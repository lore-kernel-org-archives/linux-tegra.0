From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch v2] drm/tegra: fix small leak on error in tegra_fb_alloc()
Date: Tue, 3 Dec 2013 11:10:42 +0100
Message-ID: <20131203101041.GF21178@ulmo.nvidia.com>
References: <20131112102526.GA10651@elgon.mountain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131112102526.GA10651-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Terje =?utf-8?Q?Bergstr=C3=B6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--pyE8wggRBhVBcj8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2013 at 01:25:26PM +0300, Dan Carpenter wrote:
> If we don't have enough memory for ->planes then we leak "fb".
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> ---
> v2: tiny style changes

Applied, thanks.

Thierry

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSna4hAAoJEN0jrNd/PrOhYD4P/1FLJV7rh5Tnx0Gdw5Vv0Ni8
/RHBmvmT1hYEMNAkoWudCLzA9rulWaKNqNXHbJ1zuD0TfVB9PdHOT8MfB1P04OTJ
qb7vX6+ekvHh9Nnf3WB50yICVE0zmjbCnjLbd2PXpvl/cz4A6YamGsPxyqfiXLqO
FV3nwMoTOXdgYo5yLSIH7CelS6zfHSZ93rQ1n3XfWQmFUNeT+C7QgGqoGptk6HIU
i5GxkLALXAKJJrgrcDiMd16mamnfm8uvEf0mn3d8/grSVmyVsBT5hzhga6KBTNjy
ZruVlS5CtgiC1hGiHkYJE8+UVc7kOZwPk7iAOHc/h0CkjlGVb9v98DHXO6mFiU2w
d2NpA6fSyQMBGQYfc/V4amSQFBRdWs+5wz6V0NyUTrDLKeMZw3ZQrvZTULmcl9PE
w+QfKJeL3DgQW4M8kzgFFUI1ir4UbZ2izmNVnIuR876TfjIG+9pVakvOqsXkzm3F
NvhIxQvq1WA+QXLqAnP507EuCNU7HU9w2etxWBJC/bkDuaTQquUwMdHgsS7sEL3Y
EiMcxj+yX/cwAWm8dN3c5kkMNxUxPXyU5yjz6w/VAdfZJmGVPbg6+W3x8fEHt47U
8i4OnZ3VD7V+EPOHkFwzdeoEtIpLvXc2PIBZgu4bKcFK5epn7ft8lf4JgRUpIk87
NwAecmHAmxUlKbC4uQBk
=djln
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--
