From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 06/24] PM / devfreq: tegra30: Tune up boosting
 thresholds
Date: Tue, 16 Jul 2019 20:55:15 +0900
Message-ID: <fe402767-430b-7554-c1c5-c75d7dcd04aa@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223648epcas5p29ffd69f96e6ab840877647be14df6b0b@epcas5p2.samsung.com>
        <20190707223303.6755-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-7-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
> Now that average-sustain coefficient / multiplier is gone, it won't hurt
> to re-tune the boosting thresholds to get a bit harder boosting for MCALL
> clients, resulting in a more reactive governing in a case of multimedia
> applications usage like 3d / video.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 16f7e6cf3b99..2bf65409ddd8 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -111,8 +111,8 @@ static struct tegra_devfreq_device_config actmon_device_configs[] = {
>  		.irq_mask = 1 << 26,
>  		.boost_up_coeff = 200,
>  		.boost_down_coeff = 50,
> -		.boost_up_threshold = 60,
> -		.boost_down_threshold = 40,
> +		.boost_up_threshold = 50,
> +		.boost_down_threshold = 25,
>  	},
>  	{
>  		/* MCCPU: memory accesses from the CPUs */
> 

It just adjusts the tunable point.
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
