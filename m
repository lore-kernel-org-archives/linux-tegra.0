From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v7 7/9] drm: tegra: use cec_notifier_conn_(un)register
Date: Wed, 28 Aug 2019 11:36:45 +0200
Message-ID: <20190828093645.GD2917@ulmo>
References: <20190814104520.6001-1-darekm@google.com>
 <20190814104520.6001-8-darekm@google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DrWhICOqskFTAXiy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190814104520.6001-8-darekm@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dariusz Marcinkiewicz <darekm@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--DrWhICOqskFTAXiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2019 at 12:45:05PM +0200, Dariusz Marcinkiewicz wrote:
> Use the new cec_notifier_conn_(un)register() functions to
> (un)register the notifier for the HDMI connector, and fill in
> the cec_connector_info.
>=20
> Changes since v4:
> 	- only create a CEC notifier for HDMI connectors
>=20
> Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
> Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/gpu/drm/tegra/output.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/outpu=
t.c
> index bdcaa4c7168cf..34373734ff689 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -70,6 +70,11 @@ tegra_output_connector_detect(struct drm_connector *co=
nnector, bool force)
> =20
>  void tegra_output_connector_destroy(struct drm_connector *connector)
>  {
> +	struct tegra_output *output =3D connector_to_output(connector);
> +
> +	if (output->cec)
> +		cec_notifier_conn_unregister(output->cec);
> +
>  	drm_connector_unregister(connector);
>  	drm_connector_cleanup(connector);
>  }
> @@ -163,18 +168,11 @@ int tegra_output_probe(struct tegra_output *output)
>  		disable_irq(output->hpd_irq);
>  	}
> =20
> -	output->cec =3D cec_notifier_get(output->dev);
> -	if (!output->cec)
> -		return -ENOMEM;
> -
>  	return 0;
>  }
> =20
>  void tegra_output_remove(struct tegra_output *output)
>  {
> -	if (output->cec)
> -		cec_notifier_put(output->cec);
> -
>  	if (output->hpd_gpio)
>  		free_irq(output->hpd_irq, output);
> =20
> @@ -184,6 +182,7 @@ void tegra_output_remove(struct tegra_output *output)
> =20
>  int tegra_output_init(struct drm_device *drm, struct tegra_output *outpu=
t)
>  {
> +	int connector_type;
>  	int err;
> =20
>  	if (output->panel) {
> @@ -199,6 +198,21 @@ int tegra_output_init(struct drm_device *drm, struct=
 tegra_output *output)
>  	if (output->hpd_gpio)
>  		enable_irq(output->hpd_irq);
> =20
> +	connector_type =3D output->connector.connector_type;
> +	/*
> +	 * Create a CEC notifier for HDMI connector.
> +	 */
> +	if (connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA ||
> +	    connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIB) {
> +		struct cec_connector_info conn_info;
> +
> +		cec_fill_conn_info_from_drm(&conn_info, &output->connector);
> +		output->cec =3D cec_notifier_conn_register(output->dev, NULL,
> +							 &conn_info);
> +		if (!output->cec)
> +			return -ENOMEM;
> +	}
> +
>  	return 0;
>  }
> =20

It might be slightly cleaner to move this into the HDMI drivers
themselves, although that'd mean a bit of duplication. That could be
mitigated by moving the code into a separate helper that could be called
by the HDMI drivers.

Then again, I don't feel strongly about it, and that could always be
done as part of some later refactoring, so I think this is fine.

Thierry

--DrWhICOqskFTAXiy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1mSy0ACgkQ3SOs138+
s6H4gg/+OuMLV5fIj7+uzWlp1gQO6V43RpNGjpFS9gndEosOfV/QTOEip16Efq1p
ZegaEk1ibqDX7dIwQ2m48uFRJw+qKyYVIJoxBhFDgcUk5uwnAtHF7qMTRnQJGcVP
LDjQ2Lxw4PmpdO8SQxUc/xDOlmTWPcqGpv7XzqB+ZbwK7ACCce5Cw080B/5kp1Z1
4D4dttwjpVdtO0/dx3nhFYpjeDAwyH/u8kWJLFAt+cbVgyNap8drgrSNlAArVXD3
R5R5Ge3iouXUuY+juQRv4uwC86F6WAOfKU8VQaENjRof5jCyL/BJrv9t4JGYbVte
QQnAi9FJvwbpra04AkpFG2nib/nnX/8m3OGiRrMp29l7TRpD9QptRDIaSKkPkw4n
BpySuAXUIh05zS8xNNZNDxW3BygkZQHoK50tW0RNwhYmI4LTfOrkDT3E6ZyWLx9E
j4+CwkemwwRijP8yX3eegsC8gYreS1ERPNuAehIghf95X3b6KExZQb4/yj/qxW/E
cpXn24r3PT45Y7GZVXuIEyMIeLWIz+2YOxCgXwYjzEkRau8NHBA/UIRPzWLiuovO
JXJyeT7d7J9rNm0YE9A45jNnG4qpN1ruV919nABZ9Qgq7jVFDP83bWp1ywKZQtTO
be1SyPh01yjDg3/H7mRqkLFU3WXO+Uz82JwNG1RN9A0aE0Us3Qo=
=st98
-----END PGP SIGNATURE-----

--DrWhICOqskFTAXiy--
