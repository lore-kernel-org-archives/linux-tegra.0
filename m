From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Support enhanced addressing
 mode for DWMAC 4.10
Date: Mon, 9 Sep 2019 21:13:29 +0200
Message-ID: <20190909191329.GB23804@mithrandir>
References: <20190909152546.383-1-thierry.reding@gmail.com>
 <20190909152546.383-2-thierry.reding@gmail.com>
 <BN8PR12MB3266AAC6FF4819EC25CB087BD3B70@BN8PR12MB3266.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BN8PR12MB3266AAC6FF4819EC25CB087BD3B70@BN8PR12MB3266.namprd12.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2019 at 04:05:52PM +0000, Jose Abreu wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> Date: Sep/09/2019, 16:25:46 (UTC+00:00)
>=20
> > @@ -79,6 +79,10 @@ static void dwmac4_dma_init_rx_chan(void __iomem *io=
addr,
> >  	value =3D value | (rxpbl << DMA_BUS_MODE_RPBL_SHIFT);
> >  	writel(value, ioaddr + DMA_CHAN_RX_CONTROL(chan));
> > =20
> > +	if (dma_cfg->eame)
>=20
> There is no need for this check. If EAME is not enabled then upper 32=20
> bits will be zero.

The idea here was to potentially guard against this register not being
available on some revisions. Having the check here would avoid access to
the register if the device doesn't support enhanced addressing.

>=20
> > +		writel(upper_32_bits(dma_rx_phy),
> > +		       ioaddr + DMA_CHAN_RX_BASE_ADDR_HI(chan));
> > +
> >  	writel(lower_32_bits(dma_rx_phy), ioaddr + DMA_CHAN_RX_BASE_ADDR(chan=
));
> >  }
>=20
> > @@ -97,6 +101,10 @@ static void dwmac4_dma_init_tx_chan(void __iomem *i=
oaddr,
> > =20
> >  	writel(value, ioaddr + DMA_CHAN_TX_CONTROL(chan));
> > =20
> > +	if (dma_cfg->eame)
>=20
> Same here.
>=20
> > +		writel(upper_32_bits(dma_tx_phy),
> > +		       ioaddr + DMA_CHAN_TX_BASE_ADDR_HI(chan));
> > +
> >  	writel(lower_32_bits(dma_tx_phy), ioaddr + DMA_CHAN_TX_BASE_ADDR(chan=
));
> >  }
>=20
> Also, please provide a cover letter in next submission.

Alright, will do.

Thierry

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl12pFkACgkQ3SOs138+
s6ETZA//e0WU5Hrb5t7pZZJ4aMic/ZLKBTWhpHFIWs2viAiezlw3okqBevLUWQ9s
UGS5OJgTsdpdSng+6PlL235LiIAAlvEMup3qwW3m4elEkxx4VrLcyH1S6AZabxZ4
F/ntmiJHDOLMNGQknuPqZhKcqTm7Ybci7MzRfYBZnQF+GNOBG7rld2CC0kYPV9mm
b58HEq+CdSnJE1u1531lt785PGkJVekNhr4FDP9nXTamvUcR9bHooK9C8qBf/I/U
TXG0lOKu2R3hvSJBnoAUffDboA2+Y0jZD/oZnjmsXzGU5YYvZgqxS95vObsDVZri
LwvDOkwG4X6tveTp74nc3gLoUScsKx4aNfYqlxmTCito8r8DGijEgVUOp7Fnhjcy
QxQ2D/VBb7AJSMa2xi22lYU1/FhCISFJQ6D0w7eCM95G/hlIdSRzzo2o1yXOFxKb
RvH7v7rsPDUzU8jDXtD86R5Dsea/TaFnPRM4kCQrCopXY8pQoR6YQ7xHmTp4remu
vP6BrZAk20ApsMD4G8KhPI5n0URKadOtN+bkWJrsBGaw8HLwR6ricq84j67Whibi
lmeDt+jCxPMCvRSHMrGnh3pha7Km7fto4QjtSq+ZJndfTuNeqxt1D68n9FNnxHGP
V2Ck0tGw31Ui629CrHaZQgqfpQb1swosPAUuK3AnuAnImkgMfws=
=kFia
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
