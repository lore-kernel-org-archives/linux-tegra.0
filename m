From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] mfd: tps6586x: add version detection
Date: Wed, 4 Dec 2013 11:49:09 +0000
Message-ID: <20131204114909.GK29268@sirena.org.uk>
References: <cover.1386108712.git.stefan@agner.ch>
 <77384d24810d9a22fc04cad6f7468f54a9cbaafe.1386108712.git.stefan@agner.ch>
 <20131204081021.GB7469@lee--X1>
 <e2ae7b9602d0c1e11f8e56ced17e9da0@agner.ch>
 <20131204100728.GA907@lee--X1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5dNcufZ4prhark0F"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131204100728.GA907@lee--X1>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5dNcufZ4prhark0F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 10:07:28AM +0000, Lee Jones wrote:
> On Wed, 04 Dec 2013, Stefan Agner wrote:

> > As I pointed out in the comment above, the struct tps6586x is in the C
> > file, so I would need to move that too. That's why I did not made that
> > change in the end. What do you think, should I still move (and move the
> > struct too?)=20

> Why would the struct have to be moved if the function is inline?

If the function is in the header and trying to use a struct that's only
defined in the C file then it's not going to build - keeping the struct
in the C file only does seem like a worthwhile thing for encapsulation.

--5dNcufZ4prhark0F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnxayAAoJELSic+t+oim9WCwQAIqChvlA28rjAv+Gzq5no6eA
8vZYtMyPqA9ZynXD4vrTt6CA79VUt0ne9dQM6lUDkMllUhQX+N6nws0Jljv7xh2v
42buB5qt31gUH5PgnQzLdf03eC/nk4R0Xc/usvApkX1iz4p6fLAivj9J9rEoLvNs
uOWvZluHxnIEcJIEGzimPDi28TwpP91sFrF3ZiBQ2WJXJe9N/U3XYt6HFxk0Rp3n
Ymw/evDiweL/UnHsbe2nnSOtBbUEeXX5z+3NzFiACv7DGvPTc0gTVFk76kO3kxqL
IURQaV+lHmt2jLlvwKvsPnM9xstsZLTn5lrh8Dn9Iv0ITCmLWAvXJGuR0nxClKTV
ipgu01ZF0IpNTKCWENbkzNl/559dVQn/QRcrb6awmDeRu7UmF1jL6enf1L0u0UuR
QsU++HCq1RAMdGQS/NpKfw3QgOZu2VGyVG8tZ4ykzVjQdKT4DKtswFLDW7ym9CA+
qWVLvxjdMGvyiZDyrRLXsdKtfDK0fWllfnx0reitsNFcWOZZ5EzqgDer79ErbVav
Rwd4N0D244olcz9JvjvY/dXx+4cVZuffWKN1Je9ftTOCg6ERrZ009fz0YY0cNd5q
ZHAIEgIxl6vCFt1dWjuWpj17XHDif+aoShUB1J5zk6m41h4Askczw+qF2Efqx0Lh
I+YKO7czoms/MoSsNUV/
=ajwe
-----END PGP SIGNATURE-----

--5dNcufZ4prhark0F--
