From: Mark Brown <broonie@kernel.org>
Subject: Re: Boot WARN with patch "regulator: core: Link consumer with
 regulator driver"
Date: Wed, 11 Jul 2018 16:06:07 +0100
Message-ID: <20180711150607.GC9651@sirena.org.uk>
References: <83491a3e-cfed-6673-244e-e720f338db92@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <83491a3e-cfed-6673-244e-e720f338db92@kapsi.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: p.paillet@st.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 11, 2018 at 01:08:14PM +0300, Mikko Perttunen wrote:

> I'm seeing the following spew during boot with Tegra210 with the patch
> "regulator: core: Link consumer with regulator driver", recently applied to
> linux-next:

Someone reported this already, it's a limitation of the device link API
really but we've not seen much of a response from them.

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltGHN4ACgkQJNaLcl1U
h9AOmgf/eJykFhEVTVL/i+nXz8/R7N+K5q/MotehXhbssNgNJppfhmIF+zrwMX+I
jTASG1YCwsX7Y0fGLcgtRYS6QLr09AKgoT8kyA5I3f+f8o6oDhBgCQsPulzZsIkq
PvjTQuA8FG7Q6ybnwgfABdBVWq8pYbS7h+tiWDBTzH34gaepY6vhIRkJpHEDzC2P
OTsFvIL/997L+cBViFiyD/4Q4DIe/A4aQsTXsO5uUIB7eqfV+0b8is/WY9uZu9cu
jiWkUrFtp48uV8tp2owALNlwWnz0LhgGObz+F1c20WbQNzjHa786HsOCfLDgwEg3
MsQx3eogxJQLOU2+0tx6vNKRB6I0eA==
=8TN9
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--
