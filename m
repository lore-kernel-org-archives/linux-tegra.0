From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: How to encode being an I2C slave in DT?
Date: Wed, 06 May 2015 09:53:55 +0200
Message-ID: <3394114.re5da8pjTi@fb07-iapwap2>
References: <1427745615-5428-1-git-send-email-danindrey@mail.ru> <20150505105513.GA1841@katana> <20150506065928.GP25193@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5965437.OTLEguJE2Q"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150506065928.GP25193-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--nextPart5965437.OTLEguJE2Q
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Mittwoch, 6. Mai 2015, 08:59:28 schrieb Uwe Kleine-K=F6nig:
> Hello,
>=20
> On Tue, May 05, 2015 at 12:55:13PM +0200, Wolfram Sang wrote:
> > So what about adding a new property "i2c-slave-reg"? This does not =
only
> > prevent the confusion above, but also makes it very clear that this=
 node
> > is an I2C slave without the need to encode that somehow in the
> > compatible property (although it probably should be described there=
 as
> > well, still).
>=20
> I admit I didn't follow the discussions referenced in the footnotes, =
but
> I wonder if the slave part should be added to the device tree at all.=

> AFAICT it could (and so should) be completely userspace-defined which=

> slave driver is used on which address. I imagine that for most
> controllers the bus addresses to use can be chosen more or less freel=
y.
> So what am I missing?

if you had read the footnotes you would know :-) Our usecase is connect=
 an=20
embeedded controller via i2c to the host soc, similar to cros-ec, but h=
ere the=20
ec is the i2c master. The ec connects keyboard, mouse, pwrmngt, and oth=
er=20
stuff, for which the drivers are best implemented in kernel code AFAIK.=
=20

Marc
--nextPart5965437.OTLEguJE2Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJVSciTAAoJEKyeR39HFBtolnIH/2hOZ0U2n2rlrP48CIDnGk0F
jOl7TAPbl7n3AyuQmFBtI5UFNVdUmFajgRHnEuEcEtpfhHPajlqfzEcTUA4vtT8g
zzsMHkbmYvsdzdgeJ4AYDf9pXn1UImKTIhXf2ZOkbO1X97SVyceDMoAMMugXdhNj
myqxBHrfjy8TJ3BXYo9Co5CicAVIsAWsPH6s7M08F8GdolRv74MWfQgzwYhUXbLI
EdVQdzAkVU/SOTSwmGrhVwd5B1faesML29HhRPFmQVvw93WRUR9Hnn3hxxhNktfJ
S1+nSwiK6H7QMbZP6D5Zc4Pyo1VSGRNnvf8UsdPjdgIcTOU0nQv3XrpPOYdrhxQ=
=3TD0
-----END PGP SIGNATURE-----

--nextPart5965437.OTLEguJE2Q--
