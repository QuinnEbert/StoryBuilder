OpenAI StoryBuilder
===================

A bulk CLI-based short story builder and speech narrator using GPT4 via the (paid for) OpenAI Chat Completion platform, designed specifically for use on macOS systems.

Prerequisites
-------------

* macOS Monterey or later
* *The README assumes you use `bash` because Bash is awesome despite Apple's insistence otherwise, stuff here will probably break if you don't use Bash!*
* `python3` in `$PATH`
* The "Karen" Australian English high-quality voice installed via the Speech pane in System Preferences / System Settings
* `openai`, `reportlab` installed via `pip3`
* `parallel` and `ffmpeg` installed via `brew`
* Signed up for the OpenAI platform with valid payment details added therein

Usage Examples
--------------

Ensure you're in `bash` first:
```
/bin/bash
```

Now, set your OpenAI API key:
```
export OPENAI_KEY="sk-OPENAI_PLATFORM_API_KEY"
```

Finally, the good stuff...

```
./StoryBuilder.sh 0 'Cheese Sandwich Man Origins' "Tell me the origin story of the super hero named Cheese Sandwich Man, who is kind of like a low-rent version of Powdered Toast Man from Ren and Stimpy"
```
Generates a single such story (the first argument is the zero-based final story index number that will be generated)

```
./StoryBuilder.sh 29 'Cheese Sandwich Man Chronicles' "Tell me a daily exploit story of the super hero named Cheese Sandwich Man, who is kind of like a low-rent version of Powdered Toast Man from Ren and Stimpy"
```
Generates 30 such stories

***Also!**  The numeric argument can be omitted, if you do, 100 stories will be generated*

Viewing/Listening to Results
----------------------------

A folder in `Stories` will get created with the name of the story you chose, from there, options are in subfolders:

* `Text` contains the plain text stories
* `PDF` contains US Letter sized 12pt PDFs of the plain text stories
* `Uncompressed` contains AIFF files with TTS speaking each story
* `MP3` are the MP3-compressed TTS readings

Frequently asked Questions
--------------------------

**Q:** Can I change the voice used?  
**A:** Yes, install (ideally) a high-quality voice of your choosing via the Speech pane in System Preferences / System Settings, then replace `Karen` near the bottom of `StoryBuilder.sh` with the name of your chosen voice.  I will soon push an update to make this dead simple via the CLI.

**Q:** Can you adapt it to scrape the ChatGPT interface so I can use GPT3.5 without paying or avoid the platform setup hassle?  
**A:** We don't live in a socialist utopia sweetie, it costs money to develop these ML models, pay OpenAI for the platform if you want to use this codebase -- heck, you pay after the fact for what you use -- we all get better tools eventually in return for paying them our fair share.

**Q:** How much does it cost to generate large volumes of stories?  
**A:** Surprisingly little; when testing, I was consistently burning US $4 or so on batches of 100 stories in the realm of 4KB text output (or 3 to 5 minutes of narrated text).

**Q:** Any plans to port to "xyz"?  
**A:** Nope, if you want to write a version of it that uses flite or espeak to get it to run on Windows or Linux, or make it use Cepstral Swift, do so, and send a pull request, I might give it a look, I might not.  **I *would* be *highly* interested in a Windows port that can be easily made to use the OneCore voices!**  The flite and espeak voices are TERRIBLE and Cepstral's anti-consumer changes to CLI TTS rendering since v6 onward are directly anti-FOSS; on macOS, we have the easiest legally licenced access to RealSpeak voices on the planet and this sounds beautiful with next to zero effort.

**Q:** Are you aware you left a lot of parallelism on the table when building this?  
**A:** Yes!  I intend to push fixes to correct this, not to worry!  My goal was to get this little weekend project released ASAP and then ship a few small refinements to make life less painful later

**Q:** Why can it only very slowly run 5 text generation jobs at a time?  
**A:** Capacity-savvy API rate limits at OpenAI.  I fully support them doing this too even as a paying customer, it's early days for this technology, no equivalent open source options exist, and we want as many people as possible to be able to leverage it reasonably until FOSS options are around