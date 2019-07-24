From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v5 02/24] drm: Add drm_connector_init()
 variant with ddc
Date: Wed, 24 Jul 2019 19:16:35 +0200
Message-ID: <ea96186f-8d38-a698-f29e-049987ae0163@suse.de>
References: <cover.1563960855.git.andrzej.p@collabora.com>
 <53f5ded2971235e5b63c9a3ed4ed8bccf10c78f2.1563960855.git.andrzej.p@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1652618009=="
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53f5ded2971235e5b63c9a3ed4ed8bccf10c78f2.1563960855.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Mamta Shukla <mamtashukla555-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM1dQTEkxZZdg@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1652618009==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LtNJJAmlPBJFSmTCjBWxZTnrO1jKlugWK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LtNJJAmlPBJFSmTCjBWxZTnrO1jKlugWK
Content-Type: multipart/mixed; boundary="vnsNtGTawS7eHAvH285t7LPE1bVWovlWW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>,
 dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Neil Armstrong
 <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>,
 Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>,
 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org,
 linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Krzysztof Kozlowski
 <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>,
 Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>,
 Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>,
 Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 Jonas Karlman <jonas-uIzNG4q0ceqzQB+pC5nmwQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 Mamta Shukla <mamtashukla555-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>,
 Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
 Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>,
 Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>,
 Allison Randal <allison-wcfNWazeolPR7s880joybQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org,
 Enrico Weigelt <info-EcKl7qYKIbxeoWH0uzbU5w@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>,
 amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>,
 Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 Todor Tomov <todor.tomov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>,
 Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>,
 Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>,
 Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>,
 Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Message-ID: <ea96186f-8d38-a698-f29e-049987ae0163-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v5 02/24] drm: Add drm_connector_init() variant with ddc
References: <cover.1563960855.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
 <53f5ded2971235e5b63c9a3ed4ed8bccf10c78f2.1563960855.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
In-Reply-To: <53f5ded2971235e5b63c9a3ed4ed8bccf10c78f2.1563960855.git.andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

--vnsNtGTawS7eHAvH285t7LPE1bVWovlWW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.07.19 um 15:59 schrieb Andrzej Pietrasiewicz:
> Allow passing ddc adapter pointer to the init function. Even if
> drm_connector_init() sometime in the future decides to e.g. memset() al=
l
> connector fields to zeros, the newly added function ensures that at its=

> completion the ddc member of connector is correctly set.
>=20
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_connector.c | 19 +++++++++++++++++++
>  include/drm/drm_connector.h     |  5 +++++
>  2 files changed, 24 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_conn=
ector.c
> index 068d4b05f1be..06fbfc44fb48 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -296,6 +296,25 @@ int drm_connector_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_connector_init);
> =20
> +int drm_connector_init_with_ddc(struct drm_device *dev,
> +				struct drm_connector *connector,
> +				const struct drm_connector_funcs *funcs,
> +				int connector_type,
> +				struct i2c_adapter *ddc)
> +{
> +	int ret;
> +
> +	ret =3D drm_connector_init(dev, connector, funcs, connector_type);
> +	if (ret)
> +		return ret;
> +
> +	/* provide ddc symlink in sysfs */
> +	connector->ddc =3D ddc;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_connector_init_with_ddc);
> +

Thanks for including such a function.

Acked-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>

>  /**
>   * drm_connector_attach_edid_property - attach edid property.
>   * @connector: the connector
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 33a6fff85fdb..937fda9c1374 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1410,6 +1410,11 @@ int drm_connector_init(struct drm_device *dev,
>  		       struct drm_connector *connector,
>  		       const struct drm_connector_funcs *funcs,
>  		       int connector_type);
> +int drm_connector_init_with_ddc(struct drm_device *dev,
> +				struct drm_connector *connector,
> +				const struct drm_connector_funcs *funcs,
> +				int connector_type,
> +				struct i2c_adapter *ddc);
>  void drm_connector_attach_edid_property(struct drm_connector *connecto=
r);
>  int drm_connector_register(struct drm_connector *connector);
>  void drm_connector_unregister(struct drm_connector *connector);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--vnsNtGTawS7eHAvH285t7LPE1bVWovlWW--

--LtNJJAmlPBJFSmTCjBWxZTnrO1jKlugWK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl04knMACgkQaA3BHVML
eiPIEAf/SbE8+UterlzTVb4DSKX4d7+6Qm6csshf2sBPxiw6ecOqETPDYsQXsZYK
lwqXKV0mCZ7emWWXINgeIGb27bYeXxlv/s7BpdMC/H88bZK2MqnHQdbwlXD5W+PF
9QPMXdbn55pDDyjE/Onjmip5Ce+gkXQb2EyafrqkEuDxhCx9QCUnSwrXpV6kTmxS
/ZCuKYDKVU89AoRunyM8VS2Uqwm9e0GZTaUHcr+3rxGUxwi99/LJu7vGLwLih7Nl
BEJUyOIzVT9mg7dGE70z8XG/0X0bDQEQiNjKHIUdMOCKbMBZerZjPuGH2a84AS4h
j71GFMojM8wuds7/IkMG76b5vfNGNA==
=Nt+n
-----END PGP SIGNATURE-----

--LtNJJAmlPBJFSmTCjBWxZTnrO1jKlugWK--

--===============1652618009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

--===============1652618009==--
