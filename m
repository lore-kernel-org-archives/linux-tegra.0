From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 16/37] PM / devfreq: tegra20: Adjust clocks
 conversion ratio and polling interval
Date: Thu, 2 Jul 2020 10:37:34 +0900
Message-ID: <fef085ec-62e6-58e1-d34c-bfbc7a6a2e71@samsung.com>
References: <20200609131404.17523-1-digetx@gmail.com>
        <CGME20200609131504epcas1p1069393852a0d53f5ea31ded7aff34a93@epcas1p1.samsung.com>
        <20200609131404.17523-17-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200609131404.17523-17-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
> The current conversion ratio results in a higher frequency than needed,
> that is not very actual now since the Display Controller driver got
> support for memory bandwidth management and hence memory frequency can
> go lower now without bad consequences. Since memory freq now goes to a
> lower rates, the responsiveness of interactive applications become worse
> due to a quite high polling interval value that is currently set to 500ms.
> Changing polling interval to 30ms results in a good responsiveness of the
> system.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/devfreq/tegra20-devfreq.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
> index 249d0dc44f6c..7cdea4ba38f7 100644
> --- a/drivers/devfreq/tegra20-devfreq.c
> +++ b/drivers/devfreq/tegra20-devfreq.c
> @@ -79,16 +79,12 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
>  
>  	/*
>  	 * EMC_COUNT returns number of memory events, that number is lower
> -	 * than the number of clocks. Conversion ratio of 1/8 results in a
> -	 * bit higher bandwidth than actually needed, it is good enough for
> -	 * the time being because drivers don't support requesting minimum
> -	 * needed memory bandwidth yet.
> -	 *
> -	 * TODO: adjust the ratio value once relevant drivers will support
> -	 * memory bandwidth management.
> +	 * than the number of total EMC clocks over the sampling period.
> +	 * The clocks number is converted to maximum possible number of
> +	 * memory events using the ratio of 1/4.
>  	 */
>  	stat->busy_time = readl_relaxed(tegra->regs + MC_STAT_EMC_COUNT);
> -	stat->total_time = readl_relaxed(tegra->regs + MC_STAT_EMC_CLOCKS) / 8;
> +	stat->total_time = readl_relaxed(tegra->regs + MC_STAT_EMC_CLOCKS) / 4;
>  	stat->current_frequency = clk_get_rate(tegra->emc_clock);
>  
>  	writel_relaxed(EMC_GATHER_CLEAR, tegra->regs + MC_STAT_CONTROL);
> @@ -98,7 +94,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
>  }
>  
>  static struct devfreq_dev_profile tegra_devfreq_profile = {
> -	.polling_ms	= 500,
> +	.polling_ms	= 30,
>  	.target		= tegra_devfreq_target,
>  	.get_dev_status	= tegra_devfreq_get_dev_status,
>  };
> 

Ackded-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
