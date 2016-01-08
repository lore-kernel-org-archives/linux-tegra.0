From: Mark Brown <broonie@kernel.org>
Subject: Re: next boot: 564 boots: 59 failed, 448 passed with 57 offline
 (next-20160107)
Date: Fri, 8 Jan 2016 02:47:55 +0000
Message-ID: <20160108024755.GK6588@sirena.org.uk>
References: <568e8740.01941c0a.31072.ffffb67b@mx.google.com>
 <20160107155958.GG6588@sirena.org.uk>
 <20160107162810.GA25177@ulmo>
 <20160107185739.GA29951@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g5OIygP5QP1fC/+Y"
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160107185739.GA29951@kroah.com>
Sender: linux-next-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jiri Slaby <jslaby@suse.com>, Arnd Bergmann <arnd@arndb.de>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--g5OIygP5QP1fC/+Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 07, 2016 at 10:57:39AM -0800, Greg Kroah-Hartman wrote:
> On Thu, Jan 07, 2016 at 05:28:10PM +0100, Thierry Reding wrote:
> > On Thu, Jan 07, 2016 at 03:59:58PM +0000, Mark Brown wrote:

> > I think this is merely waiting to be picked up into the tty tree. I
> > suspect the reason why there's output in the first place is because
> > of earlyprintk. I've seen recent linux-next work properly, with the
> > serial console hanging at some point (fbcon shows login prompt). If
> > I apply the above patch things are back to normal.

> I'll go queue that up later, but how is this suddenly showing up in
> -next?  The tty tree has been pretty quiet for a while now..

There were some memory management issues which broke booting on almost
all ARM platforms for most of this week so nothing else was really
visible and relatively few -next builds over the Christmas vacation (as
one would expect).

--g5OIygP5QP1fC/+Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWjyNaAAoJECTWi3JdVIfQJi8H+wXnxbpktnbMtjaJsgn8QRAo
vpl14xYflxZclifzKEY2UkzwjHIKQZ2hApVIbr75uRhLsELighaly2QKZw+1Jo0i
Cmz1hFBgsD8/PKRQ1m474e82+TzJeu+Z3xm0ctIcDA3hv1Qa8+vXFwU1ET83UuwT
Q/gy2QKHzbOtsoXj7wnrdHf8K168XiPuMbU1g+QQqNd+Z93GWTWrFStKg2oXv/2i
AWdR5NpR25aT9hutMs1x5yrjOuMtRta42B0HbyN6J2pePjLhI9o2mK+QhW+DAD9q
KrmdI26iRWSkh6bVA+RlFjPBCo5PgVZ3Uh+ns1sWTIOqRTsikWhf449hfLg1yCk=
=DjR0
-----END PGP SIGNATURE-----

--g5OIygP5QP1fC/+Y--
