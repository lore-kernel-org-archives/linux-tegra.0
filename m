From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 7/7] gpu: host1x: Track client version
Date: Fri, 18 May 2018 14:39:39 +0200
Message-ID: <20180518123939.GA9594@ulmo>
References: <20180517153430.9602-1-thierry.reding@gmail.com>
 <20180517153430.9602-8-thierry.reding@gmail.com>
 <0a6d355f-1173-61e5-af38-97f65ae41145@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0561455386=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <0a6d355f-1173-61e5-af38-97f65ae41145@kapsi.fi>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0561455386==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 18, 2018 at 03:21:11PM +0300, Mikko Perttunen wrote:
> On 05/17/2018 06:34 PM, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Userspace needs to know the version of the interface implemented by a
> > client so it can create the proper command streams. Allow individual
> > drivers to store this version along with the client so that it can be
> > returned to userspace upon opening a channel.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   include/linux/host1x.h | 3 +++
> >   1 file changed, 3 insertions(+)
> >=20
> > diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> > index 89110d896d72..57d26406bdfd 100644
> > --- a/include/linux/host1x.h
> > +++ b/include/linux/host1x.h
> > @@ -49,6 +49,7 @@ struct host1x_client_ops {
> >    * @dev: pointer to struct device backing this host1x client
> >    * @ops: host1x client operations
> >    * @class: host1x class represented by this client
> > + * @version: interface version implemented by this client
> >    * @channel: host1x channel associated with this client
> >    * @syncpts: array of syncpoints requested for this client
> >    * @num_syncpts: number of syncpoints requested for this client
> > @@ -61,6 +62,8 @@ struct host1x_client {
> >   	const struct host1x_client_ops *ops;
> >   	enum host1x_class class;
> > +	unsigned int version;
> > +
>=20
> It doesn't seem to me that this fits here - Host1x doesn't provide any
> userspace interface, TegraDRM does. We will (hopefully) have clients in t=
he
> future that use a different userspace interface, or don't have one at all.
> So this property should be on TegraDRM side instead.

I think the line is somewhat blurry. Technically it is the host1x
clients that define the version of the interface that they provide. By
interface I mean the "class" of the command stream supported. So gr2d
will define what methods are valid to use on a specific version of the
module. The same goes for gr3d and VIC. The hardware module is where
that specification lives.

So if we ever had a client that didn't provide a userspace interface via
Tegra DRM we'd still want to represent what version of the (command
stream) interface is expected. By moving this to drm/tegra, we move the
hardware specific bits into the userspace related parts, so I'm not sure
it is a really good fit.

However, I do understand where you're coming from. Ultimately where
userspace gets involved is at the ABI level that drm/tegra exposes. And
for drivers that don't expose a userspace ABI, they'd likely need to
deal with the version number internally, so storing this in host1x
clients wouldn't fit very well either.

I don't really care all that much how exactly we store the version
information so that it can be reported back to userspace, and moving it
to drm/tegra makes the code somewhat more elegant. I came up with the
below, which is completely untested but should work.

Thierry

--- >8 ---
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4330d5d48801..5dc02340007e 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -1389,7 +1389,7 @@ static int tegra_open_channel(struct drm_device *drm,=
 void *data,
 				break;
=20
 			args->syncpts =3D client->base.num_syncpts;
-			args->version =3D client->base.version;
+			args->version =3D client->version;
 			args->context =3D context->id;
 			break;
 		}
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index 13660f6225a2..f493e0bf2172 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -105,6 +105,7 @@ struct tegra_drm_client {
 	struct host1x_client base;
 	struct list_head list;
=20
+	unsigned int version;
 	const struct tegra_drm_client_ops *ops;
 };
=20
diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
index 7cae8252f0fa..165a1cece039 100644
--- a/drivers/gpu/drm/tegra/gr2d.c
+++ b/drivers/gpu/drm/tegra/gr2d.c
@@ -196,11 +196,11 @@ static int gr2d_probe(struct platform_device *pdev)
 	gr2d->client.base.ops =3D &gr2d_client_ops;
 	gr2d->client.base.dev =3D dev;
 	gr2d->client.base.class =3D HOST1X_CLASS_GR2D;
-	gr2d->client.base.version =3D gr2d->soc->version;
 	gr2d->client.base.syncpts =3D syncpts;
 	gr2d->client.base.num_syncpts =3D 1;
=20
 	INIT_LIST_HEAD(&gr2d->client.list);
+	gr2d->client.version =3D gr2d->soc->version;
 	gr2d->client.ops =3D &gr2d_ops;
=20
 	err =3D host1x_client_register(&gr2d->client.base);
diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index 9bd89916d2ef..0d72e78bd6e8 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -325,11 +325,11 @@ static int gr3d_probe(struct platform_device *pdev)
 	gr3d->client.base.ops =3D &gr3d_client_ops;
 	gr3d->client.base.dev =3D &pdev->dev;
 	gr3d->client.base.class =3D HOST1X_CLASS_GR3D;
-	gr3d->client.base.version =3D gr3d->soc->version;
 	gr3d->client.base.syncpts =3D syncpts;
 	gr3d->client.base.num_syncpts =3D 1;
=20
 	INIT_LIST_HEAD(&gr3d->client.list);
+	gr3d->client.version =3D gr3d->soc->version;
 	gr3d->client.ops =3D &gr3d_ops;
=20
 	err =3D host1x_client_register(&gr3d->client.base);
diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index b9df467ca71e..9fa77405db01 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -342,12 +342,12 @@ static int vic_probe(struct platform_device *pdev)
 	vic->client.base.ops =3D &vic_client_ops;
 	vic->client.base.dev =3D dev;
 	vic->client.base.class =3D HOST1X_CLASS_VIC;
-	vic->client.base.version =3D vic->config->version;
 	vic->client.base.syncpts =3D syncpts;
 	vic->client.base.num_syncpts =3D 1;
 	vic->dev =3D dev;
=20
 	INIT_LIST_HEAD(&vic->client.list);
+	vic->client.version =3D vic->config->version;
 	vic->client.ops =3D &vic_ops;
=20
 	err =3D host1x_client_register(&vic->client.base);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 6dc819b1ab64..518864cfbd16 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -62,7 +62,6 @@ struct host1x_client {
 	const struct host1x_client_ops *ops;
=20
 	enum host1x_class class;
-	unsigned int version;
=20
 	struct host1x_channel *channel;
=20

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlr+yYkACgkQ3SOs138+
s6F/DBAAqekHyP+4QNCKx381oHW43Rdg6vCOWvUKzFnY6MdrFxFR10516HL29wrN
QkBDQpYdA+l4suw8HoKyzmsUNabySNEswlPVYUnKnh8TiD3PKxgMTLrWsBtov2Ew
v6NTWeh9Fb9rzd5EKrek0UdCOPqhl8ffT7l7GxO+dIbrCBZI2UbfFOJtCW+sbJXN
8ZhmwDmVWSWu7BYg/qeDteChUyvIQ7r8Ax5DeRVlfXl3OkKK8gneAMKNyp3Kw6I7
WwLN8XVe6OojEkQP4l9u5m9CvSaW0MXHQxr/5Ax6eaqWubVqTESEOV4uGttsNRJS
kSBvWpbNBUDpdXzqVIvyJDHB1fqgay0fJ/IeCUWPscvCfZy/q+FVBsPOOm0MzGYh
6NpkRDAG0Gfo8yMKlQ/1tUD3WPEpOs3EwdVB6RkRXUtzWDNdYHusnwPc862laNyM
nA9chQgLHgqui/t4r4YQN4GhCDCyh5EWqWqyQA8xM+lHh53InaJNe3ungE7/zza9
8R6ImyDgQ00VgWX48DtTx0IMC63oNvD2b54i4+Yqtvy0JmCHznh3WecFm5Xns6FO
NhcNKadmKHMbD7Ssc8N3QC+AvB3NBk+LtmHcBF8RekMRsPQg/BkdehMD+O2GVUgJ
UpVTzPMZ8Q8ph6l1aGXNOxwBv7xl5Ce3zmEcu5jk2UfDU7NGcC4=
=BgO6
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--

--===============0561455386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0561455386==--
