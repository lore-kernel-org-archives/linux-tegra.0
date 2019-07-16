From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 12/24] PM / devfreq: tegra30: Inline all one-line
 functions
Date: Tue, 16 Jul 2019 21:26:11 +0900
Message-ID: <b5634fbe-8bc1-0f04-e13b-6345dfbb5615@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223633epcas4p3873704f3199126be0e8d5cb7454c7a51@epcas4p3.samsung.com>
        <20190707223303.6755-13-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-13-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

I'm not sure that it is necessary.
As I knew, usally, the 'inline' is used on header file
to define the empty functions.

Do we have to change it with 'inline' keyword?

On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
> Depending on a kernel's configuration, a single line functions may not be
> inlined by compiler (like enabled ftracing for example). Let's inline such
> functions explicitly for consistency.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index c6c4a07d3e07..1a10df5dbbed 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -181,28 +181,29 @@ static struct tegra_actmon_emc_ratio actmon_emc_ratios[] = {
>  	{  250000,    100000 },
>  };
>  
> -static u32 actmon_readl(struct tegra_devfreq *tegra, u32 offset)
> +static inline u32 actmon_readl(struct tegra_devfreq *tegra, u32 offset)
>  {
>  	return readl_relaxed(tegra->regs + offset);
>  }
>  
> -static void actmon_writel(struct tegra_devfreq *tegra, u32 val, u32 offset)
> +static inline void actmon_writel(struct tegra_devfreq *tegra,
> +				 u32 val, u32 offset)
>  {
>  	writel_relaxed(val, tegra->regs + offset);
>  }
>  
> -static u32 device_readl(struct tegra_devfreq_device *dev, u32 offset)
> +static inline u32 device_readl(struct tegra_devfreq_device *dev, u32 offset)
>  {
>  	return readl_relaxed(dev->regs + offset);
>  }
>  
> -static void device_writel(struct tegra_devfreq_device *dev, u32 val,
> -			  u32 offset)
> +static inline void device_writel(struct tegra_devfreq_device *dev,
> +				 u32 val, u32 offset)
>  {
>  	writel_relaxed(val, dev->regs + offset);
>  }
>  
> -static unsigned long do_percent(unsigned long val, unsigned int pct)
> +static inline unsigned long do_percent(unsigned long val, unsigned int pct)
>  {
>  	return val * pct / 100;
>  }
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
