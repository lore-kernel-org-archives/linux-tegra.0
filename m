From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: next/master boot: 273 boots: 63 failed, 209 passed with 1
 untried/unknown (next-20171106)
Date: Tue, 7 Nov 2017 11:55:01 +0100
Message-ID: <20171107105501.7x74gdqzhr7uulp2@sirena.org.uk>
References: <5a0055f1.85a8500a.98d54.a4e4@mx.google.com>
 <20171106191713.d7jqg2b6zqchythw@sirena.co.uk>
 <d8e21d87-776b-beff-62af-34e5ad1febc3@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="krpzuqjshaov4wzi"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <d8e21d87-776b-beff-62af-34e5ad1febc3-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "kernelci.org bot" <bot-ssFOTAMYnuFg9hUCZPvPmw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guillaume Tucker <guillaume.tucker-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--krpzuqjshaov4wzi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 07, 2017 at 10:12:59AM +0000, Jon Hunter wrote:
> On 06/11/17 19:17, Mark Brown wrote:

> >>     multi_v7_defconfig:
> >>         tegra124-nyan-big:
> >>             lab-collabora: failing since 2 days (last pass: next-20171102 - first fail: next-20171103)

> Thanks for the report. I have been looking into a failure on nyan-big
> [0], but this one looks like a new failure. I will take a look.

Guillaume Tucker has been bisecting this with the shiny new bisection
code he's testing, he was saying on IRC he thinks he's found the
offending commit:

   https://people.collabora.com/~gtucker/tmp/bisect-tegra-4.14.rc8-next-20171106.txt

(not CCing Johannes yet)

--krpzuqjshaov4wzi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAloBkQQACgkQJNaLcl1U
h9AMRQf/QI7MNiPeXL/0NK81uBKYHAdkYkger0aAGLJa+m62KFDoJLtH3eMMUcvq
ROzwBwwBB/arSYwO48qIYVcE7S4xTnC2Fr5z3nSW49G1k6DxoYXPKA2Er+PEZh8z
mCHtwfUcvZ0JKGVyooe8fK4yEgAnnGc3bFmvgJ0ixhiP7/STmbjIB0Vyd9Jwrx6X
7Kko6W26c7HuAp+Iu850J/JW4sYtnDHJHVCS8K3c5I0Vn4fiCve0lk9j7Sv0YCic
RyiC5QvHss/QdP2RmtExp0/CktkfF/Zv8SjAu1Ets3RWS/oShijo7RrQ/MOREQSB
QROgIRWKN80DJ5ZUcP/cOrPNF8OcIw==
=9wmT
-----END PGP SIGNATURE-----

--krpzuqjshaov4wzi--
