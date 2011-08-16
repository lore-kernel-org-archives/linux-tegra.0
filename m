From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC PATCH v2 00/13] arm/tegra: Initialize GPIO & pinmux from DT
Date: Tue, 16 Aug 2011 10:12:17 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04AEA25368@HQMAIL01.nvidia.com>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com>
 <201108161509.17157.arnd@arndb.de>
 <CACRpkdaVx=6AJ5DFjVN1ZYQ++hu9pT6WxD9n+pqmYVaCf1xawg@mail.gmail.com>
 <201108161637.16620.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201108161637.16620.arnd-r2nGTMty4D4@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Arnd Bergmann wrote at Tuesday, August 16, 2011 8:37 AM:
> On Tuesday 16 August 2011, Linus Walleij wrote:
> > One specific thing worries me: Grant asked me to make sure
> > to NOT create a global pin number space for the pinmuxes (and thus
> > pinctrl). This means that in order to proceed, mappings of pinmux
> > groups or pincontrol (such as bias) groups, each device using such
> > an entity need to reference the intended pincontroller/mux instance.
> >
> > Say mmc instance 0 need pingroup foo on pincontroller bar
> > means that there must be a specific reference from mmc.0:s
> > struct device * to pinctrl bar:s struct device *. Maybe this is
> > peanuts in DT, sorry not enough insight.
> 
> I think what you are looking for is the equivalent of the
> interrupt-parent property for pinmux. The idea is that each
> node in the device tree can point to a device managing the
> pinmux, so reference would point to a local number in that
> space. We have discussed this for the GPIO case already, and
> I suspect that the two should be identical (gpio-controller
> and pinmux-controller using the same device node and same
> property to refer to them). Since the pinmux-parent
> (gpio-parent, ...) property gets inherited by all child
> devices, you only need to set it once at the root of the
> device tree for the simple case where there is only one
> controller.

One issue here: There isn't always a single gpio/pinmux parent; as a
concrete example, the ALSA/ASoC driver for Tegra+WM8903 uses GPIOs both
from Tegra itself, and from the WM8903 audio codec.

I could imagine the same being true in basically any case where one
device uses N GPIOs (e.g. SD controller with power, change-detect,
and read-only GPIOs; some could easily come from the SoC and some
from a GPIO expander).

I'm not quite so sure that multiple parents would be useful for pinmux,
but I wouldn't say that it was impossible...

-- 
nvpublic
