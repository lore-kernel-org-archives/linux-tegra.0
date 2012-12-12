From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Wed, 12 Dec 2012 17:08:29 +0100
Message-ID: <20121212160829.GA30278@avionic-0098.adnet.avionic-design.de>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
 <1353935954-13763-7-git-send-email-tbergstrom@nvidia.com>
 <20121205083335.GA20984@avionic-0098.adnet.avionic-design.de>
 <50BF1DAA.8030805@nvidia.com>
 <20121205111332.GA25676@avionic-0098.adnet.avionic-design.de>
 <50BF345A.8050201@nvidia.com>
 <20121205120429.GA29943@avionic-0098.adnet.avionic-design.de>
 <50C5CAB5.3040000@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50C5CAB5.3040000-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2012 at 01:42:45PM +0200, Terje Bergstr=C3=B6m wrote:
> On 05.12.2012 14:04, Thierry Reding wrote:
> > On Wed, Dec 05, 2012 at 01:47:38PM +0200, Terje Bergstr=C3=B6m wrote:
> >> You're right in that binding to a sub-device is not a nice way. DRM
> >> framework just needs a "struct device" to bind to. exynos seems to sol=
ve
> >> this by introducing a virtual device and bind to that. I'm not sure if
> >> this is the best way, but worth considering?
> >=20
> > That was discussed a few months back already and nobody seemed to like
> > the idea. In fact it was as a result of that discussion that Stephen
> > brought up the idea to register the DRM driver from a central host1x
> > driver (it may also have been part of a discussion on IRC, I don't
> > remember exactly).
> >=20
> > At the time I spent some time on a patch that introduced drm_soc_init()
> > to solve this by creating a dummy struct device and registering the
> > driver on top of that. But I abandoned it in favour of fixing the DRM
> > platform support code. The approach also didn't provide for the proper
> > encapsulation.
>=20
> I've managed to go through all the other feedback and implement a
> solution to most of them, so now I have some slack to actually think
> about the initialization. Sorry about this, but you (meaning all the
> reviewers) did give us a _lot_ to do. :-) Fortunately, the driver
> actually became a lot better, too.
>=20
> Back to the topic of tegradrm init. The root cause of the problem is
> that DRM framework needs some device to assign itself to. The problem is
> that this device doesn't have any physical counterpart, as it's only for
> storing a pointer in DRM framework. Please correct me if this is wrong.
>=20
> Moving the client registration to ping pong between DRM and host1x has
> its problems. host1x driver itself has no use for a list of client
> devices. It can just iterate its children in case it needs them. In
> tegradrm, you need a list of devices under tegradrm control, which might
> or might not be the same as list of devices under host1x hardware.
>=20
> The solutions that many other DRM drivers seem to employ are the virtual
> devices. Exynos and OMAP drivers do this, as does SH Mobile DRM driver.
> So I think I'd still go this way, as it's the path of minimum
> resistance, least amount of code and most localized change. I know it's
> not ideal, but I'd also not like to get stuck in this.

I've briefly discussed this with Stephen on IRC because I thought I had
remembered him objecting to the idea of adding a dummy device just for
this purpose. It turns out, however, that what he didn't like was to add
a dummy node to the DT just to make this happen, but he has no (strong)
objections to a dummy platform device.

While I'm not very happy about that solution, I've been going over it
for a week now and haven't come up with any better alternative that
doesn't have its own disadvantages. So perhaps we should go ahead and
implement that. For the host1x driver this really just means creating a
platform device and adding it to the system, with some of the fields
tweaked to make things work.

Is this something that you can take care of in your patch series? I
could also implement this on top of the current driver and then all your
patch series would have to do is remove host1x.c from tegra-drm and
instantiate the platform device itself.

Thierry

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQyKv9AAoJEN0jrNd/PrOho6YP/Rwfh39fMvmD6ZX61DaDlOqH
ETOMGBe3/cn684GTLTUE8ZTvoQu0kuKWnVqTSw6FbObQECZ9Bo1LADCAtmZkJ9Ss
GuqKfZPSonAENw3rSzW4ETpvmPtN6vf1xiNQT4u62GFieJKUVmzRPCI3VXps+Pjm
4BYZofuxHuHjjjaPws/W3MJX+Tpl+t0hHSH7fwIrk/CbCtuZ/ZUZb/joxX5JgSla
OqVLhbbKbPLyRCTmFb+K6g8+TjGdC8l7XCrFMohiVz0OM3IhqLi0c3UbPaVYX87t
efTU9MLPw0R8mBgw0PYLRBwdZGQEro9OuLrdmvQSpcDtXSqM+qjNE+z/bApy7yIo
viZ3g7OArXBMpJFTDkdlj3u+4foYtfL3HNccMcuR9FhK707ZTku/8q+umn1q5kJm
pMC6lofr3CUtRVy5g2z9/44+VE0oxq5OpBMtKSyBIl74F2yHClGDgYvogsxXAGzB
t/Q1a3vCdDDxR13AYzJvHiKwc+fX6T3IXR8xLoJP9bOblkCltp5HZFdwaeSi38tK
llG08Fg464ogVKXlFZ1DhTa4eKrctNY1QmCftlbVbOz2RNWxoY7yuM9xtIcPdFdL
G3gZOngXQWIn70SFoJ2Gl4fxiNF9cGDx5uDj9clA9PvtfKNOGNUrS9LIuRz5rv56
mcOdVhzrZdwW7krPxcTx
=F3KD
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
