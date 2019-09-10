From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: Only enable enhanced
 addressing mode when needed
Date: Tue, 10 Sep 2019 15:54:27 +0200
Message-ID: <20190910135427.GB9897@ulmo>
References: <20190909152546.383-1-thierry.reding@gmail.com>
 <BN8PR12MB3266B232D3B895A4A4368191D3B70@BN8PR12MB3266.namprd12.prod.outlook.com>
 <20190909191127.GA23804@mithrandir>
 <BN8PR12MB3266850280A788D41C277B08D3B60@BN8PR12MB3266.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BN8PR12MB3266850280A788D41C277B08D3B60@BN8PR12MB3266.namprd12.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2019 at 08:32:38AM +0000, Jose Abreu wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> Date: Sep/09/2019, 20:11:27 (UTC+00:00)
>=20
> > On Mon, Sep 09, 2019 at 04:07:04PM +0000, Jose Abreu wrote:
> > > From: Thierry Reding <thierry.reding@gmail.com>
> > > Date: Sep/09/2019, 16:25:45 (UTC+00:00)
> > >=20
> > > > @@ -92,6 +92,7 @@ struct stmmac_dma_cfg {
> > > >  	int fixed_burst;
> > > >  	int mixed_burst;
> > > >  	bool aal;
> > > > +	bool eame;
> > >=20
> > > bools should not be used in struct's, please change to int.
> >=20
> > Huh? Since when? "aal" right above it is also bool. Can you provide a
> > specific rationale for why we shouldn't use bool in structs?
>=20
> Please see https://lkml.org/lkml/2017/11/21/384.

The context is slightly different here. stmmac_dma_cfg exists once for
each of these ethernet devices in the system, and I would assume that in
the vast majority of cases there's exactly one such device in the system
so the potential size increase is very small. On the other hand, there
are potentially very many struct sched_dl_entity, so the size impact is
multiplied.

Anyway, if you insist I'll rewrite this to use an unsigned int bitfield.

Thierry

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl13qxAACgkQ3SOs138+
s6Gtlw/+PebnFYt7gpCYJwV+uclDuC52tBtJfP3xyipRbTfKpM01hAZ66jlbMHXo
biTf5b5Xy6PBS7aIQcDWakm4J853T9n/4maQK5whR//YTCh0Gf2h+68WoB1IdnYW
lRAYLk/knUUE6hHVG0HFKEc8WuCR+4vEOvT4K8odKqBzv0xdj2lhpvtOOisWenAz
sf5qVUDXTGgCrB3ofBA1ZOzWaLDAA+961v1mQyLv35/Qayix1xRkI2mFHSGwlqzG
UiQtQiPd5c56TKKk1GLjzaE/dtst0DGCpeMnAeZAw6DZPGjrfId3OmsZP2VZMUAC
5+t9UDKDVWyS9HL2iRYAwa6YRXRBBJ1gAzaDwTf2RHSal37qU2PbgGQRtjtDJft4
yUW+uk32XQ6qD70jFmSoO/2pA5izBeuquKtJG8HVdM+FiayuYAg8SKX541Z55+Xs
yehBhr0A+Z9jyq07wPuKqp7rez3KH+IyDZ4eyyEbUmOqqG1ZNOG4s5c4FfwMA8Cp
+CQSQ13D2QWj54TeXVf6lyRU5Vhm2gPZHv3ahwB2s6yGc8V5E4DbNH47DoKAbzGY
mh2gA6MhDIlNS7v4ZeVthhwmbq6dWYXz46Dlc7Y0GgvHF9MkHXmip3Aq0ndXSF36
SMfu5YkcPIAbLpFqj2H/jA53sAPi33iyeXqkNacZUm7npf13NcU=
=mn/8
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
