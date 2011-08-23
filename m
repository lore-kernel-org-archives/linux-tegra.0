From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC PATCH v2 00/13] arm/tegra: Initialize GPIO & pinmux from DT
Date: Tue, 23 Aug 2011 11:49:56 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B24A38E6@HQMAIL01.nvidia.com>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com>
	<201108161509.17157.arnd@arndb.de>
	<CACRpkdaVx=6AJ5DFjVN1ZYQ++hu9pT6WxD9n+pqmYVaCf1xawg@mail.gmail.com>
	<201108161637.16620.arnd@arndb.de>
	<74CDBE0F657A3D45AFBB94109FB122FF04AEA25368@HQMAIL01.nvidia.com>
 <CACRpkdY=nVQYnznTU7=_D0n1V1U_xOKH2y75-jKp7k7NzwH8Zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdY=nVQYnznTU7=_D0n1V1U_xOKH2y75-jKp7k7NzwH8Zw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Linus Walleij wrote at Tuesday, August 23, 2011 6:51 AM:
> On Tue, Aug 16, 2011 at 7:12 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> 
> > One issue here: There isn't always a single gpio/pinmux parent; as a
> > concrete example, the ALSA/ASoC driver for Tegra+WM8903 uses GPIOs both
> > from Tegra itself, and from the WM8903 audio codec.
> 
> The Ux500 have pinmuxing on the DB8500 and AB8500 - the latter
> is a PMIC (&misc) connected to the DB8500 via I2C.
> 
> In the pincontrol subsystem I'm brewing, each of these will have
> their own pin controller instance and their own struct gpio_chip as
> well, so:
> 
> DB8500: pinctrl.0, gpio.0
> AB8500: pinctrl.1, gpio.1

Makes sense to far.

> Each GPIO chip may have it's respective pin controller as parent
> I guess, or they may simply be the same struct device * whatdoIknow.

I'm not clear on why the GPIO and pinmux would have any kind of parent
relationship. Perhaps that's how your HW is designed. In Tegra, GPIO
and pinmux are completely separate HW blocks without much of a defined
relationship.

I can certainly see both being implemented by the same code if it makes
sense to do so. On Tegra, I think I'd still lean towards keeping them
as separate devices, since they have separate register spaces and are
documented separately etc. However, I can certainly see that other HW
might have both sets of functionality in one HW block.

> I know this is vaporware, but does this reasoning hold also to
> the Tegra+WM8903 combo?

-- 
nvpublic
