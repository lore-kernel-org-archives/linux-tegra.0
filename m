From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] media: staging: tegra-vde: Runtime PM is always
 available on Tegra
Date: Fri, 26 Jun 2020 09:44:52 +0200
Message-ID: <20200626074452.GC3109062@ulmo>
References: <20200624150847.22672-1-digetx@gmail.com>
 <20200624150847.22672-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="WplhKdTI2c8ulnbP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200624150847.22672-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--WplhKdTI2c8ulnbP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 06:08:45PM +0300, Dmitry Osipenko wrote:
> Runtime PM is always available on Tegra nowadays since commit 40b2bb1b132a
> ("ARM: tegra: enforce PM requirement"), hence the case of unavailable RPM
> doesn't need to be handled.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/staging/media/tegra-vde/vde.c | 16 ----------------
>  1 file changed, 16 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--WplhKdTI2c8ulnbP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl71p3QACgkQ3SOs138+
s6G0vQ//dpkQN0nsvPYnk0HeH8sLhO6u9BWqfrWsCUM8ZM7Jr+G08Q7YjDLcF72K
awBVBLgjK0ZkBXmMoT64J57xHfC7O9747zPiPedoCntFPjYTC5cLXVW61LRLrZFD
aGRLXJ50YQCf5bshtmRfK+PVL2bcXvjV2fJUP+MremfE24OALFW3IkFP13BPhxVs
d2fYwTly8qqAu6eG4vj5b4wzd0u1d5Zq0qVIxE2kwb26jY+8qtLZz8Fm0d1P1jYV
FBen5xgv1x2G1KKedLyHakMXh3EjziF5SARiuM3KqpOtf3jQc3niXfxuK2ocLb43
PvpaMmCpKP9QPPcWPANtLdHb6tIpTKdvzhqSmoKKyZ1mfsr4P9Wou8V0j/csTP5q
vn4DuAaZp3ub76f84RSBb3aPen6Xtx1tALh0eONWFiuKDzKdbEDKxrO19t5eD3Fx
zSPijXgN4kxRMyDgiHIbUNMMdoF69fhO9lTB0zgl35AFM8YV3G5MozNtl8pB/ZSk
21BaDXvsHvPIuI6glZGVvSSDPDRpEz/DAu7MNOeMkOSy5vNz3mOHDhAL1gMVeU4d
KcRkYSlDnfyHizQIMTXzfsgnTazFFBx8UaKwhsKEP83xJpCeULZehO2vKib9xKJm
m4ig+UbpWnkync+LRXUGBph3gDX8yvoTaRjotANmfK8upi0VBu0=
=8Q9h
-----END PGP SIGNATURE-----

--WplhKdTI2c8ulnbP--
