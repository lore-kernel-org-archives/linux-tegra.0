From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Thu, 13 Dec 2012 21:32:24 +0100
Message-ID: <20121213203224.GB18597@avionic-0098.adnet.avionic-design.de>
References: <20121205083335.GA20984@avionic-0098.adnet.avionic-design.de>
 <50BF1DAA.8030805@nvidia.com>
 <20121205111332.GA25676@avionic-0098.adnet.avionic-design.de>
 <50BF345A.8050201@nvidia.com>
 <20121205120429.GA29943@avionic-0098.adnet.avionic-design.de>
 <50C5CAB5.3040000@nvidia.com>
 <20121212160829.GA30278@avionic-0098.adnet.avionic-design.de>
 <50C99677.6090306@nvidia.com>
 <20121213085750.GA14740@avionic-0098.adnet.avionic-design.de>
 <50CA175F.60002@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50CA175F.60002-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2012 at 10:58:55AM -0700, Stephen Warren wrote:
> On 12/13/2012 01:57 AM, Thierry Reding wrote:
> > On Thu, Dec 13, 2012 at 10:48:55AM +0200, Terje Bergstr=C3=B6m wrote:
> >> On 12.12.2012 18:08, Thierry Reding wrote:
> >>> I've briefly discussed this with Stephen on IRC because I
> >>> thought I had remembered him objecting to the idea of adding a
> >>> dummy device just for this purpose. It turns out, however, that
> >>> what he didn't like was to add a dummy node to the DT just to
> >>> make this happen, but he has no (strong) objections to a dummy
> >>> platform device.
> >>>=20
> >>> While I'm not very happy about that solution, I've been going
> >>> over it for a week now and haven't come up with any better
> >>> alternative that doesn't have its own disadvantages. So perhaps
> >>> we should go ahead and implement that. For the host1x driver
> >>> this really just means creating a platform device and adding it
> >>> to the system, with some of the fields tweaked to make things
> >>> work.
> >>=20
> >> Even the virtual device is not too beautiful. The problem is that
> >> the virtual device is not physical parent for DC, HDMI, etc, so=20
> >> dev_get_drvdata(pdev->dev.parent) returns the data from host1x
> >> device, not the virtual device.
> >>=20
> >> We'll post with something that goes around this, but it's not
> >> going to be too pretty. Let's try to find the solution once we
> >> get the code out.
> >=20
> > After some more discussion with Stephen on IRC we came to the
> > conclusion that the easiest might be to have tegra-drm call into
> > host1x with something like:
> >=20
> > void host1x_set_drm_device(struct host1x *host1x, struct device
> > *dev);
>=20
> If host1x is registering the dummy device that causes tegradrm to be
> instantiated, then presumably there's no need for the API above, since
> host1x will already have the struct device * for tegradrm, since it
> created it?

Right, that won't be necessary of course. As long as the driver-private
data of the device stays NULL until tegra-drm is ready (has finished
probing) just getting the struct device from the clients and looking at
that should be enough.

Thierry

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQyjtYAAoJEN0jrNd/PrOhAqgP/Av3g8wQr/SDQBNG37H1vc7a
0s2MEShPOfU1bnUQztPFoKFoPhXXGRXBYXoCLzy1/cTmpv7hxYW4heYrN+FuYxHZ
krxgAKmJ7NaYdx7p6fTsPm6g9Rpn64ZdCjQ0qRNXvyTTnVcRlgDxt+5EBRLxzFta
maZfHSJAvCoApV0U1+8saFzWQl4+apvwoaed+SFUoLBaDcU1H9DaGI60xy5njxDg
lTEFuVi0fT85Xafrmp8OD5fzi6FIIRasVL0df1h9xTGX/h3fjJQCZqRCNmf7tCZl
BiVipgqVPe0cqQ49SmgklrZKkBpSwHJZyt+NIHPU1/AecUY+4BV/G3Pzn3UNrHno
yOIsUCiVJk6YBFaa2og5xJlFFGel9YaD9TVeryOKZLLyIVkf1SCq8gKui/wX9wD+
yVQH2Z4vfXm3WekrAryMJ4P+MuAf1E0U4EQ4mC3YSbaH92RuPrNQTv3JQlPKf2um
70xU3R/cSe1SDB4UMxhVr5/ZPiHwy1l0Pm5TjVY8Y/kgi9Tu6wWw+7/oEpQ2GU+W
dSZc6cByfsUjf/ShJhUZYlZMDi9jWV6OKOKddqOrlbVibshWm85ltIiOfzx1SVs/
oNkVSaNjZQYHA0dYkzbWwNqwYPAqtdgzzSyyAR72WUGYiBUAsPR/U9q9UzCP13cj
S8N/c2/VMAp7VvhCyEYw
=yK9q
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
