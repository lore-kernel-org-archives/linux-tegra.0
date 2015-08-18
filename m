From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Revert part of "ASoC: tegra: Convert to managed
 resources"
Date: Tue, 18 Aug 2015 09:55:17 -0700
Message-ID: <20150818165517.GL10748@sirena.org.uk>
References: <20150818115645.GA3345@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HFmY1QOi3uof3bwe"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150818115645.GA3345@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vaishali Thakkar <vthakkar1994-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--HFmY1QOi3uof3bwe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2015 at 05:26:45PM +0530, Vaishali Thakkar wrote:

> Revert the problematic part of commit 470805eb9f31 ("ASoC: tegra:
> Convert to managed resources"). Before this commit, PM cleanup was

Please use subject lines matching the style for the subsystem on
patches.

--HFmY1QOi3uof3bwe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV02NxAAoJECTWi3JdVIfQRvkH/jSJZDphUwBnFf/wkWpcMTIa
GGur19MuCklj+1inueffr85tiiymZcrX4a0ZUNRzL899/XdnSAoyT5cjbVg02KPm
bqtYiY/IN/F10Sucuqsm218kgePPhxBGtzTLOfYA1+/ZH7sMpenAKhCNyH9xG00G
9xFH+wZmoNjClXC6lvCcIkdnPNpkPHfnxUnL6UCn7RICO5OBq5bb8Am3p0wjQJUr
CS0lWKu/GmG3s2oqPZkEK/GCsxEVJddSA4+EYw3SRvFAJbMrJ3v6hG0GdLI/uvCg
PG/OndZvurLm8g+QNUrtTuIZRdZiVhVvOOOR5lQvegBypr4Upah+opk/V+G/ZOc=
=Nrq+
-----END PGP SIGNATURE-----

--HFmY1QOi3uof3bwe--
