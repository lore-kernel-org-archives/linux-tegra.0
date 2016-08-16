From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: fix Tegra114 USB compatible values
Date: Tue, 16 Aug 2016 14:38:48 +0200
Message-ID: <20160816123848.GC4564@ulmo.ba.sec>
References: <20160815173132.12270-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160815173132.12270-1-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 11:31:31AM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> DT compatible values should always include an entry for the specific
> chip in addition to any earlier generations that the HW is backwards-
> compatible with.
>=20
> This doesn't affect the kernel at all given current driver code, but
> U-Boot needs to distinguish between Tegra114 and Tegra30 for this HW,
> and I'd like to synchronize the DT content.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra114.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Both patches applied, thanks.

Thierry

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXswlVAAoJEN0jrNd/PrOhoJwP/2Uk/1SDFHj+1IdM1bJwRee4
xwmTNLXr5NZej7+70m7Y7R8b9X4ZhhDYZq8EcFIEwxK8c0x1Yg19bmqbTd0cwefN
NPajE5mVIQorBICfjeRve98qCXcYst7g5pCCM0aF/YHx+THvajX/4aNshKMcDSBn
I41W+9rhv1cSj0YPqx8+ht6ygAwv6V8/Zcs/MqyiO2+nWSlVzTfT70pCwrspby0R
/rsUVYMBAaxXii/pWLpH78O7+QXuRHGMrd8qkZh9XxaVod/6sC3GTLBoeOC+AIM3
7SPGvWaLp3uKmQIfdTq3keyM6zQvddvMT4iGMRJL76+RXmF7Y+/epM3IDK+GqYGD
5oJsroRQkryQy8UilTgjBPporwrwD59fhj8+au6R/jPgSM9w8/DJ3orSUONPsiBD
6ISKth5iDBZwjsrrFzDvLVbJmOJx8h5kX7FtAMhduIyrkSXELZSitNdKcDSrHyXe
KlJbYOpo7cA10ifZ+QwBnvTNLDNi7xEa3S95vxKanJKo3P0uyd6myCBs6Y2QzfJW
PvARrDLFgL985HigG37fecMKQLK+n6ugm1M4tkx9Mgt2oLb4gJpe5bb25uFrlUwS
lrDeP8Vvn2BcCiiznpd65IG86zsqcQJJLa9XzIw5QnUj9GBIS94u/rBP4/8vx4Mv
6fzRgkpobw+0AD8p0x0e
=nVOP
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
