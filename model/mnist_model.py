# # v1.0
import torch
import torch.nn as nn
import torch.nn.functional as F

from torchsummary import summary

class Mnist(nn.Module):
    def __init__(self, input_dim = 784, mid_dim = 100, output_dim = 7):
        super().__init__()
        # define network layers
        self.fc1 = nn.Linear(input_dim, mid_dim)
        self.fc2 = nn.Linear(mid_dim, output_dim)

        self.dropout = nn.Dropout(p=0.4)
        
    def forward(self, x):
        # define forward pass
        x = torch.flatten(x, 1)
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = self.fc2(x)
        x = F.log_softmax(x, dim=1)
        return x

if __name__ == "__main__":
    model = Mnist()

    # input_data=torch.rand(1,1,784)
    # print(input_data)
    # result=model(input_data)
    # print(result)
    # print(result.shape)
    print(model)
    summary(model, input_size=[(1, 3072)], batch_size=32, device="cpu")
