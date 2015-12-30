From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL 2/5] memory: tegra: Changes for v4.5-rc1
Date: Wed, 30 Dec 2015 16:36:22 +0100
Message-ID: <20151230153622.GA7085@ulmo>
References: <1450356639-7758-1-git-send-email-thierry.reding@gmail.com>
 <1450356639-7758-2-git-send-email-thierry.reding@gmail.com>
 <20151222195318.GG30172@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151222195318.GG30172@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 22, 2015 at 11:53:18AM -0800, Olof Johansson wrote:
> On Thu, Dec 17, 2015 at 01:50:36PM +0100, Thierry Reding wrote:
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d713=
0bec:
> >=20
> >   Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-4.5-memory
> >=20
> > for you to fetch changes up to e2127ae7a5e80eb53ad431c39145767391da40cd:
> >=20
> >   memory/tegra: Add number of TLB lines for Tegra124 (2015-12-14 16:11:=
35 +0100)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > memory: tegra: Changes for v4.5-rc1
> >=20
> > This is a single fix to improve performance of the SMMU on Tegra124.
>=20
> Merged, thanks.
>=20
>=20
> Btw, it's a little confusing when there's [GIT PULL x/5] and we only
> see 2-5. I wasn't sure if 1/5 had gotten lost, so I had to go search for
> it. Seems like it was destined for the clk tree. It'd be nice if those
> were sent outside of the series to avoid confusion in the future.

Alright, I'll make a mental note to not do this in the future.

Thierry

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWg/nwAAoJEN0jrNd/PrOh0UgP/2QfAMoN+h/PPXu4imMPlVkU
xCvTqFid6Mt6iptdObDuvvX+0TtF6BHKqBw6R/NHKPeiakgPi63MMT4W9+X7hXar
rD8sLHcCA7dkl1KhrNRC1Aot/e11D5tauvnDluQAq85KiC0YRN7qpFV1YpU67XBK
JGTqQmVA8NqW98p+8dIlpo9xlQ+p1Bss6Qma9pcEfyfR54Mq7Ox/Q00damg6WtT4
dtJ0S/a8pP5HVZkeBzdT8rQ40goJqZD6eDlcx5FyW7TKqLJ+bfSBWZRgaB3X/Sml
IFw20OV2E5hyirJKmY+awoUYcqKCb+zSWiTveUk1dpcuxGqHFi3+a57sa5NwU6mb
HSQ4lrVD0OUCxZKIZo+6w/Y5z16lz7fBzfAKBXHr1Wnu6Oi4IQWoYCS57InFts1D
k3qh/5A3BwEwfMyBP/6gNJf/7wTJ0naeBuefRh7ogfq23dyutaxo895oubHCxxk3
b/Win9bjrP4T3DyeDiCkkrMOk/wCUPce+Vc0rjjPSeuJFLtVt4aBTpg7f1srdR5D
aQrJlW2LR3/Mk9q7vMPFWfwGQC6OBgtpCpSmP+U15+To2NmlBeGLu2Jtk3nIRtnw
WQ1s6fCBSuVM8FV5RoVrhBmj/PUDsxtAjRrNhvN2PeLYM8jrrjvvph3rdOfYqMrR
DNHWxFJduN8GUXkHp75g
=+jYm
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
