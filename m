From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL] clk: tegra: Changes for v4.7-rc1
Date: Mon, 9 May 2016 07:19:46 +0200
Message-ID: <20160509051946.GA18753@ulmo.ba.sec>
References: <1461945596-24090-1-git-send-email-thierry.reding@gmail.com>
 <20160503000248.GB3492@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160503000248.GB3492-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 02, 2016 at 05:02:48PM -0700, Stephen Boyd wrote:
> On 04/29, Thierry Reding wrote:
> > Hi Michael, Stephen,
> >=20
> > The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc=
69ca:
> >=20
> >   Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-4.7-clk
> >=20
> > for you to fetch changes up to 2690e912644e610854c4c3b23d0a0daec9d030ca:
> >=20
> >   clk: tegra: dfll: Reformat CVB frequency table (2016-04-28 12:41:54 +=
0200)
> >=20
> > Note that the first patch is this pull request is a dependency for a
> > larger series that will have to go in through the ARM-SoC tree in order
> > to properly handle the dependencies.
> >=20
>=20
> Thanks. Pulled.
>=20
> Are there any thoughts on making that hw control stuff more
> generic? Perhaps using something like power domains to do that
> instead of having drivers cross-call to the clk driver with
> custom tegra APIs?

I'm not aware of any API that would fit in this case. Power domains
would be misleading because power management isn't involved. One other
alternative that I had thought about is to make it a "virtual" reset,
but that is equally misleading because nothing is really being reset
here.

Yet another option might be to make it a "virtual" clock, though it'd
have to be somewhat hacky because we need two steps (one to enable HW
control and another to start the HW sequencer). That could be
implemented using ->prepare() and ->enable(), respectively, but it's
really not a clock either.

I welcome any ideas on how to turn this into something generic, though.

Thierry

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXMB3wAAoJEN0jrNd/PrOhoH0P/RylW5YmAMUy6r06Wwo953kC
zNDYwfGpOwRBfTdvjNR2iAvqcpXSfT8pRB0v/wzQxpZSR5K66g8VVi9LsRP8WyrM
ZoJlMlOE3oJC/xw/j7rBNsnqcAM5h7F8qbL0U06DV4SDNkKpA71x1laBlhdpmrku
mWBDCg720zr1loU0SZlT8nZ7jKW2Ucy/Ruz11FHPbx0EnR9VRWY82FvxSYchBE1f
SSl/qzcdk6DqitaYH41OBf3ML2Mj/kZahh6H9ZFzjpatUBsXrkpFg4W8UcPXCfw6
6mr+LqQIbBCsIN6EkFsjc0HuzhRJtO2RCdRthSaGjF73+2k5cKxnMxD1Odojy/1H
qNvSKnCHbk849MEX3mWhDO0VBXJPbmbq0GdKR+24AmemWwzfEefJKila56UjPLwy
m6GtxpipoCaDguy6Mm4OAbxE/ntKFSk2IRmiLnoyxX/pfeGaPEAl1YZR1ViX81d5
j6ALsHdWVBH/+mPs4V+E99JGCib0ozE31Aa/taZgXgP/5oxHXpShLI8p2tmDjOvC
nNKIcWt8hA90Sa2zk/ccHOBgl4U7Gx6jC8l/lrUeyM6C+iBxaxsM6H/m7PHJIDBE
7jXTGgl6dH7aIphhmnWZmn5fGFy4WUrbqPMANs3QsbGUWc/Ez98VbXeG6TkVI+Hh
sboBBurG6x2hpmlW2xKd
=cxO+
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
