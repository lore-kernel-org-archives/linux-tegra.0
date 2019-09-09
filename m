From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: Only enable enhanced
 addressing mode when needed
Date: Mon, 9 Sep 2019 21:11:27 +0200
Message-ID: <20190909191127.GA23804@mithrandir>
References: <20190909152546.383-1-thierry.reding@gmail.com>
 <BN8PR12MB3266B232D3B895A4A4368191D3B70@BN8PR12MB3266.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BN8PR12MB3266B232D3B895A4A4368191D3B70@BN8PR12MB3266.namprd12.prod.outlook.com>
Sender: netdev-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2019 at 04:07:04PM +0000, Jose Abreu wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> Date: Sep/09/2019, 16:25:45 (UTC+00:00)
>=20
> > @@ -92,6 +92,7 @@ struct stmmac_dma_cfg {
> >  	int fixed_burst;
> >  	int mixed_burst;
> >  	bool aal;
> > +	bool eame;
>=20
> bools should not be used in struct's, please change to int.

Huh? Since when? "aal" right above it is also bool. Can you provide a
specific rationale for why we shouldn't use bool in structs?

Thierry

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl12o9YACgkQ3SOs138+
s6FZNhAAs/HF4Oi/hCf8A2C4bHideeNCvGKRu9YRNGKKXXguVI7lKuL42Y124f8/
XGryFA2m75/GPk7QAzzydbzfoL9pxzfREPmVOZMBwcHWtXPWZhe6nWV12YKv7y5f
QYmjHhkuU1lH5GjMbnVXstpvrsCxm1nmRMr4IYiCTrs1Z4f2JCUOd6ULV+RHGZxv
z2evlo3r3PEFERKolVIWySf8JsXDGQVO8FouN1DbAGpAozQpTv609E+smIWwdHqP
QHts0VqiZPMgPb5jYl8qyEKVUZjiRGy3bSutBxteZB0rZb9hGXa8zmsbezkbai77
RBTwIf8l9cFDnxtoHSuZxFXtVxHrrCJStsWaM10pBu5dXXURJkXEmyYKLrz0/Gjo
e8KisHj5YWK8mtscN678q4sgAv6TnjfGi4zc0Emc1hR76dzj0/0AkC3vGWwIyfFs
xIcF+z/LdXsQnSxTfa9TRHf+h1i3goeYrqqllVYoZKRIiRB+XyIYYQ2O947wxdM1
09gjbCCrXlE4OMQkDyJRPSsfzmyGCp/f+qwXIfGbJpyzIiugnk9iX2EMokgLb4ey
s4/QhQASPF9jShtc5hXDzbjUUeIpXIAaXFX+mEoaLGIYeTJFsC3/nwufV7KRqh8D
bGukJ7d7u+rCbWWXWPcSjEjXMzr58yx1f1ta22SspJdIH7XPCbY=
=IXZb
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
