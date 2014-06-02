From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] clk: tegra124: Enable hda to hdmi clocks
Date: Mon, 2 Jun 2014 08:06:59 -0700
Message-ID: <CAEUnVG6a8pa8hdgmpryYaRPyMGM3H261bGZhKuawVwfOais1tw@mail.gmail.com>
References: <1396984629-14101-1-git-send-email-dgreid@chromium.org>
 <534D781A.90508@wwwdotorg.org> <s5h1twxfit6.wl%tiwai@suse.de>
 <534EA7D5.502@wwwdotorg.org> <s5hmwdvjx89.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <s5hmwdvjx89.wl%tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 2, 2014 at 5:45 AM, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org> wrote:
> At Wed, 16 Apr 2014 09:55:01 -0600,
> Stephen Warren wrote:
>>
>> On 04/16/2014 08:30 AM, Takashi Iwai wrote:
>> > At Tue, 15 Apr 2014 12:19:06 -0600,
>> > Stephen Warren wrote:
>> >>
>> >> On 04/08/2014 01:17 PM, Dylan Reid wrote:
>> >>> Add the clocks used for HDMI audio played through the HDA controller.
>> >>> Initialize the codec clock to 48Mhz and the HDA clock to 102MHz per
>> >>> the TRM.
>> >>
>> >> This patch seems fine to me. Peter, I assume you'll apply this and
>> >> eventually sent a pull request to Mike.
>> >>
>> >> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> >
>> > I guess this is basically needed for Tegra HD-audio HDMI stuff, so I'd
>> > need to pull the change to my branch once when applying other Dylan's
>> > patches.  Let me know the pull-able branch once when merged.
>> > Alternatively, I can apply the all patches in series to my tree if
>> > it's easier, too.  Just let me know what you guys prefer.
>>
>> This change is only needed at run-time, not at compile-time, so there's
>> no build-time dependency. Since this is a new feature, it's fine for it
>> to only work once everything is merged together in linux-next, or
>> Linus's tree, so there's to push it all through a single branch.
>
> This fix seems still missing in linux-next.  Note that the whole Tegra
> HDMI audio driver patches have been already included in for-next
> branch of sound git tree.

Thanks for checking Takashi,

I thought it was going through Peter's tree.  Peter have you had a
chance to take a look?

Thanks,

Dylan

>
>
> Takashi
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
