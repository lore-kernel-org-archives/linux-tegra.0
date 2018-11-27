From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] net: stmmac: Move debugfs init/exit to
 ->probe()/->remove()
Date: Tue, 27 Nov 2018 15:35:58 +0100
Message-ID: <20181127143558.GA20622@ulmo>
References: <20181123122122.18957-1-thierry.reding@gmail.com>
 <9c8443aa-edaa-2398-bdd8-df49f2529cb6@synopsys.com>
 <20181126153419.GD19710@ulmo>
 <3f5ef823-4683-04f8-5f3a-0ccfdb472d6d@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HlL+5n6rz5pIUxbD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3f5ef823-4683-04f8-5f3a-0ccfdb472d6d@synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <jose.abreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2018 at 09:02:51AM +0000, Jose Abreu wrote:
> On 26-11-2018 15:34, Thierry Reding wrote:
> > On Fri, Nov 23, 2018 at 12:44:02PM +0000, Jose Abreu wrote:
> >> On 23-11-2018 12:21, Thierry Reding wrote:
> >>> From: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Setting up and tearing down debugfs is current unbalanced, as seen by
> >>> this error during resume from suspend:
> >>>
> >>>     [  752.134067] dwc-eth-dwmac 2490000.ethernet eth0: ERROR failed =
to create debugfs directory
> >>>     [  752.134347] dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_set=
up: failed debugFS registration
> >>>
> >>> The imbalance happens because the driver creates the debugfs hierarchy
> >>> when the device is opened and tears it down when the device is closed.
> >>> There's little gain in that, and it could be argued that it is even
> >>> surprising because it's not usually done for other devices. Fix the
> >>> imbalance by moving the debugfs creation and teardown to the driver's
> >>> ->probe() and ->remove() implementations instead.
> >>>
> >>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>> ---
> >>>
> >> Did you test trying to dump "descriptors_status" file when
> >> interface is not open ? I think that's the main reason why this
> >> is not in probe ...
> > Indeed, that seems to cause a hang. Still, it doesn't sound like the
> > right things to repeatedly create and remove debugfs files just because
> > we can't provide the contents when the device is down.
>=20
> Agree.
>=20
> >
> > How about we return an empty file or an error code instead when the
> > interface is down?
>=20
> I think an error code would be more suitable (ENODEV/EBUSY ?).
> Can you submit v2 ?

I submitted a v2 earlier but wanted to elaborate why I ended up going
with an empty file instead of an error code. None of the error codes
seem like a good fit. For example ENODEV might lead people to think that
somehow the device was removed, whereas EBUSY could be misinterpreted as
the device being busy and therefore being unable to dump the status of
the rings.

I was leaning towards EPERM in the end, but then thought that it also
was ambiguous because it could be interpreted as meaning the user lacked
the permissions to query the rings status.

So in the end, it occurred to me that reading the rings status for an
interface that was down wasn't really an error. It's just that there's
no ring structures to dump, so the most logical way to return that was
with success but an empty file.

Thierry

--HlL+5n6rz5pIUxbD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv9VksACgkQ3SOs138+
s6F//RAAj7XNgHmaMGPThRAkeNlSdNIWy7gZy9HIWelfy7D/PanOb+Z1faCrtrcO
846S4PK/ZUbiALOak3ZFa4SXIqmmwcM+X7JZ3AMOPhz/GAT9wIZP+p0MhB8AYXfP
8mwXG8EvCfHEy3cRt/n1cWKGATEhrwsK9VNRatribbQ9XLIFxI5T1S0uPK3X8fmB
+S2kMnYCnOszgw6k7/pLD0Ibs4W2HvMx56INnU+DbQbFbHsB66zyESiynZa710Gp
g9aLZ40NgWI8sIAy7N81er/iiPsV8yil+3BO5TIyIPkj8oARytOghrs6uRM3ZWmP
/w218dckJYh5hvsT5aim0K3vSIW9F9u6yLb3tMGUgjc/+ePxrmaF2dQabAYr4SWA
HXh15ouRwSo7vzMpeGVYqpIx6xGyVJrmnc46uYaoJ+AA+aLFcW9+7qY6k3qBJNWn
vk9+CmZb1Dvo6ZFJTdqj/LO3o1548h21hE3dprBv0VpGx8aX50BZ98ccvpGmxJUU
+/aZQCDQ2NYzxauLju2iusouZ41ZhV6jdXHfWZUoNbXrEi0NdA/GZKJ5HihcH3zV
mw1f3cltjfkaE0nn9jQfWYhS9VHeSONcId7/OEDmu9rtrgQSPtbNPCyokxhAxEpo
pBdBzzTk08RRrKpbTuTLNFkW8yTFdzHjeespnwUDB+FLpPTptek=
=AA+E
-----END PGP SIGNATURE-----

--HlL+5n6rz5pIUxbD--
