From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 4/5] drm/tegra: gem: Correct iommu_map_sg() error
 checking
Date: Wed, 20 Dec 2017 21:17:16 +0100
Message-ID: <20171220201716.GD31757@ulmo>
References: <cover.1513783738.git.digetx@gmail.com>
 <1daf8bfe7c4ef37a4d5d6d5f87eae36425a3df14.1513783739.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1daf8bfe7c4ef37a4d5d6d5f87eae36425a3df14.1513783739.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2017 at 06:46:13PM +0300, Dmitry Osipenko wrote:
> iommu_map_sg() doesn't return a error value, but a size of the requested
> IOMMU mapping or zero in case of error.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/gem.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlo6xUwACgkQ3SOs138+
s6G+3g//SYg0QxbxKk8QOecf8DO0APyxhKmCb8SWsxp18Pm6LuDMCuLcm2lr5R+g
wULs3Bm+7nmqAdPXDgS/MoUbVQTBF2yytU7NZsjOxxgivGrEF4GAvJpne3//PGX7
b9Qt/uZ/1kYm7ba36zWgoTj7oHAXKQgg5/XGRgTA37jGbBPLylrRu9W3xHj/W61W
ULEs2NRbRGY/FJ3L+Rth9IHQqQv1Lh3FIwdPIZUjy8dvxPwYjdhoRckAOEwbmp9z
gw+wpq71nvl4l6Cy4KuxDgWnK4R5HntQEqwnRsT6Uy7eg0xXWPf2zRECWk0OAOpO
9phyXUrHghBvWd+XxanVYrMLHcEyE09KNQss4RHkdLD8O4X4nDbT6Y6i3csHj2G7
uMk4eW/UnVL6eFPBaoJU3k/WJX8gWua8tGT+3N3B7XjELbV62n7VTDgDzStJMSDs
rmE1+77GGnNoKaA4/DcA2NZuQ8FCt1xfnPPv4RQRr7Sm1fjkhABeB9bo6yp/ybRA
ItbnzQsQpKK4z/QVIGVQOZd2fiwTKDOLPtz0kQ54v4KuAQOliFeEbRcMlKGVBSAo
tl6q0Gc8f+iKaIIv8AT6iGTMCSfioBeO/8ZnBd7j8Q4DDmILfz+Jwm5bsCHWD24n
LvtG5ZqJzNavIcRarplIR7SxyUYT50rRUXlxxWSzBSAVP7+PTYg=
=w7Ex
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
