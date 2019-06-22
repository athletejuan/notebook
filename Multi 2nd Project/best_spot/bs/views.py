from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required
from .models import BS, Cost
from .forms import BSForm, CostForm
from IPython import embed

def intro(request):
    bss = BS.objects.order_by('-pk')
    context = {'bss':bss}
    return render(request, 'bs/intro.html', context)

@login_required
def new(request):
    if request.method == 'POST':
        form = BSForm(request.POST)
        if form.is_valid():
            history = form.save()
            return redirect('bs:detail', history.pk)
    else:
        form = BSForm()
    context = {'form':form}
    return render(request, 'bs/form.html', context)

def detail(request, history_pk):
    # board = Board.objects.get(pk=board_pk)
    history = get_object_or_404(BS, pk=history_pk)
    context = {'history':history}
    return render(request, 'bs/detail.html', context)

@login_required
def update(request, history_pk):
    history = get_object_or_404(BS, pk=history_pk)
    if request.method == 'POST':
        form = BSForm(request.POST, instance=history)
        if form.is_valid():
            form.save()
            return redirect('bs:detail', history.pk)
    else:
        form = BSForm(instance=history)
    context = {'form':form, 'history':history}
    return render(request, 'bs/form.html', context)

def delete(request, history_pk):
    history = get_object_or_404(BS, pk=history_pk)
    if request.method == 'POST':
        history.delete()
        return redirect('bs:intro')
    else:
        return redirect('bs:detail')