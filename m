From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] soc/sound: tegra_max98090: do not invert headphone
 jack
Date: Thu, 4 Feb 2016 19:37:01 +0000
Message-ID: <20160204193701.GS4455@sirena.org.uk>
References: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
 <1454563862-1971-2-git-send-email-sctincman@gmail.com>
 <56B37E19.6010002@wwwdotorg.org>
 <56B3A10E.4010508@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="azZrKF05zqlgub2L"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56B3A10E.4010508-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--azZrKF05zqlgub2L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 04, 2016 at 12:05:50PM -0700, Jonathan Tinkham wrote:

> I was referencing 'Documentation/sound/alsa/soc/dapm.txt' with regards to
> control names. While it is possible to add another entry into the user-space
> configuration, I took this documentation as a definition of kernel control
> naming schemes, and thought the driver had used a non-standard naming scheme
> (or at least, not a consistent one).

That's *not* ABI documentation, that's a random example of some kernel
internal strings.

> I see that now. If the inversion behavior differs between venice2 and nyan,
> then another compatible string would need to be added anyways, correct? As
> you mentioned above, this might need to be done anyways for the rename.

A property would be nicer.

--azZrKF05zqlgub2L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWs6hcAAoJECTWi3JdVIfQwtsH/0Xtt4UrZsRLT1LUoXCLoNU6
TCE+D1MGRgw4Y5cHjzgCeOVZg1FFSkfohtyUTce9SW41PdZVPSq0F/OFnHnh4Avg
61SHzJSKv2QnFiNA2ZptK2rwcElyd5BJXjpJiSb5OyvWHOa5fxmWDms2IDuwA7y7
71tox5g4xwzuHMHqcCjzNwJFculdyzPH++BJw3cCcbiErxI4Fy1BYG2QnhXkKZBv
WmCRqo8L8jh1Ts2BQD2pMjJIwuedIgQ3oBF5KdraLNpgxMgDIO0rTJsC0lkS5Fvw
4qJM4SxPGqnmSVZWgOcK6eXdQByMoX3USdbSxFAqhEQYmae9Bu+2CBsJ2w+jxbo=
=cz6L
-----END PGP SIGNATURE-----

--azZrKF05zqlgub2L--
