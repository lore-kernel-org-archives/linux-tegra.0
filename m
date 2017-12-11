From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/2] drm/tegra: dc: Link DC1 to DC0 on Tegra20
Date: Mon, 11 Dec 2017 11:12:22 +0100
Message-ID: <20171211101222.GF10671@ulmo>
References: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+ts6NCQ4mrNQIV8p"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+ts6NCQ4mrNQIV8p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2017 at 02:19:43AM +0300, Dmitry Osipenko wrote:
> HW reset isn't actually broken on Tegra20, but there is a dependency on
> first display controller to be taken out of reset for the second to be
> enabled successfully.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c | 77 +++++++++++++++++++++++++++++-----------=
------
>  drivers/gpu/drm/tegra/dc.h |  4 ++-
>  2 files changed, 51 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index fc70351b9017..6139d3e9cedf 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -24,6 +24,8 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_plane_helper.h>
> =20
> +static struct tegra_dc *dc0;

I'd like to avoid the global variable. Perhaps you can use the
driver_for_each_device() or driver_find_device() functions to find the
correct device?

Thierry

--+ts6NCQ4mrNQIV8p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlouWgYACgkQ3SOs138+
s6EG/w/+OdUlYCGesWRUDkC0Atva94YOX4LC2yqhddrxtzaMg0D03jcZx+SFoMIt
zCSBftARcqcH/bpw/feHmeN2/0Y1aYrERNsAaRpAHjNJ4a5UGXegKjr8+rKJ82Vn
yWDcj92UxSW1HyTlv+8yoFownaUg9yi2oOxe2PHM3k4+ccIK+SenSKBK8uI6atfR
20ja+KwKoxuPXYqPEPOLHT9bAv1PTFfGavpKH8qGLsrtUraQFXpiF5jW2UpQI0K5
m8pRvQlaQCSP+COhA15yf12bcEd43Nc9dUduELEVXwJ6Uvg3SC9+xChS3EFYhjlv
wvK2LHUWyCpteRcPQTFYJvADKzsCSM4m+jkewNmL9wpmEWm65Q5kGU7noKYCTXZo
5HqdWiNCBRpC6FDO/MzsefX+Z1f9EpxFw/3G9Jt4/AxfgNv1jYImunZIbI/8vKSd
uxCsQ8izCN7dEwDMNR6TiyAbO1Ctk89V2pCIyRN/voEakQw4km3Mzy5l5QWtuAKT
cQQJsT8XLqLQaVU/4PDVktli3iZRoYYn3d7CuiYFeHkGczSQnwK5EnJYv6pzLU3P
OS3m0OSNyg3WHh5J6XMTQ8piPN8fLIDu+ANnMGVbPM+53DbcYnvkXEK1U9EQ/aIy
l/o1/qRqFQsBccdYwEL/5A/bDHhJS1h/ljtyj+PAA9zDxhIb3QM=
=uv1F
-----END PGP SIGNATURE-----

--+ts6NCQ4mrNQIV8p--
