From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] host1x: cdma: use completion instead of semaphore
Date: Tue, 11 Dec 2018 11:08:32 +0100
Message-ID: <20181211100832.GE14426@ulmo>
References: <20181210215119.1903413-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r7U+bLA8boMOj+mD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181210215119.1903413-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Dmitry Osipenko <digetx@gmail.com>, Emil Goode <emil.fsw@goode.io>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--r7U+bLA8boMOj+mD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 10, 2018 at 10:51:04PM +0100, Arnd Bergmann wrote:
> In this usage, the two are completely equivalent, but the
> completion documents better what is going on, and we generally
> try to avoid semaphores these days.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/host1x/cdma.c | 6 +++---
>  drivers/gpu/host1x/cdma.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

My understanding is that potentially many userspace processes could be
blocking on this, which I think is the reason for it being a semaphore.
Is the completion going to work for those cases as well?

Thierry

--r7U+bLA8boMOj+mD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwPjKAACgkQ3SOs138+
s6F4YA//cuiEcBrx+Cqz4xqncvpwk/VeJ6Ag2er4y2er5lZL5OWJbSdKQuhw8ns7
l1OQ3VLF0Js9hLaDLEfdgxR3zzu0Ok5cyKeUH0bC1VZ8ces8ER1xHK24W7YeINAn
ST8okJEV97mSHiiWe/p8nrYq5iIH7giUb9iZT57AX+6nxGAcg+XJ2gietauU2RUB
RFSOcO2AQboWC9CWCcY0sW04IIP2+z4CMLeRDbe1TIGZzgyuG1p/WEuMqQ0AN+qv
njAP8w9OyW1cltuoLqthFmdScsqc30H22RI/dISgFlLdYgu5PeGeYUeO5P+RB0Js
iHk8T/wsr7+HTfnfpxZXYJnA1YtvIGEVe7RkTscAYjm9/UU//bke5OqjQJ4AOasn
83rXE9hhvNk+Vx7tzr0hQP20vm/3a5shTWWtOf/l8pJFhOqvMpJzZ1UBj4nz92XL
6ObY5XB8apbuFtqEVmUenOyZbRuJdpXOexerOJ82vBsu/WANpdOQP+9bo2Tdgtwv
mNGWauAS3DJExL42UN2t6PnK7a9O/s7Wr0j7K9vhYNjZrgTsXOQcLMPLVhuJ3w8X
gJvl3qJ8ZaGZcIh8MtQG3mG/qiALn3VwctxsIFkgX/a5IqTudIHsplq9/srLW0SX
7p1scDD9ON05LCWGW8J7DFgbS3vd2vL++IUwoYjudZTC2hG0GSI=
=IYkF
-----END PGP SIGNATURE-----

--r7U+bLA8boMOj+mD--
