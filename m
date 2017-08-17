From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm: tegra: add CONFIG_OF dependency
Date: Thu, 17 Aug 2017 17:20:13 +0200
Message-ID: <20170817152013.GA30664@ulmo>
References: <20170721161333.3332968-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1022804978=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170721161333.3332968-1-arnd@arndb.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stephen Boyd <stephen.boyd@linaro.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1022804978==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2017 at 06:13:23PM +0200, Arnd Bergmann wrote:
> Without CONFIG_OF, we can run into a build error:
>=20
> drivers/gpu/drm/tegra/dpaux.c:378:20: error: 'pinconf_generic_dt_node_to_=
map_group' undeclared here (not in a function); did you mean 'pinconf_gener=
ic_params'?
>   .dt_node_to_map =3D pinconf_generic_dt_node_to_map_group,
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>                     pinconf_generic_params
> drivers/gpu/drm/tegra/dpaux.c:379:17: error: 'pinconf_generic_dt_free_map=
' undeclared here (not in a function); did you mean 'pinconf_generic_params=
'?
>=20
> This adds an explicit dependency.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/tegra/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmVtCgACgkQ3SOs138+
s6FDNA/+Mznb4InDKHLjaCgguZkcskINrYwxIo2NA3FX/Dop5Nx7x7TG4QbA2wn4
KJfp6BgxF3NaiclHlJuXoI4Fv0SV4ZdenAOYNzzjBEgWXztlf8dk9HX+ASVgeRUf
FcYpBGqHW0vGPQrIbBi6417xPa4a6D3IM+xZ3n0COIo49mD6Z8RhLw8nB4vtSvug
35XWDY8oxKh79zR2DdTrnORSuvtv1bzXT2tStuM2CbwX0HXDaCw8x03Ni5reqbu4
1mccl2G5Z92r/1CIPFqIV7mnZLszZ4JqCi2dmj45UlrP8VdoJD2bEmhP2RHcXjvD
7wXii3uw9F1LeAXjmcnij69RMHcjbY36qam3UYQ3XVnYKbwvL24OtnBOwYUES+E+
5YOWEBFmXxtR3xmQbcJ1tIXZ28h5kdWcGub9YCepa0kxAKs9pzQ1tgb4ZEmi42Fj
yngD3sJMbNVz//7NrrpTasXioAvdu537UvJoThVrjQE7u/NfXokAd1xrJqGjfGPG
2pC7ohzWABCn488nnyfbvIQ1hUNUBam+6CVuW6ZHnfaRbf8XtA7KgGa9Zmc3tQr/
Iejbuc9RlfKyHY36xJHuZ89bDlfmnpooRudz5y52j9VTRXnmQLKrygWgFVOxJ93P
748dI96qZrVxlCQ8+gvdOADscW//xCpeUTAkx1UeAWFOXhZksYA=
=h9mK
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

--===============1022804978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1022804978==--
