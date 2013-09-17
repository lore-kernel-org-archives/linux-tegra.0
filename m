From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/9] irqdomain: Introduce __irq_create_of_mapping()
Date: Tue, 17 Sep 2013 10:21:15 +0200
Message-ID: <20130917082114.GA6757@ulmo>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
 <1379320326-13241-4-git-send-email-treding@nvidia.com>
 <52377568.6010204@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gKMricLos+KVdGMg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52377568.6010204-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2013 at 04:17:28PM -0500, Rob Herring wrote:
> On 09/16/2013 03:32 AM, Thierry Reding wrote:
> > This is a version of irq_create_of_mapping() that propagates the precise
> > error code instead of returning 0 for all errors. It will be used in
> > subsequent patches to allow further propagation of error codes.
> >=20
> > To avoid code duplication, implement irq_create_of_mapping() as a
> > wrapper around the new __irq_create_of_mapping().
>=20
> This function is a manageable number of callers that the callers should
> just be updated and avoid the wrapper.

Okay, I can do that. Can I take this as a sign that you're generally
okay with the idea behind the series?

Thierry

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSOBD6AAoJEN0jrNd/PrOhuOQP/37S/PM7W23HJoJ7QkQeRCJs
b8M0CB2JbOH3epRGHenbu0X6JgYshmZoNpcw5S4G4z7Qh7LH3kbCpL6GTXyRu1Jl
zpz2Bo4WcCjyVyT7JRYOtenzbejiuFvirOwsJb12cxDXrgF/1brj2CQXBKYLFHce
/X/5YHuTmubpTcXAvl5DShcKafQ9s26ldc9jLCEZsbxLpRtNHvE5QORRg/04FWk6
KzId+yDIM+ob0URvBaq/9OygxjfL7XZoFBK4HGDX8qwRd0ONN03Gd0RnIaLtCP45
dh3EGklJnlxOw+cvpENV/I+fwzbP71bk072xmq4M/DBnyVO7HZ6gGBr82Y3SbGZ4
b1iptU4ewmh3MkntLVzuYZvOiXH3seX+BWdiw5TGeASY17NkFJAphfBPrnjY+6vP
bDlD8APgdvQ0r3iU92CAC/xjJtF76BAQEVPz63DL1f46bZN+oCTzGlKjg5VEPjAK
7/cJJSlWR+oq2QH8w6mkzzsHbLsF6nEbPdXjZmi/QDw1qV/M6+dwND8LM/2iB9rr
J8BHX0/B7D6hah7l8wiaqSzpYjbgy5LfMuiKPgN7TYhkTvQ14En8Ml8Vxg8R3h0S
2convQV5s9OBoh+/MwAF4PT6mp/m5lr/BAFn1t+fgiwLspVrNGPlDwjYpGLZgwGh
8VqtwbJJDwKuK2pA9xiz
=5oTC
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
