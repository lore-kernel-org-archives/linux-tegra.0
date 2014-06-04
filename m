From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 HDA support
Date: Wed, 04 Jun 2014 13:04:05 -0600
Message-ID: <538F6DA5.9040608@wwwdotorg.org>
References: <CAEUnVG7+=1ko8NL1Z3ovSpGveUADUidy4sBhU_dTUe1zbe-bMA@mail.gmail.com> <537BCF39.6050909@wwwdotorg.org> <CAEUnVG7CRWx5Y3RsgPzrHgYRGAx=bS4WY=w1xBUw0Ukt0DTdUQ@mail.gmail.com> <20140521205538.GA6237@mithrandir> <CAEUnVG7tDjw_6wHc=FN0KsOKsSS1u8H8SzYdxt9VCwUsARRTeQ@mail.gmail.com> <20140522094958.GA11585@ulmo> <CAEUnVG5pNMzDoXGso+UiAWPpD0hNPhBPyGr8KfV587AuU70QPQ@mail.gmail.com> <537E39D9.2000304@wwwdotorg.org> <CAEUnVG4UettOj0xDy+f6qEhUbhNs=u-wgyCf_Prsd2JpnmFfLw@mail.gmail.com> <CAEUnVG42Fmn4QOu-jObpoyViscmfKn35oDmb=WR8t=X7YVSB=Q@mail.gmail.com> <537F9BEB.5020102@wwwdotorg.org> <CAEUnVG63BCgpGuo+qcYkvpnVSSguBy9xwSC_AoZqCt1RgBqm7w@mail.gmail.com> <CAEUnVG52fJhd9213fdydoUW11N0yZ31T2MZ2BPmd5Q2xkZ8XeQ@mail.gmail.com> <538F5848.1050803@wwwdotorg.org> <CAEUnVG7bbcPjRcGxn_GAJ7rKJy4g_5veEsRnU
 2yCDVWFY3ncUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAEUnVG7bbcPjRcGxn_GAJ7rKJy4g_5veEsRnU2yCDVWFY3ncUQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/04/2014 11:51 AM, Dylan Reid wrote:
> On Wed, Jun 4, 2014 at 10:32 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 05/30/2014 07:45 PM, Dylan Reid wrote:
>>> On Fri, May 23, 2014 at 1:34 PM, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>>>> On Fri, May 23, 2014 at 12:05 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>>>> On 05/22/2014 09:55 PM, Dylan Reid wrote:
>>>>> ...
>>>>>>>>>>>>> On Tue, May 20, 2014 at 2:55 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>>>>> ...
>>>>>>>>>>>>>> Now I have the same results as Thierry; speaker-test looks like it
>>>>>>>>>>>>>> should be working, yet I don't hear any audio from the monitor. I know
>>>>>>>>>>>>>> the monitor works, since I've used it extensively for testing GeForce
>>>>>>>>>>>>>> GPU HDMI audio.
>>>>> ...
>>>>>> Took all day, but I did get to try this.
>>>>>>
>>>>>> on U-Boot commit d7782d0, flashed with Stephen's u-boot flasher from github.
>>>>>>
>>>>>> And kernel at 81d0207 - ARM: tegra: enable HD-Audio controller in defconfig
>>>>>> plus the addition of the hda node "okay"  to the jetson-tk1 DT.
>>>>>>
>>>>>> I can hear the jetson's audio on the TV.  This is currently a sample
>>>>>> size of one TV, I'll set up the Quantum Data tomorrow and check that
>>>>>> it works there as well.
>>>>>
>>>>> I tried that same U-Boot commit (with a few device-mode USB patches on
>>>>> top that shouldn't affect anything since I didn't use USB device mode)
>>>>> and have the same results.
>>>>>
>>>>> My monitor is a Dell U2410 with sound bar.
>>>
>>> I found one of these.  I also didn't hear any audio.  In fact I
>>> couldn't get audio out of most monitors, TV sets worked fine.
>>>
>>> hdmi.c couldn't configure audio for the pixel clock generated for the
>>> monitor.  Luckily I found a patch in our downstream tree that fixes
>>> it.
>>>
>>> video: tegra: Calculate HDMI audio CTS/N/AVAL values -- 7/25/11 author
>>> swarren =)
>>>
>>> Thanks for fixing this for me!
>>>
>>> I can send this up unless you'd rather send it yourself.
>>>
>>> I appended the patch moved to the new location of hdmi.c:
>>
>> That wouldn't apply for me since all the TABs were spaces in the email.
>> I tracked down the original and manually ported it over. You can find it
>> in my github if you're interested:
>>
>> git://github.com/swarren/linux-tegra.git tegra_dev
>>
>> That patch does make things a bit better, but there are still some issues.
>>
>> When my (Venice2) system boots, the login screen is displayed at native
>> LCD resolution, and my HDMI monitor displays a 1920x1200 chunk from the
>> top-left of the LCD. At this point, I can play 44.1KHz audio without
>> issue. 48KHz doesn't work due to hdmi->audio_freq not being updated, as
>> I mentioned in my previous mail.
> 
> Do you have a good idea how to convey this information from the audio
> driver over to HDMI?
> Downstream I see we have a hideous if CONFIG_TEGRA_DC in patch_hdmi.

