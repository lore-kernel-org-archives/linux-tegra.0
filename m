From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 31/31] clk: tegra: remove bogus PCIE_XCLK
Date: Fri, 29 Nov 2013 15:56:29 +0100
Message-ID: <20131129145628.GK9712@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-32-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VJJoKLVEFXdmHQwR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384548866-13141-32-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--VJJoKLVEFXdmHQwR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2013 at 01:54:26PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The "pcie_xclk" clock is not actually a clock at all, but rather a reset
> domain. Now that the custom Tegra module reset API has been removed, we
> can remove the definition of any "clocks" that existed solely to support
> it.
>=20
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.
> ---
>  drivers/clk/tegra/clk-tegra20.c         | 6 ------
>  drivers/clk/tegra/clk-tegra30.c         | 7 -------
>  include/dt-bindings/clock/tegra20-car.h | 2 +-
>  include/dt-bindings/clock/tegra30-car.h | 2 +-
>  4 files changed, 2 insertions(+), 15 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--VJJoKLVEFXdmHQwR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmKscAAoJEN0jrNd/PrOhp9UP/0L+hqIxs3w1SbQG69Ld3BNN
p1YzlB8S68lsNn8W4vDpq4nRS9hAJYTP/tHuKnAsiIv5goGrX7u3BH3Co1zO9WIz
mhPU1UhaCCqrqoH1FLhiLgkhOEzJ7f8qTwvg7mtYKo9ktx0toS1TYhC1vUfMrlCM
lrF2VzOM4tPwuRMgJOF1LPPjpVQgrmYz6Xa72B8XVi400EyaKhf3dluucSMGYa+3
EAZKr+ekLPgFyOl3Q6JpGm6wU+M8Vi/XmU8LmXsv74gNhQ68ETmRZX4u+Hy+xw2W
VsGDwREF2jug6JBzDujXy8LWlKTSCyAn0ixH580AG6fdar5sh0y3+U43z60OFR5g
OPnq+BYwbcFIhRaJCM5T6W+vdkSCRDjK2af0Nq5ipTgjcjcXfEcw8KOUU4DMdAMc
e7a7k5/KrWKrySxBthBsdJA19H4HK7f6h/OWMNzAzUueVX8fuN2lIpBLrZeMuOml
gydBP2ESk1XwK+74I2DRsic4rS//QnV3e4PRk89T8WIwZ9jTEHcjNshDfj3sE4Rv
BUk3Yq7WC/ryGRu35RQI/wXPWSj2U/IRHe6DX2iaV3ojaakiAjD1wJTWhtx9Bj22
bhNJu3ftBz5qF3E8WDEheTxCpaBX7vomepakGu4vOtgxqyHvLioizix3rR/3dqlA
g67RVnZ/xioHbIQPOsko
=SSmW
-----END PGP SIGNATURE-----

--VJJoKLVEFXdmHQwR--
