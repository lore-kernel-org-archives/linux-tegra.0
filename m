From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 23/24] PM / devfreq: tegra30: Increase sampling
 period to 16ms
Date: Thu, 18 Jul 2019 19:00:53 +0900
Message-ID: <2dbe4ea5-13af-4b88-5539-b4a738f6fb1c@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223611epcas1p47b94d7e80981515efcc4ef0d7b00733c@epcas1p4.samsung.com>
        <20190707223303.6755-24-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-24-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 7. 8. 오전 7:33, Dmitry Osipenko wrote:
> Increase sampling period by 4ms to get a nicer pow2 value, converting
> diving into shifts in the code. That's more preferable for Tegra30 that
> doesn't have hardware divider instructions because of older Cortex-A9 CPU.
> In a result boosting events are delayed by 4ms, which is not sensible in
> practice at all.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 19e872a64148..bde19b758643 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -71,7 +71,7 @@
>   * translates to 2 ^ (K_VAL + 1). ex: 2 ^ (6 + 1) = 128
>   */
>  #define ACTMON_AVERAGE_WINDOW_LOG2				6
> -#define ACTMON_SAMPLING_PERIOD					12 /* ms */
> +#define ACTMON_SAMPLING_PERIOD					16 /* ms */
>  
>  #define KHZ							1000
>  
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
