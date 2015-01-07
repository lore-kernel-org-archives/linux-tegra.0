From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [patch] drm/tegra: bad irqsave/restore in
 tegra_dc_finish_page_flip()
Date: Wed, 7 Jan 2015 14:46:45 +0100
Message-ID: <20150107134644.GD6988@ulmo>
References: <20150107110126.GA14864@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OROCMA9jn6tkzFBc"
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150107110126.GA14864@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom@nvidia.com>, David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--OROCMA9jn6tkzFBc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 02:01:26PM +0300, Dan Carpenter wrote:
> We can't save two values to the IRQ flags at the same time so the IRQs
> are not enabled at the end.  This kind of bug is easy to miss in testing
> if the function is normally called with IRQs disabled so we wouldn't
> enable IRQs anyway.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch, applied.

Thanks,
Thierry

--OROCMA9jn6tkzFBc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUrTjEAAoJEN0jrNd/PrOhoFcP/02GScwL5lLhP5gUhEwKIuUx
D82uVtOX62sq8BsXyd0nFqc2gT1XNE8LKe3h8WBvXY2Bw517PU4xMv9dGGl+EmvS
ufLmT9g4vZSf7iNxcC/eOZJq7DBZSshjfMIyvzpjDmUETCbN7v+BdV+sqiq3dCaX
G0KVHc79wKvvAeIn9TiZnYBt9A7Qt31Y0YmwihVPL46hQxsuKnYvmxFJf9NeNUS7
4KvndK4P4NqOcWuCMbhpqM+fyE90mgtsTLrO4FuBPXAr2xR6e2yVW3HDnqHTf4N+
1B/SmFeQVi0wsbAVYvJe10mLyIqAtRtqvxKGVPfxP+h66MX9senGVLmR1F9RfBhx
HSNqhZrLy9Z738qMPrH9TAycGPGx+9yucNTWAqPj3/tIn42xog8Cqh+xsvtOxeAo
8vcCS/tpK/8CHsk9DVMskfM+Dgi5uOlgJtpagjSIHrEJWb68GkTuNVBtAcoUy8H3
NzrCAHGaaKTZ9OLYFvMyivD4mNbSbYnSwn8Ss/52lQN2ASA21AMxJozft8XTqhtP
Bc8uAik2al+8drSracHTgsWw3eqQd1mw/sC82EeQSJT1PZyTuqSxC0g6enOxCz86
Y3RglXrzd8uFRQ5q9MeHcWjTULL8INPLYW9iqsDTFUhrBaUbS0DNGI8l4Zdc0VOt
WIE1+qy7VlFUut9hWfjQ
=5ijO
-----END PGP SIGNATURE-----

--OROCMA9jn6tkzFBc--
