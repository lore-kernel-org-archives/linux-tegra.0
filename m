From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] base: dd: don't remove driver_data in -EPROBE_DEFER case
Date: Tue, 3 May 2016 17:14:59 +0200
Message-ID: <20160503151459.GA19539@ulmo.ba.sec>
References: <1457450122-5792-1-git-send-email-yizhang_hust@163.com>
 <20160503131126.GA18494@ulmo.ba.sec>
 <20160503150739.GA14897@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160503150739.GA14897@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Yi Zhang <yizhang_hust@163.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2016 at 08:07:39AM -0700, Greg KH wrote:
> On Tue, May 03, 2016 at 03:11:26PM +0200, Thierry Reding wrote:
> > On Tue, Mar 08, 2016 at 11:15:22PM +0800, Yi Zhang wrote:
> > > the driver_data may be used for sanity check, it fails the
> > > probe() if driver_data is NULL after it is re-triggered.
> > > for example, soc_probe() in sound/soc/soc-core.c
> > >=20
> > > Signed-off-by: Yi Zhang <yizhang_hust@163.com>
> > > ---
> > >  drivers/base/dd.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > Hi Greg,
> >=20
> > This causes a boot regression on at least one board, caused by one of
> > the drivers looking at driver data to check whether or not the driver
> > has properly loaded. If the code encounters a non-NULL pointer it
> > tries to dereference it, but because it's already been freed there is
> > no memory backing it and things crash.
> >=20
> > I don't think keeping stale pointers around is a good idea. The whole
> > point of setting this to NULL in the core is so that probe failures
> > result in the same starting conditions no matter what.
> >=20
> > Can we please get this reverted?
> >=20
> > Cc'ing linux-tegra for visibility since that's where the boot regression
> > is observed.
>=20
> Now reverted, thanks for letting me know.

Thanks Greg.

Thierry

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKMBzAAoJEN0jrNd/PrOhP5cP/RtJXQpK4yMd0txlawDlUt5E
cFheN8OSWN6l9rWk/XzgPNYyCJhSEGWCbDZRu1MU+L7h3ewssaGtJ2Wo8zXymegc
oXRsoQ4tflYxjtwJuDgNLlMLuh2nPnoXyKAf/mrJ2IvNSNg6WASLa5URQ6FW1O+5
Vx3ecQW+yuaFlIeop/1XEuQTJlkIzdaAKnZFTBlr3adEHMbtOQ/dPYEG9fvx/GQ9
RKNlYo8os2Jq5iO6TqsUU1DFc9EaaKuaR4srfR9wsPRWSKALFsqeuex8Jn4a7MuX
cn57XGxHMe7/uTnYWYiHleI3gB1hTeRDzRR/C0sWogcMv/u8M1BCd8+OYQJOcI8m
J6MyW7uC8VLfGosDIAqBJDkAeMnm+WUFU3XsPXQhdDOwonRJeokZiwgfD+zwRG+m
pYiAaZ13s77qdSDGjdbFvP3p5OPyENwKqJ3GEUzL0lG4TyFZqve0w86tFj848Bnx
o3pzZL/izChcl4mz8SRtLdsNcHMjNeVs3mgZZMFVJoxfqxIfgkczkU9ZmEci2jHi
yCK+zzRVI0cZm5c6AgjtWl0GY48M08a0h4b/hqZsaTt17Le+nanIAadcQtCSnc5l
IDjw+eAwDRehx3KXI9CbyGjiAk0Go1lyf1MVT595nvlR897c75Ixj/s4reMpa8dQ
giWUfWfdM3P0mFiiH4cY
=uj9I
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
