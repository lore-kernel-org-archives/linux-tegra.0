From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: Fix page pool size
Date: Mon, 23 Sep 2019 12:00:31 +0200
Message-ID: <20190923100031.GB11084@ulmo>
References: <20190923095915.11588-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190923095915.11588-1-thierry.reding@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Florian Fainelli <f.fainelli@gmail.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, Jon Hunter <jonathanh@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2019 at 11:59:15AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The size of individual pages in the page pool in given by an order. The
> order is the binary logarithm of the number of pages that make up one of
> the pages in the pool. However, the driver currently passes the number
> of pages rather than the order, so it ends up wasting quite a bit of
> memory.
>=20
> Fix this by taking the binary logarithm and passing that in the order
> field.
>=20
> Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

I fumbled the git format-patch incantation. This should've been marked
v2.

Thierry

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index ecd461207dbc..f8c90dba6db8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1550,13 +1550,15 @@ static int alloc_dma_rx_desc_resources(struct stm=
mac_priv *priv)
>  	for (queue =3D 0; queue < rx_count; queue++) {
>  		struct stmmac_rx_queue *rx_q =3D &priv->rx_queue[queue];
>  		struct page_pool_params pp_params =3D { 0 };
> +		unsigned int num_pages;
> =20
>  		rx_q->queue_index =3D queue;
>  		rx_q->priv_data =3D priv;
> =20
>  		pp_params.flags =3D PP_FLAG_DMA_MAP;
>  		pp_params.pool_size =3D DMA_RX_SIZE;
> -		pp_params.order =3D DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE);
> +		num_pages =3D DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE);
> +		pp_params.order =3D ilog2(num_pages);
>  		pp_params.nid =3D dev_to_node(priv->device);
>  		pp_params.dev =3D priv->device;
>  		pp_params.dma_dir =3D DMA_FROM_DEVICE;
> --=20
> 2.23.0
>=20

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2Il78ACgkQ3SOs138+
s6FM4Q/9Gd/rzVqwfDtVKsf1YAs1NNO2QuQZ8P5UAKyvmNHygU1fRfmPLc3GcCNj
z+Xjq6VUeFkeW1Da5m+uwayp2SnmKAz3HtzKX96lKr2401xt4voN1NbDYIGBWErD
ulusmz8Jz8LA9X7HZevXBOuozJZf0XwnePoYQ2yt3yRq7YMn/dwnasbjTgazP5uY
gc1cs1gUoUhxxeddWxeq+ODo6mN3B+S7c+f8yJpJfY6GWAPtHPCH/xiyWsMTqiIE
X9oIcOhUfo3Yyh7IammZSTbv0qItMHLdIQOtsdcfeawir7GEdQIZyWYR1TQjjDXg
x2J2p7vATq1ns4YG9b1oS+WziiCLVCjvm+5VR8oA2w84xCsJoU0VvnAv4X1G6ojZ
Bav/lLGMJFfvpOWoTzCmkPZWhrL739i6jUQbQ1QpP/zzgBueigpWpKWIQHHFCHIg
j7QpcpYVJI9S2jvmzp8bfHTHQdGRYpNdfyBrMClmFpof5vqhUKPtp6mv6FaXUMp4
fp9J1Cx4hoU25GuB2cKfS9MiDzXyjR9dlr2sdVK9B9lSx3d8QOpYTgbocuzivhkC
uroqKGwqLC8sl3Sv1TT1vLYLFd/2HbTVsRtlqOGnKLFWpe5PRMxNbiBno6B+yICw
XmxJOk1Xsm8BRcwl5D06LU+447Ai/5Z0vbaGDLYIyYG33m0zzEY=
=BgL2
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
