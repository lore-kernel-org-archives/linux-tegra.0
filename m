From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] i2c: of: Try to find an I2C adapter matching the parent
Date: Wed, 6 Feb 2019 13:07:02 +0100
Message-ID: <20190206120702.GC21676@ulmo>
References: <20190125131142.26837-1-thierry.reding@gmail.com>
 <20190205124443.GF1045@kunai>
 <20190206093851.5sxretbl7ajizi5f@ninjato>
 <20190206094912.nnfsfzivwbss4yye@ninjato>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0742852529=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190206094912.nnfsfzivwbss4yye@ninjato>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Tristan Bastian <tristan-c.bastian@gmx.de>, Vlado Plaga <rechner@vlado-do.de>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============0742852529==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Md/poaVZ8hnGTzuv"
Content-Disposition: inline


--Md/poaVZ8hnGTzuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2019 at 10:49:12AM +0100, Wolfram Sang wrote:
>=20
> > And there is a regression! Good that I didn't push out before
> > double-checking. No one noticed that this breaks registering child
> > devices because of_i2c_register_devices() doesn't have a pointer to work
> > with anymore?
>=20
> Well, sorry, I forgot an important detail. There is no regression
> because most drivers still populate adap->dev.of_data with the node
> pointer of their parent. I experimentally removed this from my driver
> under test motivated by this comment from the commit in the Fixes: tag:
>=20
> "Linking it to the device node of the parent device is wrong, as it
> leads to 2 devices sharing the same device node, which is bad practice,"
>=20
> But removing this bad practice from I2C core is more work. I wonder now
> if we are in some inconsistent in-between state if I apply this patch as
> is?

I think this patch would serve as preparatory work to remove the sharing
of device nodes. There shouldn't be any regressions here because we only
fall back to the parent's ->of_node if the I2C adapter's ->of_node does
not match. Since the I2C adapter's ->of_node match is what we currently
do, the only thing that this patch does is add a fallback for the cases
where the I2C adapter's ->of_node is not set.

As far as I can tell, the only code where this should matter is the
drm_dp_aux helpers where the I2C adapter's ->of_node is no longer being
set because of the commit that introduced the regression for Tegra124
Nyan (and Venice2) boards.

So I think this patch is safe to apply and as you suggested this can be
used as the baseline for cleaning up all the cases where we reuse the
parent's ->of_node for the I2C adapter's ->of_node.

So I guess you could say we're in some in-between state, but I don't
think it's inconsistent. It just allows us to do this step by step,
which I think is good.

Thierry

--Md/poaVZ8hnGTzuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxazeMACgkQ3SOs138+
s6EVQQ/9G7o5iOGs4ymGIuDvzOWKvuWnRsSQUE4MSLHGvyLrh3lyhZE3lGi5YVrR
vv/UfVSl7B3f9MZMW8yAiYdT0dF1MUvx9CHvu0fyvedPcFu8n+gSjPhNOBquHSsZ
nchq2V2pRxuh8IimiPyVzQGE8dPZQaxWPvq7XEZzNjEpxXfbxziyjsrxkBl2WuhH
5O73wbm7QMCKI+/vL3k2r1vcT1Zhv8TNA4kHHna/7uO+k4ccd1ipNF6y5CFNoeNT
keQuu9kYkR6VjPK6icMrnl20JwNBfzUggl/c+2GYPn7ENQ23TuGbKQLcYm1N32xa
a/96neF23oSGaMEOIStGSBeQgZ6TeoHvoLBiOvPl791cOebUswcV9+WpFEj5fR4D
395/MN6zREDaD1n0BjuBHhCUbRnIXEre/UjMjEnjcdyFp8zWSvOf5cxuhNOHId6h
ugDxoh0CowYGDrbyGPLQ8xozzs/I7E6cMKSWhIvVMp403QrB7ht7tGGBK+EFT9QN
H+qv5wAUPXjUN1mywNPmJvaryZE8SI71VfZo5tNxVVe7BSgZvIMRVib6+4VHVieY
SuLwQ0iycekah6SAzWfDh6eMO8W2yWdaL1K3NbsgSHiJLV9KtkFjF3D1J1i0apDY
cbHulSbtI78g6sXnzH9XZp3qCNJBunUMVGaE8AbieJNwHgtvbBY=
=+Gmt
-----END PGP SIGNATURE-----

--Md/poaVZ8hnGTzuv--

--===============0742852529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0742852529==--
