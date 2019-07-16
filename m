From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 15/24] PM / devfreq: tegra30: Fix integer overflow on
 CPU's freq max out
Date: Tue, 16 Jul 2019 21:32:13 +0900
Message-ID: <bf0cf31f-4a03-f8f5-ac7b-280a384bb09d@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223632epcas4p2c3254e4cc10a71bb1311fcfef582ed39@epcas4p2.samsung.com>
        <20190707223303.6755-16-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-16-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
> There is another kHz-conversion bug in the code, resulting in integer
> overflow. Although, this time the resulting value is 4294966296 and it's
> close to ULONG_MAX, which is okay in this case.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 0de1efdaabf4..60ebf9c9cd86 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -172,7 +172,7 @@ struct tegra_actmon_emc_ratio {
>  };
>  
>  static const struct tegra_actmon_emc_ratio actmon_emc_ratios[] = {
> -	{ 1400000, ULONG_MAX },
> +	{ 1400000, ULONG_MAX / KHZ },
>  	{ 1200000,    750000 },
>  	{ 1100000,    600000 },
>  	{ 1000000,    500000 },
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
