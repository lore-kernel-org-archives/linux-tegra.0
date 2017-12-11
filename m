From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] usb: phy: tegra: Increase PHY clock stabilization
 timeout
Date: Mon, 11 Dec 2017 10:53:22 +0100
Message-ID: <20171211095322.GC10671@ulmo>
References: <20171210225535.8532-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MnLPg7ZWsaic7Fhd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171210225535.8532-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2017 at 01:55:35AM +0300, Dmitry Osipenko wrote:
> This fixes "utmi_phy_clk_enable: timeout waiting for phy to stabilize"
> error message.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-=
usb.c
> index f668bfb708d3..7d5db625f800 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -16,7 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/gpio.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> @@ -305,14 +305,9 @@ static int utmip_pad_power_off(struct tegra_usb_phy =
*phy)
> =20
>  static int utmi_wait_register(void __iomem *reg, u32 mask, u32 result)
>  {
> -	unsigned long timeout =3D 2000;
> -	do {
> -		if ((readl(reg) & mask) =3D=3D result)
> -			return 0;
> -		udelay(1);
> -		timeout--;
> -	} while (timeout);
> -	return -1;
> +	u32 tmp;
> +
> +	return readl_poll_timeout(reg, tmp, (tmp & mask) =3D=3D result, 1, 5000=
);

Technically I think this should be readl_poll_timeout_atomic() because
the above used to use udelay() instead of usleep_range(). But since the
function is never used inside atomic context, this looks fine.

You may want to bump the sleep time between reads to something like 10
or 20. usleep_range() doesn't always work well with very short values,
and given that you already bump the timeout from 2 ms to 5 ms indicates
to me that we're actually spending a lot of time in this loop, and
iterating somewhere between 2000 and 5000 times isn't any good. We only
use this function to wait for the USB_PHY_CLK_VALID bit which happens
during clock enable and disable, which isn't going to be very often, so
even in the best case (where the clock is immediately valid) there's no
need to return within a microsecond.

Thierry

--MnLPg7ZWsaic7Fhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlouVZAACgkQ3SOs138+
s6EPghAAv6vPAwumYNXxv8GF2DdFzg14baJqXarudQZxRtk5fTyUNuaeAKNjuEFy
rrr4ACMYio4k/hk2axFufES+4MdXknNzQg/1gpNkLYZQvU4yYLLqd69NhFZonPDZ
4hyUgb5J+PYZFWEngpBliRbZarBPmTZQ4SsnnB+ZZ6zzrl8QOoUsfJ/wWz2KHA61
sL0dOf1odD1ii+3hdDBF4n0vjas0qyeEHqVwrrbA1cM2N2bu9jwpd7PZJmDAhioQ
2MtaAJBRaUadCOuNRUcPODvRgfiYw2DKplVPnNUgNx5OUWhoUSH3Kny7jCF63kTG
1xwOUvAwFT9smDac1psv9WIehTAtZLXFZ9Jc9P7LuU4vMVvmUMEaVXac+AyGwhil
2VnMdPnPBIaC++gPlOtSOr1oJPQD8lduzKf2A1NukAbPUM8FVmwcVv3zyo6lVw3o
WPKR+BgxSnYKdL1q1upEoI0e6xrTJXDVp+FxK8MnA2xXQPrzZEfb8bFuJjKZj9Ei
i2DT9VjXon9dahe3wAEsCFIL+JdQyRrMZ79xoIux0TNwKS7Bv1EcMzYL+iI8CgeA
iu1+lbTJ5eFmufR+xI+BO6xiCHmxqJb+N/c9mXwl6lYrwlWvyNhNtBEJCEpLE9zX
82daFdIw4S8Q0D4SMJqN5keVJbb6zPRXBgCcgFdhAG9GJQy25Qk=
=DwOm
-----END PGP SIGNATURE-----

--MnLPg7ZWsaic7Fhd--
