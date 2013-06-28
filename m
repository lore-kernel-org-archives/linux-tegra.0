From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Fri, 28 Jun 2013 12:38:27 +0200
Message-ID: <20130628103826.GA17680@mithrandir>
References: <CACxGe6t9ifg9VRfXKypuhie3pXVPneZqcBy+J1bFpUaUx32P7g@mail.gmail.com>
 <20130626.090030.1519009485651154440.hdoyu@nvidia.com>
 <CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg@mail.gmail.com>
 <20130628.114915.1341075505557760886.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130628.114915.1341075505557760886.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Pawel.Moll-5wv7dgnIgG8@public.gmane.org" <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 10:49:15AM +0200, Hiroshi Doyu wrote:
> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Wed, 26 Jun 2013 12:03:2=
0 +0200:
>=20
> > On Wed, Jun 26, 2013 at 7:00 AM, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > > Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Tue, 25 Jun 2013 19:=
52:33 +0200:
> > >
> > >> > Here's my workaround. I need to call of_detach_node() with OF_DYNA=
MIC
> > >> > to avoid duplicated device registration.
> > >>
> > >> Gah! my eyes!
> > >>
> > >> Don't do that. It is incredibly problematic. Look at inhibiting
> > >> duplicate device creation instead.
> > >
> > > I may not follow this thread correctly, but could anyone point out the
> > > above "inhibiting duplicate device creation" if there's already such
> > > solution?
> >=20
> > No, the solution doesn't exist yet, but it wouldn't be hard to
> > implement. What you need to do is to add a struct device pointer to
> > struct device_node, and set the pointer to the struct device when
> > of_platform_device_create creates a device. (it would also need to be
> > set for early_platform_device creation, but that's not something that
> > should affect you). You would also add a check to
> > of_platform_device_create to check if the device pointer is already
> > set. If it is, then skip creation of the device.
>=20
> Implemented as Grant suggested. At least this works for our case,
> where IOMMU needs to be instanciated earlier than other device[1].
> early_platform_device case still need to be covered.

I think we arrived at a different conclusion in another branch of this
thread. With the patch below every driver needs to explicitly allocate
the platform device and set the struct device_node's .dev field, which
has other side-effects such as the device hierarchy getting messed up.

A better alternative would be to have of_platform_populate() run early
such that the .dev field in the struct device_node can be set by core
code, which would not require every driver to be changed.

I'm not sure exactly what needs to be done to make this work, however.
Grant, can you provide some guidance here as to how this may be fixed?
Where would we have to call of_platform_populate() from and what makes
this break with the current implementation?

Thierry

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRzWeiAAoJEN0jrNd/PrOhlioP/1Qxx/lvZJN+tFH4SwNcrusO
wQNMjq/r2YbiO+xPG7HHNesAnSLXmrTru80lN7sTWglucBDFFmtXOxEqrrNuUmFv
f+6VwpBPNM8oJVPoWHhoUMmj4hi3I6sFDSftjtnqpnvXk6mUjzDxGG65upnMHjHR
yIpsXAfg8ybfNWu1popdT/Y0eeK6imOEFxwVwrYJgfxIDeINgycbyxmm6DtWoA94
io0c+0x1vKxVOYw0K+XXMvm3XEraRHmvvOnNvWzYccIWvoE3DmZqSKIsjr0TLijs
D38tdLmkufSqWP8moO+yTgd7LU1cbKnMnc5nCcEXLZp9PV1Cr7ehpjaJRf+qcyX2
rNvbVvz0T7gIHv2kl/XXrKe1pB6Z76mSXHy5bJRnfOYXIyVdVcFFVvNdukGfYcWd
Oh334wizpw7VuVN8o9NThgYVGTbjSaQ0LdAeDSFuSjxzxFU9lZ5Wx6ysyi5KO/Qr
QfSIeebKxIQU5DefrvKAoUby25ExLWDcMcGQmHOO8o4ONxhLRFpAfl6ZFmFGOJA0
8m3yd3NnoarxsBOllGsPbNn7n4svdR3NYhDHCnBA3sbWs366qP0EtmPWF/9LH9yT
VMr5s5FUzgoj6rMvtDxtyU1Rki19R7SJhV34HeHznWSYBC3llx66gTHYtEdQC12l
WA+/wKbWJHVlqjCU9KGJ
=4/tu
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
