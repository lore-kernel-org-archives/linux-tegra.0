From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] net: stmmac: Move debugfs init/exit to
 ->probe()/->remove()
Date: Fri, 23 Nov 2018 14:12:31 +0100
Message-ID: <20181123131231.GB21651@ulmo>
References: <20181123122122.18957-1-thierry.reding@gmail.com>
 <9c8443aa-edaa-2398-bdd8-df49f2529cb6@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9c8443aa-edaa-2398-bdd8-df49f2529cb6@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <jose.abreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--61jdw2sOBCFtR2d/
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

I can't say that I did. I'll run a couple more tests and see if I can
fix both of the issues.

Thierry

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv3/LoACgkQ3SOs138+
s6HYpQ/+NA43XmFdoOhzRJjZZqjcPO9spvtNYupeIUjcSJUeMQQErnJkCimsSzfO
w7hfmHi2o81v1gwvnjPO6oU8dmIMQXbfSSkKsDaIuAz5bBKIZn3eL1+dAL+1aABk
D+y/oiYYT3sFFKIOIcisxIIVw9oMXfyD/JNclwHjNrYt7HiUeYi0pdKTjDz02IZT
WlF/yvnFIaiGOCQDVNJ4zCxsKPnlutyZbg4TlyrvApFXLX64uDyNIMCWvQBAtY7f
92gAvs0/J+6E/0/bDulHLVIoPxRX8oo/Ar6FfRsYJCK6+T3J+TnVJaUNhJoVNA4r
GprA5ncNTUsjVxfMNtXuLpABcebqqcxMEUXYiBKwphrjg7PwBTFiGwE74vZPIlmB
oG8YkaopH06f17+7/6nx9z4eLSPZBNWFGhaIUPYQq42TmmQKSqb5OYA2blndGaCa
xtlCG/YomKwY1J71bUI30zTRV4254aTwtJCOl3l5OHs583Bhi+iN2VtL3eC/5iAE
XMn5HcP9qgI7951a+QXpNS9SEJqZsDuGrG48qkdnNAzhwQu4DWjKGoa/rY1L/8AD
VJBC1ustpfGVp8hZwxxfYRsKLp6tbIOHUVA8OT1I0i/Iz4zzwY+Mbem4QCam3fuH
hmfXx0U16mBV6XpyfFxLgacdm81KMbpwGqTtVsaLFTvqkImUaJ4=
=RqG/
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
