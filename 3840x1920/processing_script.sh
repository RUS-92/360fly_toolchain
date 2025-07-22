current_dir=$(pwd)

mkdir "${current_dir}/equirectangular"

for i in `ls ./*.MP4`
do
  ffmpeg -i $i -i "${current_dir}/fly360_3840x1920_x.pgm" -i "${current_dir}/fly360_3840x1920_y.pgm" -lavfi remap -c:v libx264 -crf 0 ./equirectangular/$i
done

cd equirectangular
mkdir blindspotted
for i in `ls ./*.MP4`
do
  ffmpeg -y -i $i -vf "pad=width=5334:height=2667:y=0:x=-1,scale=h=1920,crop=w=3840:x=747" -c:v libx264 -crf 0 -f mp4 ./blindspotted/$i
done

cd blindspotted
for i in `ls *.MP4`
do
  python "${current_dir}/spatial-media/spatialmedia" -i $i injected_$i
done
