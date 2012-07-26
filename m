From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Remove unneeded include
Date: Thu, 26 Jul 2012 19:43:20 +0200
Message-ID: <20120726174320.GA27390@avionic-0098.mockup.avionic-design.de>
References: <1343323707-27221-1-git-send-email-thierry.reding@avionic-design.de>
 <5011802D.7060105@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5011802D.7060105-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2012 at 11:36:45AM -0600, Stephen Warren wrote:
> On 07/26/2012 11:28 AM, Thierry Reding wrote:
> > The linux/notifier.h include is no longer required. This removal was
> > most likely forgotten in the move to the new pinctrl driver in commit
> > f30d12b ("ARM: tegra: Switch to new pinctrl driver").
>=20
> Does the include actually cause any problems? One of the first commits
> I'll send for 3.7 is to remove all the board files leaving only device
> tree support, so this file is going away soon anyway...

No, it doesn't cause any problems. If the file is going away for 3.7
anyway you can ignore this patch.

Thierry

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQEYG4AAoJEN0jrNd/PrOhk3kP/3JAvN7voRS3Q84oX2imdV/z
ARyx+QQ3//JRQmnd1FtjkEBUabY9MedQTNwCx2io7qzPWxeoqD44P/858NsK8Puc
McPsXrqMQ5DuXJ5Q6igdPKt2/fTnGINUZjcZHY8LWBK0YBcE1E8sF8Z0uElidPrR
1SDx5q1OKge0uU+KDUyT/TymJoqYm+tpJ58zHxrnm27X25+PTWO1HcNaGaGoeF9/
TW2K6jkxMsPgcplaue5up5EwKvuCaMOSiwt24D1ULaKYcz5v+uowvnOT9sqeIlhd
M+W8F9fLeun9RZwHrTKepQz8cOj1vwgD14kX1neXCiTb18GA7rVF3D00SaZmkXAO
RWEGXDfIdx3bBdZMWpzT9lGILsED/HTqNIn26IhhaMSQd6JWN7hVifDJj6rmOfWp
ppY1JQ4mpeEEYD2ItU/HktTW6cewcZazfkqNrNzobd5Rwvr0wOiJdWdhPqKdi5rl
uciwrfnptGprCtVNzOxqTivcnB1wsEH3vY8zZYyV7PhBCbApq3IVTtr8f/hDTZ21
V7YbsNI5YjgnH6apNpzmj/l2EmCokrLl8SiOgVk8i5KuSk8dpePdIwFjMMZ1/88+
EfEXI0OBIkkFF2wwvQeYJSuV+jRhOy8q5MmZXzf/dOivjKtDZht7/bXNcssXm/sw
iG3AJ7+XnSgKkrvaIjGi
=C47I
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
