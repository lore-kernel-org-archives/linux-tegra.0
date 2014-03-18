From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regmap: Fix possible sleep-in-atomic in fast io mode
Date: Tue, 18 Mar 2014 11:42:51 +0000
Message-ID: <20140318114251.GN11706@sirena.org.uk>
References: <1395141600-24558-1-git-send-email-tiwai@suse.de>
 <20140318112756.GM11706@sirena.org.uk>
 <s5hvbvbrb25.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SuSGaIqs99hP22V3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <s5hvbvbrb25.wl%tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SuSGaIqs99hP22V3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 18, 2014 at 12:38:42PM +0100, Takashi Iwai wrote:
> Mark Brown wrote:
> > On Tue, Mar 18, 2014 at 12:20:00PM +0100, Takashi Iwai wrote:

> > > regmap deploys the spinlock for the protection when set up in fast_io
> > > mode.  But some places are still left with possible sleep in the lock,
> > > typically allocating memory with GFP_KERNEL.  This patch fixes these
> > > calls by moving the allocations out of the lock.

> > You should have split these two unrelated changes into two patches.

> You're suggesting to split the patch to fix for regmap_bulk_write()
> and regmap_register_patch()?  I don't mind to split, but basically
> both are the very same bug, and the solution is very same, too.

Yes (especially given that the considerations for patch are a bit
different).

> >  I already have a fix for the cache sync in my tree locally which I will
> > test just a soon as I fix whatever broke the -next build for me.

> I don't know why you're talking about the build fix...

I can't exactly test my code if the underlying kernel won't even
compile.

--SuSGaIqs99hP22V3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTKDE4AAoJELSic+t+oim9lpQP/iC4WV4HXDwWaNVPSZJ2GbzT
qdoYFXVFQWRm5RLqf2JN3XOg8NTiLXWcWzWo7SnPlgfCemfezzqibzccEGcIkRg5
zyCj7fEXXiZjbJHPzqCYdESL6At1nwkTpBNZ2FMmWqjBPOZwOm2ulRe8URwQyWi7
j2jLtK9VxEPnEsPfYnOp8rsb1lp4qtonBtEHHQ8GWRh7+aoEu49RUB4EaMaauz47
KybB4SHJo2Bbv2bqz+ev2J8l1JzCoiraEmj/sMWPXEM7iL4AxYtCAziXNNgQRVJu
BmBEpBE06UvJmCUNbWMKDYMcyVPXOVvdkyXmIbWoEWHHxd1H9qriPuL//m9I4Lf3
u/g1GEappmmv79XydOxu663GEckavDmkcWxvbLYCwqVrBsPQPqktIyHC6g539Pfq
RGpM8RbaN/88fX3nioVNiFG812xleOy7aWyUyjAYD/o2L6IQgBMB85Z5yUiuPTL5
aDHyjMaHvHyvAObZaWIbxBQeu7yhGrc33N00qDEfo28vAX++phdxIpYpSjpcQinl
eVVpIk1Ey6HGVww+9zReTe3UNg94a/NYQ+jqZhLPv6EIu2FYghS64emPAQq8UMoH
qIPrwHMlVvdFVnUKMzWP9y9pWd5IV9P2lrzSuzbADgTp036i73R1sOH3oSbWE6TJ
N/GYyzJfMlYg51v09FKd
=/6dR
-----END PGP SIGNATURE-----

--SuSGaIqs99hP22V3--
