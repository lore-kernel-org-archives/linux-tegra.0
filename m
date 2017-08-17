From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Support sub-devices recursively
Date: Thu, 17 Aug 2017 17:52:36 +0200
Message-ID: <20170817155236.GH30664@ulmo>
References: <20170815134622.21289-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nOM8ykUjac0mNN89"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170815134622.21289-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nOM8ykUjac0mNN89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 15, 2017 at 03:46:22PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The display architecture in Tegra186 changes slightly compared to
> earlier Tegra generations, which requires that we recursively scan
> host1x sub-devices from device tree.
>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/bus.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)

Applied, with leftover debug messages removed.

Thierry

--nOM8ykUjac0mNN89
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmVu8EACgkQ3SOs138+
s6EjTA//UvqO+Ph6qJwlxiOOO9aw4ZdAdZh/Z15NaXFg1nlWt21n3E/e+S5t0l05
DW2OibFKRvxyUfqBiru+B8Gew2mld4++AUP9VWL1It2o5vvlUW7RK9K6xg25Nfky
Phnq0isVj7n/UZsgu2IF6LvmkZyQayeTN+M0fk2eRRIK7mBRb6EGF24qX7Zp+7Gj
w0NBEkybvjXl5ZhjHpEg8w/zooo3oGtJZ/99HKTP5RvGShd+bb9WqGvuBACmcXT8
y32PBd+6EA8Y1FPxSnHBs1ud8bOl0YG4YdikhM/glcrDoMmNK9WBy7qY4l3R9nC4
DVXukEONqCepK3H3JPpc8K1XxyjtW4l67dAl0fIXGYDJPGAJYBpbsfOEpI+TE1Z0
6y6DOYVp2r7vymrSwSwLK/kJZuC0CrRUc+DCpO6P7BBNnsps2ZaDQkO5xaXrVrHH
PyLt1+N1bqAOuZq2kcY5hfZeqtVeJNDv3En9DQain3ebZ++dRhTwgeH/zx8k/z+3
I5vx6QoaD4v2QZgMlwONfmRWGokwvyrhinYTafKtk5IQupbTcDOX5ZCSawz4i7hH
wgcyEBhxfaa19ZmunjVYUs0msVi7ySk86aD/WwsKPgbeP1Yoofsb7MsQO8p4+r71
y/9owcjkiT2FXCnNeNCWmUKbE3tiYydnFHDW3EMdZBgVx70VtYE=
=OE6S
-----END PGP SIGNATURE-----

--nOM8ykUjac0mNN89--
