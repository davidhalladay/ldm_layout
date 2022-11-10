wget https://ommer-lab.com/files/latent-diffusion/vq-f8.zip

mkdir exp
mkdir exp/vqgan
mkdir exp/vqgan/vq-f8

mv ./vq-f8.zip exp/vqgan/vq-f8/

cd exp/vqgan/vq-f8/
unzip vq-f8.zip
rm vq-f8.zip
cd ../../