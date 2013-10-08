From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 13/27] drm/tegra: Move subdevice infrastructure to
 host1x
Date: Tue, 8 Oct 2013 11:52:26 +0200
Message-ID: <20131008095226.GB19633@ulmo.nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-14-git-send-email-treding@nvidia.com>
 <5253A563.1060409@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FkmkrVfFsRoUs1wW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5253A563.1060409-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--FkmkrVfFsRoUs1wW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2013 at 09:25:39AM +0300, Terje Bergstr=C3=B6m wrote:
> On 07.10.2013 11:34, Thierry Reding wrote:
> > The Tegra DRM driver currently uses some infrastructure to defer the DRM
> > core initialization until all required devices have registered. The same
> > infrastructure can potentially be used by any other driver that requires
> > more than a single sub-device of the host1x module.
> >=20
> > Make the infrastructure more generic and keep only the DRM specific code
> > in the DRM part of the driver. Eventually this will make it easy to move
> > the DRM driver part back to the DRM subsystem.
>=20
> Do we need the host1x_client/tegra_drm_client concept outside DRM? You
> separated the two in an earlier patch, but the whole structure is there
> because of limitation in DRM. Shouldn't we keep management of drm
> clients entirely inside drm?

The DRM specific parts are still all managed within the DRM driver.
However the host1x_client API, and specifically the method in which
sub-devices can be registered (host1x_client to host1x_device) is
completely subsystem agnostic.

That part can be used subsequently by things such as a V4L2 driver
to achieve the same thing we've done with Tegra DRM, namely to use
several sub-devices collectively to provide the functionality of a
"composite" device (VI/CSI).

> Second, do we need an own drm_bus for host1x clients? Does it bring
> something drm_platform doesn't? I couldn't see any immediate difference
> between the two.

The difference is in that we pass in a host1x_device, which is not a
platform device, but really just a wrapped struct device. That in turn
provides the whole composite device infrastructure. So, no, it can't be
done with drm_platform.

Thierry

--FkmkrVfFsRoUs1wW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSU9XaAAoJEN0jrNd/PrOh8n0QALK4piwuTv6VCR4pN/vQuYi4
mwPKgKDkmkKVSIgHg6aVqFVLn3JRgYpOZNnuCRNHINmkv0lQ/T+QiJtaid1XYIe5
z5wFE2zIQ4Gm3AQmyzMVVSeovV6CSoEBwJxrpgw97PX/KRQeRR4ewQth9hDZfz8W
sOM06iyKC+oBrCevME2wx46KVBJgq53KvW9gJ/p3CLyN8fkZLH9l+9gtD5oKlXFm
2TAlENM7eIIC5x3RDOwq6u48kXAgCg/B9tteodpj8iYJvJK6Ma1Nue2Dg13avom+
jvL599L0hPJywQr4wEX/NJHgw90BrDg0poMiXdq2JKd9eriHWTb6BxrAd2NH5Jv1
Gub3KrIgOuzNQKwV7BaWVDcmZ490Vei4SsVeWb1tRT2K9JD3Gu+avBi6YjUcnO6u
jUiVOnsb7TmAPBi0XDmuW0i3Ase9bBMIPoi+UHjACqujSiUfoNZuC/krQw2ub7kg
zH62Sy23BSipEqoDN/o/+eN94kenQ9idtPKUzXA6+b3mMsZyNT7BdSie7mhqZZeE
BTxgzXLtdhD+kbKV/dJDxum3W8afEjZSmNQ4IxTxo3lo5SgATuivwHeTlUf9VTCP
7akeDqCx9hwo/BhlYbFG5JrDiXK2/tdVjmQybI9M2Jm4nC0yVFTfOTQFQeubpGs+
qfMeQx6nZexL7wSXsd0g
=ApRC
-----END PGP SIGNATURE-----

--FkmkrVfFsRoUs1wW--
