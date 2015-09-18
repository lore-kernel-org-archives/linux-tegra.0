From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 5/5] drm/tegra: Fix module autoload for OF platform driver
Date: Fri, 18 Sep 2015 17:36:57 +0200
Message-ID: <20150918153657.GA6692@ulmo.nvidia.com>
References: <20150917142232.GA20243@goodgumbo.baconseed.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0749696951=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150917142232.GA20243@goodgumbo.baconseed.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Luis de Bethencourt <luis@debethencourt.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0749696951==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2015 at 04:22:32PM +0200, Luis de Bethencourt wrote:
> This platform driver has a OF device ID table but the OF module
> alias information is not created so module autoloading won't work.
>=20
> Signed-off-by: Luis de Bethencourt <luisbg@osg.samsung.com>
> ---
>  drivers/gpu/drm/tegra/drm.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 2486bc2..62d724d 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1064,6 +1064,7 @@ static const struct of_device_id host1x_drm_subdevs=
[] =3D {
>  	{ .compatible =3D "nvidia,tegra210-sor1", },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, host1x_drm_subdevs);

This shouldn't be necessary because the MODULE_DEVICE_TABLE entries are
already in the subdrivers.

Thierry

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJV/C+VAAoJEN0jrNd/PrOhJ40P/1Oec3+CJS3qmmnpnjZvn/CI
O29M65FCOAk5ZyHXq8up5QWg6mgfaFp6zzHyWWAJJ7bpJbf+BSgUWnZQPuxNsRoQ
NmB7zZP8vYllmE3W8pGFlUd2iMenzcV2ctQmX+ljKSFVDNIT3XF7lq5crUaAP6B9
GyE9FsOTAF/e8SjUOcdlANdo6TJGWqht94cs4DJEvt3FzmKD/UjEqlcOse5kNoas
ofbvQPOMiVM+vR4+0wl/N93T2wdIRulF5BsokvrIqXXoabq1JwJYg//3OpJeXbvm
ONESlDxm76KIbkcZYxVeBwKId6cfSwXPT3sXgBJKNUvO6LZ650+1yGHtBBnPg4br
nCAY6IxBZrB3SlEERvIucTWkgeTwFhsP/r4F9642dBTR9LYHdYyxJkEZmngaNvJv
2RMhHkscx2D5iDc6BXzrwn+DwbEXVGB9zNLmQSRl9c7myueashhrELmd4FWZIZMc
GxS1wnfBv3yMyg1WoeKAbCys6D0L9hKSVU20Dt0C7+BC/e9hEeuouWxLJWIJ8deL
HzodAj92xf/V+tfYRm+82egNNmD7vFQnt4b6I0M0Ifeye/FpI8lEbUowTC6NPWe1
s2oCpziX83gXW9NemuHkHaU+LyGs5lNhnIN3xWqPVuhE3nbI7n2yKbZC5HGmp+OD
iaEibL6O4+vNAmTdXlhA
=QJPK
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--

--===============0749696951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0749696951==--
