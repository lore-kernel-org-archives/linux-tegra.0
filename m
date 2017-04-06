From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 00/12] gpio: Tight IRQ chip integration and Tegra186
 support
Date: Fri, 7 Apr 2017 00:34:49 +0200
Message-ID: <20170406223449.GH27728@ulmo.ba.sec>
References: <20170403160532.20282-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="G44BJl3Aq1QbV/QL"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170403160532.20282-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--G44BJl3Aq1QbV/QL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 03, 2017 at 06:05:20PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Hi Linus,
>=20
> here's a first draft of patches to make GPIOLIB_IRQCHIP flexible enough
> to support the Tegra186 use-case. Instead of just fixing the bugs that I
> had pointed out earlier, this goes one step further and completely
> integrates IRQ chip registration into GPIO chip registration. The idea
> is that drivers will initialize a set of fields (collected in a new
> struct gpio_irq_chip) before calling gpiochip_add() (or derivatives) and
> gpiolib will internally set up an IRQ domain and register the IRQ chip.
>=20
> Currently this makes use of the new infrastructure only in the Tegra186
> driver, but I plan to convert a couple of others once we can agree that
> this is a direction that you're comfortable with.

Linus,

any comments on this?

Thierry

> Thierry Reding (12):
>   gpio: Use unsigned int for interrupt numbers
>   gpio: Implement tighter IRQ chip integration
>   gpio: Move irq_nested into struct gpio_irq_chip
>   gpio: Move irqdomain into struct gpio_irq_chip
>   gpio: Move irqchip into struct gpio_irq_chip
>   gpio: Move irq_valid_mask into struct gpio_irq_chip
>   gpio: Move lock_key into struct gpio_irq_chip
>   gpio: Move irq_chained_parent to struct gpio_irq_chip
>   gpio: Move irq_default_type to struct gpio_irq_chip
>   gpio: Move irq_handler to struct gpio_irq_chip
>   gpio: Move irq_base to struct gpio_irq_chip
>   gpio: Add Tegra186 support
>=20
>  Documentation/gpio/driver.txt              |   6 +-
>  drivers/bcma/driver_gpio.c                 |   2 +-
>  drivers/gpio/Kconfig                       |   9 +
>  drivers/gpio/Makefile                      |   1 +
>  drivers/gpio/gpio-104-dio-48e.c            |   2 +-
>  drivers/gpio/gpio-104-idi-48.c             |   2 +-
>  drivers/gpio/gpio-104-idio-16.c            |   2 +-
>  drivers/gpio/gpio-adnp.c                   |   2 +-
>  drivers/gpio/gpio-altera.c                 |   4 +-
>  drivers/gpio/gpio-aspeed.c                 |   6 +-
>  drivers/gpio/gpio-ath79.c                  |   2 +-
>  drivers/gpio/gpio-brcmstb.c                |   2 +-
>  drivers/gpio/gpio-crystalcove.c            |   2 +-
>  drivers/gpio/gpio-dln2.c                   |   2 +-
>  drivers/gpio/gpio-ftgpio010.c              |   2 +-
>  drivers/gpio/gpio-intel-mid.c              |   2 +-
>  drivers/gpio/gpio-lynxpoint.c              |   2 +-
>  drivers/gpio/gpio-max732x.c                |   2 +-
>  drivers/gpio/gpio-mcp23s08.c               |   2 +-
>  drivers/gpio/gpio-merrifield.c             |   2 +-
>  drivers/gpio/gpio-mockup.c                 |  10 +-
>  drivers/gpio/gpio-omap.c                   |   2 +-
>  drivers/gpio/gpio-pca953x.c                |   2 +-
>  drivers/gpio/gpio-pcf857x.c                |   2 +-
>  drivers/gpio/gpio-pci-idio-16.c            |   2 +-
>  drivers/gpio/gpio-pl061.c                  |   2 +-
>  drivers/gpio/gpio-rcar.c                   |   2 +-
>  drivers/gpio/gpio-reg.c                    |   4 +-
>  drivers/gpio/gpio-stmpe.c                  |   6 +-
>  drivers/gpio/gpio-tc3589x.c                |   2 +-
>  drivers/gpio/gpio-tegra186.c               | 625 +++++++++++++++++++++++=
++++++
>  drivers/gpio/gpio-vf610.c                  |   2 +-
>  drivers/gpio/gpio-wcove.c                  |   2 +-
>  drivers/gpio/gpio-ws16c48.c                |   2 +-
>  drivers/gpio/gpio-xgene-sb.c               |   2 +-
>  drivers/gpio/gpio-xlp.c                    |   2 +-
>  drivers/gpio/gpio-zx.c                     |   2 +-
>  drivers/gpio/gpio-zynq.c                   |   2 +-
>  drivers/gpio/gpiolib.c                     | 232 ++++++++---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c      |   4 +-
>  drivers/pinctrl/bcm/pinctrl-iproc-gpio.c   |   2 +-
>  drivers/pinctrl/intel/pinctrl-baytrail.c   |   6 +-
>  drivers/pinctrl/intel/pinctrl-cherryview.c |   6 +-
>  drivers/pinctrl/intel/pinctrl-intel.c      |   2 +-
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c  |   4 +-
>  drivers/pinctrl/pinctrl-amd.c              |   2 +-
>  drivers/pinctrl/pinctrl-at91.c             |   2 +-
>  drivers/pinctrl/pinctrl-coh901.c           |   2 +-
>  drivers/pinctrl/pinctrl-oxnas.c            |   2 +-
>  drivers/pinctrl/pinctrl-pic32.c            |   2 +-
>  drivers/pinctrl/pinctrl-pistachio.c        |   2 +-
>  drivers/pinctrl/pinctrl-st.c               |   2 +-
>  drivers/pinctrl/pinctrl-sx150x.c           |   2 +-
>  drivers/pinctrl/qcom/pinctrl-msm.c         |   2 +-
>  drivers/pinctrl/sirf/pinctrl-atlas7.c      |   2 +-
>  drivers/pinctrl/sirf/pinctrl-sirf.c        |   2 +-
>  drivers/pinctrl/spear/pinctrl-plgpio.c     |   2 +-
>  include/linux/gpio/driver.h                |  81 ++--
>  58 files changed, 943 insertions(+), 147 deletions(-)
>  create mode 100644 drivers/gpio/gpio-tegra186.c
>=20
> --=20
> 2.12.0
>=20

