current_dir=$(pwd)

mkdir "${current_dir}/equirectangular"

for i in `ls ./*.[Mm][Pp]4`
do
  ffmpeg -i $i -i "${current_dir}/fly360_4096x2048_x.pgm" -i "${current_dir}/fly360_4096x2048_y.pgm" -lavfi remap -c:v libx264 -crf 0 ./equirectangular/$i
done

cd equirectangular
mkdir blindspotted
for i in `ls ./*.[Mm][Pp]4`
do
  ffmpeg -y -i $i -vf "pad=width=5689:height=2844:y=0:x=-1,scale=h=2048,crop=w=4096:x=796" -c:v libx264 -crf 0 -f mp4 ./blindspotted/$i
done

cd blindspotted
for i in `ls *.[Mm][Pp]4`
do
  python "${current_dir}/spatial-media/spatialmedia" -i $i injected_$i
done
