From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Tue, 27 Nov 2012 11:37:39 +0100
Message-ID: <20121127103739.GA3329@avionic-0098.adnet.avionic-design.de>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
 <1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>
 <CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com>
 <50B46336.8030605@nvidia.com>
 <CAPM=9txCuPJcFAfD7Hu5o2BVFK=pVah7B8HhG0ctLCyFPwNEnA@mail.gmail.com>
 <50B476E1.4070403@nvidia.com>
 <CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA@mail.gmail.com>
 <50B47DA8.60609@nvidia.com>
 <1354011776.1479.31.camel@tellur>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oyUTqETQ0mS9luUI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1354011776.1479.31.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2012 at 11:22:56AM +0100, Lucas Stach wrote:
> Am Dienstag, den 27.11.2012, 10:45 +0200 schrieb Terje Bergstr=C3=B6m:
> > On 27.11.2012 10:32, Dave Airlie wrote:
> > > On Tue, Nov 27, 2012 at 8:16 AM, Terje Bergstr=C3=B6m <tbergstrom@nvi=
dia.com> wrote:
> > >> Thanks for the pointer, I looked at exynos code. It indeed checks the
> > >> registers written to, but it doesn't prevent overrun by checking siz=
es
> > >> of buffers and compare against requests.
> > > They probably need to add that, its not as important as the base
> > > addresses, unless it takes negative strides, generally base addresses
> > > means you can target current->uid quite easily!
> >=20
> > Ok. We'll implement the firewall, unless we come up with even a better
> > choice.
> >=20
> > >> If this is the way to go, I'll put the firewall behind a Kconfig fla=
g so
> > >> that system integrator can decide if his system needs it.
> > > We don't generally make security like this optional :-)
> > >=20
> > > If you do that you should restrict the drm device to root users only,
> > > and never let a user with a browser anywhere near it.
> >=20
> Personally I would never trust any binary, but that's just my personal
> opinion.
>=20
> But I'm in favour of having the command stream checking optional, simply
> backed by the fact that we are likely to use the same 2D driver
> infrastructure for Tegra 2 and 3. On Tegra 3 we can most likely go
> without in-depth command stream checking as the graphics core there sits
> behind the IOMMU, which can provide an appropriate level of security.

But in that case it should be made mandatory at first until proper IOMMU
support is enabled on Tegra30. Then it can be checked at driver probe
time whether or not to enable the extra checks. That way we don't need a
special Kconfig option and we still get all the security that we need,
right?

Thierry

--oyUTqETQ0mS9luUI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQtJfyAAoJEN0jrNd/PrOh2FoQAK4C00WzKClXUijHGIM90g7d
yCYzjsE465J5G2aFGKF1t7tzkydHHbmSVeBHmO576p5CdTaaSi3yTSD+zIUE1paM
45pSRrbLSZM79k++elWDP0Nccre5gC11XfGRMwBpQDDfM6gFNRyffLgpd6B4WzTT
27bjJjEHZAME8W5IohZDk5+4nZuHfDinI7w3FQFcRHdk1ac6xfODFeWVcmzMb/1e
jdnFR4x4RkmcFbb4eD1Nm5PSeC2dgK02NGsqISoRsNBeVDfsnYnl0HPLHQGR+tQe
KmwsK6fy3XNkKJFduCtrcxtw3p39O3kw1Sd2jaQmeNfxW07Fa/EGoiVYROOh7wwl
j3Z7usEDBvdNPp8iLBV7qIOQ/j3SB1BXaGcp+9Cjlqe4S+IGEomP8Nt7jOyKTIqE
W+RB1xUGTyA879uIerBf6+uU/pSSVd3+RZKNUwAqdOdzaEBQRAkg+RsTB2LlWxft
TOk41cKuWCa0JmtJdiVVr5UlnV4UvzjxNdGkKu5Efz57CDKpAueqDtMlFVe6S8wp
+uxLF1qpB0sVCGWV7INB7skPr2A5yoiUYVy371uGlgSvT2LYucBqm8V6xsdFZGVZ
ycbptP/H2dX6c9doK7Qk6N3FeTQB8ii5sKdnpB/c5+tiEHGSDYf80A+VYC07AyAc
sb5Jdh0iJCjfjABEwjpb
=rjAF
-----END PGP SIGNATURE-----

--oyUTqETQ0mS9luUI--
