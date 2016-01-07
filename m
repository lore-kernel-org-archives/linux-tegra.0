From: Mark Brown <broonie@kernel.org>
Subject: Re: next boot: 564 boots: 59 failed, 448 passed with 57 offline
 (next-20160107)
Date: Thu, 7 Jan 2016 16:56:57 +0000
Message-ID: <20160107165657.GH6588@sirena.org.uk>
References: <568e8740.01941c0a.31072.ffffb67b@mx.google.com>
 <20160107155958.GG6588@sirena.org.uk>
 <20160107162810.GA25177@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nCRcqX7cEx7rr7Pe"
Return-path: <linux-next-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160107162810.GA25177@ulmo>
Sender: linux-next-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Arnd Bergmann <arnd@arndb.de>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--nCRcqX7cEx7rr7Pe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 07, 2016 at 05:28:10PM +0100, Thierry Reding wrote:

> These should all be fixed by this patch:

> 	serial: 8250: of: Fix the driver and actually compile the 8250_of

> which can be found in patchwork here:

> 	https://patchwork.kernel.org/patch/7883541/

> I think this is merely waiting to be picked up into the tty tree. I

Ah, good - hopefully that'll get picked up quickly, I suspect it's going
to turn out to be responsible for a bunch of the other failures we're
seeing at the minute.

--nCRcqX7cEx7rr7Pe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWjpjYAAoJECTWi3JdVIfQvQwH/isS0Ohw9I6pdKMEiRE0pYw6
DPvujsU4sCPA2u744h0HHGDP2wMw4IkY0IymQKaJenkFYoAq1L+uK/Ar/UasooJ8
YCs83VaW/cQTdlFHqWiXOcqdKr07PK9UA/OQ7zVNGZ0HFvoM/Cm7zzYh0SqKwQDc
sLHf6KfE7GatbgRF1jyBulgQpL1X7Vvin32pGvnK8NqelAE9+WzRM0CYD/mJ7By9
2ohSuzzF/ZugYXzGZcggn5G6X4HTSoEIIstgt/x33qd0wdFRIXGKKrtVxUahct5A
cmVPs4s3xkGXTQ0I173cH9zUsdISqz9H3PAHf5xA8vyn+aKYvX5ncQIAW2rjxfE=
=VPDn
-----END PGP SIGNATURE-----

--nCRcqX7cEx7rr7Pe--
