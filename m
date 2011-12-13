From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/3] pinctrl: add a driver for NVIDIA Tegra
Date: Tue, 13 Dec 2011 01:27:05 +0100
Message-ID: <CACRpkdYz4-HFf6oBZ1NNies6SqKCYrsTbFaMjh7Sr7M8wXFVPQ@mail.gmail.com>
References: <1323382390-14892-1-git-send-email-swarren@nvidia.com>
	<1323382390-14892-2-git-send-email-swarren@nvidia.com>
	<CACRpkdYDn0V7SeQuFiFDMxGkybvg6PGf7jxid8ECGB7Azkj3zw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17518604D7@HQMAIL01.nvidia.com>
	<CACRpkdahqb0qMVcKF9NBT5pwRgK4FOob5ABtb7ids9Bhh5XbZg@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17518607C1@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17518607C1-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ext Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 12, 2011 at 7:06 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Linus Walleij wrote at Friday, December 09, 2011 4:56 PM:

>> For me there are two points:
>>
>> - Avoiding clash with kernel maintainers who hate firmware-like tabl=
es and
>> =A0 binary data filling up the kernel. Some certain other guy bearin=
g my
>> =A0 name comes to mind.
>
> Well, one of the nice things here is that everything to conctrol the =
HW
> is in the driver, unlike on other systems without all this data that
> have to rely on opaque BIOS/ACPI/EFI/... hooks.

Good point. I will have to play that card if the situation should arise=
=2E
Kernel devs also tend to hate stuff they can't control.

>> - Footprint: the majority of the stuff in your driver ends up in non=
-discardable
>> =A0 memory, and will be kept around. Since we have this concept of a
>> =A0 single zImage for a number of say ARMv7 systems, and since pin
>> =A0 controllers can be pretty hard to load from modules, *all* of th=
em
>> =A0 may have to be compiled-in. If every driver for every board take=
s this
>> =A0 approach I am afraid it will be end up with a measurable footpri=
nt.
>
> Perhaps what we need is a way to build all these drivers as modules, =
but
> still link them into the kernel so they're statically available durin=
g
> early boot, but allow them to be unloaded like modules after the syst=
em
> has booted and determined they aren't needed.
>
> This would have the advantage of getting rid of the unused driver cod=
e
> as well, whereas putting the data into DT only handles ensuring the d=
ata
> for other SoCs isn't present in the kernel after boot.

Hm that sounds pretty complicated. But also extremely useful if
we forge ahead on single zImages.

I'd never be able to pull it off thoug :-/

Anyway, we'll deal with this when we run into the problem.

Yours,
Linus Walleij
