From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: define and export __clk_get_debug for providers
Date: Thu, 26 Jun 2014 15:11:09 -0700
Message-ID: <CAPtuhTgp2Ubr-9CiVGeJjG91J765dYKcY3gF+i+o1MTf2ELKPA@mail.gmail.com>
References: <1403713591-17179-1-git-send-email-pdeschrijver@nvidia.com>
 <44039675.8s16pHQIVH@wuerfel> <20140625182349.32686.25931@quantum> <CAAObsKDVrXRgO1e2=SorGiNUMhGPCCUUPtsjDfnST9gFN4=qTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAObsKDVrXRgO1e2=SorGiNUMhGPCCUUPtsjDfnST9gFN4=qTQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 26, 2014 at 12:37 AM, Tomeu Vizoso
<tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> wrote:
> On 25 June 2014 20:23, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>
>> Peter,
>>
>> Just FYI, I'm trying to reverse the trend of prepending double
>> underscores for functions that are used by clock providers. That stuff
>> started out small and sort of grew out of control ;-)
>
> I'm looking at rebasing Rabin's patches for per-user clks, and I have
> had to add a few variants for providers, so they can be called with
> clk_core instead. Have been prepending underscores for those internal
> variants, but in some cases I had to also append a _internal suffix
> because there were already variants without locking.
>
> What convention were you thinking of for distinguishing provider-only
> variants for e.g. clk_set_rate?

Hmm. Now we need a convention. Damn. ;-)

I'm open to suggestions. I think prepending a single underscore makes
great sense for a lock-free inner function. And some number of
underscores (1 or 2) makes sense for static functions not exposed to
clock providers. I kind of like using 2 underscores for the static
functions so that it is easier to differentiate them.

For any new functions you create with unique names that are exposed to
clock providers, do not prepend any underscore at all. It's just
another public function in clk-provider.h.

If any taste makers out there have suggestions I am happy to listen.

Regards,
Mike

>
> Regards,
>
> Tomeu
