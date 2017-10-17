From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/4] reset: tegra: check BPMP response return code
Date: Tue, 17 Oct 2017 12:40:43 +0200
Message-ID: <20171017104043.GB30589@ulmo>
References: <cover.1504776489.git.talho@nvidia.com>
 <00e7714871d7568e9fc848dc5f76d14e07984a1e.1504776489.git.talho@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <00e7714871d7568e9fc848dc5f76d14e07984a1e.1504776489.git.talho@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Timo Alho <talho@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 07, 2017 at 12:31:03PM +0300, Timo Alho wrote:
> Add checks for return code in BPMP response message.
>=20
> Signed-off-by: Timo Alho <talho@nvidia.com>
> ---
>  drivers/reset/tegra/reset-bpmp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Hi Philipp,

Would you provide an Acked-by on this so that I can take it into the
Tegra tree? There's a build dependency on patch 1/4 in the series.

Quoting in full since you were not previously on Cc, unfortunately.

Timo, please remember to always Cc the relevant maintainers.

Thierry

> diff --git a/drivers/reset/tegra/reset-bpmp.c b/drivers/reset/tegra/reset=
-bpmp.c
> index 5daf2ee..fac2db6 100644
> --- a/drivers/reset/tegra/reset-bpmp.c
> +++ b/drivers/reset/tegra/reset-bpmp.c
> @@ -23,6 +23,7 @@ static int tegra_bpmp_reset_common(struct reset_control=
ler_dev *rstc,
>  	struct tegra_bpmp *bpmp =3D to_tegra_bpmp(rstc);
>  	struct mrq_reset_request request;
>  	struct tegra_bpmp_message msg;
> +	int err;
> =20
>  	memset(&request, 0, sizeof(request));
>  	request.cmd =3D command;
> @@ -33,7 +34,13 @@ static int tegra_bpmp_reset_common(struct reset_contro=
ller_dev *rstc,
>  	msg.tx.data =3D &request;
>  	msg.tx.size =3D sizeof(request);
> =20
> -	return tegra_bpmp_transfer(bpmp, &msg);
> +	err =3D tegra_bpmp_transfer(bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +	else if (msg.rx.ret < 0)
> +		return -EINVAL;
> +
> +	return 0;
>  }
> =20
>  static int tegra_bpmp_reset_module(struct reset_controller_dev *rstc,
> --=20
> 2.7.4
>=20

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl3isACgkQ3SOs138+
s6F/Sg/+IQ70ShJxvti68Bt1vuFgXEIhO/LtBw55Bp+c8Q1mG1DtTplH9U+sBsqc
Djp3czOmJwgsYfglgfBdBC3WeDg+FZUl7NVvwXw8mYVtaXXemT07wXBcrEahvSiE
L6SOElUVakmmV/DbmAO9PFVOL6zgO4QLmFU+9czuoTgF4eTnV9kPCZLAlanCaS+/
Yh22lKYa8K/M8bC1AH8N2Zs62ZWMLroiGZg1M/PvZW4lT+sqgQhi3D5TROAD7uv7
WZ4bqrssiVRGzTiZ0UiHX873tFgaFupvRQ7Q4s7uoOVClKcPCBLyvBoxuhNi18OZ
fWkgDh4GLKa3qmkBI0Ev6Uk7pwtI/HhbGGDQsXLw332Vmj8GlmWi/z7ZJg0KCDDX
X48hjeVzEsdVEcMWw1Yv9abDSmfG5IvRk8ioxlbMbtw7uzovRiRL0UCF6+4riOi7
3WNct+j45pCieUfimixlcJnrEGq/ompH3yBS7v6Ak8S+QflP/c++XC0dPRZycuyR
gU92oUvJyTNM2LlN+ybX+H+oN6leG3Uvp2mn7UaKqJ0afxWDWr519lH17qp6aGIo
cR7GXKNz5Rc1tmXvGl8z2JCOwxw/4IG/EC3tIHIi9mSE0BtRZq+KAQFl+rUsKchf
vlF5ti7PItVQVp0nCXkB3AFO3QjAgYIYVwu19whc/rVZFR8IJwU=
=dT2Y
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
