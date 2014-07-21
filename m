From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] staging/nvec: Remove double const qualifier
Date: Mon, 21 Jul 2014 22:05:56 +0200
Message-ID: <20140721220556.a5fdbe2a3eaf3c087041a826@gmx.de>
References: <1405943681-2932-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405943681-2932-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 21 Jul 2014 13:54:41 +0200
Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The SIMPLE_DEV_PM_OPS macro already uses the const qualifier, so there's
> no need to repeat it.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

> ---
>  drivers/staging/nvec/nvec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 11f9e1c3447c..aef52306620a 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -959,7 +959,7 @@ static int nvec_resume(struct device *dev)
>  }
>  #endif
>  
> -static const SIMPLE_DEV_PM_OPS(nvec_pm_ops, nvec_suspend, nvec_resume);
> +static SIMPLE_DEV_PM_OPS(nvec_pm_ops, nvec_suspend, nvec_resume);
>  
>  /* Match table for of_platform binding */
>  static const struct of_device_id nvidia_nvec_of_match[] = {
> -- 
> 2.0.1
> 


-- 
Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
