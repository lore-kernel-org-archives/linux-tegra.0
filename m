From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: plane: Remove format-modifier checking
Date: Wed, 23 Oct 2019 16:16:36 +0200
Message-ID: <20191023141636.GB2711737@ulmo>
References: <20190224153405.8447-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1592090548=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190224153405.8447-1-digetx@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============1592090548==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 24, 2019 at 06:34:05PM +0300, Dmitry Osipenko wrote:
> Tiling modifier can't be applied to YV12 video overlay because all tiling
> modifiers are filtered out for multi-plane formats. AFAIK, all modifiers
> should work with all of formats, hence the checking is incorrect and
> simply not needed.
>=20
> Fixes: e90124cb46bdb ("drm/tegra: plane: Support format modifiers")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/plane.c | 16 ----------------
>  1 file changed, 16 deletions(-)

I'm hesitant to apply this because we don't really have a good way to
test that this is actually the case. I vaguely recall that at least for
some of the block-linear formats supported on Tegra124 and later there
are additional restrictions on when they can be used.

There's also the problem that using these block-linear formats, and I
think this even applies to the TILED format on older Tegra SoCs, results
in higher bandwidth requirements.

Bandwidth requirements is something that we don't really concern
ourselves with, and that's bad enough as it is. I suspect that once we
blindly allow all format modifiers we could easily run into situations
where the display controllers underflow.

Now, regardless of which way you look at this, it boils down to testing.
We don't have a good way of testing various combinations of format
modifiers to verify that they work. You say yourself that "AFAIK, all
modifiers should work with all formats", but can you really know for
certain? Until we're able to properly test this, we really can't.

Given all of the above, I think it's better to be prudent and only allow
format/modifier combinations that we've actually tested. I'm not aware
of a good way to test planar formats, so we don't have a good way to get
the results that we need.

I'm all ears if you know of a good way to test this. It doesn't have to
be anything fully automated. Automated testing is especially difficult
to do for display because it usually needs visual inspection. But that's
okay, I'm willing to settle for something that we can roll into a script
and run manually after boot until we can find a way to automatically do
this type of test.

Thierry

> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
> index d068e8aa3553..5a8a3387f5ee 100644
> --- a/drivers/gpu/drm/tegra/plane.c
> +++ b/drivers/gpu/drm/tegra/plane.c
> @@ -72,21 +72,6 @@ static void tegra_plane_atomic_destroy_state(struct dr=
m_plane *plane,
>  	kfree(state);
>  }
> =20
> -static bool tegra_plane_format_mod_supported(struct drm_plane *plane,
> -					     uint32_t format,
> -					     uint64_t modifier)
> -{
> -	const struct drm_format_info *info =3D drm_format_info(format);
> -
> -	if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)
> -		return true;
> -
> -	if (info->num_planes =3D=3D 1)
> -		return true;
> -
> -	return false;
> -}
> -
>  const struct drm_plane_funcs tegra_plane_funcs =3D {
>  	.update_plane =3D drm_atomic_helper_update_plane,
>  	.disable_plane =3D drm_atomic_helper_disable_plane,
> @@ -94,7 +79,6 @@ const struct drm_plane_funcs tegra_plane_funcs =3D {
>  	.reset =3D tegra_plane_reset,
>  	.atomic_duplicate_state =3D tegra_plane_atomic_duplicate_state,
>  	.atomic_destroy_state =3D tegra_plane_atomic_destroy_state,
> -	.format_mod_supported =3D tegra_plane_format_mod_supported,
>  };
> =20
>  int tegra_plane_state_add(struct tegra_plane *plane,
> --=20
> 2.20.1
>=20

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2wYMIACgkQ3SOs138+
s6HMUBAAkMcnsil5fbLkuO3EK8JFeZkIcJpkCrVe3OK7UjFRAi8RGLKxLc4n5N3Q
3WSZG6CHX4YmtHa8jkjUnX9dzgqTmmm2WBh5IjR2+XuySf9c7rSD0EF2Gzsy6Y4w
YJDAas34D73oWmP5HfF4bg+WV7kXFvorx+zb+QUzbu7GpJw/mEuPGqaE4KQQwt+A
eF0XjJPEitEhmGMSEgXR4DEA9NxeckZMYYuPl8jENunE8LlMIpqZy0Y3WQPT4y2W
G9AFYI4VTK3kk8sdAAFkjwbWXCk++VDiGKDDcKg+8K0fCiVpRnzTo1bI9AAQWyoU
Adf4i//PLZ3ieZgNzm9KafoRGVttPIo6JcrvQfi/0e8SO/8ynktPmCEwGPnJnDVZ
xMRPz8jlUlj7kovq0DodXL2OKFmNCdO9jS1FMALtyojS+iSZejqXUJ3mlScckxIT
6JSi/n7GhoPGaQWKnRsSDIjCSal5dGwVzOD2phZUwYPjaVwkJ6tjhQpY0KFE0kb6
i9layrE5Pb/49/RuqlXfkrprKKpO7skRLz4kmliDa86nKMW9c2aFI1N15YA7D39O
uFkQPm3HE86SPv0ZqYZYzne3BEKw0E1oWn54m0jCIu/Ixh1POjRfcsALsrvzOcIY
VuBZmgntOG32AEnVVMHKFrAXHxa4yQTLEUJ5g4zDCKDl63Enqf0=
=LGMI
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--

--===============1592090548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1592090548==--
