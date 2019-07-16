From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 04/24] PM / devfreq: tegra30: Drop write-barrier
Date: Tue, 16 Jul 2019 20:51:19 +0900
Message-ID: <1aaa2e01-dcb3-7499-61ef-0b5fe4b94e77@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223727epcas4p450b911e20b59833cf68975099c7e4bfa@epcas4p4.samsung.com>
        <20190707223303.6755-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-5-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
> There is no need in a write-barrier now, given that interrupt masking is
> handled by CPU's GIC now. Hence we know exactly that interrupt won't fire
> after stopping the devfreq's governor. In other cases we don't care about
> potential buffering of the writes to hardware and thus there is no need to
> stall CPU.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 5e606ae3f238..4be7858c33bc 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -230,12 +230,6 @@ static void tegra_devfreq_update_wmark(struct tegra_devfreq *tegra,
>  		      ACTMON_DEV_LOWER_WMARK);
>  }
>  
> -static void actmon_write_barrier(struct tegra_devfreq *tegra)
> -{
> -	/* ensure the update has reached the ACTMON */
> -	readl(tegra->regs + ACTMON_GLB_STATUS);
> -}
> -
>  static void actmon_isr_device(struct tegra_devfreq *tegra,
>  			      struct tegra_devfreq_device *dev)
>  {
> @@ -287,8 +281,6 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
>  	device_writel(dev, dev_ctrl, ACTMON_DEV_CTRL);
>  
>  	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
> -
> -	actmon_write_barrier(tegra);
>  }
>  
>  static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra,
> @@ -376,8 +368,6 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
>  		tegra_devfreq_update_wmark(tegra, dev);
>  	}
>  
> -	actmon_write_barrier(tegra);
> -
>  	return NOTIFY_OK;
>  }
>  
> @@ -423,8 +413,6 @@ static void tegra_actmon_start(struct tegra_devfreq *tegra)
>  	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++)
>  		tegra_actmon_configure_device(tegra, &tegra->devices[i]);
>  
> -	actmon_write_barrier(tegra);
> -
>  	enable_irq(tegra->irq);
>  }
>  
> @@ -439,8 +427,6 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
>  		device_writel(&tegra->devices[i], ACTMON_INTR_STATUS_CLEAR,
>  			      ACTMON_DEV_INTR_STATUS);
>  	}
> -
> -	actmon_write_barrier(tegra);
>  }
>  
>  static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
