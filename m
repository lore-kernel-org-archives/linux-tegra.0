From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3] ARM64: tegra: Add support for Google Pixel C
Date: Mon, 29 Feb 2016 07:54:24 +0100
Message-ID: <20160229065424.GD23745@ulmo>
References: <1454949199-27050-1-git-send-email-jonathanh@nvidia.com>
 <1455020809-17531-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455020809-17531-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2016 at 12:26:49PM +0000, Jon Hunter wrote:
> Add initial device-tree support for Google Pixel C (a.k.a. Smaug) based
> upon Tegra210 SoC with 3 GiB of LPDDR4 RAM.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>=20
> Changes v2 -> v3:
> - Added PSCI information to enable all 4 CPUs on boot
>=20
> Changes v1 -> v2:
> - Removed console boot parameter and added stdout-path
> - Added 32k clock for PMC
>=20
>  arch/arm64/boot/dts/nvidia/Makefile           |  1 +
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 83 +++++++++++++++++++++=
++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts

Applied, thanks.

Thierry

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW0+sdAAoJEN0jrNd/PrOhaM4QALMCa4by31TgoYpOe1CRjhhw
GX+1sLZwOnTd40GavmZIiXMlSQL9ZmnIKfH3CjAyeR23bxchvGt+yDLnlBAXBC7m
0W4d412nrEAWf4bgb/N/1ep5TcASS0u+T6hVdsH+H1okzG45sAf5UwY6agZMKaJi
DUCCor112EghTvGLoMvfufq/+Z/fYgiXvun92dpstr1ZreSif48RltPHF2MTJ/GA
j7xZ4v9guYfCbe48KfTEjYML1bBMqRODvqwOc4TcgwCpvaM9EnTPi+AbfJFT4TOq
SFQs2UM/7k4BImIWAdwJn/ZcflCbZrdpPC6/FzDJX1vIxQEQXyGs3Nw/YvAoKp5X
sA2YIPMKLt72NqM3lN0cnTswoTF+HAEeLKCsuJyApQ284ejfVrNIesZPH8N2mn8A
5P/OmE16rMpxSvI0+SRdxhXUUZ/wI6VA7C1eM++sKAN5mJe/CEWL8CgU2wUWxxPl
1nI+aLWXJNe7Z0jAUgN4a9axjgfJJ88hbTJP+/1SEcDuEkIp31uWrCoqKuvLjNPx
SN5oVi7MHX5YPtD8RvQrmqOUoASNC0M6sMGNBS6uxEsAYB5EFA79YDKro7PZEMcB
Sou4KeyrnSSH3e6nVxTMeM3Kf8Ev1BULWte9J17HkWW2/7HGxzWN/+ZtJ+Y5EBlJ
F+p6Jk2D0oMeG8gR4Jo+
=AK2D
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
