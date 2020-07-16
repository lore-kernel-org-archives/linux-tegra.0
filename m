From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v3 02/18] arm64: tegra: Add missing clocks and
 power-domains to Tegra210 VI I2C
Date: Thu, 16 Jul 2020 15:25:25 +0200
Message-ID: <20200716132525.GI535268@ulmo>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J+eNKFoVC4T1DV3f"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1594786855-26506-3-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--J+eNKFoVC4T1DV3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2020 at 09:20:39PM -0700, Sowjanya Komatineni wrote:
> Tegra210 VI I2C is in VE power domain and i2c-vi node should have
> power-domains property.
>=20
> Current Tegra210 i2c-vi device node is missing both VI I2C clocks
> and power-domains property.
>=20
> This patch adds them.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

Thierry

--J+eNKFoVC4T1DV3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8QVUUACgkQ3SOs138+
s6F3SA//ZjtMB7xBZ6HBUcP64/WJge+YF7WI2y+H5sKJfBeM0U1C8alR16PQq11z
F96RGmLb3MXmS7xe1GldWEsybS+L6p0earsr70YTyylfbH/n5Y7O/lGIIyuh+GI4
uye1Mzg18tuNCdnc2M/b8guscVfhYYpKROQTEUGOipxUmvW+i0s2A323W6glfBEY
Q2e02KK/6m1wm0YF8I4wwdOBUn0Crel/ojaFeAO/HL21prKj8a+inJPicD2GSn4X
ADDWtoMfHkOaL5zcr8bC05QFZuSRvIajdKKeuJ5xtVGqrTCuLJR1LOfw0xLH7daV
eLxTYcBWRJ/bkNBlUpnluibploP+2bVEHTRDQqhpTFMZoGn30hwL67amumDALk/4
ytsF+tZyXr+ixMzA/iuv76T+GnkFWKm7/qe9bhnNgyV/GooJ26xMOog+m0BUQvbE
D749ofyu7TlH08Y9vkGjXRztqLoXyisyTnNLHaifoUBoMY7W4xROUSScHIZWc6sI
PEZlt+9JJt8uT+1GWWdzphv2Fr1OI1FoWQ645E3dM+GhlqTh/4qde0yAM3iA7MdK
Ihp7UQXIbtiThykIrvMbrSxB0JpIyiXpol9HxXSlyk/HvRqstcc2DgbfDARkPlcb
H4PXNn4diPdJp9ow+yyqHIsDAx6b9YpTO2YBO2aEMjA3CT1ivzY=
=gsdR
-----END PGP SIGNATURE-----

--J+eNKFoVC4T1DV3f--
