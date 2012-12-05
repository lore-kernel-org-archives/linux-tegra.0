From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC libdrm] Add NVIDIA Tegra support
Date: Wed, 5 Dec 2012 08:46:29 +0100
Message-ID: <20121205074629.GA13386@avionic-0098.adnet.avionic-design.de>
References: <1354634032-9986-1-git-send-email-thierry.reding@avionic-design.de>
 <1354634032-9986-2-git-send-email-thierry.reding@avionic-design.de>
 <50BEFA1F.5090907@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50BEFA1F.5090907-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2012 at 09:39:11AM +0200, Arto Merilainen wrote:
> On 12/04/2012 05:13 PM, Thierry Reding wrote:
> >+int drm_tegra_open(const char *path, struct drm_tegra **devicep)
> >+{
> >+       struct drm_tegra *device;
> >+       int err;
> >+
> >+       if (!path || !devicep)
> >+               return -EINVAL;
> >+
> >+       device =3D calloc(1, sizeof(*device));
> >+       if (!device)
> >+               return -ENOMEM;
> >+
> >+       DRMINITLISTHEAD(&device->bo_list);
> >+
> >+       device->fd =3D open(path, O_RDWR);
> >+       if (device->fd < 0) {
> >+               err =3D -errno;
> >+               free(device);
> >+               return err;
> >+       }
> >+
> >+       *devicep =3D device;
> >+
> >+       return 0;
> >+}
>=20
> I think you shouldn't ask the path from the application (=3DDDX) here,
> but use drmOpen() that automatically finds the correct device for
> you.
>=20
> I'd also prefer letting the application open and close the device
> and modify drm_tegra_open() to take the fd as a parameter. That way
> the DDX could easily access also all generic libdrm functions.

Good points, I'll take those into account.

Thanks,
Thierry

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQvvvVAAoJEN0jrNd/PrOhfe0QALB6wTlifJbjF60iAHgcznSa
YIHlJ5pF5kMithP9UfyK00+OjDKM6mgbL29+eGKLh5dJ52ixr7K5z3AITxT9vq71
UijWCFaxkBz9xWI4LnCZXuUpD7JhMHPiUFF/5j8Q+4n3ekxl/FS02xvRVTpAZXHr
xWiOq2PrHrfb5MqFg3Kba9vLFjhK7X/uA+vniMduUV2nXEkmlYnC+kUMWCiraC4w
HX25xms5/hDPNemtlvRLu4ZfjQYPbgRmMsrHyTi33pPA4HeiyqEbQb8T9lSXuf7a
LdguQNPvi4GUtpBeqGsaEflaG1xVVZ3IW3ylGMoqSKDnvCSuSFXA7+8V12Fma1tk
AVhZeHoHds9Sge92N8bktKryK2l/VqtQRAMhBvKrtZlHjqwLN9mTPSKi2XzFDVcD
5ZLLuLDH3nHmKYaJDTysHsoNsQ4oaiz0AnrYJQsEmjDVsUzo+ypKuyVeiBlSSNvY
kQg135uw5HwDUeYDgLg4JVuK6uDoXrCDJyQlm6ZQ+bNfM4IYiD1rzzRpTB8JJ7uF
QLjREFdffIi9yC8i6DFgOAsWDIs1PydQtVT+PK1kWzJNT/iCfjTgkVeQfT7LmCGw
04p6YzWRuTJUFYoQzBM/k/SpVIxU7qKxNPZmWiQxaqXtar85zMCp9WgjzTyZaROy
fYVx5fhAUz/Yi7Cb/ZYq
=nfgo
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
