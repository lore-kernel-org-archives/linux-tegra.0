From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] net: stmmac: Move debugfs init/exit to
 ->probe()/->remove()
Date: Wed, 28 Nov 2018 10:41:19 +0100
Message-ID: <20181128094119.GH17419@ulmo>
References: <20181123122122.18957-1-thierry.reding@gmail.com>
 <20181127132143.10473-1-thierry.reding@gmail.com>
 <316d6a25-cb61-32d8-9792-8ffcc2122d8a@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="/9ZOS6odDaRI+0hI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <316d6a25-cb61-32d8-9792-8ffcc2122d8a@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <jose.abreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--/9ZOS6odDaRI+0hI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2018 at 09:38:32AM +0000, Jose Abreu wrote:
> On 27-11-2018 13:21, Thierry Reding wrote:
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
> > Note that the ring descriptors cannot be read while the interface is
> > down, so make sure to return an empty file when the descriptors_status
> > debugfs file is read.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > This applies on top of net-next.
> >
> > Changes in v2:
> > - avoid access to ring descriptors when interface is down
> >
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 +++++++++++--------
> >  1 file changed, 13 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 076a8be18d67..5551fead8f66 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -2550,12 +2550,6 @@ static int stmmac_hw_setup(struct net_device *de=
v, bool init_ptp)
> >  			netdev_warn(priv->dev, "PTP init failed\n");
> >  	}
> > =20
> > -#ifdef CONFIG_DEBUG_FS
> > -	ret =3D stmmac_init_fs(dev);
> > -	if (ret < 0)
> > -		netdev_warn(priv->dev, "%s: failed debugFS registration\n",
> > -			    __func__);
> > -#endif
> >  	priv->tx_lpi_timer =3D STMMAC_DEFAULT_TWT_LS;
> > =20
> >  	if (priv->use_riwt) {
> > @@ -2756,10 +2750,6 @@ static int stmmac_release(struct net_device *dev)
> > =20
> >  	netif_carrier_off(dev);
> > =20
> > -#ifdef CONFIG_DEBUG_FS
> > -	stmmac_exit_fs(dev);
> > -#endif
> > -
> >  	stmmac_release_ptp(priv);
> > =20
> >  	return 0;
> > @@ -3899,6 +3889,9 @@ static int stmmac_sysfs_ring_read(struct seq_file=
 *seq, void *v)
> >  	u32 tx_count =3D priv->plat->tx_queues_to_use;
> >  	u32 queue;
> > =20
> > +	if ((dev->flags & IFF_UP) =3D=3D 0)
>=20
> I tried looking for an helper to check if interface is open but
> couldn't find one so I guess this is the right thing to do.

Yeah, I had done the same thing and came up empty-handed.

> Acked-by: Jose Abreu <joabreu@synopsys.com>

Thanks!
Thierry

--/9ZOS6odDaRI+0hI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv+Yr4ACgkQ3SOs138+
s6GLpw/9Gm1I3bb+4A/cCUEPmPMW7CsfwJXDoVKUD44P7C+S4T0j+RjGRpGWQzgN
gIHV5HEBgFWJWNSLUZnWXBTObeGU5qrhkT6hfSxrVw0+V+4aOKM7qUTgydD3V1Du
7JVd9iAUj6lMPUdpKyDIEgw7GEE7Cb2ja54RX5Z7lPRFqiW26VGz1keNaE9EKctk
qQgX6aXvmifRj9DxJQWSOaZr0T8uZwjm6HxwKrvZa7KoIrWE78pnI380IMAWinUs
aaLd/pxSDIuhpbK+O+jPKA0ixbiLHYxNliyGABKk8QekcXuxvlxF5rgTN6BvvWAw
zf4ePjCveawRNPhb80oxE5YIdNnwvZQ//ba6J77P16eGOM2YgxL65BwIaYPEe1Tf
w/t7u6P4fAyRRaQL3k2ECPdfLvKPgoiUcd3/Xmo5PHZT3CFNtpvdl+CCFCawPt/A
HTNGHP14NZtfoNtqXOVO1omZ15+3TxG8JWKXjitJ0wQbACxb2aBKfcXLBoY7XFhh
yJB5TXY9e+aL3GoDoFTAxgj8avHqBmYZ4LYU2SbQtqjENC9Oh+DUyXU2AEjXqMoV
D21ZdMIvooLxFcyRQCdK8rXq4fQ+GHfX3YUv6z3xk09GbEa4qZIOJNqXpA8O1Z1T
d8dSyLkLWQQmdYe1LTIBRJgpPsvG0CJWaXnGLEgYCCeVZwKhlW8=
=8+GH
-----END PGP SIGNATURE-----

--/9ZOS6odDaRI+0hI--
