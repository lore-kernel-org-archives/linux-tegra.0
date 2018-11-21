From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] soc/tegra: add of_node_put()
Date: Wed, 21 Nov 2018 13:31:10 +0000
Message-ID: <f38e8b29-d1db-f915-6699-aec9013bfe7e@nvidia.com>
References: <20181121124912.22074-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121124912.22074-1-tiny.windzz@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 21/11/2018 12:49, Yangtao Li wrote:
> of_find_node_by_path() acquires a reference to the node
> returned by it and that reference needs to be dropped by its caller.
> bl_idle_init() doesn't do that, so fix it.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/soc/tegra/common.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
> index cd8f41351add..2e30604c9658 100644
> --- a/drivers/soc/tegra/common.c
> +++ b/drivers/soc/tegra/common.c
> @@ -23,10 +23,13 @@ static const struct of_device_id tegra_machine_match[] = {
>  bool soc_is_tegra(void)
>  {
>  	struct device_node *root;
> +	bool rc;
>  
>  	root = of_find_node_by_path("/");
>  	if (!root)
>  		return false;
>  
> -	return of_match_node(tegra_machine_match, root) != NULL;
> +	rc = of_match_node(tegra_machine_match, root) != NULL;
> +	of_node_put(root);
> +	return rc;
>  }

Thanks for the fix, however, I think it would be even simpler just to
call of_machine_is_compatible() here instead.

Cheers
Jon

-- 
nvpublic
