From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] drm/tegra: fix return value check
Date: Mon, 28 Oct 2013 23:38:33 +0100
Message-ID: <20131028223832.GA4906@mithrandir>
References: <CAPgLHd_JqYS5DC4tmzgGVEYmJpeM96FAEDvmM3cUUep+1jj7mA@mail.gmail.com>
 <20131028085358.GC10718@ulmo.nvidia.com>
 <526EDC64.5050202@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <526EDC64.5050202-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2013 at 03:51:32PM -0600, Stephen Warren wrote:
> On 10/28/2013 02:53 AM, Thierry Reding wrote:
> > On Mon, Oct 21, 2013 at 11:34:07AM +0800, Wei Yongjun wrote:
> >> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> >>=20
> >> In case of error, the function clk_get_parent() and
> >> devm_ioremap_resource() returns ERR_PTR() and never returns NULL.
> >> The NULL test in the return value check should be replaced with
> >> IS_ERR().
> >>=20
> >> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org> ---=20
> >> drivers/gpu/drm/tegra/dsi.c | 6 +++--- 1 file changed, 3
> >> insertions(+), 3 deletions(-)
> >=20
> > I've applied this, but with the first hunk removed, since looking
> > at the implementation of clk_get_parent() it can actually return
> > NULL. In fact it seems like it will never return ERR_PTR().
> >=20
> > I've also updated the commit message to reflect that.
>=20
> Hmm. The documentation for clk_get() says:

The patch didn't check the return value clk_get() but clk_get_parent().
Here's the implementation:

	struct clk *__clk_get_parent(struct clk *clk)
	{
		return !clk ? NULL : clk->parent;
	}

Note that clk_get_parent() in simply a locked version of the above. That
will obviously only return ERR_PTR() if clk->parent happens to be set to
one such value, which I don't think will ever happen.

Thierry

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSbudoAAoJEN0jrNd/PrOhRkMQAJpuaIezlHazDJIcePmmpmGB
MMkmZdxnUykiz+gVqYYYjSPyy293I5iGYnoAz2hncJoPyaOll9o4yxi0fAgK0bzQ
mYyja/phKQ7Z+EjjjVUafCqyeXzuGsv+5YjrLRdeVFjuzC/XLT891Igu3oYnox+F
PeUMkEkzGE8kb8PLK8tuJQIp5kkeeWzsLjkHqIcybeB+TJH9NtQizHMM7Iw9crU8
BrCzi2HF9IBS2q5aqODVJjKiwzWXtYUKJfITos9rkN00p4eeQxs4lEmbpLGB3ooK
pHW+QBRu8T//IOuorqfVMPKqBo6yraZgVzLf6AswBcrewCQPRjwjFv4YfXKXDDiD
wjCHcctm5ycl6ZKGh34LgCHkjjtZdpQQKqSP3zmctIRNg4rNquik/5PloFuqc3Nb
MF1oavwcEk47SelToA4Hs8xCWNxitBbVH/C6NsVOoLz3j8vEl5MJaIzZx+7ppeks
k/xvc1frlNN7kL9Px/brE2vPJvV+2JKkdYqNV/Vpdq9fA6qbveBTTXQeDQFpw9oW
lRueFUXo8BOzf3kjaVnYU1GsV+IJ4NV/xhTz14tjPdh4Fsl9s49aw82nmnlKZfXV
NrT4hQP4mlULI6xbZ8oxvbtv6wuXDmw9/I2VT7rMEokW3ShoqUfCQjkLG8fvzuUN
ZCK3uy/tERojaJZtaS4/
=jAma
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
