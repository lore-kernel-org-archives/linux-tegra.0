From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 22/25] pinctrl: tegra: pinctrl-tegra194: Do not
 initialise field twice
Date: Tue, 14 Jul 2020 17:49:14 +0200
Message-ID: <20200714154914.GA251696@ulmo>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-23-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200713144930.1034632-23-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2020 at 03:49:27PM +0100, Lee Jones wrote:
> Both PIN_PINGROUP_ENTRY_Y() and DRV_PINGROUP_ENTRY_Y() macros are
> called for each of the 2 pin groups defined here, and both of them
> initialise 'drv_reg', causing the compiler to complain.
>=20
> Only initialise 'drv_reg' once.
>=20
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: warning: initialized fie=
ld overwritten [-Woverride-init]
>  71 | .drv_reg =3D ((r)), | ^
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:105:2: note: in expansion of ma=
cro =E2=80=98DRV_PINGROUP_ENTRY_Y=E2=80=99
>  105 | DRV_PINGROUP_ENTRY_Y(0x14004, 12, 5, 20, 5, -1, -1, -1, -1, 0)
>  | ^~~~~~~~~~~~~~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of ma=
cro =E2=80=98drive_pex_l5_clkreq_n_pgg0=E2=80=99
>  124 | drive_##pg_name, | ^~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:128:2: note: in expansion of ma=
cro =E2=80=98PINGROUP=E2=80=99
>  128 | PINGROUP(pex_l5_clkreq_n_pgg0, PE5, RSVD1, RSVD2, RSVD3, 0x14000, =
0,
>  | ^~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: note: (near initializati=
on for =E2=80=98tegra194_groups[0].drv_reg=E2=80=99)
>  71 | .drv_reg =3D ((r)), | ^
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:105:2: note: in expansion of ma=
cro =E2=80=98DRV_PINGROUP_ENTRY_Y=E2=80=99
>  105 | DRV_PINGROUP_ENTRY_Y(0x14004, 12, 5, 20, 5, -1, -1, -1, -1, 0)
>  | ^~~~~~~~~~~~~~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of ma=
cro =E2=80=98drive_pex_l5_clkreq_n_pgg0=E2=80=99
>  124 | drive_##pg_name, | ^~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:128:2: note: in expansion of ma=
cro =E2=80=98PINGROUP=E2=80=99
>  128 | PINGROUP(pex_l5_clkreq_n_pgg0, PE5, RSVD1, RSVD2, RSVD3, 0x14000, =
0,
>  | ^~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: warning: initialized fie=
ld overwritten [-Woverride-init]
>  71 | .drv_reg =3D ((r)), | ^
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:107:2: note: in expansion of ma=
cro =E2=80=98DRV_PINGROUP_ENTRY_Y=E2=80=99
>  107 | DRV_PINGROUP_ENTRY_Y(0x1400c, 12, 5, 20, 5, -1, -1, -1, -1, 0)
>  | ^~~~~~~~~~~~~~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of ma=
cro =E2=80=98drive_pex_l5_rst_n_pgg1=E2=80=99
>  124 | drive_##pg_name, | ^~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:130:2: note: in expansion of ma=
cro =E2=80=98PINGROUP=E2=80=99
>  130 | PINGROUP(pex_l5_rst_n_pgg1, PE5, RSVD1, RSVD2, RSVD3, 0x14008, 0,
>  | ^~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:71:14: note: (near initializati=
on for =E2=80=98tegra194_groups[1].drv_reg=E2=80=99)
>  71 | .drv_reg =3D ((r)), | ^
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:107:2: note: in expansion of ma=
cro =E2=80=98DRV_PINGROUP_ENTRY_Y=E2=80=99
>  107 | DRV_PINGROUP_ENTRY_Y(0x1400c, 12, 5, 20, 5, -1, -1, -1, -1, 0)
>  | ^~~~~~~~~~~~~~~~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:124:3: note: in expansion of ma=
cro =E2=80=98drive_pex_l5_rst_n_pgg1=E2=80=99
>  124 | drive_##pg_name, | ^~~~~~
>  drivers/pinctrl/tegra/pinctrl-tegra194.c:130:2: note: in expansion of ma=
cro =E2=80=98PINGROUP=E2=80=99
>  130 | PINGROUP(pex_l5_rst_n_pgg1, PE5, RSVD1, RSVD2, RSVD3, 0x14008, 0,
>  | ^~~~~~~~
>=20
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/pinctrl/tegra/pinctrl-tegra194.c | 1 -
>  1 file changed, 1 deletion(-)

Indeed, looks correct to me:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8N0/cACgkQ3SOs138+
s6EyDg/8DvdSsh/xAJCs/CnR7MTGLh60dManNXVZn2FQihuEEXhDyqs7WC+JLmiw
5mxbGiNt+0I6GsVizGeyuqtFUY0t4HpLLAY6mrMatr2lRnJ7+5VWnKhvj3ouRDqU
Xmw96Gkc+aoQY2he1VyJ41OnZrdSNoaniDN7GUZ4rSg+oRYsv/7GzMcUGuH021oc
MtOFXZZeaelUIE+AUqT7V4WBurTNW0EFmCC/l7n7ZWQBz4eZ1cbRS3XNZBDArqsv
acF+a7W6RlgmiTYyQtVvew1KttdW8vXPLE4IvhibWe5EVW8x6ra7CeYDnsUZE7RY
JuOImmlImnjwoJbRLuHcuOL9tGU6f5Lvchmt8moR/rADue3D0ltswJZE+jslleyp
9aM4wtOOmymbbPLzNeNPwMU4FWmA3KR2DSa0GxLMuLOJR7s1bTyOb4ygWAPGnBUY
gHxAjYLCTS+ZpLMEh0mHaSAxAt0pSq7j/wZVyEUe/QXTGrvq3D0LiL7jHJKcX46R
x6mkVt7vFHlv4lhkUIpsE56BYws+9q1s5g63OHuJ+8VFkUwCaPFXX1MaLaBpXNTa
9SmovIo0mG99ExVK1RZmba0Dd/SUF20cxK5NRtRTvEYMRAdzhNMHNa7vgDFlZLF2
oplZw4k0f61kijz2+u8GF+gpyzEDsxJgBM1yOm+7JAy1L9OLQwg=
=1tXh
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
