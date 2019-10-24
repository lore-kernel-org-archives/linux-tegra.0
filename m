From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 2/3] drm/tegra: Fix 2d and 3d clients detaching from
 IOMMU domain
Date: Thu, 24 Oct 2019 13:58:04 +0200
Message-ID: <20191024115804.GB2924027@ulmo>
References: <20190623173743.24088-1-digetx@gmail.com>
 <20190623173743.24088-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190623173743.24088-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:37:42PM +0300, Dmitry Osipenko wrote:
> This should should fire up on the DRM's driver module re-loader because
> there won't be enough available domains on older Tegra SoCs.
>=20
> Cc: stable <stable@vger.kernel.org>
> Fixes: 0c407de5ed1a ("drm/tegra: Refactor IOMMU attach/detach")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c   | 4 ++--
>  drivers/gpu/drm/tegra/drm.c  | 9 ++++++---
>  drivers/gpu/drm/tegra/drm.h  | 3 ++-
>  drivers/gpu/drm/tegra/gr2d.c | 4 ++--
>  drivers/gpu/drm/tegra/gr3d.c | 4 ++--
>  5 files changed, 14 insertions(+), 10 deletions(-)

I think I understand what this is trying to do, but the commit message
does not help at all. So what's really going on here is that we need to
detach the device from the group regardless of whether we're sharing the
group or not, just like we attach groups to the shared domain whether
they share the same group or not.

But in that case, I wonder if it's even worth splitting groups the way
we are right now. Wouldn't it be better to just put all the devices into
the same group and be done with it?

The current code gives me headaches every time I read it, so if we can
just make it so that all the devices under the DRM device share the same
group, this would become a lot easier to deal with. I'm not really
convinced that it makes much sense to keep them on separate domains,
especially given the constraints on the number of domains available on
earlier Tegra devices.

Note that sharing a group will also make it much easier for these to use
the DMA API if it is backed by an IOMMU.

Let me see if I can throw something together to that effect.

Thierry

> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index fa505baaaabc..c1b885444d90 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -2388,7 +2388,7 @@ static int tegra_dc_init(struct host1x_client *clie=
nt)
>  	if (!IS_ERR(primary))
>  		drm_plane_cleanup(primary);
> =20
> -	host1x_client_iommu_detach(client, dc->group);
> +	host1x_client_iommu_detach(client, dc->group, true);
>  	host1x_syncpt_free(dc->syncpt);
> =20
>  	return err;
> @@ -2412,7 +2412,7 @@ static int tegra_dc_exit(struct host1x_client *clie=
nt)
>  		return err;
>  	}
> =20
> -	host1x_client_iommu_detach(client, dc->group);
> +	host1x_client_iommu_detach(client, dc->group, true);
>  	host1x_syncpt_free(dc->syncpt);
> =20
>  	return 0;
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index d2080bd7d392..f94441457c64 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1120,15 +1120,18 @@ struct iommu_group *host1x_client_iommu_attach(st=
ruct host1x_client *client,
>  }
> =20
>  void host1x_client_iommu_detach(struct host1x_client *client,
> -				struct iommu_group *group)
> +				struct iommu_group *group,
> +				bool shared)
>  {
>  	struct drm_device *drm =3D dev_get_drvdata(client->parent);
>  	struct tegra_drm *tegra =3D drm->dev_private;
> =20
>  	if (group) {
> -		if (group =3D=3D tegra->group) {
> +		if (!shared || group =3D=3D tegra->group) {
>  			iommu_detach_group(tegra->domain, group);
> -			tegra->group =3D NULL;
> +
> +			if (group =3D=3D tegra->group)
> +				tegra->group =3D NULL;
>  		}
> =20
>  		iommu_group_put(group);
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index 488f36f00bd8..9f1a3d6f3406 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -107,7 +107,8 @@ int tegra_drm_unregister_client(struct tegra_drm *teg=
ra,
>  struct iommu_group *host1x_client_iommu_attach(struct host1x_client *cli=
ent,
>  					       bool shared);
>  void host1x_client_iommu_detach(struct host1x_client *client,
> -				struct iommu_group *group);
> +				struct iommu_group *group,
> +				bool shared);
> =20
>  int tegra_drm_init(struct tegra_drm *tegra, struct drm_device *drm);
>  int tegra_drm_exit(struct tegra_drm *tegra);
> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> index 673059fd2fcb..c486e0a05c9d 100644
> --- a/drivers/gpu/drm/tegra/gr2d.c
> +++ b/drivers/gpu/drm/tegra/gr2d.c
> @@ -69,7 +69,7 @@ static int gr2d_init(struct host1x_client *client)
>  	return 0;
> =20
>  detach:
> -	host1x_client_iommu_detach(client, gr2d->group);
> +	host1x_client_iommu_detach(client, gr2d->group, false);
>  free:
>  	host1x_syncpt_free(client->syncpts[0]);
>  put:
> @@ -89,7 +89,7 @@ static int gr2d_exit(struct host1x_client *client)
>  	if (err < 0)
>  		return err;
> =20
> -	host1x_client_iommu_detach(client, gr2d->group);
> +	host1x_client_iommu_detach(client, gr2d->group, false);
>  	host1x_syncpt_free(client->syncpts[0]);
>  	host1x_channel_put(gr2d->channel);
> =20
> diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
> index 4778ae999668..591bafe455e0 100644
> --- a/drivers/gpu/drm/tegra/gr3d.c
> +++ b/drivers/gpu/drm/tegra/gr3d.c
> @@ -79,7 +79,7 @@ static int gr3d_init(struct host1x_client *client)
>  	return 0;
> =20
>  detach:
> -	host1x_client_iommu_detach(client, gr3d->group);
> +	host1x_client_iommu_detach(client, gr3d->group, false);
>  free:
>  	host1x_syncpt_free(client->syncpts[0]);
>  put:
> @@ -98,7 +98,7 @@ static int gr3d_exit(struct host1x_client *client)
>  	if (err < 0)
>  		return err;
> =20
> -	host1x_client_iommu_detach(client, gr3d->group);
> +	host1x_client_iommu_detach(client, gr3d->group, false);
>  	host1x_syncpt_free(client->syncpts[0]);
>  	host1x_channel_put(gr3d->channel);
> =20
> --=20
> 2.22.0
>=20

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2xkcsACgkQ3SOs138+
s6EiwhAAiUsnjZ6BBMJkLVBwXfEaKLB3ga/tbSXblEDHLFvBNzOx+uAWKpm8TkPz
1qRIA6CZicSjTeD30ilbkeR98LfFjgroz+QkX6Vom2AJCA75MY50RL3h5uFXmcLr
iyNpk3vs8tfDEi9/AdrEYiwQq0LdUZKgf3MZuFBIl7JvbT8WUEt3p1OgHHrOzKH7
6qQ8sJBHWhAVhYIznIDe14h4HeD9XBXX+tfJIvwvxz5LCtfkFW7kpLlU3oCIEER/
T6QVNRUdl7Bv8kp6SttmG1e6zJs2DakhHmnW5FZDszTSQJ4d5vuCQIN1oFRLLyME
PxBNC+lc1PHxiPUQLngHM1hunlvCeePB5RoJINUC/Xy4fSFQc1xbdY0H/E8RoTiK
o0vKyafvWv8fj+17brBh6OLE4lHHmmV+E5skAT/Gf6xasn17RHlf3vZmPihgmVLD
0vwLIQIqs3+CPKgkod2mSV9QQ3Et1NMUV2iztnK+IQFQVc2q/R/0a0HvVcM4QXaY
skhdcp2idXkPShVBitWTT3XdrHi4LYpjySehAMD2d3m608MzlHa2KwHVe1W3IiXj
7LcHKu1yYU3jNaTj4WLZVR/7WCDRU4dYeGynRjiQVr/L6spxM+z4EAXlOvczUZXo
EOZ8WFH3t7HRivUniCCBC2OkvkPUNpt2yRbuMTDa3y+9MwhObpw=
=uq7y
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
