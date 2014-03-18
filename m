From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] remgap: Fix possible sleep-in-atomic in
 regmap_register_patch()
Date: Tue, 18 Mar 2014 12:03:12 +0000
Message-ID: <20140318120312.GP11706@sirena.org.uk>
References: <1395143914-26929-1-git-send-email-tiwai@suse.de>
 <1395143914-26929-2-git-send-email-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qdlkwHn4NkwSqFTO"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395143914-26929-2-git-send-email-tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qdlkwHn4NkwSqFTO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 18, 2014 at 12:58:34PM +0100, Takashi Iwai wrote:
> Just like the previous, fix the possible sleep-in-atomic in
> regmap_register_patch() by moving the allocation out of the lock.

Sorry, I guess I wasn't clear - I already have essentially the same
patch locally.

--qdlkwHn4NkwSqFTO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTKDX9AAoJELSic+t+oim9eusP/3V0qv4z8u3tR3SMS/a3jzEE
+N50YkkkH+eFO1hNQtd/kM6wGSNsV3KYTT3bLT6Qvs/gSih3MEuD0NZUW44X1jWc
06GTW6QsTtGS4IK4TnB43huy9q7/ER8gQ/U4kdtxQEgUaVzJcNmBG6CRIBSYgKF8
YkJ9byu3mWafor/z8IYhPaz8JcTr0SPuiZAWBxZI9yG/nVAuF1SvMHlqUf6gQbI8
kSnmFuRNMBfhFta7Q4cbCr82xT+R7G0lYxGjBPDysHWzzLnvncpI1RjwKT0QAR62
ouVVuw00anuuHvq0i67r1O3CUUdFYLNt1OK6q030tJru/b16GzwGtYk/OWgiUoUx
00QydEMqGTo9FrZvZmimez60dCwiULy30l2lLzW4sSiSxLiVSSrsIW2Cm4M/tqgP
EcDUycc8+E2VoWe5GHIahcDvqStkwJdLRUYVr82zcXINb0/pyJcBvEB4DVxpyMLv
XzwBI4Hd5vMjz9AsBtczzF0Ht0n+Xt11MDDRjkmjzt34ZZKevj+AyyGbvHVTaF47
YyncrTvpfG/44chxb/j0x36MiCh9ItxTRJkRsD17PYQWHzJzUtDUYDGKDVyQ8CK6
bfUBb470vTjTsQjjBEbpGH6Ft1jWiiVbySvJsebCzuvunMbASV+G56YIud0WVpvj
IT2yKJjn+/eTlNBVBkqC
=+PZp
-----END PGP SIGNATURE-----

--qdlkwHn4NkwSqFTO--
