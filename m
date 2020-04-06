From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] PM / devfreq: tegra30: Delete an error message in
 tegra_devfreq_probe()
Date: Mon, 6 Apr 2020 09:00:20 +0900
Message-ID: <924a6012-985e-b22d-6f85-e9eb3f03e88b@samsung.com>
References: <CGME20200404184602epcas1p1e0188779ade7c393f9e37a4757e1b6cc@epcas1p1.samsung.com>
        <ba67e238-43a7-6c53-363e-7a2c12f09949@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ba67e238-43a7-6c53-363e-7a2c12f09949-S0/GAf8tV78@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Elfring <Markus.Elfring-S0/GAf8tV78@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 4/5/20 3:45 AM, Markus Elfring wrote:
> From: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> Date: Sat, 4 Apr 2020 20:34:02 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 28b2c7ca416e..93e6f4b25b04 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -807,10 +807,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	}
> 
>  	err = platform_get_irq(pdev, 0);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "Failed to get IRQ: %d\n", err);
> +	if (err < 0)
>  		return err;
> -	}
> +
>  	tegra->irq = err;
> 
>  	irq_set_status_flags(tegra->irq, IRQ_NOAUTOEN);
> --
> 2.26.0
> 
> 
> 

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
