From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: drop "select DRM_HDMI"
Date: Wed, 6 Mar 2013 08:06:32 +0100
Message-ID: <20130306070632.GB2436@avionic-0098.mockup.avionic-design.de>
References: <1362517656.16460.125.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362517656.16460.125.camel-uMdlDhfIn7prKue/0VVhAg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2013 at 10:07:36PM +0100, Paul Bolle wrote:
> Commit ac24c2204a76e5b42aa103bf963ae0eda1b827f3 ("drm/tegra: Use generic
> HDMI infoframe helpers") added "select DRM_HDMI" to the DRM_TEGRA
> Kconfig entry. But there is no Kconfig symbol named DRM_HDMI. The select
> statement for that symbol is a nop. Drop it.
>=20
> What was needed to use HDMI functionality was to select HDMI (which this
> entry already did through depending on DRM) and to include linux/hdmi.h
> (which this commit also did).
>=20
> Signed-off-by: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
> ---
> Untested.=20
>=20
>  drivers/gpu/drm/tegra/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
> index c92955d..be1daf7 100644
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@ -4,7 +4,6 @@ config DRM_TEGRA
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_CMA_HELPER
>  	select DRM_KMS_CMA_HELPER
> -	select DRM_HDMI
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT

Good catch! I think what happened here is that the DRM HDMI helpers used
to be in a separate file and DRM_HDMI enabled that file to be built. The
helpers were moved into drm_edid.c at some point, though, and the symbol
was dropped and I forgot to remove it from the Tegra DRM Kconfig.

Acked-by: <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRNur4AAoJEN0jrNd/PrOhrS0P/j5xa1RlegD3dNcQuRXp2czQ
rXFSblwkzlAn55j+N0JOoF3UwAgO9XKPbW0MvkCebLrJ3yCawKTodm8a/yHjZzIi
ndMEe6FDJY09MpyMA3AW6EfD3Dh6H/VK1BS1sJCSC92txQY0wD0tPKVvq0pQOqiK
aX1ao9AZTVHk/EUlvUaMmWHpgqdqAS7hosatk2h23W0bJpmQyZg2E0F4iYbGHi8n
Ro6Cwa5UGNOr0MFVvOvzg2sEOUuGEKpPycvM77Z8n3C9sn/fRszqVClRyWPczbjP
JusPAOBNIRBHFRhQjilOyZFlqUv/SBIJt1yRBt1bY34UDhTlFFmnP1p3nhhmAahv
DdZTre5zTePqzxaBc6yahQhaFDHEnN05qqa6wHunxvqg5F0dr9YDB70xOAcW0Tqj
G8qSKdIdcmQMMeotHmgkfdYUXc0S7z3qC540zBXfJ+8KO1uFgTZIequ5WiuJW0Xw
IK1I93jSWpXy/Vl6+D+908macUsj7VJcaEKqbu71WBh0/YE3cCml+yCz3nBi7MxK
E9c9XqOIST7kpYr/ZLzXrR6TA0EJPOo6qp4qJuXHWHkvJILclKNXAZ/hp8FADDel
GTdErSBgDLIvMnBKT3v7fBXghuD2fw1ls0BkglguJSX0KFxYIlJ7HLgyJPdeLW6U
HdSFCkEd7gErX4d1iQ63
=8ZUu
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
