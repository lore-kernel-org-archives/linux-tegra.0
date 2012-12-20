From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Thu, 20 Dec 2012 21:30:59 +0100
Message-ID: <20121220203059.GA12977@avionic-0098.adnet.avionic-design.de>
References: <50CA175F.60002@wwwdotorg.org>
 <50CAC2AC.1010704@nvidia.com>
 <50CB5205.1030303@wwwdotorg.org>
 <50CB850F.9090704@nvidia.com>
 <20121216121603.GA31780@avionic-0098.adnet.avionic-design.de>
 <50D2D792.1050401@nvidia.com>
 <50D34775.5010606@wwwdotorg.org>
 <50D34F00.4080308@nvidia.com>
 <50D3511F.2090308@wwwdotorg.org>
 <50D35287.3040509@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50D35287.3040509-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 08:01:43PM +0200, Terje Bergstr=C3=B6m wrote:
> On 20.12.2012 19:55, Stephen Warren wrote:
> > So it's fine for the tegradrm driver to manipulate the tegradrm
> > (virtual) device's drvdata pointer.
> >=20
> > It's not fine for tegradrm to manipulate the drvdata pointer of other
> > devices; the host1x children. The drvdata pointer for other devices is
> > reserved for those devices' driver's use only.
>=20
> They're all tegradrm drivers, so tegradrm can manipulate its drvdata.
> The other simple way is global pointer. Let's aim now for a simple
> solution, and if later we find out it causes problems, let's fix it then.

The problem with your proposed solution is that, even any of Stephen's
valid objections aside, it won't work. Once the tegra-drm module is
unloaded, the driver's data will be left in the current state and the
link to the dummy device will be lost.

I don't think waiting for things to fail is the right option here. If we
can make out this problem now, then now is the time to fix it. No
excuses.

And quite frankly given how all the various host1x components are
interlinked I think having a single function that gets the DRM dummy
device for DRM-related clients isn't that bad.

Thierry

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ03WDAAoJEN0jrNd/PrOh1WgQAK/rL1FnYmQuGqGMjtHjNjWQ
kWygOKJ6T4HZB9KvjANxpmdDUNvPxexJM00UPExzwmDDv5K86wGx+1nwSazyvIag
VBRli2Wiv04F2JzM6jjnLPLfYb59E+eczrMljfaBTx/wXPUbTkrEbAXb50pyZF1K
NMjOF+PT2ToYGIdPN1ZVQFjkq/KDxTC1XuNSjtRZQtkdZmG+SAiFUUPM8I8VA4y+
FOhYLDvznTijtQgMZcUxyut2Jg/TqcMHk0N2Phbbdl+lqZDrCwoS4ZxvmCLWc8MI
NAfBYjREcH+w8GactIjS4G93ZfNTKuZ/wRGcRHE592q/wjsEH+UNaPmHpJ3CQk8L
yZ98JmeIdUAz+2NW05VOL/80GRlPRJK0OkteLgJDzCBmADjqmh9bfMsa8RomHaNH
UOpah/uKSGwEin5UhDF9ptJfs+Jyoe2XRGd8wczK6dxp6t9wYEy0JEwnLfyBIqBs
Yb70sLGqIHPrd/fixYbYtyn1BiKVSenUm6DfZWBjs6n319UzGkBxTPsh9FywPpHg
2pWEOGVAyAtDIZI8VbhBkx6HDEOXDRsHnMsuWuqg7xXZZobP+VZChIyiE8pjA4GZ
rDblnVJMTUDcNCQMwFUvFmGHuVcGYFreQB9LtNElLriVFcY25u/G5B5YmposDB8x
e3NDGLxbIPIEfWs2muCd
=w19B
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
