From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 12/37] PM / devfreq: tegra20: Use MC timings for
 building OPP table
Date: Thu, 2 Jul 2020 13:18:18 +0900
Message-ID: <4ea7fe00-7676-3186-8222-6e0d0eb8ed1f@samsung.com>
References: <20200609131404.17523-1-digetx@gmail.com>
        <CGME20200609131458epcas1p2c774a0302bcef2c02790c2cb8cad57a0@epcas1p2.samsung.com>
        <20200609131404.17523-13-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200609131404.17523-13-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Georgi Djakov <georgi.djakov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

On 6/9/20 10:13 PM, Dmitry Osipenko wrote:
> The clk_round_rate() won't be usable for building OPP table once
> interconnect support will be added to the EMC driver because that CLK API
> function limits the rounded rate based on the clk rate that is imposed by
> active clk-users, and thus, the rounding won't work as expected if
> interconnect will set the minimum EMC clock rate before devfreq driver is
> loaded. The struct tegra_mc contains memory timings which could be used by
> the devfreq driver for building up OPP table instead of rounding clock
> rate, this patch implements this idea.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/devfreq/tegra20-devfreq.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra20-devfreq.c b/drivers/devfreq/tegra20-devfreq.c
> index 6469dc69c5e0..bf504ca4dea2 100644
> --- a/drivers/devfreq/tegra20-devfreq.c
> +++ b/drivers/devfreq/tegra20-devfreq.c
> @@ -123,8 +123,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  {
>  	struct tegra_devfreq *tegra;
>  	struct tegra_mc *mc;
> -	unsigned long max_rate;
> -	unsigned long rate;
> +	unsigned int i;
>  	int err;
>  
>  	mc = tegra_get_memory_controller();
> @@ -151,12 +150,17 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  
>  	tegra->regs = mc->regs;
>  
> -	max_rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
> -
> -	for (rate = 0; rate <= max_rate; rate++) {
> -		rate = clk_round_rate(tegra->emc_clock, rate);
> +	if (!mc->num_timings) {

Could you explain what is meaning of 'num_timing?
Also, why add the opp entry in case of mc->num_timings is zero?

> +		err = dev_pm_opp_add(&pdev->dev,
> +				     clk_get_rate(tegra->emc_clock), 0);
> +		if (err) {
> +			dev_err(&pdev->dev, "failed to add OPP: %d\n", err);
> +			return err;
> +		}
> +	}
>  
> -		err = dev_pm_opp_add(&pdev->dev, rate, 0);
> +	for (i = 0; i < mc->num_timings; i++) {
> +		err = dev_pm_opp_add(&pdev->dev, mc->timings[i].rate, 0);
>  		if (err) {
>  			dev_err(&pdev->dev, "failed to add opp: %d\n", err);
>  			goto remove_opps;
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
