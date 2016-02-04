From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] Fix headphone detection on Acer Chromebook 13
Date: Thu, 4 Feb 2016 18:03:26 +0000
Message-ID: <20160204180326.GP4455@sirena.org.uk>
References: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gIhrS3Q23Nl70UJ5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454563862-1971-1-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--gIhrS3Q23Nl70UJ5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 03, 2016 at 10:30:58PM -0700, Jonathan Tinkham wrote:

> Jonathan Tinkham (4):
>   soc/sound: tegra_max98090: do not invert headphone jack
>   sound/soc: tegra_max98090: rename headphone jack DAPM
>   sound/soc: tegra_max98090: document headphone jack rename
>   soc/sound: tegra_max98090: update dts affected by rename

Please try to use subject lines reflecting the style for the subsystem -
this makes it easier for people to spot relevant content.  The above
isn't even internally consistent :(

--gIhrS3Q23Nl70UJ5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWs5JuAAoJECTWi3JdVIfQDVcH/2bISj8BZpcEaTMwXuyWrfQ8
DybA+ST6T6VI9ceLQrnDul2Q/4zuxEkW22uRKCtaNrvMIH4XdU8QDiRzcjLuTrCE
ZvWPmvrch6rHIchcfM7sklnmn8XPL6w5LRF3EmZ0Fy+Zoyrs1Pr1WfIQK4mI2fRK
GSkME8UNEqwYyVHp6jn+mgjIVibM6HdmxG4h7BpHLziZBZkS4vagdCN9l2u4xQ/y
DI9jvVJP4fZf2NF2K+sp2YviFoq7p2tZiGkvK+q3AWiQaBcPk0eBKkxFWML0R+HB
meZBf/kjZRQUaAfEJMqbW3ySp8RKS0JYPOML4hWZukQXN6+QaSfF2dqVyrBqmUA=
=1li2
-----END PGP SIGNATURE-----

--gIhrS3Q23Nl70UJ5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
