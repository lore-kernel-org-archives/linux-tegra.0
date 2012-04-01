From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 14/17] ASoC: tegra: add tegra30-ahub driver
Date: Sun, 1 Apr 2012 11:31:18 +0100
Message-ID: <20120401103117.GD3153@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-15-git-send-email-swarren@wwwdotorg.org>
 <20120331201433.GL5012@opensource.wolfsonmicro.com>
 <4F77B7CA.3020803@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F77B7CA.3020803-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 31, 2012 at 08:04:58PM -0600, Stephen Warren wrote:
> On 03/31/2012 02:14 PM, Mark Brown wrote:

> > This looks like a fairly clear sign that this should be a CODEC driver,

> My aim here was to get something basic in place before I looked into all
> the "SoC DSP" and separate FE/BE stuuf, and how to express the AHUB and
> DAS as codecs.

The DAS might be more suited to the soc-pcm model given that there's
more of a tight coupling between what goes in and what comes out (from
what I remember).

> > or possibly the DMA driver - if nothing else even if you didn't change
> > anything else about the implementation it'd ensure that you didn't need
> > to open code this probe checking.

> Maybe just because I haven't looked into this at all, but I'm not sure
> how this would solve the probing issue; I can see that the machine
> driver wouldn't (ASoC rather than pdev) probe until the AHUB driver had
> (pdev) probed, but how would that affect the dependent device probes? I
> suppose it'd work out if the dependent devices didn't touch HW until
> their ASoC probes?

Yes, exactly - allocate the resources in the platform driver probes,
register with ASoC and then only touch the hardware when ASoC tells you
the whole card is ready.

--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPeC5vAAoJEBus8iNuMP3duosP/jrPdQr1oPWDE8qmb4UMxYVM
Wx7kSDQdfXkfdI41wqOjR+ZlfN0C3OmxxeRepmfXbAqEWStdmyTUZIvYxIvbQRwj
ag34whPLPVB9KaL0aRKDZvhkmqYUFme+fpQRf1uGZfKdcEG3uXw9Y5bBznJCSp3n
q6Q6AEKtCfzSEcQU6X3L2+WwgepUgWgqPQy+fH85awp0vn3fatIcx7g3LXwU+RIo
QNdHUxvQBRSE9CdyMXFBAdeNB2kOtGOz/POUiFAPgd3geOps9e543QiD8AJAkcA5
79zT8l0404UliJdOPexAP5fG9lD2pCKGL2cEmNo+b9vsA9SzHrLwVjcXZSMjMrg1
ZKOZIkcJ4tpzXYl6l+OBL0Sy5MxqwN//vy68WvVtZKDMuToGZZAy8NhlQLCpDOji
BBSTgM/UDbkoBOEObfzl9ndz4LPjGfIZBBSSLJnuuD7Eb8bEDGveD6ecuILmtLqn
QCTnFwE2sNQFwgtcz12WILb++viedY+YHPA7nMV8L5TaEqDYWcAzU9kLVlWZv0V7
JI8gJSGW+mn+AS0LaHdcXPvBywVBT4gh2bUGjBMlJdthSaoyrinZhKr3nbCjyXpI
iSTVq+I877J9sWnM+jh6RyUQk6BFSXeYO2YiZJu0xrZcRQbttRyfhtw9uQqhJHJ/
7+GkX39TLaNvxi1qllX/
=Y4vV
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--
