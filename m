From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/3] drm/tegra: Restore licensing consistency
Date: Wed, 12 Feb 2014 20:13:42 +0100
Message-ID: <20140212191340.GB2424@ulmo.nvidia.com>
References: <1392190238-1717-1-git-send-email-treding@nvidia.com>
 <52FBA581.3000707@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52FBA581.3000707-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2014 at 09:46:57AM -0700, Stephen Warren wrote:
> On 02/12/2014 12:30 AM, Thierry Reding wrote:
> > The bulk of the Tegra DRM driver is GPL v2 licensed, but some of the new
> > subdrivers were licensed under an MIT license. This was simply oversight
> > on my part.
> >=20
> > One exception to this is the public header file that will eventually be
> > used within libdrm. Since all the other headers in libdrm use the MIT
> > license, do the same for Tegra.
>=20
> The series,
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> I guess this needs explicit acks from the following people outside
> NVIDIA who touched these files:?
>=20
> Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org> (dsi.c)
> Emil Goode <emilgoode-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (tegra_drm.h)

Does it? Those changes were mostly mechanical in nature, so I'm not sure
if that qualifies them for having any bearing of the license of the
file.

But if you insist I can resend with Wei and Emil on Cc.

Thierry

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+8fkAAoJEN0jrNd/PrOhk9MQALTBZFujbtaXBlbrvzTUnOpv
znd3wEr2yeoXKBWN9r2zxl+iWSe3eAaIy37vbS5KbRkSqPZP5jZkLs4qh3JKY2U7
pqTUX2juQlHR5AdchLTTb7BBcbs/ROmyptg/uJg/sUvb8saOeFr0vlmJ2MUnuyJF
OQyUT+i5BX1JwX3mWYUaQllzzTOiktqR50/UmeTCjQTHtWSwcH+cuxlrpTaMcrop
YhOyo2J1YT2XpVLWiFziOAj57rOBZ2KAQZUVXh/htAG79ZvGPwF96/at3vd6jHsu
hHXVAJhA/89YWjmKLNYx5GY7CTh69G9evsICDzujBLepOZz7ZgLuo6p2HhHy1cp6
VY/ZXm2duJgi/kIf2E5Xycmb6dUbSAQWsHR4xH1viwwQlw/09wIjSQ3ChmF6cIK6
ylMRcod8S0JAjNg1jP5JAffHNCC+EQ+2DAmrUW0lph4szOQ2r4C3vY+h2t5cuEK4
YqlqJXsddljjwb4Zf+Y6SCIeoCY+2iJ0kdVvVsmj8biSwkygm6ZW80WLrUqzUOyo
F1fMHBK4uAB2dXvUwc6hR3BkqyfdE+9X7f1enTt8gicnqT6g7F7q99HQAhNTMXQM
lQPJHT3VH/hIXeufgO0+ofm22ybOIU4eDhWM8HIh8pOn6Ukd225jBLedSrAxT7Pb
e7o35MemfjupxMfrKI3a
=7LVS
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
