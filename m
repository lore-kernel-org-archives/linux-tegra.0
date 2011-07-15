From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: Tegra: Harmony: Register and configure WM8903
 IRQ GPIO
Date: Fri, 15 Jul 2011 09:05:12 +0900
Message-ID: <20110715000510.GD32716@opensource.wolfsonmicro.com>
References: <1310589618-16080-1-git-send-email-swarren@nvidia.com>
 <20110714122520.GB14249@sirena.org.uk>
 <74CDBE0F657A3D45AFBB94109FB122FF049E834971@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF049E834971-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 14, 2011 at 08:49:28AM -0700, Stephen Warren wrote:
> Mark Brown wrote at Thursday, July 14, 2011 6:25 AM:

> > This seems silly - we should fix this in the core code rather than have
> > every single board that ahppens to use an interrupt which is also
> > available as a GPIO manually faff around with gpiolib.

> That seems a good goal.

> However, how does the WM8903 driver know whether the interrupt number
> it's passed is a straight-up dedicated interrupt (hence the calls aren't
> required), or a GPIO (hence they are)?

It shouldn't - I said "core code" for a reason :)

> I guess the answer is that there should be an interrupt API to map from
> interrupt to GPIO number, returning <0 when there is no GPIO backing the
> IRQ, and an op in struct irq_chip to implement that? However, that's not
> there right now as far as I can tell.

Yes, exactly - but it should not be complicated to add one and since
you're doing this anyway it'd make sense to do the core change rather
than faffing around the edges of the system.

> Finally, there are some pinmux interactions that need to be dealt with;
> on Tegra, the pinmux allows the tristate/drive status of pins to be set
> on a group basis (a group being a set of 1-n pins). However, gpio enable
> (which overrides the pinmux's setting of tristate/drive) can be set on
> a per-pin basis. At least on Seaboard, the WM8903 IRQ is an input pin
> in a group that otherwise needs to contain output pins, so we really
> want to enable the WM8903 IRQ GPIO pin as a GPIO, and set it to input,
> before setting up that pinmux group to drive the pins. Without this,
> there may be a brief period where both Tegra and the WM8903 are driving
> this IRQ signal, which can't be good for hardware.

If the pinmux stuff can't work this out then it needs to be worked on
until it can, this is pretty basic stuff.  I had thought that the plan
was to support a big block configuration done by the board which set
everything up en masse and would presumably cope with stuff like this?
