From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 14/37] PM / devfreq: tegra20: Add error messages to
 tegra_devfreq_target()
Date: Thu, 2 Jul 2020 10:12:24 +0900
Message-ID: <5d83261b-12e5-9734-f793-0600212bcee1@samsung.com>
References: <20200609131404.17523-1-digetx@gmail.com>
        <CGME20200609131736epcas1p1ba2a7c962cc370785327e82c973594b6@epcas1p1.samsung.com>
        <20200609131404.17523-15-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200609131404.17523-15-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
> It's useful to now when something goes wrong instead of failing silently,
> so let's add error messages to tegra_devfreq_target() to prevent situation
> where it fails silently.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/devfreq/tegra20-devfreq.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
> index bf504ca4dea2..249d0dc44f6c 100644
> --- a/drivers/devfreq/tegra20-devfreq.c
> +++ b/drivers/devfreq/tegra20-devfreq.c
> @@ -44,19 +44,25 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
>  	int err;
>  
>  	opp = devfreq_recommended_opp(dev, freq, flags);
> -	if (IS_ERR(opp))
> +	if (IS_ERR(opp)) {
> +		dev_err(dev, "failed to find opp for %lu Hz\n", *freq);
>  		return PTR_ERR(opp);
> +	}
>  
>  	rate = dev_pm_opp_get_freq(opp);
>  	dev_pm_opp_put(opp);
>  
>  	err = clk_set_min_rate(tegra->emc_clock, rate);
> -	if (err)
> +	if (err) {
> +		dev_err(dev, "failed to set min rate: %d\n", err);
>  		return err;
> +	}
>  
>  	err = clk_set_rate(tegra->emc_clock, 0);
> -	if (err)
> +	if (err) {
> +		dev_err(dev, "failed to set rate: %d\n", err);
>  		goto restore_min_rate;
> +	}
>  
>  	return 0;
>  
> 

Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
