From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/8] clk: Minor cleanups
Date: Wed, 6 May 2015 13:33:55 +0200
Message-ID: <20150506113354.GA9421@ulmo>
References: <1430196383-9190-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1430196383-9190-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Max Filippov <jcmvbkbc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2015 at 01:46:15PM +0900, Krzysztof Kozlowski wrote:
[...]
>   clk: tegra: Fix inconsistent indenting
>   clk: tegra: Fix duplicate const for parent names

I've squashed these into the patches that add the EMC driver.

Thanks,
Thierry

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSfwfAAoJEN0jrNd/PrOhVSwQAJ/rA3S2D6xMynluMc5UstEk
UZ72ZR6v0z5S9VzLenuIhtSsuk7oVJbTmDgMvf8XAbbOWtbGHJQn6ZmR3Me6GG+x
zzIGolMjNHrBRK9MOdni1ryv3/F81BE7QZrGHvnMpeXRbDerQJz3C+PUlcZ1nsu6
6hGfCl6+QCVT82nX3oj3qEdQScMMbiG37VTTluW63wQY3qaSZARouMLou1/MY+ln
4GUa09KVJdiAlASQ6llRQVAPVas1WGX2OCmhNeqhk8ERQVJj1orjxl4rOyTVux14
PvHHdfJrTA1w8WxzrLKjvUCm1aJgc5sNTQqZV9TcA0ktdjMtjkFaWAFS70J9oWrG
/bk+CbeJtEDWhTOIvclVlbwQ0kyZtFexSZgc1uICHB3PABb2LdZ3HDHrZs3KskCD
7FrUSakBBB5c9USKnaBDmBxuRW5ORDHQfPlrAB46Ye6SBB2GvgsW/S9JxVDRioqX
BB83VnMMxSxPyGCqgmvAkAV06wHMy3RwVs+OMi8FqhQwb7f+QTo/ERxwTBbtk/WC
SRJaopAR/sz6igINaL1Nx21Z/kju4xMjCZraLcII4p3CJvT6YtT9Q78xWJGGribj
U6bHROgmnJxNnb9PTq/nYL4j4GeOfr6+sbp/If0v4WkS7BBtQAxXHXLgVbmPR1Un
IO7lmnPDceWy7YJedk4F
=LSUk
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
