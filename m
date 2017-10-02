From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/4] soc/tegra: bpmp: check BPMP response return code
Date: Mon, 2 Oct 2017 21:26:12 +0100
Message-ID: <c4d1211c-e861-7cd4-ba4e-cf2a1c36165d@nvidia.com>
References: <cover.1504776489.git.talho@nvidia.com>
 <8be4357544ffb9a60e116bc0a666189b93951c91.1504776489.git.talho@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8be4357544ffb9a60e116bc0a666189b93951c91.1504776489.git.talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
>  drivers/soc/tegra/powergate-bpmp.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/tegra/powergate-bpmp.c b/drivers/soc/tegra/powergate-bpmp.c
> index 8fc3560..82c7e27 100644
> --- a/drivers/soc/tegra/powergate-bpmp.c
> +++ b/drivers/soc/tegra/powergate-bpmp.c
> @@ -42,6 +42,7 @@ static int tegra_bpmp_powergate_set_state(struct tegra_bpmp *bpmp,
>  {
>  	struct mrq_pg_request request;
>  	struct tegra_bpmp_message msg;
> +	int err;
>  
>  	memset(&request, 0, sizeof(request));
>  	request.cmd = CMD_PG_SET_STATE;
> @@ -53,7 +54,13 @@ static int tegra_bpmp_powergate_set_state(struct tegra_bpmp *bpmp,
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
>  static int tegra_bpmp_powergate_get_state(struct tegra_bpmp *bpmp,
> @@ -80,6 +87,8 @@ static int tegra_bpmp_powergate_get_state(struct tegra_bpmp *bpmp,
>  	err = tegra_bpmp_transfer(bpmp, &msg);
>  	if (err < 0)
>  		return PG_STATE_OFF;
> +	else if (msg.rx.ret < 0)
> +		return -EINVAL;
>  
>  	return response.get_state.state;
>  }
> @@ -106,6 +115,8 @@ static int tegra_bpmp_powergate_get_max_id(struct tegra_bpmp *bpmp)
>  	err = tegra_bpmp_transfer(bpmp, &msg);
>  	if (err < 0)
>  		return err;
> +	else if (msg.rx.ret < 0)
> +		return -EINVAL;
>  
>  	return response.get_max_id.max_id;
>  }
> @@ -132,7 +143,7 @@ static char *tegra_bpmp_powergate_get_name(struct tegra_bpmp *bpmp,
>  	msg.rx.size = sizeof(response);
>  
>  	err = tegra_bpmp_transfer(bpmp, &msg);
> -	if (err < 0)
> +	if (err < 0 || msg.rx.ret < 0)
>  		return NULL;
>  
>  	return kstrdup(response.get_name.name, GFP_KERNEL);

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
