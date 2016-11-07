From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Mon, 7 Nov 2016 14:21:27 +0100
Message-ID: <20161107132127.GE12559@ulmo.ba.sec>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <CACRpkdZpPHLDGeBb8kb=LYmuT0PKPf_quK+OF2peaV+8dxr5vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EXKGNeO8l0xGFBjy"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZpPHLDGeBb8kb=LYmuT0PKPf_quK+OF2peaV+8dxr5vQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Suresh Mangipudi <smangipudi@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--EXKGNeO8l0xGFBjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2016 at 08:53:37AM +0100, Linus Walleij wrote:
> On Wed, Nov 2, 2016 at 11:48 AM, Suresh Mangipudi <smangipudi@nvidia.com>=
 wrote:
>=20
> > Add GPIO driver for T186 based platforms.
> > Adds support for MAIN and AON GPIO's from T186.
> >
> > Signed-off-by: Suresh Mangipudi <smangipudi@nvidia.com>
>=20
> Stephen/Thierry/Alexandre:
> Can I get your review on this Tegra thing?

Can we hold off on this for a bit? I've got my own implementation of
this in my Tegra186 tree because I thought nobody else was working on
it. From a brief look they seem mostly similar but there are a couple
of differences that I need to take a closer look at (and do some more
intensive testing on).

Thanks,
Thierry

--EXKGNeO8l0xGFBjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIH/WAAoJEN0jrNd/PrOhqcUQALBo6ytdY0stw/OikD0ZWY/U
wi6eB0ujjQ80m9eh/Li7zCbe5VMcK68VWPlWaFE4q9IRM1ZQTk/mk/WV94066puU
57eTbLFQiih5jpW7JlgSg9ZuK7ZRZ/UiMSM6PMDea9VdQgR6a+0F44b6rfDwp8iH
J9NfZyK2+UzQN4QM+yVevzJhgs58X6MQYcnWnxs4mq21rU5qx54+aG6rCyI+rX2X
TKGdyDkMqH7EFeI1pRtn2JuophEoGFmr4LnbOtxGQRPI/zfaAGaWn0TXTHuyPpFE
zk6mrRV3ILpUrodMTOFmNdPqpUESCi+kQfIv2acFuMZ89EuoZNTyaOKyTgZuSmyU
WFSf0BhBXPSfCwvq9pIDtRR09VkzltbabouJggHbW6Mg5vcEW3J+4vTIKmJkjbAU
Md3E+S4Mcrd/N5fHm7OIG+zvvZU8kZ9MIFeVdifMWk83En9sAFtjpnJmss/3s3Ff
FhGnbdFrj5gyDdkMHhpZnmIaCh1xuVdeDCrqZF+W5eCkrvthG5pLFvja4Kst6osP
GwOIMNY2qOwKjtHCI0YfrYVhUdDPU83KS3DWsJVj8zizLC104Mqy+2gQH472b6kz
uqa4Axj0ajQ0kKfkuXOAqjRXTfSIIOT12pMAMR24wPYBRU4DPlF6z46kDULbI/UC
ixT1RVMohAHTg2uiEWLe
=8dB9
-----END PGP SIGNATURE-----

--EXKGNeO8l0xGFBjy--
