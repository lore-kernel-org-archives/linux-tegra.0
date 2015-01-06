From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: tegra: Move out nyan-generic parts out from the
 nyan-big DT
Date: Tue, 6 Jan 2015 09:40:10 -0800
Message-ID: <CAOesGMj5EFr89SvskxjwjG8UdVPMJLO4-Up_5WLPUabqyqmXNw@mail.gmail.com>
References: <1420540653-14816-1-git-send-email-tomeu.vizoso@collabora.com>
	<1420540653-14816-3-git-send-email-tomeu.vizoso@collabora.com>
	<20150106130656.GF31830@ulmo.nvidia.com>
	<CAL1qeaETERAm6aTwWycCat-RzQz8UmixWtc-uK4dFsu7wL8HAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaETERAm6aTwWycCat-RzQz8UmixWtc-uK4dFsu7wL8HAg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 6, 2015 at 9:30 AM, Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
> On Tue, Jan 6, 2015 at 5:06 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>>
>> Back when we merged the nyan-big DTS there was some discussion and it
>> was concluded that the devices are very similar, with the panel being
>> one notable exception. So I think that this belongs in the nyan-big
>> DTS and you need to add a similar property to the nyan-blaze DTS with
>> the compatible for the panel used in the design. And you might need
>> to add an entry for the panel in the panel-simple driver, too.
>
> That's correct.  There are also variants of big and blaze with 1080p
> panels, so those will definitely need their own panel nodes as well.
>
> Other than that,
>
> Acked-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Shame on both of you for not pruning the patch when replying -- the
emails go too long for gmail to show them by default. :) :P

And yeah, this split looks reasonable to me (with the panel comment fixed)

Feel free to carry:

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
