# ruby-ppt-generator
It is an attempt to use JRuby to generate Powerpoint presentation using apache's HSLF library

## Intention of the proof of concept
We have an application containing data points and we have been creating powerpoint presentation manually to present it to our customers. So we were tasked with creating a powerpoint presentation based on the data points available in a existing rails application.

## Solutions discussed
Initially we looked at the gem [powerpoint] (https://github.com/pythonicrubyist/powerpoint) to generate powerpoint. This has new neat templates which we could extend to create slides according to our needs. For extending those templates, one should understand schemas like [relationships](http://schemas.openxmlformats.org/package/2006/relationships) and [presentationML] (http://schemas.openxmlformats.org/presentationml/2006/main) and [drawingML](http://schemas.openxmlformats.org/drawingml/2006/main) and put a xml together in order to define our templates which is fairly complex. Also at our first look, it didn't occur to us quickly how we can automatically adjust views based on the data. So we looked for other possibilities.
Looking at Java based solutions. We looked at Apache's HSLF/POI library and Aspose SDK. Since Aspose SDK is the commercial one, so we chose to go with Apache's HSLF/POI library
Ruby-Java-Bridge - We didn't consider it.

## Solution we arrived at
As part of our rails application, whenever there is a request made to download the powerpoint presentation, we stored the request in the database. We created a new JRuby based job that queries the database every 30 minutes and if it finds a work to do, it will create a powerpoint presentation and send an email to the person who requested the powerpoint as an attachment. We were also excited to try out JRuby in a real project for the very first time.

### We have couple of advantages with this approach.
* We don't have to disturb the existing rails application. I mean we don't have to convert the existing application to be JRuby based application.
* We quickly completed this POC under a day.
* A manual job is neatly automated.

## License
The code found in this repository is released under [MIT License](http://www.opensource.org/licenses/MIT).
