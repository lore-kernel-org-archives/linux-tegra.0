From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/2] ARM: Tegra: Harmony: Register and configure WM8903
	IRQ GPIO
Date: Thu, 14 Jul 2011 08:49:28 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF049E834971@HQMAIL01.nvidia.com>
References: <1310589618-16080-1-git-send-email-swarren@nvidia.com>
 <20110714122520.GB14249@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110714122520.GB14249-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Thursday, July 14, 2011 6:25 AM:
> On Wed, Jul 13, 2011 at 02:40:17PM -0600, Stephen Warren wrote:
> 
> > +	gpio_request(TEGRA_GPIO_CDC_IRQ, "wm8903");
> > +	gpio_direction_input(TEGRA_GPIO_CDC_IRQ);
> > +
> >  	i2c_register_board_info(0, &wm8903_board_info, 1);
> 
> This seems silly - we should fix this in the core code rather than have
> every single board that ahppens to use an interrupt which is also
> available as a GPIO manually faff around with gpiolib.

That seems a good goal.

However, how does the WM8903 driver know whether the interrupt number
it's passed is a straight-up dedicated interrupt (hence the calls aren't
required), or a GPIO (hence they are)?

I guess the answer is that there should be an interrupt API to map from
interrupt to GPIO number, returning <0 when there is no GPIO backing the
IRQ, and an op in struct irq_chip to implement that? However, that's not
there right now as far as I can tell.

Finally, there are some pinmux interactions that need to be dealt with;
on Tegra, the pinmux allows the tristate/drive status of pins to be set
on a group basis (a group being a set of 1-n pins). However, gpio enable
(which overrides the pinmux's setting of tristate/drive) can be set on
a per-pin basis. At least on Seaboard, the WM8903 IRQ is an input pin
in a group that otherwise needs to contain output pins, so we really
want to enable the WM8903 IRQ GPIO pin as a GPIO, and set it to input,
before setting up that pinmux group to drive the pins. Without this,
there may be a brief period where both Tegra and the WM8903 are driving
this IRQ signal, which can't be good for hardware.

-- 
nvpublic
