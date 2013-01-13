From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ASoC: tegra: add tegra machine driver using
 wm9712 codec
Date: Mon, 14 Jan 2013 08:26:42 +0900
Message-ID: <20130113232640.GO5041@opensource.wolfsonmicro.com>
References: <1357348725-32139-1-git-send-email-dev@lynxeye.de>
 <1357348725-32139-4-git-send-email-dev@lynxeye.de>
 <50EC9B01.6010203@wwwdotorg.org>
 <1357685553.2884.33.camel@astat>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jx/LfW4V5TfZLeq7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1357685553.2884.33.camel@astat>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jx/LfW4V5TfZLeq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 08, 2013 at 11:52:33PM +0100, Lucas Stach wrote:
> Am Dienstag, den 08.01.2013, 15:17 -0700 schrieb Stephen Warren:

> > Hmmm. I thought that could be auto-instantiated based on probing the
> > AC'97 bus for whatever was there?

> AC97 is in principle probeable by reading the first regs of the codec,
> but all the infrastructure to do proper hotplugging on the AC97 bus is
> missing in the kernel. As I didn't want to be the one to add all this
> infrastructure to a dying audio platform, I opted to do the same thing
> as all the other platform using AC97 and instantiate the codec from the
> machine driver.

That's about the size of it, yes.  We should write the device tree as
though we'd got better infrastructure here since this isn't something
that ought to be required but right now this is how you do AC'97 in
ASoC.  It'd be really nice if someone had the time to work on the AC'97
infrastructure here but I'd not hold my breath given that it's rarely
used in new designs.

--jx/LfW4V5TfZLeq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ80KiAAoJELSic+t+oim9uboP+gPnW+AF507svnC/b3Yq0CYz
h/p//H8DjQwRT3xBH4zgDnUVbbd3ddFvySZqpGfOPqPRbpGy/k/1OxoR13giV41N
+FrVs8vC4AlYDAQ5W8y3rUgmmCj0N7SfCHhR0SiOe+zxZJI6uwFqlrS1nNY5DnpL
pLmAZMkbAOKZJgW0HDQt48NZPkHxlxUXhLq7Kf79bSQRzBLMFSntiuZwEl9oNVAE
4TDxp1VwrFnW5gIUcoivfU6NKOapPnSlG6DJlZxI0IY14beqynq39SUgw/5zgba+
P0a6hAPVHl8NVkHDfGsA7FaarU2xjKGK5XLQ0p8UcRcp+CNtPcDP1vw3uTTArU9f
AEcLAp4hxm4FfOP2evfRewHmtXs6anWi0ld+Z7t4iToBBcktU6P0HzXeMTSJD2WV
YzpN74geCx/h6SfkUker1gftzgfOzlSTbPq+g++BhRIer6b3bcJSOH7uBYS/b9QC
J/q1vwt/D+hTPofNPcVwCFPLkLWUq7Wct6XOFyAqujDFFb8xKx7sEsg2igwP79A0
3JNgi4o6y5zf14gC3iS5vX94rfYSmi+6XrFiV8l3c3WbsvXNcxu8N02PBS3nc68A
rvKaIHbBpeOf7/rD9D11KIdh8gnvVDTYwIDDYMp10tSyhMVsYZTD7r7PSEw8sHRK
7LyMdWqKzdacMoheL9Nh
=Udym
-----END PGP SIGNATURE-----

--jx/LfW4V5TfZLeq7--
