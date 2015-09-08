From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v3 1/4] i2c: tegra: implement slave mode
Date: Tue, 8 Sep 2015 13:46:21 +0200
Message-ID: <20150908114621.GB15793@katana>
References: <1437424546-30405-1-git-send-email-danindrey@mail.ru>
 <1437424546-30405-2-git-send-email-danindrey@mail.ru>
 <20150724092720.GA1597@katana>
 <55B210F4.6030700@mail.ru>
 <20150724105251.GA22787@katana>
 <55D5C4AA.2000307@mail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55D5C4AA.2000307-JGs/UdohzUI@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Sorry for the long delay. I tried to analyze the issue. Attached patch wo=
rks
> on AC100 (Misha Komarovsky helped me with testing).
>=20
> Wolfram could you please try the patch with your environment?

No change, sadly. I don't get slave interrupts.

> Init function is called multuple times. If I2C controller works
> in slave mode, then driver must keep slave registers otherwise
> slave configuration will be reseted.

This patch does not tackle the main issue, though. There should not be a
"slave mode" for the controller. It can be a master and slave
simultaneously and should do the right thing depending on what's
happening on the bus. The Tegra2 manual I have says "The Master can
address the internal slave (for basic testing) or an external 7-bit or
10-bit addressed Slave device." So even a loopback should be possible
(if we trust the manual ;)).


--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV7sqNAAoJEBQN5MwUoCm22lgQAIihxed7NaPXMqr7WKk5tFbr
/NJOdJ78NZ05Leaf8hiCJs57LcHnQPOFa7E/wn2IISgZQou3azzFuQBPxdrvjyMF
C7RDb3ktFhN3mWHoo0VLWCFTqyIVbYN28JjDo6nAhiU3U+2AF7I5iIrg116LKa90
OCSJHS2/zUmaOrSoSGUQ7PgCRi8xR+0YoTMX6teuH1wWIkR0eAKt1RgNsErtB0oT
qoS424Hf1PSA9nkbMe8CU/4ie7v2wRFs0N4dSMmNJ4Y5mUI5mHPyf5Hw0vu74wnY
H/+nr5U3eldI1nGP48pEFBE/+TiDezxtMoB4J0kk8UFCjig9R8g0NGxOGKxtzDdL
CnlQ0kBUYLPyg9eMCJKOQE2Nvy0s+C5/iy9c3XjTI8qcXWZMf9KYwXjNJCVe7ocW
L/0RU/tyJQBVA9BDZctmv4heQNwPcQmmlwRD1E06qADKiSXMxBdOce9lKyWeN36+
UPaWfPsqWoMyWpAfKRudwH1Erym3R6QAiRipaU1xbQg5L8sALRF9Ju6O+eaBdHTx
JmdJnrCtnX1jUxMwb0xpjiN45DIbyHodBF2sC18MXJccW0N3j3zNj4uZhffxg4Ej
4h73r9dJhz6dJOunGc336CwP8LQUr06IKG3fCdJ/cFhWO6oVqmlahows8vfLTae5
U03YbnDd6tzEVNl9fO5A
=OxLB
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
