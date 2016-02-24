From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: don't open code of_device_get_match_data()
Date: Wed, 24 Feb 2016 11:26:31 +0100
Message-ID: <20160224102631.GE1391@katana>
References: <1456063089-3403-1-git-send-email-wsa@the-dreams.de>
 <56CAD248.8060301@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wTWi5aaYRw9ix9vO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56CAD248.8060301-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--wTWi5aaYRw9ix9vO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >This change will also make Coverity happy by avoiding a theoretical NULL
> >pointer dereference; yet another reason is to use the above helper funct=
ion
> >to tighten the code and make it more readable.
> >
> >Signed-off-by: Wolfram Sang <wolfram-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> >---
> >
> >Compile tested only; HW test would be much appreciated!
>=20
> Tested on Jetson-TX1.

Thanks!

> There is some more cleanups needed on this driver i.e. do not support
> non-DT, move the of_table to down etc. I like to post follow up post after
> this is applied.

Please do. This is applied now, I'll push out later today.


--wTWi5aaYRw9ix9vO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWzYVXAAoJEBQN5MwUoCm2lgwQAKvRJtLZB/LsFL+QXXJ9DsWi
FrdMB0tqp6/STMwRmdVz83xRpE4Gem/h3GEy6tYl1rxuROsovtVUuuqKg0nUgeXg
A8hNvcAm+qdlEmUhCzJqyOr93RYWU2qIEcJIJyYdcGVHR9nES131eeMrD5hXSO2f
upkiZGSpHtmBJcPPNgwd8uoYsbmsQ6fVbAQUTjJCoM1uHPgRyqRUutSWDz6tg2up
IN+3tvIVPuMlWHlue/v31BcopHh1JqI2IO9Ami0srRdXkbPQXMp0LvwfAHzLzhoY
81C/rPRVmZw1/6jOj751PkCws3DOGQmpibgJfYKW0CC9VVcgvickcXz72vXdLk/c
XCP1PbdScgtIrXPAfKKJZth0BD3RqpWi9k6XCogpwiIeCcqgjJsCgm+Th2VTp5ry
eCVn5cI4asxP+eGjgTqqvIbF/M3rD5aBdL21RpkgYxv4ovYL5PDgDbTKqXfA1pP+
uLgC68zVJeP9yFTcN1nkvZNEA4ltEF9W5UAaILHCT57YEEf0XDZ9dV1tfb/gsZF1
YLJDocapZlDxUPJ3yZMep6OQy1JKDr/SIK9oPwdKN0KGDmDfMBL24toNyuAE/5fF
olA1vhHBA/A4JYRDX8jLwkvMtcXyWhnGdNOLudOFAy0nTF0ZHVK4S5YVvNkm7mu1
7f3YF/o1Um+fhPBagkoc
=he6i
-----END PGP SIGNATURE-----

--wTWi5aaYRw9ix9vO--
