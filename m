From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 8/9] drm/tegra: dpaux: Add missing runtime PM references
Date: Fri, 29 Nov 2019 11:44:12 +0100
Message-ID: <20191129104412.GD2771912@ulmo>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
 <20191128153741.2380419-9-thierry.reding@gmail.com>
 <20191129092319.GD624164@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2131221687=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20191129092319.GD624164@phenom.ffwll.local>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============2131221687==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
Content-Disposition: inline


--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2019 at 10:23:19AM +0100, Daniel Vetter wrote:
> On Thu, Nov 28, 2019 at 04:37:40PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Ensure that a runtime PM reference is acquired each time the DPAUX
> > registers are accessed. Otherwise the code may end up running without
> > the controller being powered, out-of-reset or clocked in some corner
> > cases, resulting in a crash.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> On patches 4,5,7 in this series Acked-by: Daniel Vetter <daniel.vetter@ff=
wll.ch>
>=20
> On this one here I'm very confused.
>=20
> - Why do you drop the runtime pm between enable and disable? Is that just
>   how the hw works, i.e. the pad config stays, just the registers go away?

Now you've made me doubt this. I don't think the pad configuration stays
across runtime suspend/resume, so you're right, this shouldn't work.
I'll need to go retest this one specifically.

I had added these runtime PM references to ensure the device was
properly configured at resume from suspend, but there ended up being an
additional issue with the I2C driver that relies on this, so perhaps
this may not be necessary in the end.

> - I'm not seeing any locking between the different users (dp aux and
>   pinctrl). We might want to change drm_dp_aux->hw_mutex to a pointer to
>   make this easier (but I'm not super fond of that pattern from i2c).

There should be no need to lock here. DP AUX transfers will only be used
between drm_dp_aux_enable() and drm_dp_aux_disable().

> - Your drm_dp_aux_enable/disable needs to be moved into the ->transfer
>   callback, otherwise the various userspace interface (dp aux, but also
>   i2c on top of that) won't work. Some pre/post_transfer functions like
>   i2c has might be useful for stuff like this.

I suppose it would be possible for someone to attempt to use those
userspace interfaces outside of drm_dp_aux_enable()/drm_dp_aux_disable()
and then the locking would be required.

I'll look into that.

Thierry

>=20
> Cheers, Daniel
>=20
> > ---
> >  drivers/gpu/drm/tegra/dpaux.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpau=
x.c
> > index 622cdf1ad246..4b2b86aed1a5 100644
> > --- a/drivers/gpu/drm/tegra/dpaux.c
> > +++ b/drivers/gpu/drm/tegra/dpaux.c
> > @@ -434,8 +434,13 @@ static int tegra_dpaux_set_mux(struct pinctrl_dev =
*pinctrl,
> >  			       unsigned int function, unsigned int group)
> >  {
> >  	struct tegra_dpaux *dpaux =3D pinctrl_dev_get_drvdata(pinctrl);
> > +	int err;
> > +
> > +	pm_runtime_get_sync(dpaux->dev);
> > +	err =3D tegra_dpaux_pad_config(dpaux, function);
> > +	pm_runtime_put(dpaux->dev);
> > =20
> > -	return tegra_dpaux_pad_config(dpaux, function);
> > +	return err;
> >  }
> > =20
> >  static const struct pinmux_ops tegra_dpaux_pinmux_ops =3D {
> > @@ -809,15 +814,22 @@ enum drm_connector_status drm_dp_aux_detect(struc=
t drm_dp_aux *aux)
> >  int drm_dp_aux_enable(struct drm_dp_aux *aux)
> >  {
> >  	struct tegra_dpaux *dpaux =3D to_dpaux(aux);
> > +	int err;
> > +
> > +	pm_runtime_get_sync(dpaux->dev);
> > +	err =3D tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
> > +	pm_runtime_put(dpaux->dev);
> > =20
> > -	return tegra_dpaux_pad_config(dpaux, DPAUX_PADCTL_FUNC_AUX);
> > +	return err;
> >  }
> > =20
> >  int drm_dp_aux_disable(struct drm_dp_aux *aux)
> >  {
> >  	struct tegra_dpaux *dpaux =3D to_dpaux(aux);
> > =20
> > +	pm_runtime_get_sync(dpaux->dev);
> >  	tegra_dpaux_pad_power_down(dpaux);
> > +	pm_runtime_put(dpaux->dev);
> > =20
> >  	return 0;
> >  }
> > --=20
> > 2.23.0
> >=20
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3g9nkACgkQ3SOs138+
s6Hj3A/+PqCFRb0VVrY3Li6fcisTc3P2IclxOVXVwXKk6+cuXJfVSs0i8Zd7JAzO
jWIP8S82xEh5H338AzCy2r4hncl5YoDhHEb8Sppj/iK8aFI96CELE0+kEsamb+52
EEn32SEgheYnSh2UcZTDqjPDW91yda6WHDRb6c33V86KEne9lf/KI0DzizsG4UZ9
nO9nUx2a1AI38UH3czWKph+PrM594PJ0UQdZT0nP0rTDaJPmznDP0obzjiHXXS/D
1X6qALYHNPOqZMJvPOSERY7qc9arHLbrtjMDy+qcJTKgg9Azuqzdv/ribuEHzuW0
yH63gpK8gLsIZPss6t4EcVDn8o/fxDnUk1glQgOduBZWCMT6ukQTlRePuDICVsrA
OUDLfWLeFD9U1OA5EMdBqaWG/dOFiK0yHUr8hEn7K/UIv+ofT4eg6cyX0HWlm1KH
Kb/wsckpFDi/+1b9RarFUu643BvmVRvYbNWCARcfUxf4A2cLmszJ692vPCNJlWUs
XteAG+lY8qhH+j8c/OGMuQYwWE/NpxSli/YF0cvXjSwXe4iDTqNfI0OGsFsiSHQ1
zZjqxyd63LDdYJM/IfhdLu0Y6PQSD2NK4shyRog4wcHKlfslZ5WJGAoKa5FFbh9k
tu+HPnoVLVORfCoX3GWVfkMy89BxWPWwe82QGpZSFgx7lc1V4+4=
=Sf/5
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--

--===============2131221687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2131221687==--
