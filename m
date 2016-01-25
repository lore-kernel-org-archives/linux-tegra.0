From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM64: tegra: Add chosen node for tegra132 norrin
Date: Mon, 25 Jan 2016 14:57:04 +0100
Message-ID: <20160125135704.GA7014@ulmo.nvidia.com>
References: <1450704171-8345-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450704171-8345-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2015 at 01:22:51PM +0000, Jon Hunter wrote:
> The NVIDIA bootloader, nvtboot, expects the "chosen" node to be present
> in the device-tree blob and it is not then it fails to boot the kernel.

"if it is not"

> Add the chosen node so we can boot the kernel on tegra132 norrin with

"Tegra132 Norrin"

> the nvtboot bootloader.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 2 ++
>  1 file changed, 2 insertions(+)

Otherwise looks good to me. Given that this is a fix for v4.5 material,
you might want to send it directly to arm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (and perhaps
mention that you'd like to have this applied to v4.5). With the above
two fixups:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWpimrAAoJEN0jrNd/PrOhm9wP/RqlgJmhv/DEouaPXp7FXsDL
pXzBXrOFSe00ueET75r6aL+eEKwgn45IhhyPL5XiwkjdMhTqc4Y5kpQLdh3X3e2u
hXw+kbaKyHn95fSsV2vaz+mvt0cHCB2cafgsmw+6GfoslnSd4J1eJ+fuTa53IZki
sxKywogy8UdFJpwE9BKckbQm3+9enVT5hcr2A7myFTZIuRJO0XRTmUvHAjypNI1R
Vs1VGTK3czFlOlnXHDqBdlWayYR1tH6F38Bj1vnxTcWvecwlhZLn5b4s3kXNN8q5
k3Scvg063WngR4rIbKL/l5YDb9yD2e4g1Y1tBhFjn8JGYfm11kR06hSwvR4NBvWq
peQ+8HrsqzOEYIIriBbvKtMO7yMnfIj2MY84ngYhGuQsn74ah3bmgRr5fYTPHM0l
dAG5UvzFmmbq+HOaenig6uCRrmkyIfjMqTziyDPjC0oFGioKUb5TEtU2J3xAeOvP
09EoAfuhAY/SSLebWgdDWPKepa6vyKend8sx8U6rpyZ231fNFfKc5leJ9PMWy8nO
1UNyLGI+grlN2gowbBQU6/7/oAHx1NUgH9dulHmjnXFTuUA/9T5GNEifcCU9kMwc
6SuuPYpM+86ROob9csK2DHQ1Uf3G7Slp554iQ764Clf3C6ibT55AfYd3si47Qcbo
nOhfxp4WKyWErGGA03gv
=5VDZ
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