--G44BJl3Aq1QbV/QL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljmwoYACgkQ3SOs138+
s6EDig//Zfpk4B0+Hk/jc5WWiaL32hbpfaCYheOxws7xbRR/37Rva6pUypkRlKpt
A67Ydq/nOl/ZrZw2YVLdn7cfhVaeR8oAP823bD4o5XtY8LDzfZOHQ8Tq0WY8s9V3
8VnjCtfmwIrKiBoNeKAF4XMPCyEK1WVGzP7xdQZoMJ/1oE+1eUq0OJ2MelCY3P7G
ku77nGWNUMUTYtIzpLWErR8juXVgVk+NUoCx2rKIxVR8NTMLCUjbG2LXMd346rLm
nasKjof0wtG06Lsb1ixL1XHVaEp6mFIcRvC7/kLi5Z5gj2wTplEw0Pm5UlrTCNE9
vv9dTLyF+8DSXA57g2WP/gMac2sh3C11sTcU1fZ/wXjV5B4SwVefiQ2HcWalzpsj
BuuNYJqI7F0wR+tJZwkqYnsr183BMboWmFgvVf/1v7kCXTfNttYiutw5u2xf7l/D
zt/XADVzs69yvKWyCqAZ468e25DOG1MNEYkDe0JZeAASNjozKrQZKandTJ2jv1XN
aHO7M8gwdn8mK1w6PAMwcACeetzIpPHaH0A4rzOldE0CRZhRgzZ1uTL241/qXPLF
L+HY7kAZ71qqfI5QZguRtnT1WqFL0YS9+fyMmPOqt6ihWD4AmLF9naaOfujNn7Io
oUOOTs+3oXJ4GPTu7Ghr8S5KUu6FFaAwT/3DiH79FRfc/r8M68E=
=wy83
-----END PGP SIGNATURE-----

--G44BJl3Aq1QbV/QL--
