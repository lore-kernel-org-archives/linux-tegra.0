From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 4/4] drm/tegra: Refactor IOMMU attach/detach
Date: Fri, 4 May 2018 17:10:20 +0200
Message-ID: <20180504151020.GA31229@ulmo>
References: <20180504133707.22451-1-thierry.reding@gmail.com>
 <20180504133707.22451-4-thierry.reding@gmail.com>
 <60550738-6a93-ddc3-0376-fe9676b85c42@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0497150307=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <60550738-6a93-ddc3-0376-fe9676b85c42@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org


--===============0497150307==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 04, 2018 at 05:23:42PM +0300, Dmitry Osipenko wrote:
> On 04.05.2018 16:37, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Attaching to and detaching from an IOMMU uses the same code sequence in
> > every driver, so factor it out into separate helpers.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/dc.c   | 42 ++++++------------------------------
> >  drivers/gpu/drm/tegra/drm.c  | 42 ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/tegra/drm.h  |  4 ++++
> >  drivers/gpu/drm/tegra/gr2d.c | 32 +++++++--------------------
> >  drivers/gpu/drm/tegra/gr3d.c | 31 ++++++--------------------
> >  5 files changed, 68 insertions(+), 83 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > index c843f11043db..3e7ec3937346 100644
> > --- a/drivers/gpu/drm/tegra/dc.c
> > +++ b/drivers/gpu/drm/tegra/dc.c
> > @@ -1837,21 +1837,11 @@ static int tegra_dc_init(struct host1x_client *=
client)
> >  	if (!dc->syncpt)
> >  		dev_warn(dc->dev, "failed to allocate syncpoint\n");
> > =20
> > -	if (tegra->domain) {
> > -		dc->group =3D iommu_group_get(client->dev);
> > -
> > -		if (dc->group && dc->group !=3D tegra->group) {
> > -			err =3D iommu_attach_group(tegra->domain, dc->group);
> > -			if (err < 0) {
> > -				dev_err(dc->dev,
> > -					"failed to attach to domain: %d\n",
> > -					err);
> > -				iommu_group_put(dc->group);
> > -				return err;
> > -			}
> > -
> > -			tegra->group =3D dc->group;
> > -		}
> > +	dc->group =3D host1x_client_iommu_attach(client, true);
> > +	if (IS_ERR(dc->group)) {
> > +		err =3D PTR_ERR(dc->group);
> > +		dev_err(client->dev, "failed to attach to domain: %d\n", err);
> > +		return err;
> >  	}
> > =20
> >  	if (dc->soc->wgrps)
> > @@ -1916,15 +1906,7 @@ static int tegra_dc_init(struct host1x_client *c=
lient)
> >  	if (!IS_ERR(primary))
> >  		drm_plane_cleanup(primary);
> > =20
> > -	if (dc->group) {
> > -		if (dc->group =3D=3D tegra->group) {
> > -			iommu_detach_group(tegra->domain, dc->group);
> > -			tegra->group =3D NULL;
> > -		}
> > -
> > -		iommu_group_put(dc->group);
> > -	}
> > -
> > +	host1x_client_iommu_detach(client, dc->group);
> >  	host1x_syncpt_free(dc->syncpt);
> > =20
> >  	return err;
> > @@ -1932,9 +1914,7 @@ static int tegra_dc_init(struct host1x_client *cl=
ient)
> > =20
> >  static int tegra_dc_exit(struct host1x_client *client)
> >  {
> > -	struct drm_device *drm =3D dev_get_drvdata(client->parent);
> >  	struct tegra_dc *dc =3D host1x_client_to_dc(client);
> > -	struct tegra_drm *tegra =3D drm->dev_private;
> >  	int err;
> > =20
> >  	devm_free_irq(dc->dev, dc->irq, dc);
> > @@ -1945,15 +1925,7 @@ static int tegra_dc_exit(struct host1x_client *c=
lient)
> >  		return err;
> >  	}
> > =20
> > -	if (dc->group) {
> > -		if (dc->group =3D=3D tegra->group) {
> > -			iommu_detach_group(tegra->domain, dc->group);
> > -			tegra->group =3D NULL;
> > -		}
> > -
> > -		iommu_group_put(dc->group);
> > -	}
> > -
> > +	host1x_client_iommu_detach(client, dc->group);
> >  	host1x_syncpt_free(dc->syncpt);
> > =20
> >  	return 0;
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index 7afe2f635f74..bc1008305e1e 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -1114,6 +1114,48 @@ int tegra_drm_unregister_client(struct tegra_drm=
 *tegra,
> >  	return 0;
> >  }
> > =20
> > +struct iommu_group *host1x_client_iommu_attach(struct host1x_client *c=
lient,
> > +					       bool shared)
> > +{
> > +	struct drm_device *drm =3D dev_get_drvdata(client->parent);
> > +	struct tegra_drm *tegra =3D drm->dev_private;
> > +	struct iommu_group *group =3D NULL;
> > +	int err;
> > +
> > +	if (tegra->domain) {
> > +		group =3D iommu_group_get(client->dev);
> > +
> > +		if (group && (!shared || (shared && (group !=3D tegra->group)))) {
> > +			err =3D iommu_attach_group(tegra->domain, group);
> > +			if (err < 0) {
> > +				iommu_group_put(group);
> > +				return ERR_PTR(err);
> > +			}
> > +
> > +			if (shared && !tegra->group)
> > +				tegra->group =3D group;
> > +		}
> > +	}
> > +
> > +	return group;
> > +}
> > +
> > +void host1x_client_iommu_detach(struct host1x_client *client,
> > +				struct iommu_group *group)
> > +{
> > +	struct drm_device *drm =3D dev_get_drvdata(client->parent);
> > +	struct tegra_drm *tegra =3D drm->dev_private;
> > +
> > +	if (group) {
> > +		if (group =3D=3D tegra->group) {
> > +			iommu_detach_group(tegra->domain, group);
> > +			tegra->group =3D NULL;
> > +		}
> > +
> > +		iommu_group_put(group);
> > +	}
> > +}
> > +
> >  void *tegra_drm_alloc(struct tegra_drm *tegra, size_t size, dma_addr_t=
 *dma)
> >  {
> >  	struct iova *alloc;
> > diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> > index 4f41aaec8530..fe263cf58f34 100644
> > --- a/drivers/gpu/drm/tegra/drm.h
> > +++ b/drivers/gpu/drm/tegra/drm.h
> > @@ -110,6 +110,10 @@ int tegra_drm_register_client(struct tegra_drm *te=
gra,
> >  			      struct tegra_drm_client *client);
> >  int tegra_drm_unregister_client(struct tegra_drm *tegra,
> >  				struct tegra_drm_client *client);
> > +struct iommu_group *host1x_client_iommu_attach(struct host1x_client *c=
lient,
> > +					       bool shared);
> > +void host1x_client_iommu_detach(struct host1x_client *client,
> > +				struct iommu_group *group);
> > =20
> >  int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
> >  int tegra_drm_exit(struct tegra_drm *tegra);
> > diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> > index 0b42e99da8ad..2cd0f66c8aa9 100644
> > --- a/drivers/gpu/drm/tegra/gr2d.c
> > +++ b/drivers/gpu/drm/tegra/gr2d.c
> > @@ -32,7 +32,6 @@ static int gr2d_init(struct host1x_client *client)
> >  	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
> >  	struct drm_device *dev =3D dev_get_drvdata(client->parent);
> >  	unsigned long flags =3D HOST1X_SYNCPT_HAS_BASE;
> > -	struct tegra_drm *tegra =3D dev->dev_private;
> >  	struct gr2d *gr2d =3D to_gr2d(drm);
> >  	int err;
> > =20
> > @@ -47,22 +46,14 @@ static int gr2d_init(struct host1x_client *client)
> >  		goto put;
> >  	}
> > =20
> > -	if (tegra->domain) {
> > -		gr2d->group =3D iommu_group_get(client->dev);
> > -
> > -		if (gr2d->group) {
> > -			err =3D iommu_attach_group(tegra->domain, gr2d->group);
> > -			if (err < 0) {
> > -				dev_err(client->dev,
> > -					"failed to attach to domain: %d\n",
> > -					err);
> > -				iommu_group_put(gr2d->group);
> > -				goto free;
> > -			}
> > -		}
> > +	gr2d->group =3D host1x_client_iommu_attach(client, false);
> > +	if (IS_ERR(gr2d->group)) {
> > +		err =3D PTR_ERR(gr2d->group);
> > +		dev_err(client->dev, "failed to attach to domain: %d\n", err);
> > +		goto free;
> >  	}
> > =20
> > -	err =3D tegra_drm_register_client(tegra, drm);
> > +	err =3D tegra_drm_register_client(dev->dev_private, drm);
> >  	if (err < 0) {
> >  		dev_err(client->dev, "failed to register client: %d\n", err);
> >  		goto detach;
> > @@ -71,10 +62,7 @@ static int gr2d_init(struct host1x_client *client)
> >  	return 0;
> > =20
> >  detach:
> > -	if (gr2d->group) {
> > -		iommu_detach_group(tegra->domain, gr2d->group);
> > -		iommu_group_put(gr2d->group);
> > -	}
> > +	host1x_client_iommu_detach(client, gr2d->group);
> >  free:
> >  	host1x_syncpt_free(client->syncpts[0]);
> >  put:
> > @@ -94,14 +82,10 @@ static int gr2d_exit(struct host1x_client *client)
> >  	if (err < 0)
> >  		return err;
> > =20
> > +	host1x_client_iommu_detach(client, gr2d->group);
> >  	host1x_syncpt_free(client->syncpts[0]);
> >  	host1x_channel_put(gr2d->channel);
> > =20
> > -	if (gr2d->group) {
> > -		iommu_detach_group(tegra->domain, gr2d->group);
> > -		iommu_group_put(gr2d->group);
> > -	}
> > -
> >  	return 0;
> >  }
> > =20
> > diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
> > index e129f1afff33..98e3c67d0fb5 100644
> > --- a/drivers/gpu/drm/tegra/gr3d.c
> > +++ b/drivers/gpu/drm/tegra/gr3d.c
> > @@ -42,7 +42,6 @@ static int gr3d_init(struct host1x_client *client)
> >  	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
> >  	struct drm_device *dev =3D dev_get_drvdata(client->parent);
> >  	unsigned long flags =3D HOST1X_SYNCPT_HAS_BASE;
> > -	struct tegra_drm *tegra =3D dev->dev_private;
> >  	struct gr3d *gr3d =3D to_gr3d(drm);
> >  	int err;
> > =20
> > @@ -56,19 +55,11 @@ static int gr3d_init(struct host1x_client *client)
> >  		goto put;
> >  	}
> > =20
> > -	if (tegra->domain) {
> > -		gr3d->group =3D iommu_group_get(client->dev);
> > -
> > -		if (gr3d->group) {
> > -			err =3D iommu_attach_group(tegra->domain, gr3d->group);
> > -			if (err < 0) {
> > -				dev_err(client->dev,
> > -					"failed to attach to domain: %d\n",
> > -					err);
> > -				iommu_group_put(gr3d->group);
> > -				goto free;
> > -			}
> > -		}
> > +	gr3d->group =3D host1x_client_iommu_attach(client, false);
> > +	if (IS_ERR(gr3d->group)) {
> > +		err =3D PTR_ERR(gr3d->group);
> > +		dev_err(client->dev, "failed to attach to domain: %d\n", err);
> > +		goto free;
> >  	}
> > =20
> >  	err =3D tegra_drm_register_client(dev->dev_private, drm);
> > @@ -80,10 +71,7 @@ static int gr3d_init(struct host1x_client *client)
> >  	return 0;
> > =20
> >  detach:
> > -	if (gr3d->group) {
> > -		iommu_detach_group(tegra->domain, gr3d->group);
> > -		iommu_group_put(gr3d->group);
> > -	}
> > +	host1x_client_iommu_detach(client, gr3d->group);
> >  free:
> >  	host1x_syncpt_free(client->syncpts[0]);
> >  put:
> > @@ -95,7 +83,6 @@ static int gr3d_exit(struct host1x_client *client)
> >  {
> >  	struct tegra_drm_client *drm =3D host1x_to_drm_client(client);
> >  	struct drm_device *dev =3D dev_get_drvdata(client->parent);
> > -	struct tegra_drm *tegra =3D dev->dev_private;
> >  	struct gr3d *gr3d =3D to_gr3d(drm);
> >  	int err;
> > =20
> > @@ -103,14 +90,10 @@ static int gr3d_exit(struct host1x_client *client)
> >  	if (err < 0)
> >  		return err;
> > =20
> > +	host1x_client_iommu_detach(client, gr3d->group);
> >  	host1x_syncpt_free(client->syncpts[0]);
> >  	host1x_channel_put(gr3d->channel);
> > =20
> > -	if (gr3d->group) {
> > -		iommu_detach_group(tegra->domain, gr3d->group);
> > -		iommu_group_put(gr3d->group);
> > -	}
> > -
> >  	return 0;
> >  }
> > =20
> >=20
>=20
> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>=20
> Though I'd prefer to have tegra->group renamed, maybe to 'shared_dc_group=
'.

tegra->group doesn't bother me at all. I think just the fact that it's
in struct tegra_drm implies that it is shared. It's also declared
closely to all the other "shared" variables, so I think that makes it
pretty clear. If there were other IOMMU groups I'd agree that renaming
it would be good to clarify the purpose. But as it is, I think there's
no need for that.

Thanks for the review!

Thierry

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsd9oACgkQ3SOs138+
s6HTXw//Smvh1Uo9ew04VE8kLtSEfjk2+uOHPvMm3Jhl7Y+c5C57BJ6OHRH1/KSh
AZ9qIe72cqvJXEYm0H+X5yawM3DzALkh/hUHkPr6WEyvyFGUyNx61cOb2x4Ov8A5
Jabb/d0wDNzlru43EHE8sIngMK1lFT95TMzqRY3bk4eYHl+zSoTVPxVlBvmf3qnd
kBASQIRM7ww3i5nYK1YnF6b23SAbvqhgew2TnUVzdHmA8HDWEbpkIkFiUs7ZFNGz
UTxai2sWUHLAVcJe0FmB4R/4EgEiJsF4AjDnezOs4xhdFsTc+9k2yY38DCO7Zywo
8dl5nl+Sg6Ki9pBYgmub5l2p1uqk93kDJgsgAItVdQcaJRqqwpQmw0W9bSZXeWNR
yD3TAN6ZLnu9iksPId8ijv4wRbpcHkURmeecxYsyMdkNTHT8sohyh21YBsnraWV+
GTxqZz+dLNTNZRBGl9r/qiqGmR/shP1DkMYjejveZEFSB+qMl41grhZFM475HmJH
cTbi6WF6HHo8oEybhZeOJAbgCJDGbzquGm5NkqFudHBnolNrEW1WQTL9Jkp8SGTh
PGHEIuV8TMSHgNzRopS4buU+l81x6OmFFM+5w61hLQNcQoD3o+MnrgBeDC/Lw9pg
waRvQIY8d2hRtuUI629rWfG1m4C/K+CsUbwlrcQxXQREMs85xUM=
=x1sC
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--

--===============0497150307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0497150307==--
