From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/5] firmware: tegra: Add support for in-band debug
Date: Tue, 14 Jul 2020 18:18:09 +0200
Message-ID: <20200714161809.GE251696@ulmo>
References: <20200712100118.13343-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Dzs2zDY0zgkG72+7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200712100118.13343-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Dzs2zDY0zgkG72+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2020 at 11:01:13AM +0100, Jon Hunter wrote:
> This series adds support for in-band debug messaging for the BPMP and
> updates the BPMP ABI to align with the latest version.
>=20
> Jon Hunter (4):
>   firmware: tegra: Use consistent return variable name
>   firmware: tegra: Prepare for supporting in-band debugfs
>   firmware: tegra: Add support for in-band debug
>   firmware: tegra: Update BPMP ABI
>=20
> Timo Alho (1):
>   firmware: tegra: add return code checks and increase debugfs size
>=20
>  drivers/firmware/tegra/bpmp-debugfs.c | 436 ++++++++++--
>  drivers/firmware/tegra/bpmp.c         |   6 +-
>  include/soc/tegra/bpmp-abi.h          | 913 ++++++++++++++++++--------
>  3 files changed, 1038 insertions(+), 317 deletions(-)

All applied, thanks. I had to tweak a couple of things to make
checkpatch happy, though. checkpatch also wasn't happy with the ABI
header update, but I left it as-is to make it easier to update in the
future.

Thierry

--Dzs2zDY0zgkG72+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8N2r8ACgkQ3SOs138+
s6HKbQ/+OyWkNabkwaz2VIm+/UvhFTkpltTAO12a9bnuwIL0Gt4mTs2HF+aDlcnZ
fxDfrDxElOe9OJzNGxrbaKoM9ADIllqkiAw9OAgyDJG5SfdIRcZmD0gucFzM0mrS
uHPduH0SvnW8lZaRO89886bZeODiIZwlQyy4VxntIlnhX5D6cb8Rvxx3R3r2KuT5
SrRE63hz2C6HNuuBgzn6VNRzwnnc8FZkTzI6o2Oy3Rl86hOXe0W7YQZrl8UVtKEM
5u3GmJPaxNU8FTzaq2iOLyy+TfElwG2a3O/z/31OAtMJp30eBeL3o92hOl8QUdC3
uhYWerRv1d6Ykxm/3/bWyXYkm8hoKCMSHZW464mtCLOMH0RNM0+ZGgOVVFIGJROE
0wjTdj+Lf05IF67jgCYXLAAqbB2Cl4ZpOwH8Yv8EY3exoObwMWEMwbZiR35LZlLw
xe0GwwYFyCQLMAMLiXmqYqouQD7hlHWPHGjJ9KqcTwcdRKzvuDM40Nsm3fviJ+X8
6qV1UGva09j8KlbNnotMEpak9J4meQlubD2BgRBXnfEjNwm369+z0BgxFj36LwT8
+duclmGy9s5fTi+U4IbGD9i5kmHUQ/7bcRmmortkuR8LfNZ8bvL3C/yo3OSpVeKJ
n6cMzHSArgZA6z1Qf6MTSsDOecytuH7K/htthYF0T3w8QNdkbjo=
=k44N
-----END PGP SIGNATURE-----

--Dzs2zDY0zgkG72+7--
