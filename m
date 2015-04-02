From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 1/2] ARM: tegra: Core code changes for v4.1-rc1
Date: Thu, 2 Apr 2015 19:19:22 +0200
Message-ID: <20150402171920.GA2677@ulmo.nvidia.com>
References: <1427710333-13472-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427710333-13472-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2015 at 12:12:12PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit c517d838eb7d07bbe9507871fab3931deccff5=
39:
>=20
>   Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)
>=20
> are available in the git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-4.1-soc
>=20
> for you to fetch changes up to 5a240eff95e89af9648551a7686b0e5a7d0231ab:
>=20
>   memory: tegra: Add SWGROUP names (2015-03-30 11:47:40 +0200)

Please don't merge this just yet. Mark Brown reported that this causes
build failures in linux-next and I'm working on a couple of patches to
fix this.

Thierry

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVHXoWAAoJEN0jrNd/PrOhwMcQAIIHLrMO9Di7qnEOvJWf+ALN
bWN8zUiZuLQPBUItDnhxMBwK+DSWZsEoUGOq7R/+wPCbgv35gjag8zIXb17abgjd
QF4kGgPF2hA2nYqXxXjLdrrenuuQUHoSTKNjMZpPIKMuIFXSjrm2e7iJXPor9U+B
Y/8vZAB5UdT4hy/biABZGa0yYfrkBP6cANMEMt1VB3OG5DGylkCO8DDWGm71sYm2
J2J/B1/J9pFude/Kfz2wcz59xSjwUFqRNgrSNkxcU+W9Rks0kjgveijQdle0DP5s
lCdzrLgNYLeuAkfCfDxN0jMtBkmsr7Z4IlqJVvt74lk2floDBqAY18YvF+gQpEjd
LZ1MlfmOROw+/+xWoJXJYuW5kkENPiSKpjcZxvNepWGcTi7rQpkbPMJ+F5GLYQ2G
rUZ8a72s2zaGl/ipz5+LLcwab9fxztJKaKSTxBDkiw7ALNVLGiUmLYNuOqVz+632
g3aEHTKD/MvkP6E1SUHo29Z49rKpfBj5JottbRJDEv0VdIRgY7GueJbnKFUuo2V/
yPosAnPY3Vb8MOggHWEgQvIL+laAg6jDcfroiqQa+lIBa8qw5nvrYuOFvc8YfPQZ
I4SF6Sa+1BPAQWh4MEF2HH2N2Ly2o/kFkK67N/dSU/ql1vaDmGfieTwGsEFwlEAL
hR5KR1d52/G9Ta5I6T1X
=yoLf
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
