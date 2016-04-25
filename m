From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] regulator: core: Add early supply resolution for a
 bypassed regulator
Date: Mon, 25 Apr 2016 17:54:17 +0100
Message-ID: <20160425165417.GN3217@sirena.org.uk>
References: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
 <1461255121-5245-5-git-send-email-jonathanh@nvidia.com>
 <20160422104837.GC3217@sirena.org.uk>
 <571A0A81.4010009@nvidia.com>
 <20160422135339.GD3217@sirena.org.uk>
 <571E2D48.10509@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m2KU9Mr9JJKQaAoQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <571E2D48.10509-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--m2KU9Mr9JJKQaAoQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2016 at 03:44:24PM +0100, Jon Hunter wrote:
> On 22/04/16 14:53, Mark Brown wrote:

> > We need to only *fail* in the bypass case.

> OK. So this is what I have now. Is it weird to return EPROBE_DEFER in=20
> _regulator_get_voltage()? If so, I could add a test for bypass in the
> regulator_register().

It should be fine but perhaps print an error saying that it's a bypassed
regulator with no supply?  Deferring for no explicit reason can be
confusing.

--m2KU9Mr9JJKQaAoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXHku3AAoJECTWi3JdVIfQ8K4H/RFQrsicyadr+L9Kihf6NBNY
aVfrqLPwrEnTYU0yhZSJjQ+zjJKxWBVyKJIk4AcdULvsxy4hpEHuAf+bOJpE3zBX
2p/CcGAlfghSvoDpDogFmDJRevn1xZkwpwvKj0UhGC1cYAw0+9qbDDKxjSsAKmbu
gHA8BpgwvjSfl+mAISN1ijdnTAjtl0fdzGjIIZWmmfAYWg07NyPB9iVjXiWsyh2G
1l+xTyvKd/NHgn4bssjfkd+uqaLPVR95U3ymUccyidndgtcxSb1kF61lGu2Q4IFb
CWM/xPR3hSJ+lq48InNzqpBT+UTRPsD1UreNdforQO2be4hlHGcqRHIoNC5SQLA=
=7VJn
-----END PGP SIGNATURE-----

--m2KU9Mr9JJKQaAoQ--
