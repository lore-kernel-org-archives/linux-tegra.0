From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] net: stmmac: Move debugfs init/exit to
 ->probe()/->remove()
Date: Mon, 26 Nov 2018 16:34:19 +0100
Message-ID: <20181126153419.GD19710@ulmo>
References: <20181123122122.18957-1-thierry.reding@gmail.com>
 <9c8443aa-edaa-2398-bdd8-df49f2529cb6@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="SFyWQ0h3ruR435lw"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9c8443aa-edaa-2398-bdd8-df49f2529cb6@synopsys.com>
Sender: netdev-owner@vger.kernel.org
To: Jose Abreu <jose.abreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--SFyWQ0h3ruR435lw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 23, 2018 at 12:44:02PM +0000, Jose Abreu wrote:
> On 23-11-2018 12:21, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Setting up and tearing down debugfs is current unbalanced, as seen by
> > this error during resume from suspend:
> >
> >     [  752.134067] dwc-eth-dwmac 2490000.ethernet eth0: ERROR failed to=
 create debugfs directory
> >     [  752.134347] dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup=
: failed debugFS registration
> >
> > The imbalance happens because the driver creates the debugfs hierarchy
> > when the device is opened and tears it down when the device is closed.
> > There's little gain in that, and it could be argued that it is even
> > surprising because it's not usually done for other devices. Fix the
> > imbalance by moving the debugfs creation and teardown to the driver's
> > ->probe() and ->remove() implementations instead.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >
>=20
> Did you test trying to dump "descriptors_status" file when
> interface is not open ? I think that's the main reason why this
> is not in probe ...

Indeed, that seems to cause a hang. Still, it doesn't sound like the
right things to repeatedly create and remove debugfs files just because
we can't provide the contents when the device is down.

How about we return an empty file or an error code instead when the
interface is down?

Thierry

--SFyWQ0h3ruR435lw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv8EnsACgkQ3SOs138+
s6Fb6A//Z2w00B6tsi06+/dvF5NfOBe1/Qe584yHpemrWRQouopxgAxuzUsQ9DkT
ctl5xyuWtoGlpgKJiuOsfFC6/NtbvB104tZ/1P1TSrOqoYKOBZu9TO9dD/kkrEZP
f/Q8qHbqlkbaCz9stdxwzgLQGiUKYq2oOJ9BFmH3Nq73s6VxJtiDc46B5hgNNUwR
sInUnW6eXZSyXidQoNwOjAukXO5OGvE6ALPlBmd3dcQjRRo0OiqB/8NLYhbflcBc
/Pac0Lyr8xOm9ZdhFWB9k9TxYjDkHdaMREVkmGPkOjcr7I3GYqP8928fILd0Mell
pirV6jstA+MiUmELZMyyCnbHPiQ/pj2CY12mmfs6FfYSEF/5vyEpE1rUGKSqhC4r
GJ7E31zWMlP8aOdUfY042BRwAgBuPCSEZFt5GHzfDVt0GqR9AQZi01flfnRUMmrL
TdrJOc1MlNOrGasihTd4NSw8SbuwB+R5UYHEmX7rmlDlXQuWGmB0baCGePOpbYjZ
5uNc4WfA8k7v2gTlW6G+6RuPEAYZHdNtF0W2csZBPm5fJbKPZVOmDwqjwmFwiui6
O+VRu/NhQq5mqRAtCRXaxYrAKkTejABTKTHhIq1EAr+QzVRNZlofV8k8FSGHpWzg
uiTiy1+1GmYa1RiFIclPTruwaNEcEkrjUex3tuZVfy93bUrNP1s=
=T5F5
-----END PGP SIGNATURE-----

--SFyWQ0h3ruR435lw--
