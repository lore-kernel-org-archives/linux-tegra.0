From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCHv5 2/2] ALSA: hda - Add driver for Tegra SoC HDA
Date: Tue, 20 May 2014 09:49:01 -0700
Message-ID: <CAEUnVG6ztyOR9DO0_wP=dbGwL4JRdLtu-rk8Nfjkws0Hg3pQTA@mail.gmail.com>
References: <1400552307-20192-1-git-send-email-dgreid@chromium.org> <20140520085925.GA10210@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140520085925.GA10210@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 20, 2014 at 1:59 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, May 19, 2014 at 07:18:27PM -0700, Dylan Reid wrote:
>> This adds a driver for the HDA block in Tegra SoCs.  The HDA bus is
>> used to communicate with the HDMI codec on Tegra124.
>>
>> Most of the code is re-used from the Intel/PCI HDA driver.  It brings
>> over only two of the module params, power_save and probe_mask.
>>
>> Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> When I run this on Jetson TK1 I get the following:

I haven't tried on a Jetson TK1 yet, but we should have one by EOD.
All my testing has been on Venice2.

>
>         [    1.571912] tegra-hda 70030000.hda: CORB reset timeout#1, CORBRP = 0
>
> Is that expected?

No, but now that you mention it I see it too.  I'll take a look.

>
> The device seems to register properly:
>
>         $ aplay -l
>         **** List of PLAYBACK Hardware Devices ****
>         card 0: tegrahda [tegra-hda], device 3: HDMI 0 [HDMI 0]
>           Subdevices: 1/1
>           Subdevice #0: subdevice #0
>         card 1: TK1 [NVIDIA Tegra Jetson TK1], device 0: RT5640 PCM rt5640-aif1-0 []
>           Subdevices: 1/1
>           Subdevice #0: subdevice #0
>
> Would you mind sharing the procedure how you test this? I tried various
> incantations of this sort:
>
>         $ aplay -D hw:0,3 /usr/share/sounds/alsa/Noise.wav
>
> or
>
>         $ aplay -D plughw:0,3 /usr/share/sounds/alsa/Noise.wav
>
> to no avail.

Those sounds are mono so hw:0,3 wouldn't work, but plughw works for me.

Are you getting an error message or is it playing silence?  Never
hurts to double check that the output didn't end up in DVI mode, and
that the Playback switch is unmuted in amixer.

I used:

speaker-test -Dhw:0,3 -c 2

or

aplay -Dhw:0,3 stereo_file.wav

Thanks,

Dylan

>
> Thierry
