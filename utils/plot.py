import torch
from torchvision.utils import make_grid
import matplotlib.pyplot as plt


def show_tensor_images(image_tensor, num_images=25, size=(1, 28, 28), title=None, save_path=None):
    '''
    Visualizing image grid
    '''
    image_unflat = image_tensor.detach().cpu().view(-1, *size)
    image_grid = make_grid(image_unflat[:num_images], nrow=5)
    plt.title(title)
    plt.imshow(image_grid.permute(1, 2, 0).squeeze())

    if save_path is not None:
        plt.savefig(save_path)
    plt.show()


def show_loss_graph(gen_losses, disc_losses, title=None, save_path=None):
    '''
    Vizualize generator/discriminator loss
    '''
    x = list(range(len(gen_losses)))
    plt.plot(x, gen_losses, label="Generator loss")
    plt.plot(x, disc_losses, label="Discriminator loss")
    plt.legend()
    plt.xlabel("Batch Iteration")
    plt.ylabel("Loss")
    plt.xlim(left=0)
    plt.title(title)

    if save_path is not None:
        plt.savefig(save_path)
    plt.show()
