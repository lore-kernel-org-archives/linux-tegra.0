From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] i2c: tegra: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 14:55:49 +0100
Message-ID: <20151112135549.GB1131@ulmo>
References: <1447313163-23848-1-git-send-email-clabbe.montjoie@gmail.com>
 <20151112122923.GA31671@ulmo>
 <564496E8.60106@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <564496E8.60106@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, gnurou@gmail.com, ldewangan@nvidia.com, swarren@wwwdotorg.org, wsa@the-dreams.de, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2015 at 01:40:56PM +0000, Jon Hunter wrote:
>=20
> On 12/11/15 12:29, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Thu, Nov 12, 2015 at 08:26:03AM +0100, LABBE Corentin wrote:
> >> of_match_device could return NULL, and so cause a NULL pointer
> >=20
> > No. There is no way that of_match_device() can ever fail. The driver
> > core uses the same table to match the OF device to the driver, so the
> > only case where of_match_device() would return NULL is if no match was
> > found, in which case the tegra_i2c_probe() function would never have
> > been called in the first place.
>=20
> Right and so ...
>=20
> >> dereference later at line 809:
> >> i2c_dev->hw =3D match->data;
> >>
> >> Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-t=
egra.c
> >> index a0522fc..c803551 100644
> >> --- a/drivers/i2c/busses/i2c-tegra.c
> >> +++ b/drivers/i2c/busses/i2c-tegra.c
> >> @@ -806,7 +806,10 @@ static int tegra_i2c_probe(struct platform_device=
 *pdev)
> >> =20
> >>  	if (pdev->dev.of_node) {
>=20
> Can we get rid of this if-statement?

Yeah, I guess we can drop that, too. It's been a long time since Tegra
was converted to OF only.

Thierry

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWRJplAAoJEN0jrNd/PrOhpU4P/2xzfOSylcOH06AHmnFOPyx6
a5IvlC9pouSGClWVftpfcgERauzCJOqaM+Rp6OGCvj7e3ox3iXgP6Iq08GrGYdJH
fU3qV2j8N3MOIo5hoYJlncrNS+cTeql9766fBRd1BbdTiT23EC50jShZzJb0pgRc
kxTynQ+zHjrX/CqX9cp1aRKUMmRFopG8VLNLzGJ9ktdHhmxYLCJoVzY4pM+Qz8BS
VZzU3/0z/ump3LQ/sB3YH8AB7Rj96wSOR4Z6J2mU/9ZW10ekHsROtbIixqPvtcU8
IokAhm7DzetVeCBZJZU9OgAOn8tTWFd0vLcC+YrXfRmUv4gXdOSYlQzpsRWOOiVW
3Y8QVUFM9q2gw8+6i8mWqLNc24XlLm7koqJlDrxsVgDRYdSeJs6UzssGjjZyJAt6
vXezyu/7jPgASz9ZJ8Hryz9diWTc6/LM7L5RGledARbYnWSTde8Ytf6B72L68R7X
QV5n4TyoJkeH4JQb/Cj5cjlF3ac2ZbVXJut+pOdoK1bTi+26Z+Tb/Rddk+Szn73S
HGbZ3XR2FTJS6pCRu8P3Glj30hYtLDSr6d17YrKMnaujfRsfjjjubwb8YXqA3Rvn
PqLTY7yDepQvKqebr4jHEAq+RiUXCeUXwCrVgrQvp/iMuuMqtsL22M/iPAI3tgIX
GQxfMA9pt5ItAnhDwDjl
=ytq8
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
