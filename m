From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra20 host1x support
Date: Wed, 14 Nov 2012 21:21:54 +0100
Message-ID: <20121114202154.GA10742@avionic-0098.mockup.avionic-design.de>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de>
 <1352467202-27903-2-git-send-email-thierry.reding@avionic-design.de>
 <50A357D3.9080002@nvidia.com>
 <20121114084931.GA31837@avionic-0098.mockup.avionic-design.de>
 <50A3712E.7000104@nvidia.com>
 <20121114105406.GA31455@avionic-0098.mockup.avionic-design.de>
 <50A3C485.7080704@wwwdotorg.org>
 <20121114200415.GA10335@avionic-0098.mockup.avionic-design.de>
 <50A3FBFA.3080008@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50A3FBFA.3080008-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 01:15:54PM -0700, Stephen Warren wrote:
> On 11/14/2012 01:04 PM, Thierry Reding wrote:
> ...
> > According to tegra20_clocks_data.c, the maximum clock frequency
> > for host1x is 166 MHz, so 216 is probably not a good idea. 150 MHz
> > sounds sensible, though.
>=20
> As a general rule, I wouldn't rely on the upstream clock driver to
> specify accurate maximum clock rates at the moment. Our downstream
> kernel is more likely to be accurate. Still, upstream might be correct
> here already...

I just checked and the downstream kernel has the same maximum clock rate
for host1x.

Thierry

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQo/1iAAoJEN0jrNd/PrOhXoAQALgpuiHcv+T300NZYeS2vcR2
IFC0mKyPx0y4mZ2ox0OnlMuX8+fwmtlI74MkSfk8NsA5yqeKpzDOD9kX3LmBNky8
K5PocUVAvX7K3Ke/U6fqBxU6TEEPv647KNI/NMknxtEu5rV83Al/c/nys5IREmv+
9H4wODSaiOx74+WGix/H6z2bGnzc/Dezrrsbqe7B4fPRv+/Ld/P9pJBBH+LUzVYP
RRRwMO0uxgXzuDeGIfW4T/+bDuzELkzYk2TAItr4aL8561JMt2BzGGhIK8hvOnDv
E7p14Yhlc/AVy8tKS1LwU9cicgC/D06cyOyysgZFuNj7Pw8SCFsxgpRAwFsg4AI+
hRiL9mU7ocLeiR/Cbn+Vj+LiO6itoRqpotWF5D3dNd2LMMevEozAkcqttflpBwhQ
R6s4bUVGNndOVheI7M26AchCIks7KAkAhQwtRdbYO5oa+Onsa/Q+4bI+6bNMscoj
Ym34p0ENJ2t+dxn0pJaVsbJO09e+aUtTUqmzXEXvCZ5liRuirYwTJnjQDFiqt+Bb
RhcREjJ3TRsE+gywQ1dEsbB3NynBx+iosaCE6mtAGd9EGb0omCWSTAaN2dPPDocw
6xpke8caW9zp8Cd+fxuSW/VoS6CXzxLsBLzqCUTq/NyeUiI9KtEjtlHePbvQowfU
aaFPBh0h0baw63xxjHUy
=gqkf
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--
