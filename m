From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] cpufreq: tegra186: Simplify probe return path
Date: Mon, 13 Jul 2020 08:58:02 +0530
Message-ID: <20200713032802.u4ubftfgwtixkaj3@vireshk-i7>
References: <20200712100645.13927-1-jonathanh@nvidia.com>
 <20200712100645.13927-2-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200712100645.13927-2-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12-07-20, 11:06, Jon Hunter wrote:
> We always put the reference to BPMP device on exit of the Tegra186
> CPUFREQ driver and so there is no need to have separate exit paths
> for success and failure. Therefore, simplify the probe return path
> in the Tegra186 CPUFREQ driver by combining the success and failure
> paths.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/cpufreq/tegra186-cpufreq.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
> index c44190ce3f03..bf8cab357277 100644
> --- a/drivers/cpufreq/tegra186-cpufreq.c
> +++ b/drivers/cpufreq/tegra186-cpufreq.c
> @@ -231,15 +231,9 @@ static int tegra186_cpufreq_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	tegra_bpmp_put(bpmp);
> -
>  	tegra186_cpufreq_driver.driver_data = data;
>  
>  	err = cpufreq_register_driver(&tegra186_cpufreq_driver);
> -	if (err)
> -		return err;
> -
> -	return 0;
>  
>  put_bpmp:
>  	tegra_bpmp_put(bpmp);

Applied. Thanks.

-- 
viresh
