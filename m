From: <Ludovic.Desroches@microchip.com>
Subject: Re: [PATCH 1/4] i2c: at91: Use dma_request_chan() directly for
 channel request
Date: Wed, 13 Nov 2019 13:35:10 +0000
Message-ID: <20191113133458.co7ygdb2wsjvdsbl@M43218.corp.atmel.com>
References: <20191113092235.30440-1-peter.ujfalusi@ti.com>
 <20191113092235.30440-2-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191113092235.30440-2-peter.ujfalusi@ti.com>
Content-Language: en-US
Content-ID: <EFF23070F9667B4CB36A78FFEEEBA31D@namprd11.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: peter.ujfalusi@ti.com
Cc: agross@kernel.org, wsa+renesas@sang-engineering.com, ldewangan@nvidia.com, vkoul@kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, digetx@gmail.com, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, bjorn.andersson@linaro.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 13, 2019 at 11:22:32AM +0200, Peter Ujfalusi wrote:
>=20
> dma_request_slave_channel_reason() is:
> #define dma_request_slave_channel_reason(dev, name) \
> 	dma_request_chan(dev, name)
>=20
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>=20

Thanks
> ---
>  drivers/i2c/busses/i2c-at91-master.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2=
c-at91-master.c
> index 6e0b554dcd4e..7a862e00b475 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -758,14 +758,14 @@ static int at91_twi_configure_dma(struct at91_twi_d=
ev *dev, u32 phy_addr)
>  	slave_config.dst_maxburst =3D 1;
>  	slave_config.device_fc =3D false;
> =20
> -	dma->chan_tx =3D dma_request_slave_channel_reason(dev->dev, "tx");
> +	dma->chan_tx =3D dma_request_chan(dev->dev, "tx");
>  	if (IS_ERR(dma->chan_tx)) {
>  		ret =3D PTR_ERR(dma->chan_tx);
>  		dma->chan_tx =3D NULL;
>  		goto error;
>  	}
> =20
> -	dma->chan_rx =3D dma_request_slave_channel_reason(dev->dev, "rx");
> +	dma->chan_rx =3D dma_request_chan(dev->dev, "rx");
>  	if (IS_ERR(dma->chan_rx)) {
>  		ret =3D PTR_ERR(dma->chan_rx);
>  		dma->chan_rx =3D NULL;
> --=20
> Peter
>=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20
>=20
