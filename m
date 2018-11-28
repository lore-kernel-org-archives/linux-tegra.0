From: Jose Abreu <jose.abreu@synopsys.com>
Subject: Re: [PATCH v2] net: stmmac: Move debugfs init/exit to
 ->probe()/->remove()
Date: Wed, 28 Nov 2018 09:38:32 +0000
Message-ID: <316d6a25-cb61-32d8-9792-8ffcc2122d8a@synopsys.com>
References: <20181123122122.18957-1-thierry.reding@gmail.com>
 <20181127132143.10473-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181127132143.10473-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, "David S. Miller" <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <jose.abreu@synopsys.com>, netdev@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 27-11-2018 13:21, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Setting up and tearing down debugfs is current unbalanced, as seen by
> this error during resume from suspend:
>
>     [  752.134067] dwc-eth-dwmac 2490000.ethernet eth0: ERROR failed to create debugfs directory
>     [  752.134347] dwc-eth-dwmac 2490000.ethernet eth0: stmmac_hw_setup: failed debugFS registration
>
> The imbalance happens because the driver creates the debugfs hierarchy
> when the device is opened and tears it down when the device is closed.
> There's little gain in that, and it could be argued that it is even
> surprising because it's not usually done for other devices. Fix the
> imbalance by moving the debugfs creation and teardown to the driver's
> ->probe() and ->remove() implementations instead.
>
> Note that the ring descriptors cannot be read while the interface is
> down, so make sure to return an empty file when the descriptors_status
> debugfs file is read.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> This applies on top of net-next.
>
> Changes in v2:
> - avoid access to ring descriptors when interface is down
>
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 +++++++++++--------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 076a8be18d67..5551fead8f66 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2550,12 +2550,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
>  			netdev_warn(priv->dev, "PTP init failed\n");
>  	}
>  
> -#ifdef CONFIG_DEBUG_FS
> -	ret = stmmac_init_fs(dev);
> -	if (ret < 0)
> -		netdev_warn(priv->dev, "%s: failed debugFS registration\n",
> -			    __func__);
> -#endif
>  	priv->tx_lpi_timer = STMMAC_DEFAULT_TWT_LS;
>  
>  	if (priv->use_riwt) {
> @@ -2756,10 +2750,6 @@ static int stmmac_release(struct net_device *dev)
>  
>  	netif_carrier_off(dev);
>  
> -#ifdef CONFIG_DEBUG_FS
> -	stmmac_exit_fs(dev);
> -#endif
> -
>  	stmmac_release_ptp(priv);
>  
>  	return 0;
> @@ -3899,6 +3889,9 @@ static int stmmac_sysfs_ring_read(struct seq_file *seq, void *v)
>  	u32 tx_count = priv->plat->tx_queues_to_use;
>  	u32 queue;
>  
> +	if ((dev->flags & IFF_UP) == 0)

I tried looking for an helper to check if interface is open but
couldn't find one so I guess this is the right thing to do.

Acked-by: Jose Abreu <joabreu@synopsys.com>

Thanks and Best Regards,
Jose Miguel Abreu

> +		return 0;
> +
>  	for (queue = 0; queue < rx_count; queue++) {
>  		struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
>  
> @@ -4397,6 +4390,13 @@ int stmmac_dvr_probe(struct device *device,
>  		goto error_netdev_register;
>  	}
>  
> +#ifdef CONFIG_DEBUG_FS
> +	ret = stmmac_init_fs(ndev);
> +	if (ret < 0)
> +		netdev_warn(priv->dev, "%s: failed debugFS registration\n",
> +			    __func__);
> +#endif
> +
>  	return ret;
>  
>  error_netdev_register:
> @@ -4432,6 +4432,9 @@ int stmmac_dvr_remove(struct device *dev)
>  
>  	netdev_info(priv->dev, "%s: removing driver", __func__);
>  
> +#ifdef CONFIG_DEBUG_FS
> +	stmmac_exit_fs(ndev);
> +#endif
>  	stmmac_stop_all_dma(priv);
>  
>  	stmmac_mac_set(priv, priv->ioaddr, false);
