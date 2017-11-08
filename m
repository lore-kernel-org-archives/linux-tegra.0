From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 00/15] gpio: Tight IRQ chip integration
Date: Wed, 8 Nov 2017 14:30:22 +0100
Message-ID: <CACRpkdbL2vz-Qj4yHK7Eado0914CjeEV+Fep9PFW5RpBfEYsvQ@mail.gmail.com>
References: <20171107181559.6318-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171107181559.6318-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 7, 2017 at 7:15 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> here's the latest series of patches that implement the tighter IRQ chip
> integration. I've dropped the banked infrastructure for now as per the
> discussion with Grygorii.
>
> The first couple of patches are mostly preparatory work in order to
> consolidate all IRQ chip related fields in a new structure and create
> the base functionality for adding IRQ chips.
>
> After that, I've added the Tegra186 GPIO support patch that makes use of
> the new tight integration.
>
> Changes in v7:
> - squashes in a few fixes pointed out by Grygorii
> - adds a couple of patches on top to support driver conversion

I put it on a separate branch in the GPIO tree (gpio-irqchip-rework)
then pulled that into the devel branch of both GPIO and
pin control. That should do it.

If there are compile bugs, we shake them out now, then we
stabilize this into v4.15.

THANKS A LOT MAN, this was really walking the extra mile for
the GPIO subsystem so it is much, much appreciated. I hope
this will be the silver bullet that make it possible to consolidate
and manage the "banked GPIO" controllers going forward so
I don't have to go crazy as maintainer.

Also thanks to Grygorii for reviewing and fixing stuff.

I hope we can switch a bunch of other drivers over to using
the banked IRQ infrastructure for v4.16.

Yours,
Linus Walleij
