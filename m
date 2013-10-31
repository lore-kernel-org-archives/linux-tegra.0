From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Thu, 31 Oct 2013 09:20:29 -0700
Message-ID: <20131031162029.GF2493@sirena.org.uk>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K/+MhuhYzqQJJ3Xj"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383203126-3243-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--K/+MhuhYzqQJJ3Xj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 31, 2013 at 03:05:26PM +0800, Wei Ni wrote:
> Set full constraints during machine initialisation, so that the
> regulator_get() can get the dummy regulator if the regulator is
> physically present and enabled.
> Discussed this in the link:
> https://lkml.org/lkml/2013/10/8/40

This should be done for all DT systems - I'd expect this to be done in
generic DT init code rather than for a specific board.

--K/+MhuhYzqQJJ3Xj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJScoNDAAoJELSic+t+oim9MFUP/0aZimpALfQ9iuE20jEEic6d
Tl+m/TG7xpMlqwx5qonc6xX6iRkHOSAqRCjvg9iXHtUpvXpp+xG74LTAMBVlrcaf
rTNVxWhs1ethjRGghnUauSVtgbNU73h/1aPdkP1/Nz9o1xfF1GT1v/LJCUuRf+9m
WFeoyy5OrPvpDOsFozv80sw3eJ+ZJn1Kca0S0wF2uWqIhqo5fsBAn+3W0e8876mp
/4Mwu6h0LiZbLtZecOcZzDCTyu1TS1NlCLm8xKXLVcUyA6uFJBGZzX7ctpNvb3Ko
QsjaLVmONsXYLXj1XFRJDdAAahSTaRxLHgXFIdusWW1DKgctyQ2K7tNbfMiAW2B/
k9Y55kVs8+HRKeZUrDBsH/xbuMo337OwwAnOTcWkn+k3R+RzDeoVERznvaEqor7o
mE1J7uSoFewb7/3gQyKdROVUcTA2fe2SUQZeHKo7zEqeP1eGHPqrdtf7nYkPRjhE
HEjp68Hee7INoPewTe2/cU14jeHO2Wja0ZAkpbuL19J7WiuTKfa/FjCZcnSSv0DQ
BlkpgXbV1jzH65unLtpjgkLp+Me0oEU63s4jRYBU4joJFZhHYahIMrxdpoTihjxr
gx4AY440Smdvx0oHs+PpNKeL0wAzCos9v+SqdomSKp4kDeBrK9YoKA1WqYO4Zvjn
HN/vRX8iAXjK7MCO6Tbd
=PwWA
-----END PGP SIGNATURE-----

--K/+MhuhYzqQJJ3Xj--
