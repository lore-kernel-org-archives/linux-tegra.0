From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v5 09/11] drm/tegra: Reset the SOR on probe
Date: Tue, 3 Mar 2015 10:34:18 +0100
Message-ID: <CAAObsKD2FPmH+KZ8cce1pZWM_E859agmU6Q1or8G9J=mRuLtnQ@mail.gmail.com>
References: <1423731078-26681-1-git-send-email-tomeu.vizoso@collabora.com>
 <1423731078-26681-10-git-send-email-tomeu.vizoso@collabora.com> <CAAVeFuJEWt5tzy2_oLRq_UUA__QEto2NYM_FgC4P5uNk6diOhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuJEWt5tzy2_oLRq_UUA__QEto2NYM_FgC4P5uNk6diOhQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Terje_Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 2 March 2015 at 09:41, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Feb 12, 2015 at 5:51 PM, Tomeu Vizoso
> <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
>> As there isn't a way for the firmware on the Nyan chromebooks to hand
>> over the display to the kernel.
>
> Could this have a side-effect on models for which the firmware *does*
> hand over the display to the kernel? E.g. temporary glitch or black
> screen?
>
> This is probably ok though, as such a handing over would need to be
> documented in the firmware/kernel command line, and could thus be
> caught to disable that code block if needed.

Hi,

my understanding from talking with Thierry is that the kernel will
read the current state of the hw as the fw left it, and just carry on
if it's compatible with the currently-requested mode.

If it's not compatible, then the SOR should better be resetted to get
it into a known state.

But he's currently rewriting the SOR driver, so I don't know if it
makes sense to merge this patch.

Thanks,

Tomeu

> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
