From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: add MODULE_DEVICE_TABLEs
Date: Wed, 18 Jun 2014 23:51:00 +0200
Message-ID: <20140618215058.GA26514@mithrandir>
References: <1403126355-16236-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1257681972=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1403126355-16236-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, stable@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1257681972==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2014 at 03:19:15PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> When tegra-drm.ko is built as a module, these MODULE_DEVICE_TABLEs allow
> the module to be auto-loaded since the module will match the devices
> instantiated from device tree.

I vaguely remember doing something like this a while back and getting a
bunch of link-time errors. But I assume that you've tested this, so I
must be remembering wrongly.

One comment below:

> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 3396f9f6a9f7..a1f9b06a75d5 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -694,6 +694,7 @@ static const struct of_device_id host1x_drm_subdevs[]=
 =3D {
>  	{ .compatible =3D "nvidia,tegra124-hdmi", },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, host1x_drm_subdevs);

I don't think this one is really required. It's a union of all other
compatible values and only used to delay the DRM subsystem driver
registration until all needed subdevices have been probed.

Thierry

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTognCAAoJEN0jrNd/PrOhoAYP/3hs1FVNlDMMe7cSZw5C5oLw
ldDy22rK7GJ8zsb/Ta0SwHnsb4CeoMf0hSetAyW7bI18l70aCat8BHQAxlXh16B5
oi4Tm7yiVK2JSFdLZgBuZdEo6wc8yZr9i/KYjRx2ia7/XtpY/ec8Ndxx7Wc8/oDl
vwax9MVw5pK+QcQc5QXnGlhTTo7yt1wqMXwemUzgzXMEb37QJXHPGzCff2RkrBW4
lKT8OoFytIfpu60I+vgGNxOCGU0S/EO7x5s/+ewSU1vzoluyhQQKVNrWdZrGpZsq
Xf6inWutUaGalQRcUuDFRqsLKgV4YpNF9uIt6xvQa7AsHBbHeCuGU6qi+gvyapF/
vAK7QiopuaRKIrWCnC9LMeKdDPSWvQTLVR5xvDfI3WSEmKQsGJ8+rJnMoEdMBBx3
3oP7/rsUo66KE1NiP28gkrUe8RFIloIwpMr5DKcpWqkl5+8xHZY/O1fXbAKIKLxy
M8sEc+g6KoD0ome8kzpZTEasouAFYW/Qyj8bbU+3LqenqyKNpHatPX7sdjdm/h/N
OvZBGXknunCrDy+6c4GLOd5nSs33dKpu7DZ7D7RCyHwb0e7E7mjZ1kEqU3eW8i5z
1f13sO1hiUtlkO9gCQsWuLQRJf8o2SGF2wGX+ZfN/uJPaRDOiFB2cDhgym1kcxxo
+ntAtbFZ+HITKpdJZV9l
=0+TT
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--

--===============1257681972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1257681972==--
