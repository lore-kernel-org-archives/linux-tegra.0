From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regmap: Fix possible sleep-in-atomic in fast io mode
Date: Tue, 18 Mar 2014 11:27:56 +0000
Message-ID: <20140318112756.GM11706@sirena.org.uk>
References: <1395141600-24558-1-git-send-email-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f4k5f7Z1sR/E6cKW"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395141600-24558-1-git-send-email-tiwai-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--f4k5f7Z1sR/E6cKW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 18, 2014 at 12:20:00PM +0100, Takashi Iwai wrote:
> regmap deploys the spinlock for the protection when set up in fast_io
> mode.  But some places are still left with possible sleep in the lock,
> typically allocating memory with GFP_KERNEL.  This patch fixes these
> calls by moving the allocations out of the lock.

You should have split these two unrelated changes into two patches.  I
already have a fix for the cache sync in my tree locally which I will
test just a soon as I fix whatever broke the -next build for me.

--f4k5f7Z1sR/E6cKW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTKC25AAoJELSic+t+oim9qAUP/RsqPD+lBFCxmPDXQj/0Z1A0
n5m60v9kzFaUiZyFQAhIZ6ZhFXtIbA6dC/vcdAzIQEZtv9bHaPbBgK/GTmG1dI0F
0WBei8e+OVx0EBKaVVM5J3AmBOylj10b+l+MwiGFDnskbvERhw4lYoms1+6nXew7
URQdtb6x+zZa2aArdmHOEejo+Jg4zfHlUPD8+Ewwi6RtbfNHMfyCWgKXM+LBkUzY
LTeEiJk+w5fBxOHmMrlZw5JZC4ODcxM7X/e+Sth3wEddWj/35licx4CZlAJCKI1g
JvKLtiSq5l7joeADWFEwUmFLOofmDuU80wi2FEJsSN1Udm3Rci3Aq5XjcPanZ9he
kkedpXuORD1iwyOxcsjA9qMLBWVYWJA8M3jay3rTF/r9UeeX6eDAxs/3XPfdKK3R
69R/sq3T51hgxNDD94mKVFx1fhT0gb3w9t+4oGGjWQICI6zlp35JbjuEvJJ+SPIL
Mxk9f7zpcNDZKG2MWa0WMKr9V8jDG1vhmGS5Q5uZO4PrOw0+E+W588bZOkI91wd7
U6kKSDmT/EBVPOsKqSxIOhovdctAN8yTiphvd4uqytWWDPGygJk3CcikYfTY59v8
KnVfNjwt0A6whJQsLGKgOvuQzywyVcdArdZjYBJXR7P47Dp9mz6XijLGvDgv1BET
C6HJfakRR5FRaM0dhFpF
=NNK4
-----END PGP SIGNATURE-----

--f4k5f7Z1sR/E6cKW--
