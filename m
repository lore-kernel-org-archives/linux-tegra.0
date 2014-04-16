From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] clk: tegra124: Enable hda to hdmi clocks
Date: Wed, 16 Apr 2014 11:49:05 -0700
Message-ID: <CAEUnVG7wWeW_ed72CSTyBXYw6yp6o8LzfmhyVHsnL5C5sU36sQ@mail.gmail.com>
References: <1396984629-14101-1-git-send-email-dgreid@chromium.org>
 <534D781A.90508@wwwdotorg.org> <s5h1twxfit6.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <s5h1twxfit6.wl%tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 16, 2014 at 7:30 AM, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org> wrote:
> At Tue, 15 Apr 2014 12:19:06 -0600,
> Stephen Warren wrote:
>>
>> On 04/08/2014 01:17 PM, Dylan Reid wrote:
>> > Add the clocks used for HDMI audio played through the HDA controller.
>> > Initialize the codec clock to 48Mhz and the HDA clock to 102MHz per
>> > the TRM.
>>
>> This patch seems fine to me. Peter, I assume you'll apply this and
>> eventually sent a pull request to Mike.
>>
>> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> I guess this is basically needed for Tegra HD-audio HDMI stuff, so I'd
> need to pull the change to my branch once when applying other Dylan's
> patches.  Let me know the pull-able branch once when merged.
> Alternatively, I can apply the all patches in series to my tree if
> it's easier, too.  Just let me know what you guys prefer.
>
> (BTW, Dylan, v3 patches haven't been submitted yet, right?)

I'll send it out later today, found a runtime pm bug that I want to fix first.

Thanks,

Dylan

>
>
> thanks,
>
> Takashi
