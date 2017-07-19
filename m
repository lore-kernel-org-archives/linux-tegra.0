From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] irqchip: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 08:20:06 +0200
Message-ID: <20170719062006.hivodv3zppq6swdo@flea>
References: <20170718214339.7774-30-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7dqvm2bvmpvcpfsx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170718214339.7774-30-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>, Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>, Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>Jonathan Hunter <j>
List-Id: linux-tegra@vger.kernel.org


--7dqvm2bvmpvcpfsx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 18, 2017 at 04:43:10PM -0500, Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>=20
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
> Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Cc: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
> Cc: Baruch Siach <baruch-NswTu9S1W3P6gbPvEgmw2w@public.gmane.org>
> Cc: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
> Cc: Sylvain Lemieux <slemieux.tyco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
> Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: "S=F6ren Brinkmann" <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/irqchip/irq-bcm2835.c            |  9 ++++-----
>  drivers/irqchip/irq-bcm2836.c            |  5 ++---
>  drivers/irqchip/irq-crossbar.c           |  6 +++---
>  drivers/irqchip/irq-digicolor.c          |  8 ++++----
>  drivers/irqchip/irq-dw-apb-ictl.c        | 12 ++++++------
>  drivers/irqchip/irq-gic-v3-its-pci-msi.c |  2 +-
>  drivers/irqchip/irq-gic-v3-its.c         |  6 +++---
>  drivers/irqchip/irq-gic-v3.c             | 11 ++++-------
>  drivers/irqchip/irq-imx-gpcv2.c          |  4 ++--
>  drivers/irqchip/irq-lpc32xx.c            |  2 +-
>  drivers/irqchip/irq-mtk-sysirq.c         |  3 +--
>  drivers/irqchip/irq-mxs.c                |  4 ++--
>  drivers/irqchip/irq-stm32-exti.c         |  8 ++++----
>  drivers/irqchip/irq-sun4i.c              |  6 +++---

for sun4i:
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7dqvm2bvmpvcpfsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbvoWAAoJEBx+YmzsjxAgxdoP/1CvqdT8vk9gLRWahyZUNHBc
gz5fWqgLHRgFeOxLumxBHGl6p5ZwZhul2rK0PD/ZOwwxp53mMkguMzHuwgToZciv
KDl+bU9rPRiX4mrnlQOBlNrawGr5IOr/Vtm9su94/7R8bmOVHq8CNazMuNNLqr7Q
O9F+RiMg0JdwFrQ6bbGBsM7cdtN8JFr4qeutrYUrT+pOQLXRTMWJFEhAJRvuk1yP
dUUu4dVEFqUEe+edSZYuJdrQPuQGTkTnKN6vjDFvKZryCQqmkQgpEtlDdGOWrXTc
/ooj6mRT8vnd0RzeLouttpScC0No75URXls5o7xF+oOJcygpw80FUZEPo3gFGIx9
lrSugAfRTlGTxLPN9Mj3ebmoFquU1VTQTibIEYxDmnmK8QY6IQDRRV5Jmfm6aler
1OSvKI1ImuWd4i4iRrywuI2x8N89vzbdmlBIqkKf3D3NWwCbFsuX1yHjQRfAQkZz
Y1SLJZ4IPvWm/SHr2b9h946keM6UxFiedAF4UvakgwQY5sj2F/yUrmkaemOMikEY
hn014a26CIqjbq6w+JrbwkajUEkdcdeokzwZFyPqCkwaU92+i7OD+nJkmbYTuMkx
fgrQv2hwP330166J2cbi72UQcbBmJE3SyAaHj5OWVN9Os4pZrcm1osyFvgw0cGc6
UMV7s6/fCetapd//4i9Z
=LXvg
-----END PGP SIGNATURE-----

--7dqvm2bvmpvcpfsx--
