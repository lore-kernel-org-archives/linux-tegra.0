From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: hdmi: Setup audio only if configured
Date: Tue, 16 Apr 2019 17:12:37 +0200
Message-ID: <20190416151237.GA24373@ulmo>
References: <20190416144137.8205-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0137800845=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190416144137.8205-1-thierry.reding@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0137800845==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2019 at 04:41:37PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The audio configuration is only valid if the HDMI codec has been
> properly set up. Do not attempt to set up audio before that happens
> because it causes a division by zero.
>=20
> Note that this is only problematic on Tegra20 and Tegra30. Later chips
> implement the division instructions which return zero when dividing by
> zero and don't throw an exception.
>=20
> Fixes: db5adf4d6dce ("drm/tegra: hdmi: Fix audio to work with any pixel c=
lock rate")
> Reported-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/hdmi.c | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
> index 47c55974756d..e6c60bbc0fec 100644
> --- a/drivers/gpu/drm/tegra/hdmi.c
> +++ b/drivers/gpu/drm/tegra/hdmi.c
> @@ -1259,11 +1259,6 @@ static void tegra_hdmi_encoder_enable(struct drm_e=
ncoder *encoder)
>  	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_SOR_REFCLK);
> =20
>  	hdmi->dvi =3D !tegra_output_is_hdmi(output);
> -	if (!hdmi->dvi) {
> -		err =3D tegra_hdmi_setup_audio(hdmi);
> -		if (err < 0)
> -			hdmi->dvi =3D true;
> -	}

This has the disadvantage of keeping audio disabled after a disable/
enable sequence, even if userspace is still playing audio. I'll send
out a better fix that keeps audio working after disable/enable.

Thierry

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly18OIACgkQ3SOs138+
s6FuzQ/9HJIYmePzZsgMKn7AN4Lj/lSaNgwKiDTSRkAqBctDZAAAl5y7sScuUrs6
NwT54jlbM0iSWkuKSR0BiLEEkvf72vuX/ueMYmqXxNV3Ia5Hoo++/j0bl3VLwJQz
u3sOUc9TvcbOTM2Xpo8+lT5xXtdnigoqKR2Vprm0vdU461RyStfY1IDEYupGAfqD
hAedNtW2JT8RwQkOq8JHKySNOtkjJOvBYKhp+uJCzfLHyK22K9Jd2jPJkqa9331i
yL87Db+48ETMdCz9Xy7U1ylQzbHmXVJV5hHVKEcaIJrdeQVJxw6bL5TwxZk34TwI
pnDruWYB+LCgsjG3uGPrmGgR4y5e1d3vYOjbIrmeK6tMwfaEvv7DD+QJNPpKZJws
cIIYSw26pxtifFrquomwwlaBgcEigoefwZe/qH0M/qFKKsEPuJOmpsXsRUQ6goPh
/sX5LRbnrIw6Z+psfEI7VZ3ySKVOzVumLM3+VbUyBTvtdb/0DQt+h4M9SY/KIJtj
sPOu9tZnzSImh9VyNJrLe0qXYoWkFCn+y4wK+22EDqcoOKo1wy18KEJgAbIif0N9
/4bBN9WY7uldgYRLQnr0YKkCWJXDVOcBO45cTd9JA/ix8as3CaPv/+qt9c6y90nL
6LxvZjwsGZaM/T988XgSW2zlqb4e61RYWziP56rB9tq8o38GpUE=
=t1CZ
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--

--===============0137800845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0137800845==--
