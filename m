From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] early init and DT platform devices allocation/registration
Date: Thu, 15 Aug 2013 16:23:59 +0200
Message-ID: <20130815142358.GA25009@ulmo>
References: <CACxGe6t9ifg9VRfXKypuhie3pXVPneZqcBy+J1bFpUaUx32P7g@mail.gmail.com>
 <20130626.090030.1519009485651154440.hdoyu@nvidia.com>
 <CACxGe6te2RzFb6nkSZQFrzVX4fkQo4pyzLJ1D7Lf=440mE+jyg@mail.gmail.com>
 <20130628.114915.1341075505557760886.hdoyu@nvidia.com>
 <20130628103826.GA17680@mithrandir>
 <CACxGe6vkM+awN94kU2GYfbXPdR=MgYwr=PbqmtD+=i5vmuVSnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6vkM+awN94kU2GYfbXPdR=MgYwr=PbqmtD+=i5vmuVSnA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Pawel.Moll-5wv7dgnIgG8@public.gmane.org" <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 01:27:15PM +0100, Grant Likely wrote:
> On Fri, Jun 28, 2013 at 11:38 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Fri, Jun 28, 2013 at 10:49:15AM +0200, Hiroshi Doyu wrote:
> >> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Wed, 26 Jun 2013 12:0=
3:20 +0200:
> >>
> >> > On Wed, Jun 26, 2013 at 7:00 AM, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> >> > > Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote @ Tue, 25 Jun 2013 =
19:52:33 +0200:
> >> > >
> >> > >> > Here's my workaround. I need to call of_detach_node() with OF_D=
YNAMIC
> >> > >> > to avoid duplicated device registration.
> >> > >>
> >> > >> Gah! my eyes!
> >> > >>
> >> > >> Don't do that. It is incredibly problematic. Look at inhibiting
> >> > >> duplicate device creation instead.
> >> > >
> >> > > I may not follow this thread correctly, but could anyone point out=
 the
> >> > > above "inhibiting duplicate device creation" if there's already su=
ch
> >> > > solution?
> >> >
> >> > No, the solution doesn't exist yet, but it wouldn't be hard to
> >> > implement. What you need to do is to add a struct device pointer to
> >> > struct device_node, and set the pointer to the struct device when
> >> > of_platform_device_create creates a device. (it would also need to be
> >> > set for early_platform_device creation, but that's not something that
> >> > should affect you). You would also add a check to
> >> > of_platform_device_create to check if the device pointer is already
> >> > set. If it is, then skip creation of the device.
> >>
> >> Implemented as Grant suggested. At least this works for our case,
> >> where IOMMU needs to be instanciated earlier than other device[1].
> >> early_platform_device case still need to be covered.
> >
> > I think we arrived at a different conclusion in another branch of this
> > thread. With the patch below every driver needs to explicitly allocate
> > the platform device and set the struct device_node's .dev field, which
> > has other side-effects such as the device hierarchy getting messed up.
> >
> > A better alternative would be to have of_platform_populate() run early
> > such that the .dev field in the struct device_node can be set by core
> > code, which would not require every driver to be changed.
> >
> > I'm not sure exactly what needs to be done to make this work, however.
> > Grant, can you provide some guidance here as to how this may be fixed?
> > Where would we have to call of_platform_populate() from and what makes
> > this break with the current implementation?
>=20
> Try it and see!  :-) I cannot give a definite answer, but I suspect
> that it will fall down when registering the devices on to the
> platform_bus because it isn't initialized yet. If called early, the
> code would need to hold the platform_device in some kind of deferred
> list until the platform bus was initialize, and then have a cleanup
> function at initcall time to finish the registration of all early
> devices.

So what I did is move the call to of_platform_populate() on Tegra from
=2Einit_machine() to .init_early(). The problem with .init_early() is that
the Slab allocator isn't available yet. One can use bootmem to work
around that, but it involves sprinkling a lot of slab_is_available() and
alloc_bootmem() where otherwise just kmalloc() (or one of its variants)
would be called.

What I ended up doing was implement early_kmalloc() and early_kfree() to
replace some occurrences in code that was called at some point from
of_platform_populate(). That got me quite far, though I haven't fully
completed the conversion. I'm not sure if it's really worth it either
because that code is unlikely to ever get merged.

Instead I'll try to move the call to of_platform_populate() shortly
after the slab has been initialized, which happens to be around the time
that .init_irq() is called and see if that makes things any easier.

Thierry

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSDOR+AAoJEN0jrNd/PrOho5IP/RCgbHijBa++R+LwD0XW2b2V
CYuZ/BIRZpSxXyDjBnkXVj0dLebjUlYc67OtAXvQjQ+5Cv5XaPcnJYR7vKC3d6MV
7oML9TqVFPhoGA5Klsz9G6HZnsIbdlOUeXGR8PfNwJiNcVI4bABfROiqsskPj4eg
2ryIPVbCA+ZegDaPl4hld1gIfYOvyb12h7hbNC3BD4gJ2BwoBOE8YmKWNi03Tz9U
qSV+kDlwM2tGSw9qXmHcibNt4Iz5TdA3mvRqk1xQcQHFdE0Af2tetZ/S0fsSO4tn
Con3LVRkiMKMQOzioNA1hbfpG6K+Yw6xdEKjlpOBVDtijp95IpFlebJv7/gqxuUT
TGp4H0/G7ktw2l7slkJhjGaHsYYW2XHnZKKbtWmCv4//3nAZdApw2Q0q8O096XIJ
FTPoxPDmc+gdrOZ6mP9wFmQBi+bBBTYyeww0lv8LkvwXSmtjHK4DaLNwGt9d3eFi
ZqSpe+VZ/EqTWOZQ/4+I6HVbAsnGKpthXTd5cj6t+LM4YNC8YZdTwA3q9q55D83D
7AwPrEiH/5jXiHPuJBXm1SFuGi65zFdQEH2c0/4BJ4jw2azUmGK7A5hucnWE2MsF
B8ahdZkCk3Tss9IVnLMH53LsRW3p2pyBk7YnCW0Z4KEls3dcW29hWrLjeLvjixf3
jcAJnPyXQLUXUO0sVUV8
=Hkzz
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
