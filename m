From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V1] i2c: tegra: increase transfer timeout
Date: Mon, 21 Jan 2019 10:38:00 +0100
Message-ID: <20190121093800.GA16756@ulmo>
References: <1547757572-29075-1-git-send-email-skomatineni@nvidia.com>
 <c6ba237c-d271-c9d7-1c30-9901ba6bb1a0@nvidia.com>
 <BYAPR12MB3398536A1776FE6B3CA1AB34C29C0@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BYAPR12MB3398536A1776FE6B3CA1AB34C29C0@BYAPR12MB3398.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 18, 2019 at 05:21:28PM +0000, Sowjanya Komatineni wrote:
>=20
>=20
> >> increase transfer timeout to 10s to allow enough time during max=20
> >> transfer size.
> >>=20
> >> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> >> ---
> >>  drivers/i2c/busses/i2c-tegra.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>=20
> >> diff --git a/drivers/i2c/busses/i2c-tegra.c=20
> >> b/drivers/i2c/busses/i2c-tegra.c index e417ebf7628c..ca7c581fb4c0=20
> >> 100644
> >> --- a/drivers/i2c/busses/i2c-tegra.c
> >> +++ b/drivers/i2c/busses/i2c-tegra.c
> >> @@ -25,7 +25,7 @@
> >> =20
> >>  #include <asm/unaligned.h>
> >> =20
> >> -#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(1000))
> >> +#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(10000))
> >>  #define BYTES_PER_FIFO_WORD 4
> >> =20
> >>  #define I2C_CNFG				0x000
> >
> >Should the timeout be set depending on the max transfer size? 10s seems =
an age if the max transfer size is 4KB. In other words, we should this only=
 be applied for >T194+?
> >
> >Furthermore, in tegra_i2c_xfer_msg() we know the len of the message and =
so maybe it would be better to dynamically set the timeout depending on len=
gth?
> >
> >Cheers
> >Jon
>=20
> Yes, that=E2=80=99s the ideal way to compute timeout based on msg len and=
 bus rate.=20
> To do this I had to update TEGRA_I2C_TIMEOUT macro to take arg and
> there are 3 different patches for tegra i2c under review and all of
> those will effect as the patch changes use TEGRA_I2C_TIMEOUT.=20
>=20
> So, Should I hold on to this change for now till those patches are merged?

If you have a number of patches with interdependencies, it's best to
send them out as a whole series. So you'd typically apply them in order
to a single branch, then use:

	$ git format-patch first^..last

where first is the SHA1 of the first commit you want to send, and last
is the the SHA1 of the last patch. The carret (^) means the parent
commit of the specified one and is needed because git format-patch
doesn't include the start of the sequence.

If the commits are at the top of your branch you can use something like
this:

	$ git format-patch -3

which will generate a series for the last three patches in the branch
(more specifically starting from HEAD).

If you send them as a series, it's immediately obvious in what order
they should be applied and generally makes it easier for people to
review and test.

I think in this case you can probably just have the other two patches
first in the series, then apply the timeout patch on top. That way you
can resolve the conflicts between patches 1 and 2, and patch 3 before
sending out.

Thierry

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxFkvUACgkQ3SOs138+
s6Fw5Q/8DY8UeD7ZJIlP+dx7dlrjYimcows+9YNl/B1Lo0j+R/aCOcil2MKDoh87
2P3yC0Xa3P29kcepD2noRV0T0LHpCmhq0jxhsuY3+Z3K/M4fRw4oKScjikrtfqlN
xnrhNd/FLeBygIPvVgEHJQvnHXjzXEaH6rmZapoHuHJjuDmPXl8ZirLJBHLYXeel
sZFd9aVDtK2PwYm+hKeU2j3Vh18thtKqdtBOcZD4+ioB+mrcwqy7jPPb2OzVWhZw
ozfBnKsPqCgazFK7rZapd/bGlb0FeERtLeeE+ZqFEx475a8HsVpBOqN7ThwgKf7m
TTHEwP9EsJstlK//rPjZdOtwNXe179gbueIaKcwNZjbU/sXqmpM4nfSq1xkvGV7E
yswMwr+4X+nIHjj3Hha5TKdnprBOZTZic2ZZ+k2xQAy5vkgvOLH3BapUoe1lbGV7
9SN9QHLqUKjHukISXbsP4mLnQ2C+5oInhGRYNHRB3pI3dB2D6BvnW/mv8+2/r+uE
3wADIycOKibvWxSH5dDf2OXh5rZbcTUWGv8+jPE2LNgAvMunVICPnzyDksVXBdAq
J0WTMGjHPsr1kwuTtovvl2IHE+e00K3qNx0TJTMCD0ILf6JNjiMazBJz90vRsGyZ
wI9jSAfeYHMZ+/5uoFRev2Uu+W8YjKSvD+oGwGguXe8Xg39pqfM=
=SAKZ
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
