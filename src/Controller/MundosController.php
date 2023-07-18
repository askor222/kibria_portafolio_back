<?php

namespace App\Controller;

use App\Entity\Mundos;
use App\Form\MundosType;
use App\Repository\MundosRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/mundos')]
class MundosController extends AbstractController
{
    #[Route('/', name: 'app_mundos_index', methods: ['GET'])]
    public function index(MundosRepository $mundosRepository): Response
    {
        return $this->render('mundos/index.html.twig', [
            'mundos' => $mundosRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_mundos_new', methods: ['GET', 'POST'])]
    public function new(Request $request, MundosRepository $mundosRepository): Response
    {
        $mundo = new Mundos();
        $form = $this->createForm(MundosType::class, $mundo);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $mundosRepository->save($mundo, true);

            return $this->redirectToRoute('app_mundos_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('mundos/new.html.twig', [
            'mundo' => $mundo,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_mundos_show', methods: ['GET'])]
    public function show(Mundos $mundo): Response
    {
        return $this->render('mundos/show.html.twig', [
            'mundo' => $mundo,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_mundos_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Mundos $mundo, MundosRepository $mundosRepository): Response
    {
        $form = $this->createForm(MundosType::class, $mundo);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $mundosRepository->save($mundo, true);

            return $this->redirectToRoute('app_mundos_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('mundos/edit.html.twig', [
            'mundo' => $mundo,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_mundos_delete', methods: ['POST'])]
    public function delete(Request $request, Mundos $mundo, MundosRepository $mundosRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$mundo->getId(), $request->request->get('_token'))) {
            $mundosRepository->remove($mundo, true);
        }

        return $this->redirectToRoute('app_mundos_index', [], Response::HTTP_SEE_OTHER);
    }
}
