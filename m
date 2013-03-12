From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH REPOST] drm: tegra: don't depend on OF
Date: Tue, 12 Mar 2013 07:54:30 +0100
Message-ID: <20130312065430.GA6467@avionic-0098.mockup.avionic-design.de>
References: <1363041182-31944-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1363041182-31944-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2013 at 04:33:02PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> ARCH_TEGRA always enabled OF, so there's no need for any driver to
> depend on it.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/Kconfig |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
> index c92955d..965c48c 100644
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@ -1,6 +1,6 @@
>  config DRM_TEGRA
>  	tristate "NVIDIA Tegra DRM"
> -	depends on DRM && OF && ARCH_TEGRA
> +	depends on DRM && ARCH_TEGRA
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_CMA_HELPER
>  	select DRM_KMS_CMA_HELPER

Acked-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRPtEmAAoJEN0jrNd/PrOhwPoP/ieHob8U6KsbBaazzcMDQTfz
adENgSdSOsntOjVeMySma5ogWU9eXMbASxhQct0jRtFNiCQNB3TaGMCSNMTMiQNw
Dg8q2f2M0dJ1YAuCxcgLc49kUBkVooEWvulNhTr52j2ERVCVyMDJR5U4SzP45ExR
DNf2McZZLUtFRGqumMcnNgnbmvBwDYpX6txhaJYBLZjelgqwEehfp0WSguB8D45v
O4KQeOr1YyXql9NpJ+xcrH11KJdYXGqebJL5QRkVD2kaRkETOLNahPhj1kSvfmOz
cCM9LFLw9jqRvHPnuDHULvhAP/5LUtDETR4CPefvMioIDxv5xmkvUgmnUQnbVh3U
LpSL1H6pADIIH36aR3/aLPA3btxPccDB+M6Dh7xL7nmZmlL1U4eF2gPuy/SUSyWM
uVLX6yqG4fKR3yK3Zw0kq9qhIB9QCg+qN2T6k9otS+IHsInBPuapwEqthALwrxBZ
i2/p8I39FBCJwRTOdtuhSVBCq5b/vcX9HU2g+qMoP7pHZlAn2ULogrJyQqdCMWh+
eFLAzpGeMBu/u7L77nfqXFaywjJo3L219xgAoiRKUpjNbIheyKk8q9xsSsnXR9nL
HaLNdlyJLpXYWMZNADYi9aKmZ5982/wCGpe5WUx++09uo1R6j18qPerhCmJmhLTA
XABtLaB2neaKPXl7vdrE
=dT1Z
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
