From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 4/6] gpu: drm: tegra: Free platform data on remove
Date: Fri, 23 Nov 2012 22:53:05 +0100
Message-ID: <20121123215305.GA21555@avionic-0098.adnet.avionic-design.de>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com>
 <1353577684-7896-5-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353577684-7896-5-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 11:48:02AM +0200, Terje Bergstrom wrote:
> From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Platform data was not freed in device removal. This patch adds
> missing devm_kfree() calls.
>=20
> Change-Id: Id00fd1940e786dbc80c7ac5a1bd4d6a4c18720a1
> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c   |    3 +++
>  drivers/gpu/drm/tegra/dsi.c  |    3 +++
>  drivers/gpu/drm/tegra/hdmi.c |    3 +++
>  drivers/gpu/drm/tegra/tvo.c  |    3 +++
>  4 files changed, 12 insertions(+)

All of this is unnecessary. The reason for using the managed allocations
in the first place is because the memory is automatically freed when the
device is removed.

Thierry

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQr/BBAAoJEN0jrNd/PrOhCCkP/3C8ueQ4rnEYuFyIxrNO3cGc
lr1dhRFkyACXF42Grr6mbhi2lCsjw+0TKVXrHX28BYaS0uTR+w++mDeeMlRbCY6l
zALoZ1By9i/TlrAYRGB9l41lo5gc1rGm0R3vnFiK8i2AP9KgW1o61MkMb7ONTRsQ
bTbs6WfRCEvAilx0W05Juzc0y8HezPXEF3hZYMTbIFW+fCofYZYdzFxqcJscLnsm
DlayHHe/2K+Q7G8LeqX2RUukDgzFYRK2oDqU4GvDu6icJuSEQoJTKhG4dsnUOajU
TahIbSqiNvgQ8Mq6U9Agb6+PJiclP+ApLiG/M7v02PR7qdtFUnEn0limxli8fbph
iGrZNWJQg5HDOTax1JQ8rg+oE51v8Wqf85cvvxbH8TWG12tMcLvufixQICe1fZYj
4+UiZBxN0WjJTTu3+kpJhnCZR89O+Unhf1OJzStnVDxDr+1UGyRUhP1lAgq/8DrD
R2+HTZGOfs3GAFzSucR3GBGf5ZJnyHwrxBN32TlaPlSH2UWwGQ36UDUXyBp92cXx
nEMKspW2ynv5uywhjCa2I65c2NJCOP570sSMdtdgIrlITsIk4GpB9MB4Yc9t05a6
TUxEhntCgF/aMBHQC2kYCAUWdP2zMbuTKm9pE3JcbjT4bZI2C5pdHUyrsCx33dxm
Bgzj8l2yBDaPflZkXx6M
=lpPQ
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
