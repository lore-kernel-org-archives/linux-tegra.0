From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Wed, 04 Jun 2014 11:32:56 -0600
Message-ID: <538F5848.1050803@wwwdotorg.org>
References: <CAEUnVG7+=1ko8NL1Z3ovSpGveUADUidy4sBhU_dTUe1zbe-bMA@mail.gmail.com> <537BCF39.6050909@wwwdotorg.org> <CAEUnVG7CRWx5Y3RsgPzrHgYRGAx=bS4WY=w1xBUw0Ukt0DTdUQ@mail.gmail.com> <20140521205538.GA6237@mithrandir> <CAEUnVG7tDjw_6wHc=FN0KsOKsSS1u8H8SzYdxt9VCwUsARRTeQ@mail.gmail.com> <20140522094958.GA11585@ulmo> <CAEUnVG5pNMzDoXGso+UiAWPpD0hNPhBPyGr8KfV587AuU70QPQ@mail.gmail.com> <537E39D9.2000304@wwwdotorg.org> <CAEUnVG4UettOj0xDy+f6qEhUbhNs=u-wgyCf_Prsd2JpnmFfLw@mail.gmail.com> <CAEUnVG42Fmn4QOu-jObpoyViscmfKn35oDmb=WR8t=X7YVSB=Q@mail.gmail.com> <537F9BEB.5020102@wwwdotorg.org> <CAEUnVG63BCgpGuo+qcYkvpnVSSguBy9xwSC_AoZqCt1RgBqm7w@mail.gmail.com> <CAEUnVG52fJhd9213fdydoUW11N0yZ31T2MZ2BPmd5Q2xkZ8XeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEUnVG52fJhd9213fdydoUW11N0yZ31T2MZ2BPmd5Q2xkZ8XeQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/30/2014 07:45 PM, Dylan Reid wrote:
> On Fri, May 23, 2014 at 1:34 PM, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> On Fri, May 23, 2014 at 12:05 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>> On 05/22/2014 09:55 PM, Dylan Reid wrote:
>>> ...
>>>>>>>>>>> On Tue, May 20, 2014 at 2:55 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>> ...
>>>>>>>>>>>> Now I have the same results as Thierry; speaker-test looks like it
>>>>>>>>>>>> should be working, yet I don't hear any audio from the monitor. I know
>>>>>>>>>>>> the monitor works, since I've used it extensively for testing GeForce
>>>>>>>>>>>> GPU HDMI audio.
>>> ...
>>>> Took all day, but I did get to try this.
>>>>
>>>> on U-Boot commit d7782d0, flashed with Stephen's u-boot flasher from github.
>>>>
>>>> And kernel at 81d0207 - ARM: tegra: enable HD-Audio controller in defconfig
>>>> plus the addition of the hda node "okay"  to the jetson-tk1 DT.
>>>>
>>>> I can hear the jetson's audio on the TV.  This is currently a sample
>>>> size of one TV, I'll set up the Quantum Data tomorrow and check that
>>>> it works there as well.
>>>
>>> I tried that same U-Boot commit (with a few device-mode USB patches on
>>> top that shouldn't affect anything since I didn't use USB device mode)
>>> and have the same results.
>>>
>>> My monitor is a Dell U2410 with sound bar.
> 
> I found one of these.  I also didn't hear any audio.  In fact I
> couldn't get audio out of most monitors, TV sets worked fine.
> 
> hdmi.c couldn't configure audio for the pixel clock generated for the
> monitor.  Luckily I found a patch in our downstream tree that fixes
> it.
> 
> video: tegra: Calculate HDMI audio CTS/N/AVAL values -- 7/25/11 author
> swarren =)
> 
> Thanks for fixing this for me!
> 
> I can send this up unless you'd rather send it yourself.
> 
> I appended the patch moved to the new location of hdmi.c:

That wouldn't apply for me since all the TABs were spaces in the email.
I tracked down the original and manually ported it over. You can find it
in my github if you're interested:

git://github.com/swarren/linux-tegra.git tegra_dev

That patch does make things a bit better, but there are still some issues.

When my (Venice2) system boots, the login screen is displayed at native
LCD resolution, and my HDMI monitor displays a 1920x1200 chunk from the
top-left of the LCD. At this point, I can play 44.1KHz audio without
issue. 48KHz doesn't work due to hdmi->audio_freq not being updated, as
I mentioned in my previous mail.

However, once I log in, the window manager changes the HDMI output to
1024x768@75Hz right-of the LCD panel. I have no idea why it does this,
but still... Without the audio ACR value calculation patch, the HDMI
video output fine at this point. However, with the patch, the monitor
won't sync to the signal; it keeps entering/leaving power-save mode.

I suspect this is simply because without the patch, I see the following
error when setting up HDMI for the login screen:

tegra-hdmi 54280000.hdmi: cannot set audio to 44100 at 154000000 pclk

... and when that happens, tegra_output_hdmi_enable() sets hdmi->dvi =
true, which disables a whole bunch of code. However, with the patch
applied, the audio setup doesn't fail, so all that infoframe/... code
runs now, and I suppose there are some issues with it.

Are you able to look into this, or do you need me to investigate further?

I also couldn't persuade xrandr to switch back to a sane resolution on
the HDMI port to see if that resolved the issue. I suppose that's
probably unrelated to the audio code.
