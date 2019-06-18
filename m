From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Convert to phylink and remove
 phylib logic
Date: Tue, 18 Jun 2019 16:20:33 +0100
Message-ID: <d96f8bea-f7ef-82ae-01ba-9c97aec0ee38@nvidia.com>
References: <cover.1560266175.git.joabreu@synopsys.com>
 <6226d6a0de5929ed07d64b20472c52a86e71383d.1560266175.git.joabreu@synopsys.com>
 <d9ffce3d-4827-fa4a-89e8-0492c4bc1848@nvidia.com>
 <78EB27739596EE489E55E81C33FEC33A0B9C8D6E@DE02WEMBXB.internal.synopsys.com>
 <26cfaeff-a310-3b79-5b57-fd9c93bd8929@nvidia.com>
 <78EB27739596EE489E55E81C33FEC33A0B9C8DD9@DE02WEMBXB.internal.synopsys.com>
 <b66c7578-172f-4443-f4c3-411525e28738@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b66c7578-172f-4443-f4c3-411525e28738@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 18/06/2019 11:18, Jon Hunter wrote:
> 
> On 18/06/2019 10:46, Jose Abreu wrote:
>> From: Jon Hunter <jonathanh@nvidia.com>
>>
>>> I am not certain but I don't believe so. We are using a static IP address
>>> and mounting the root file-system via NFS when we see this ...
>>
>> Can you please add a call to napi_synchronize() before every 
>> napi_disable() calls, like this:
>>
>> if (queue < rx_queues_cnt) {
>> 	napi_synchronize(&ch->rx_napi);
>> 	napi_disable(&ch->rx_napi);
>> }
>>
>> if (queue < tx_queues_cnt) {
>> 	napi_synchronize(&ch->tx_napi);
>> 	napi_disable(&ch->tx_napi);
>> }
>>
>> [ I can send you a patch if you prefer ]
> 
> Yes I can try this and for completeness you mean ...
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 4ca46289a742..d4a12cb64d8e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -146,10 +146,15 @@ static void stmmac_disable_all_queues(struct stmmac_priv *priv)
>         for (queue = 0; queue < maxq; queue++) {
>                 struct stmmac_channel *ch = &priv->channel[queue];
>  
> -               if (queue < rx_queues_cnt)
> +               if (queue < rx_queues_cnt) {
> +                       napi_synchronize(&ch->rx_napi);
>                         napi_disable(&ch->rx_napi);
> -               if (queue < tx_queues_cnt)
> +               }
> +
> +               if (queue < tx_queues_cnt) {
> +                       napi_synchronize(&ch->tx_napi);
>                         napi_disable(&ch->tx_napi);
> +               }
>         }
>  }

So good news and bad news ...

The good news is that the above change does fix the initial crash
I am seeing. However, even with this change applied on top of
-next, it is still dying somewhere else and so there appears to
be a second issue. 

On a successful boot I see ...

[    6.150419] dwc-eth-dwmac 2490000.ethernet: Cannot get CSR clock

[    6.156441] dwc-eth-dwmac 2490000.ethernet: no reset control found

[    6.175866] dwc-eth-dwmac 2490000.ethernet: User ID: 0x10, Synopsys ID: 0x41

[    6.182912] dwc-eth-dwmac 2490000.ethernet: 	DWMAC4/5

[    6.187961] dwc-eth-dwmac 2490000.ethernet: DMA HW capability register supported

[    6.195351] dwc-eth-dwmac 2490000.ethernet: RX Checksum Offload Engine supported

[    6.202735] dwc-eth-dwmac 2490000.ethernet: TX Checksum insertion supported

[    6.209685] dwc-eth-dwmac 2490000.ethernet: Wake-Up On Lan supported

[    6.216041] dwc-eth-dwmac 2490000.ethernet: TSO supported

[    6.221433] dwc-eth-dwmac 2490000.ethernet: Enable RX Mitigation via HW Watchdog Timer

[    6.229342] dwc-eth-dwmac 2490000.ethernet: device MAC address 9a:9b:49:6f:a5:ee

[    6.236727] dwc-eth-dwmac 2490000.ethernet: TSO feature enabled

[    6.242689] libphy: stmmac: probed

On the latest -next with the patch applied I see ...

[    6.043529] dwc-eth-dwmac 2490000.ethernet: Cannot get CSR clock
[    6.049546] dwc-eth-dwmac 2490000.ethernet: no reset control found
[    6.068895] dwc-eth-dwmac 2490000.ethernet: User ID: 0x10, Synopsys ID: 0x41
[    6.075941] dwc-eth-dwmac 2490000.ethernet: 	DWMAC4/5
[    6.080989] dwc-eth-dwmac 2490000.ethernet: DMA HW capability register supported
[    6.088373] dwc-eth-dwmac 2490000.ethernet: RX Checksum Offload Engine supported
[    6.095756] dwc-eth-dwmac 2490000.ethernet: TX Checksum insertion supported
[    6.102708] dwc-eth-dwmac 2490000.ethernet: Wake-Up On Lan supported
[    6.109074] dwc-eth-dwmac 2490000.ethernet: TSO supported
[    6.114465] dwc-eth-dwmac 2490000.ethernet: Enable RX Mitigation via HW Watchdog Timer
[    6.122373] dwc-eth-dwmac 2490000.ethernet: device MAC address ee:3a:9a:b0:7e:34
[    6.129756] dwc-eth-dwmac 2490000.ethernet: TSO feature enabled

And it dies here. No more output is seen. I will try to figure
out which commit is causing this issue.

Cheers
Jon

-- 
nvpublic
