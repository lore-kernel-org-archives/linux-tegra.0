From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ASoC: tegra: Use flat regcache.
Date: Wed, 19 Mar 2014 23:10:20 +0000
Message-ID: <20140319231020.GA11706@sirena.org.uk>
References: <1395119329-30721-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LWrJum1q/OvHB6h/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395119329-30721-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--LWrJum1q/OvHB6h/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 17, 2014 at 10:08:49PM -0700, Dylan Reid wrote:
> When using an rbtree cache, there can be allocations the first time a
> register is accessed.  This can cause an attempt to schedule while

Applied, thanks.

--LWrJum1q/OvHB6h/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTKiPZAAoJELSic+t+oim99kcP/j0n4Dcush9QAAjsmyWt/GC3
Mr7b/mGUAgUYTLfUkNCKZ7gkMJpWY5d25LJpKzueJfmfUfigQww19uwCfGhObfRs
Tn5s+SU8qWMilTr/avJ9rpBzt5AT5tbQOvDwndDTr/bEVfkeoV0fr9tpPNJO9sMV
fq9Dt+/9l0uLWS+kVmPMWWo+yNlR71XEvPxFMQaru+cx6kB0AfI9Rk/s5wqLz4/K
3L9RaUGFkh6kjKlCSbSuq9s3QQHC9NmmbshLjXFMxbR+ps7/nmahBWokjawd66qj
6jctl01t98p+pg7RUBJeUBmpgdJbSK7461npwLNORmdAyWJV6pr4DGH9VXT8RKU9
lgJNoWFKJOb1kQJoHT9aRT+1vZMq7itAMYky4kKcPTYOrtV975YP2vmawWUQgkwE
PL9U2imWYfw1fttUJPGKIgO0nvyy7Jn1F5JIiHwyZZ+5Uca85PS1+iSNuEEb0d9I
J3lNh7yoDnSdbnfXwGuh85/vXSxUoH6WnwyfTWeE2MVTmwA6SQtjkTqS54IJRCJv
k+4++STRaDxmuukvlXQFp2Q1fkeDA+r7Z050xU3dJL3cA4TYQCaCK9M9067WcKPs
qmaDbaF1qNbCFNXIMUiPmQobERvu1dljzqzuggtY/VnM/4RthWNMMHhAtuVELFts
qzk0cXBpkQiqI69XjYG/
=wuX1
-----END PGP SIGNATURE-----

--LWrJum1q/OvHB6h/--
