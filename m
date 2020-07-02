From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 10/37] PM / devfreq: tegra20: Silence deferred probe
 error
Date: Thu, 2 Jul 2020 09:56:13 +0900
Message-ID: <14271aed-5fb6-14e1-3fe9-ef8d0c5013c4@samsung.com>
References: <20200609131404.17523-1-digetx@gmail.com>
        <CGME20200609131843epcas1p352d1dfcbca81988d3363036d762dd47f@epcas1p3.samsung.com>
        <20200609131404.17523-11-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200609131404.17523-11-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
> Tegra EMC driver was turned into a regular kernel driver, it also could
> be compiled as a loadable kernel module now. Hence EMC clock isn't

Looks good to me. But, you better to add the commit information
about Tegra EMC driver with commit-id ("patch title") format
into patch descritpion.

> guaranteed to be available and clk_get("emc") may return -EPROBE_DEFER and
> there is no good reason to spam KMSG with a error about missing EMC clock
> in this case, so let's silence the deferred probe error.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/devfreq/tegra20-devfreq.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
> index ff82bac9ee4e..6469dc69c5e0 100644
> --- a/drivers/devfreq/tegra20-devfreq.c
> +++ b/drivers/devfreq/tegra20-devfreq.c
> @@ -141,9 +141,11 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  
>  	/* EMC is a system-critical clock that is always enabled */
>  	tegra->emc_clock = devm_clk_get(&pdev->dev, "emc");
> -	if (IS_ERR(tegra->emc_clock)) {
> -		err = PTR_ERR(tegra->emc_clock);
> -		dev_err(&pdev->dev, "failed to get emc clock: %d\n", err);
> +	err = PTR_ERR_OR_ZERO(tegra->emc_clock);
> +	if (err) {
> +		if (err != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to get emc clock: %d\n",
> +				err);
>  		return err;
>  	}
>  
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
