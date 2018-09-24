From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] drm/tegra: dpaux: Fix always-failing probing of the
 driver
Date: Mon, 24 Sep 2018 13:59:07 +0200
Message-ID: <20180924115907.GW21032@ulmo>
References: <20180921114241.17002-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1462049465=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180921114241.17002-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============1462049465==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I33OQG5IFrqF2BWt"
Content-Disposition: inline


--I33OQG5IFrqF2BWt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 02:42:41PM +0300, Dmitry Osipenko wrote:
> Some of definitions in the code changed the meaning, unfortunately one
> place missed the change.
>=20
> Fixes: 0751bb5c44fe ("drm/tegra: dpaux: Add pinctrl support")
> Cc: <stable@vger.kernel.org> # v4.8+
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>=20
> I don't have HW to test DPAUX driver, apparently it has been broken for
> 2+ years now. There is also a known issue on with the DPAUX driver that
> prevents it from probing, that was discussed on the #tegra IRC. Thierry,
> please take a closer look at this driver and test it thoroughly, it has
> some obvious problems.
>=20
>  drivers/gpu/drm/tegra/dpaux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

It's odd that you claim that the driver is always failing probe and at
the same time you say that you don't have hardware to test the driver.
=3D)

I know for a fact that this driver does not usually fail because it is
required on all recent chips (Tegra210 and later) to drive HDMI, which
we support on all boards, so it is indeed thoroughly tested.

>=20
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index d84e81ff36ad..ba5681fab73b 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -521,7 +521,7 @@ static int tegra_dpaux_probe(struct platform_device *=
pdev)
>  	 * is no possibility to perform the I2C mode configuration in the
>  	 * HDMI path.
>  	 */
> -	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_HYBRID_PADCTL_MODE_I2C);
> +	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_I2C);
>  	if (err < 0)
>  		return err;
> =20

If you look at the definitions of both DPAUX_HYBRID_PADCTL_MODE_I2C and
DPAUX_PADCTL_FUNC_I2C, you'll see that both are actually the same, which
is a good explanation for why the driver performs flawlessly.

That said, your change is obviously correct. I've applied it, but since
it doesn't actually fix anything, and doesn't change anything from a
binary point of view, I've removed the Fixes: and Cc: stable tags.

Thanks,
Thierry

--I33OQG5IFrqF2BWt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluo0YsACgkQ3SOs138+
s6FidA/9EGiBttIDqR76dGI1VuOdu08L7cEkrFCVrkUHXY0psvODrfZcP7yYKiW7
cvQTMlXW3Sb9KEVyb+M6GS7Nfd2iL1sILGR1cE+PNar9jieFx5Pm8325Ckp80umg
qGT29t359qdbtP9FNKB6Q6yamye8iSb0rrJZErItNmMnpNOuIooEDhl/U4SKd53+
JAqXkRDX237ixvvNE6NkkOMh3ZWR6vb7xS1MkZOr/W21UPjRSKLppOsyorJ6cITA
JKfaD/puYU+wVeuaHUYZh7Qody+trv1P839Pz4IglH7UFWvwFTaFLEku5Gy+JMMY
PkfkZ6u3+p6bk5CGpT8gwWNTG7Lyi2Ba18GWlnAQIm0ba50rW4+mTmYkTn2QuydX
NY/tNLG+9+9lUzHdxt4D1IYCEDrbpro02spFrt4OHexUkWIBdQlHs4gcfbcUyNvp
7RvOo98qFLoL3FDHI0TGYer/zj69nMM40WMxJ4wqfZgzBfMSxhp4bUwAh0e4KCJE
uyEWaxeFZmWTT3zAlHItEDEGwFHq/nkVMlNV+Ruis5POkWIVJZKUjjEJUo9TT3D4
TEEb7EHZEH2DlbaNhEziVpYqItM9RqEQMHjHzmtGMsddrsSA8w2uW60qXdEyp+Pv
rboDUTOQwmzx5WkOMdKBYeIsq+ZH5tsSEAYDX7bTlJHiKb1mAcY=
=NC6u
-----END PGP SIGNATURE-----

--I33OQG5IFrqF2BWt--

--===============1462049465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1462049465==--
