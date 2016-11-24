From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Thu, 24 Nov 2016 16:01:01 +0100
Message-ID: <20161124150101.GB26657@ulmo.ba.sec>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <0e3e89a8-a2f1-68c2-0586-58902fb91587@wwwdotorg.org>
 <20161122173042.GA3239@ulmo.ba.sec>
 <CACRpkdbfkv7Yt3cOah_BGcgnqVtxvzWOqm2+HH_rkrpnJt0nFA@mail.gmail.com>
 <20161123194036.GA25876@ulmo.ba.sec>
 <58368A60.2010702@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZoaI/ZTpAVc4A5k6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <58368A60.2010702@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Suresh Mangipudi <smangipudi@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--ZoaI/ZTpAVc4A5k6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2016 at 12:06:16PM +0530, Laxman Dewangan wrote:
>=20
> On Thursday 24 November 2016 01:10 AM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Wed, Nov 23, 2016 at 02:25:51PM +0100, Linus Walleij wrote:
> > >=20
> > > This is already possible and several drivers are doing this.
> > >=20
> > > Everything, all kernel users and all character device users, end up
> > > calling gpiod_request().
> > It looks like I stumbled across the only case where this isn't true.
> > What I was seeing, and which ultimately led me to implement the compact
> > numberspace is that gpiochip_add_data() calls ->get_direction() directly
> > without first going through ->request(). We'd have to guard that one
> > case as well in order for this to work.
> >=20
> In T186, we have 8 pins per PORT and for some of ports, all pins are not
> available. Like Port A has 7 pins valid (0 to 6) and port E have 8 pins (0
> to 7). The great part is that each port has valid pins start from 0.

=46rom what I can tell that's not true. We don't always have 8 pins per
port. That's just the definition that we use to simplify the external
numbering of GPIOs.

> So just having the number of valid pins for each port as part of SOC data
> will help to find out whether GPIO exist or not.
>=20
>        int port =3D GPIO_PORT(offset);
>         int pin =3D GPIO_PIN(offset);
>=20
>       if (pin >=3D tgi->soc->port[port].valid_pins)
>                 return false;

Yes, that's exactly what tegra186_gpio_of_xlate() does, because its job
is to translate from the (sparse) numbering defined in the bindings to
the internal compact numbering.

>=20
> Similar logic can be used for APIs which can get called without
> gpio_request().

No it doesn't. There are currently a couple of cases where these
functions get called without first requesting the GPIO. These are all
internal to gpiolib as far as I can tell, but they all assume that a
GPIO with an index that's within the range from 0 to chip->ngpio will
exist.

On Tegra186 that's not the case, so we have to add code to every
callback to check whether or not a given pin exists. And the subsystem
is not equipped to deal with that properly, because it doesn't allow all
callbacks to return an error.

So, like I said in the other subthread the only way to make this sparse
number scheme work correctly is to implement ->request() and make sure
that all calls to GPIO operations are properly guarded with a call to
->request().

I still don't like very much how we'd be registering GPIOs that don't
exist physically, not only because we waste memory and CPU cycles, but
also because the driver becomes more prone to errors. If ever somebody
added new direct calls to one of the operations in the gpiolib core
without guarding them with ->request() our driver would likely break.

If we absolutely have to use the same numbering internally as in DT, we
need to at least make sure to properly handle accesses to them.

Thierry

--ZoaI/ZTpAVc4A5k6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYNwCrAAoJEN0jrNd/PrOhUlEP/152CL1pwArhg5hluST0HN+d
vPGiL2upzHplrqFFXMfgUF4Frd2llW7RWtR4PxnfxIqeb5DtybUaCIdFj5kaXdPJ
CfWFHa+kbtMdH02PPQakeXb8Gf9OeCk6xM+aJ9ClTbUcCs3WCRoNFbdo5K2wZCJE
v5/Di6ZzWILBfTtqfj1HROk9lhtQmtZvYdXmJOsA9PceWLLm8kzyHVbNXxikF4q0
eMUp72KM87LX7mFXt8Lqf9BwAH7/9Yz5SYCnV18mWEtLQ91gwrW8k20CyNoUtsVs
BbIgQOK6Gjxqu6noSDEDDgaewhU09YtkQJJ0MdDIeZnGlb0tXzD/6XQuVd911Qhs
heJIYJy4TCC6fKSPoK4XjX5gOb0St6+JX6X6M/fSklT78MROwaNLYZ81/1ebGMVB
KKC/L05923M+DNRjFGWH0VvOcfhp31VFJLuu7jvDotiE316zmfpGdpK/VrT1DiHw
rE1uODDBXgKZLkOhYKrOK5HBDnA1bbPNQ1WLf4OQU9G5oCQ6zCdpvn0hNMThk2Eb
hj0/HnLMR3ibzYrwNRYnOSlQLUgZL1pI6a1k0Vp3Iw0s7jG5NBG5p1p+s5LNdHf7
TUdcYjIRRDop1jx3nvFKwXE1fiH2MdX3DEb0yRQ2sfUtBJqWc/OV+lPFrq4pJwV4
lt/sLH3ysPZJQHwX6q83
=Xz4K
-----END PGP SIGNATURE-----

--ZoaI/ZTpAVc4A5k6--
