From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/6] ARM: tegra: Add efuse bindings
Date: Wed, 8 Jan 2014 21:05:05 +0100
Message-ID: <20140108200504.GD1298@ulmo.nvidia.com>
References: <1387891931-9854-1-git-send-email-pdeschrijver@nvidia.com>
 <1387891931-9854-4-git-send-email-pdeschrijver@nvidia.com>
 <52CB14D3.2060904@wwwdotorg.org>
 <20140108133951.GD1592@ulmo.nvidia.com>
 <52CD9DFB.9010007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u65IjBhB3TIa72Vp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52CD9DFB.9010007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--u65IjBhB3TIa72Vp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2014 at 11:50:35AM -0700, Stephen Warren wrote:
> On 01/08/2014 06:39 AM, Thierry Reding wrote:
> > On Mon, Jan 06, 2014 at 01:40:51PM -0700, Stephen Warren wrote:
> >> On 12/24/2013 06:32 AM, Peter De Schrijver wrote:
> > [...]
> >>> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra=
20.dtsi
> >>
> >>> +	efuse@7000F800 {
> >>
> >> "fuse" might be a better node name; "efuse" is presumably the name of
> >> the instance, not the type of object.
> >=20
> > There's another occurrence I noticed recently where we haven't followed
> > that rule. The PMIC node on Venice2 for instance is called as3722.
> > Perhaps that should also be renamed.
>=20
> Yes, we should fix that. Care to send a patch?

Will do.

Thierry

--u65IjBhB3TIa72Vp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSza9wAAoJEN0jrNd/PrOhB84QAK1ZPKj6gFYAJFaabDtwZz9y
yWMnI+N0c3Sz/6Ps/1hGgzJAZLm4x4DUOy6k4UjP8j6azfIKhGSUMfk7NewLOIUr
7OwNvRqFlIB9n3rKEXiAp18zIhpO8OK5KpKDYeDKCw7JdfHdQz+HhkQmd3Q45a+r
ZYVXjCRbeaR641XcjfDiipscn1xyRnOXEviDBeUVh6d5T2JpwOynT5yNU/MPtPZI
CTp+r8WuGmiHjavjh3bG3b1oTw2U/be9v7AV5B55f5uU7sxdsCAmA4feakZhPEdG
TKPT9B8D0WYFymras9sqZTEM+FlFR9FYu27kqGPbvnADH+lRX9d3N/GkHzxc6Vi0
c/NDKBW3GUqa8JHcNp8ZDwsnSoS/Z77vlD7sBmuWDKOfvt0F9S5EXDYhjXw/Y7qL
Zv3Q2BLozL92BeJ2oQBFiPYldxEu6sf9GwBfSp+ZWWCosABT4vwuppYfwrvzT4rx
YQy3MIMO+yJ5e0nMYY/YN9qeu+GC+IhZDvOYpaeUVx1WdxLmkRou6V9BPNd40OCz
NigIAJsoi8eyG8QvjGbRRe33gf8o9VqhG50V4mlGfZSk8fW+TCiZlxlNz/9Qc/Er
CRKnXTDTCB/98UGYsFXDG3/MCkwNYwKVNV3pFE9SLsmNat+BpjxfpP6ckz5tcY6X
AxepF0hrfInZ5Cx5DXSv
=SWyH
-----END PGP SIGNATURE-----

--u65IjBhB3TIa72Vp--
