From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: tegra-xusb: Fix allocation of pins
Date: Wed, 20 May 2015 17:04:07 +0200
Message-ID: <20150520150405.GA7734@ulmo.nvidia.com>
References: <1432044863-2035-1-git-send-email-jonathanh@nvidia.com>
 <1432044863-2035-3-git-send-email-jonathanh@nvidia.com>
 <20150519143340.GE26748@ulmo.nvidia.com>
 <555B5563.5060604@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <555B5563.5060604@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 04:23:15PM +0100, Jon Hunter wrote:
>=20
> On 19/05/15 15:33, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Tue, May 19, 2015 at 03:14:22PM +0100, Jon Hunter wrote:
> > [...]
> >=20
> > One more thing:
> >=20
> > [...]
> >> diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pi=
nctrl-tegra-xusb.c
> >> index 3e8e4a914fb4..c61594066e26 100644
> >> --- a/drivers/pinctrl/pinctrl-tegra-xusb.c
> >> +++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
> >> @@ -125,6 +125,23 @@ static const char *tegra_xusb_padctl_get_group_na=
me(struct pinctrl_dev *pinctrl,
> >>  	return padctl->soc->pins[group].name;
> >>  }
> >> =20
> >> +static int tegra_xusb_padctl_get_group_pins(struct pinctrl_dev *pinct=
rl,
> >> +					    unsigned group,
> >> +					    const unsigned **pins,
> >> +					    unsigned *num_pins)
> >> +{
> >> +	struct tegra_xusb_padctl *padctl =3D pinctrl_dev_get_drvdata(pinctrl=
);
> >> +
> >> +	/*
> >> +	 * For the tegra-xusb pad controller groups are synonomous
> >> +	 * with lanes/pins and there is always one lane/pin per group.
> >> +	 */
> >> +	*pins =3D &padctl->soc->pins[group].number;
> >=20
> > Shouldn't this be the same as pinctrl->desc->pins? In that case, maybe a
> > better solution would be to make .get_group_pins() mandatory again and
> > turn this into a pinctrl helper function that can be used by all group-
> > only pinctrl drivers?
>=20
> Yes I believe that you are right. However, I don't think a helper
> function would work here, because this function returns a pointer to an
> array of pin numbers. In the case of xusb this is simplified a bit
> because we are only returning a single number here for the group.
> However, if you look at other pinctrl devices (such as pinctrl-tegra.c)
> there could be more than one number in the array.

I see. Oh well, guess this is as good as it gets then.

Thierry

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVXKJjAAoJEN0jrNd/PrOhiJwP/1AD+hb0dqH9pwpUl4+oekDS
ImIbRQk1L2YG3BGQRogJJ84srI3kIq9iXC+ZUqUIqAKzkl7c299n10t65deaz1wN
lNGmX9rZyCuHVD+ykdX4bmcyeWaiqYmObAzA0ZlNbnsjhhYyQ+/FQr4gEAHEF9i2
MyTuCApDW0ZfO4vjGikpo/5+AWUyW/pMtnYVHeZCA9DnVDsLbawwb1VrWNyI6ffT
S3awNv1Yo6vTxA314T67bqFAufXVWa7jG6zElMCDbukXVWdLskds1QW+De7u+5cm
sfo06/1tpCh673oHQBAcz9iyQ7/DSO4Hr7vJCvtyfpQ7NSbCmuyD5bRW3WLBcZRh
/eqf2OLOT7OirLfMIjQo/v41Rn39dskoFpN5nV7/83DnOQnQB2RaJeQoPX7OTdtP
qBAkKUuQE+2W3yN5ZOt6yqJZ1S5zub74RFivk0F5a64afjEshDgSR1s/+JeCCmpl
6jaUuga2oydRUAh/wR/zSGgQ3hJRiSmHwGgPX1yXXxtK3bH5BnWnHUvU/B+gceg8
KNHnB/NlYCcuzeHq/Fsizr2B1oWJ34VSTpgMPVL3SM+995FP2RD92IQdtqhO6IrI
EDZUqBlu+IKdYLi/lHTLddnKWo8xs/B9sK/2xES2a4c+t1h2xDKzSaLcSADaAl8A
WePGM5/UHo730V/czKp8
=oWCz
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
