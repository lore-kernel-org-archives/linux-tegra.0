From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/4] reset: tegra: check BPMP response return code
Date: Mon, 2 Oct 2017 21:24:04 +0100
Message-ID: <f5096c39-6026-d912-f283-ba7511fa4e93@nvidia.com>
References: <cover.1504776489.git.talho@nvidia.com>
 <00e7714871d7568e9fc848dc5f76d14e07984a1e.1504776489.git.talho@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <00e7714871d7568e9fc848dc5f76d14e07984a1e.1504776489.git.talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 07/09/17 10:31, Timo Alho wrote:
> Add checks for return code in BPMP response message.
> 
> Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/reset/tegra/reset-bpmp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/tegra/reset-bpmp.c b/drivers/reset/tegra/reset-bpmp.c
> index 5daf2ee..fac2db6 100644
> --- a/drivers/reset/tegra/reset-bpmp.c
> +++ b/drivers/reset/tegra/reset-bpmp.c
> @@ -23,6 +23,7 @@ static int tegra_bpmp_reset_common(struct reset_controller_dev *rstc,
>  	struct tegra_bpmp *bpmp = to_tegra_bpmp(rstc);
>  	struct mrq_reset_request request;
>  	struct tegra_bpmp_message msg;
> +	int err;
>  
>  	memset(&request, 0, sizeof(request));
>  	request.cmd = command;
> @@ -33,7 +34,13 @@ static int tegra_bpmp_reset_common(struct reset_controller_dev *rstc,
>  	msg.tx.data = &request;
>  	msg.tx.size = sizeof(request);
>  
> -	return tegra_bpmp_transfer(bpmp, &msg);
> +	err = tegra_bpmp_transfer(bpmp, &msg);
> +	if (err < 0)
> +		return err;
> +	else if (msg.rx.ret < 0)
> +		return -EINVAL;
> +
> +	return 0;
>  }
>  
>  static int tegra_bpmp_reset_module(struct reset_controller_dev *rstc,

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
