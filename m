From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3] ARM: tegra: enforce PM requirement
Date: Thu, 28 Mar 2019 17:14:37 +0100
Message-ID: <20190328161437.GE5518@ulmo>
References: <1551255628-4794-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="PPYy/fEw/8QCHSq3"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1551255628-4794-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: linux@armlinux.org.uk, digetx@gmail.com, jhogan@kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, treding@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--PPYy/fEw/8QCHSq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2019 at 01:50:28PM +0530, Sameer Pujar wrote:
> Currently runtime PM is enabled for Tegra HDA driver. One of the concern
> raised was about handling !PM case in HDA driver. In this case, there is
> a need to manage clocks and power explicitly in the driver and reviewers
> were not really convinced about this. The consensus at the end was to
> enforce PM requirement to keep things simple, rather driver mentioning a
> dependency on PM. This is how it is done for ARM 64-bit Tegra platforms
> and the same can be done for 32-bit Tegra platforms too.
>=20
> Finally the objective is to remove dependency on PM availability for all
> Tegra drivers. The detailed discussion can be found in following patch,
> https://patchwork.ozlabs.org/patch/1031007/
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm/mach-tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to for-5.2/arm/soc, thanks.

Thierry

--PPYy/fEw/8QCHSq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyc8u0ACgkQ3SOs138+
s6EdjhAAk1+0yhpb2a8qaFvS5uO1yjOA6wkkw/sTEkZDvfAA01N5/Lg4nn6i+Obr
4zTcz12Q/uk15Gb6zrAMSnztYlqIwCdzRRSCgFxa47Ob+So6b3PXAVNV4l3y9cXA
QMlcw8Ua3bztPstydBzqP9VxdNjtQF9KW1ZZp7GglkpnBBLCguJwLpsr2I9BgWm8
UqAOnSjT1o7gauQXE2dhifNsv7ZV+sL5PqKUs+cQAUo2RdGgDAtipEhJzosK0q4s
Dtrw8JKVKjxWkJF5F3AxlkGp5zjqk4Wcgzlw0Wb+OciFX3b8bcLtCO0Zrm4Kf5Lc
vDgWmv9KbNu0rWpc2TGBTr2kv62j2u2Ea1IB455NPuXw1itMt/+d2nPkNh+AJ+xZ
+CnEEknhOUjLyub7XW3mDERvTtV3kDIRGmj6az/ivma4Codyg6Xzf9Rh8LMNO539
VWR+bpxcrelQw5aWA7M7dGOOU9II49iaEmHec7rJeuHPGo7kWxIRHpEWEn4xAoHN
ozvo8+Qv7jR3BPNHM5Z7e1PjVRF2znIbY4LMhbILBmEjUGlnhUnUJ7FRjp72bKTz
kXaj6Kd5PSYz+BbgNjdv0SLRIGkjEb7iiZcMlimPYEvIiHOyZp6U5mGjMgCmsitT
NuP4s3b5ZPCJarWUBAvBeEewlpC1x33pAx89U38E/9oT+Kj2vm8=
=WZZP
-----END PGP SIGNATURE-----

--PPYy/fEw/8QCHSq3--
