From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/5] drm/tegra: vic: Load firmware on demand
Date: Wed, 23 Jan 2019 15:06:44 +0100
Message-ID: <20190123140644.GB16034@ulmo>
References: <20190123093951.24908-1-thierry.reding@gmail.com>
 <20190123093951.24908-3-thierry.reding@gmail.com>
 <a9bb39f8-00d8-76e9-04e9-4642684d8161@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0074118087=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <a9bb39f8-00d8-76e9-04e9-4642684d8161@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


--===============0074118087==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2019 at 03:47:45PM +0300, Dmitry Osipenko wrote:
> 23.01.2019 12:39, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Loading the firmware requires an allocation of IOVA space to make sure
> > that the VIC's Falcon microcontroller can read the firmware if address
> > translation via the SMMU is enabled.
> >=20
> > However, the allocation currently happens at a time where the geometry
> > of an IOMMU domain may not have been initialized yet. This happens for
> > example on Tegra186 and later where an ARM SMMU is used. Domains which
> > are created by the ARM SMMU driver postpone the geometry setup until a
> > device is attached to the domain. This is because IOMMU domains aren't
> > attached to a specific IOMMU instance at allocation time and hence the
> > input address space, which defines the geometry, is not known yet.
> >=20
> > Work around this by postponing the firmware load until it is needed at
> > the time where a channel is opened to the VIC. At this time the shared
> > IOMMU domain's geometry has been properly initialized.
> >=20
> > As a byproduct this allows the Tegra DRM to be created in the absence
> > of VIC firmware, since the VIC initialization no longer fails if the
> > firmware can't be found.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/tegra/vic.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
> > index d47983deb1cf..afbdc33f49bc 100644
> > --- a/drivers/gpu/drm/tegra/vic.c
> > +++ b/drivers/gpu/drm/tegra/vic.c
> > @@ -181,13 +181,6 @@ static int vic_init(struct host1x_client *client)
> >  		vic->domain =3D tegra->domain;
> >  	}
> > =20
> > -	if (!vic->falcon.data) {
> > -		vic->falcon.data =3D tegra;
> > -		err =3D falcon_load_firmware(&vic->falcon);
> > -		if (err < 0)
> > -			goto detach;
> > -	}
> > -
> >  	vic->channel =3D host1x_channel_request(client->dev);
> >  	if (!vic->channel) {
> >  		err =3D -ENOMEM;
> > @@ -256,6 +249,16 @@ static int vic_open_channel(struct tegra_drm_clien=
t *client,
> >  	if (err < 0)
> >  		return err;
> > =20
> > +	if (!vic->falcon.data) {
> > +		vic->falcon.data =3D client->drm;
> > +
> > +		err =3D falcon_load_firmware(&vic->falcon);
> > +		if (err < 0) {
> > +			pm_runtime_put(vic->dev);
> > +			return err;
> > +		}
> > +	}
> > +
> >  	err =3D vic_boot(vic);
> >  	if (err < 0) {
> >  		pm_runtime_put(vic->dev);
> >=20
>=20
> This only moves the firmware data-copying to a later stage and doesn't
> touch reading out of the firmware file, hence the claim about the
> "byproduct" is invalid. Please take a look at the patch I posted
> sometime ago [0] and feel free to use it as a reference.

You're right, that hunk ended up in some other patch. And indeed this
patch looks pretty much like yours, so I've merged both together (mine
hadn't moved things out to a separate function, so I did that now, and
mine still reuses the client->drm pointer introduced in an earlier patch
to make it easier to pass that around).

Will send out v2 of this patch.

Thierry

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxIdPQACgkQ3SOs138+
s6HcYA//UTo8uiRkIf5zUBoDV3hDdNkXNVmqcX62QNZRaIonu/5MUmFt3qm8bOdB
mMXcN/91Eep5LZfdrEDywLCaCjqOrmmst7Lr8fYi16TiHNUuJKvh9D7sExI48hhJ
Utl2hEFQX9YQsCgR9E+kEzsoiRSMHYGNzBiuuivPJuUp5DRP6q0kJ+na8i9oazpC
jt7yRPnyPW5s8Zfl5YSoUumUejFVWQTXyM1j4C/QxvQcli7Gx4f09vSueXDFPduP
YS76xaAEdAaizjpSQ8+BgK4DOKw+thx2ePaKTpRaAAKiSvbnuIACW4SOJfHKwVNy
O85c5dstLmTekv2TBjdKDOro0dOIm7BTWJIWtYP3YJl7ThVU46+l0/n7xyQVLjtW
CjpDWXvQhcgugf6oTDseoSDr5z86ngcH3eu8SaZ/IM1TmiZw4/KTfSfXZYTBdXsF
+JJo/FLFRnUiMmLie+znbbZCJMTgYDEylMvrXuQAGnDX9y/I8bJZo2PmOeQsHTsT
dR2woZUNmiPtJq35ragAgjxUrr8RrGFDg5/ZJwDNog1Qwr/b17Bev374PBBgcTbQ
+7HyRkr0k+/8Zkan+ldR2Dc4ezXvnnstsmHzwCQhvbU3WeYMbdTh0pbeqO6mTYeg
CTAyDVQdpWhBAJiN0o54H39RE3vYUvtTNzwSZUFxUxi5zqmXyK4=
=T40X
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--

--===============0074118087==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0074118087==--