The only way of avoiding that would be to create some kind of common
infra-structure where video drivers can register for notifications from
arbitrary audio devices. Then, the HDA code could always call this, and
there'd be no direct references between the two drivers. To be honest
though, this feels like creating a whole bunch of overhead for something
that's very simple and likely not a maintenance issue, so I'm not sure
there's much benefit doing that.

>> However, once I log in, the window manager changes the HDMI output to
>> 1024x768@75Hz right-of the LCD panel. I have no idea why it does this,
>> but still... Without the audio ACR value calculation patch, the HDMI
>> video output fine at this point. However, with the patch, the monitor
>> won't sync to the signal; it keeps entering/leaving power-save mode.
>>
>> I suspect this is simply because without the patch, I see the following
>> error when setting up HDMI for the login screen:
>>
>> tegra-hdmi 54280000.hdmi: cannot set audio to 44100 at 154000000 pclk
>>
>> ... and when that happens, tegra_output_hdmi_enable() sets hdmi->dvi =
>> true, which disables a whole bunch of code. However, with the patch
>> applied, the audio setup doesn't fail, so all that infoframe/... code
>> runs now, and I suppose there are some issues with it.
>>
>> Are you able to look into this, or do you need me to investigate further?
> 
> I'm travelling for the rest of the week, but I can set aside time to
> look at it on Monday.  If you make any more progress before then let
> me know.

I don't know how useful this is, but I found that if I apply the
following patch, video still works:

> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index c1853aee3716..bb271efef263 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -560,7 +560,7 @@ static void tegra_hdmi_setup_avi_infoframe(struct tegra_hdmi *hdmi,
>  	u8 buffer[17];
>  	ssize_t err;
>  
> -	if (hdmi->dvi) {
> +	if (1 /*hdmi->dvi*/) {
>  		tegra_hdmi_writel(hdmi, 0,
>  				  HDMI_NV_PDISP_HDMI_AVI_INFOFRAME_CTRL);
>  		return;
> @@ -809,7 +809,7 @@ static int tegra_output_hdmi_enable(struct tegra_output *output)
>  
>  	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_HDMI_CTRL);
>  
> -	if (hdmi->dvi)
> +	if (1 /*hdmi->dvi*/)
>  		tegra_hdmi_writel(hdmi, 0x0,
>  				  HDMI_NV_PDISP_HDMI_GENERIC_CTRL);
>  	else

With either of those changes missing, I get the problem I described before.

Even with those hacks, something is obviously a bit wrong; my monitor
reports 1026x768 rather than 1024x768 as the resolution!

I'm not sure if this is related, but I notice hdmi.c contains a few:

if (of_device_is_compatible(node, "nvidia,tegra30-hdmi"))

I assume that code should also run on Tegra114/124 since the code is
probably touching HW that was added between Tegra20 and Tegra30, and
then probably not removed later. Still, I can't say for sure. These
tests aren't succeeding now, since the HDMI DT not in tegra124.dtsi only
includes "nvidia,tegra124-hdmi" in the compatible value. "Fixing" those
tests to succeed on Tegra124 breaks more functionality.

It's probably best if I leave further investigation to Thierry since he
knows the HDMI device much more than I, or perhaps you.
