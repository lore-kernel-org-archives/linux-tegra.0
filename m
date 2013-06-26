From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Wed, 26 Jun 2013 12:31:36 +0200
Message-ID: <20130626103135.GG27083@manwe>
References: <51C9AF96.3040107@wwwdotorg.org>
 <20130625.193628.2143557800560690024.hdoyu@nvidia.com>
 <CACxGe6t9ifg9VRfXKypuhie3pXVPneZqcBy+J1bFpUaUx32P7g@mail.gmail.com>
 <20130626.090030.1519009485651154440.hdoyu@nvidia.com>
 <CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GUPx2O/K0ibUojHx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "Pawel.Moll-5wv7dgnIgG8@public.gmane.org" <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2013 at 11:03:20AM +0100, Grant Likely wrote:
> On Wed, Jun 26, 2013 at 7:00 AM, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> > Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Tue, 25 Jun 2013 19:52=
:33 +0200:
> >
> >> > Here's my workaround. I need to call of_detach_node() with OF_DYNAMIC
> >> > to avoid duplicated device registration.
> >>
> >> Gah! my eyes!
> >>
> >> Don't do that. It is incredibly problematic. Look at inhibiting
> >> duplicate device creation instead.
> >
> > I may not follow this thread correctly, but could anyone point out the
> > above "inhibiting duplicate device creation" if there's already such
> > solution?
>=20
> No, the solution doesn't exist yet, but it wouldn't be hard to
> implement. What you need to do is to add a struct device pointer to
> struct device_node, and set the pointer to the struct device when
> of_platform_device_create creates a device. (it would also need to be
> set for early_platform_device creation, but that's not something that
> should affect you). You would also add a check to
> of_platform_device_create to check if the device pointer is already
> set. If it is, then skip creation of the device.

One problem with this method is that every driver that needs or wants
the device early has to do it explicitly, but I guess we can't have it
all.

I find this solution rather appealing because it allows for instance the
Marvell Armada 370/XP IRQ chip driver to do this as well so we no longer
have to keep around the extra struct device_node * in msi_chip but we
can actually reuse the one from struct device instead.

Thierry

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRysMHAAoJEN0jrNd/PrOhDWoP/2iSY1etDGScZXvRoXw7KPIW
YYbEFO1MfKvtBWkkFPbA2xc5BbswaZF9q7FMcI7C97vUZvGZCqRTbPGLpcRp5zyP
tc8/QFDtHwJy35me3ylSPP3M4m7n0A2pc+doaY3LPHevBzeWl/zARpnGU3qxBsLz
2MtFDKpJ8P5HKnBB4zKCDaL2Zbd/BMMVy2Nnud5xMXvCm7z+R08Cdt3EB9ma51Dx
YWDaQ8WADbJwWWq/b5Yyf3XROPg9ZLCaC/5madxHDE282OYC1G1Ss78tREfVpzxc
1+KXk0wfravQBaueDoWCCb3zXwMKpI14IJSAgidcJ4fyg6vIzoJZz7xXN+vZ8RNy
oenzH6kKSZKacfE/s6Xiv9K6zNX0fYzFW2soSkW1sKVJ+pp8MdWyRwkiFoP8MDGn
7u+xd69a+nff81TTv2MrFWCqNeXoroR57wQCnWJk7WSw177m3gxMpAEMaEk+x15K
5bE525s8VKD+YC6bifybmk45xncMEkmczlQL7+1Y69yZzFSIvli6bOiQyDgoJz+9
kt1AiGJBoKnl7iuOgnn3bWkbr7wJrUQCCTvnKCb9obke1Vz/BKSKJzIj3zpxbFAn
ZJBZY4STyBF7ztAHNoZVsURoN8DnkzRTF8nBtGmw99UlcFjo6FgAO3qR0QOGbYk1
NqRjngIXrFnjjqqYyUD1
=uqGJ
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--
