From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 1/6] ARM: tegra: Remove unnecessary inclusion of
 flowctrl header
Date: Tue, 4 Apr 2017 15:41:52 +0200
Message-ID: <20170404134152.GD843@ulmo.ba.sec>
References: <1490704978-22906-1-git-send-email-jonathanh@nvidia.com>
 <1490704978-22906-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SO98HVl1bnMOfKZd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490704978-22906-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SO98HVl1bnMOfKZd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2017 at 01:42:53PM +0100, Jon Hunter wrote:
> The Tegra flowctrl.h header is included unnecessarily by the Tegra
> sleep.S source file. Remove this unnecessary inclusion.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/sleep.S | 2 --
>  1 file changed, 2 deletions(-)

Applied to for-4.12/arm/soc, thanks.

Thierry

--SO98HVl1bnMOfKZd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljjop4ACgkQ3SOs138+
s6GWwxAAumgjaXji88L090H2+1tjHb5AxpVfedPNBXcXXHdHcUoMCfYoXUJXHdwV
pOVVI9BikFfrvnxhaKMWzCaKn9TVswlJuMzsK9HQIujq9HzvhY2MSAn03cJ+Rb8S
FDgoUGrP5e3mW4TP8QEqhGwZ//PsYcoNLQQCq699UmydqOvqtgSFkjFhF7b4WycM
+oUtcfu+fBobeSGErXdjmxJ2pjsSz8w88LVCzVNJYD0KGPT/oZfDj2laQohqgUz0
zmiVabKBCza4byqBYJ6gbTyywA78fWi0183XtY5Pn/ULaDDQFtAvK1GblJAhqNcC
eMtxwBXeLCQbKnegHxTqT7ljGnDVr/NhgPEEAu5ddKli0rRuoybj+MateBPVqftx
JtkvaCXjaMSCRNiu6iCC9wj4knLR86bC6+Dzyesgy5gmhi0UCDbaA3K6PElmlrlc
0Lq7L+2XvzyBlqSknTyA5M5CYqWPdiWPlpMamgZfrZTgQsmSFgLl5CudCw3bRQ+W
dpDUYbJGUHLsAsVobCw33BSvQBZrJMycPXW3zrfUD6uvLOJyuEk25ncA0s4wN1oq
pYwZnEy5pOQSNLQ4OL8HLalglIiTdf2/Qqwc+C/4NOKG5m0cMU/PYyI+GzRhMvX0
dVQeO1SHBuciHr2RB2M6Wj28NFr3DiEdFJw7Xd1oId2GAuDuQeU=
=pWy4
-----END PGP SIGNATURE-----

--SO98HVl1bnMOfKZd--
