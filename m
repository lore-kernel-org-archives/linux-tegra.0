From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Fix error handling
Date: Tue, 11 Apr 2017 11:38:59 +0300
Message-ID: <2df1f833-15f2-07fc-7949-a8bde1b8e7ab@kapsi.fi>
References: <20170410202922.17665-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170410202922.17665-1-christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10.04.2017 23:29, Christophe JAILLET wrote:
> If 'devm_reset_control_get' returns an error, then we erroneously return
> success because error code is taken from 'host->clk' instead of
> 'host->rst'.
>
> Fixes: b386c6b73ac6 ("gpu: host1x: Support module reset")
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
> ---
>  drivers/gpu/host1x/dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> index f05ebb14fa63..ac65f52850a6 100644
> --- a/drivers/gpu/host1x/dev.c
> +++ b/drivers/gpu/host1x/dev.c
> @@ -172,7 +172,7 @@ static int host1x_probe(struct platform_device *pdev)
>
>  	host->rst = devm_reset_control_get(&pdev->dev, "host1x");
>  	if (IS_ERR(host->rst)) {
> -		err = PTR_ERR(host->clk);
> +		err = PTR_ERR(host->rst);
>  		dev_err(&pdev->dev, "failed to get reset: %d\n", err);
>  		return err;
>  	}
>

Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
