From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] soc/tegra: refactor soc_is_tegra()
Date: Wed, 21 Nov 2018 14:34:57 +0000
Message-ID: <2d534bbb-7b75-8521-bf88-36b52c918d19@nvidia.com>
References: <20181121141204.22819-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181121141204.22819-1-tiny.windzz@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 21/11/2018 14:12, Yangtao Li wrote:
> of_find_node_by_path() acquires a reference to the node returned by
> it and that reference needs to be dropped by its caller.soc_is_tegra()
> doesn't do that, so fix it.Call of_machine_is_compatible() to refactor
> soc_is_tegra() whcih automatically manages the reference count.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/soc/tegra/common.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
> index cd8f41351add..0b40700b672a 100644
> --- a/drivers/soc/tegra/common.c
> +++ b/drivers/soc/tegra/common.c
> @@ -22,11 +22,13 @@ static const struct of_device_id tegra_machine_match[] = {
>  
>  bool soc_is_tegra(void)
>  {
> -	struct device_node *root;
> +	struct of_device_id *match = tegra_machine_match;
>  
> -	root = of_find_node_by_path("/");
> -	if (!root)
> -		return false;
> +	while(match->compatible){
> +		if(of_machine_is_compatible(match->compatible))
> +			return true;
> +		match++;
> +	}
>  
> -	return of_match_node(tegra_machine_match, root) != NULL;
> +	return false;
>  }

Ugh ... sorry, I thought that of_machine_is_compatible() looped through
the matches. OK, let's stick with your initial fix.

Cheers
Jon

-- 
nvpublic
