From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Re-order PCIe aperture mappings
Date: Tue, 14 Jul 2020 10:55:11 +0200
Message-ID: <20200714085511.GB141356@ulmo>
References: <20200706171454.11316-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200706171454.11316-1-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, amurray-tUaQ5FxYRYX4aQPF92CzsNBc4/FLrbF6@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2020 at 10:44:54PM +0530, Vidya Sagar wrote:
> Re-order Tegra194's PCIe aperture mappings to have IO window moved to
> 64-bit aperture and have the entire 32-bit aperture used for accessing
> the configuration space. This makes it to use the entire 32MB of the 32-b=
it
> aperture for ECAM purpose while booting through ACPI.
>=20
> Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 36 ++++++++++++------------
>  1 file changed, 18 insertions(+), 18 deletions(-)

I've had to manually apply this because it conflicts with some of the
cleanups I've been doing to the DTS files. I'll push it out later, so
it'd be good if you could check that I've applied it correctly.

Thanks,
Thierry

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8Ncu0ACgkQ3SOs138+
s6E9+w/+JjZPchwPj6idBmuMBbMOr4W0imsNtOOmtge31wagIjngpHj1pNYFjZ42
qAgefyMb30w8IWMP8tkKHby4+UOXYE9mb6lqiertUynhPRCQDVu1+o3oWPRnmFd6
ajnTN7/9ZhXJ83NmYm/h+0Zqk/2mvg6P2DjAdOkw2ioYGmfI9g6gBh6E5ypoC+sV
Lr5VntibAYLU8+zGjkfg4yyMHHM/ljG4h6F/ybVdfkM0kqomUMkE7TcustiXXosy
pdwUv53VDf2z1FRs7UbXzZSXY8G7Xo9ZarbUtjpf5+iOr1uys484/PU60qtAY0MC
gaWp7qRtkYVDjJUNrWKGF8H0P5BNKRPQ8Nd9dyBP/QMhos8e78C6SaWHTbdCJhXr
FHys9ND/Lvv9lBEq8zG+WvDuhZlbAzjYv0mQ0qn1lDQS45ObJsxnj2Ztg8q91K4W
gWBmNyiltbRGlSYMFDeWSbvSK7PBNzrg0If3GOh2Ok5nQb3DlxQIBjmnTGeVPrv7
lS5VjzyLQgxhsoTGURMBLqFICKV5gtNBhMc6FGMzK5QCcjgzdzlP6HeO/feXhYnn
28gsh8VzOVdIkoyMLZljOp4XsNiQi2sEnG6jGJZjaIB/bt3di/hT0IZkSVt+EjK/
ilRWmKI08vgWXbM+EnVILaUJDVHN50Zqi41IYhWhyEMaReFdf6s=
=jJwZ
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
