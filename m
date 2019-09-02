From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] soc/tegra: fuse: Add clock error check in
 tegra_fuse_readl
Date: Mon, 2 Sep 2019 11:45:01 +0100
Message-ID: <95734aa4-c7cb-17a2-fa4c-416a5a40b3e6@nvidia.com>
References: <1566991129-13479-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566991129-13479-1-git-send-email-nkristam@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>, thierry.reding@gmail.com, kishon@ti.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 28/08/2019 12:18, Nagarjuna Kristam wrote:
> Tegra fuse clock handle is retrieved in tegra_fuse_probe().
> tegra_fuse_readl() is exported symbol, which can be called from drivers
> at any time. tegra_fuse_readl() enables fuse clock and reads corresponding
> fuse register offset.
> 
> Calling tegra_fuse_readl() before tegra_fuse_probe(), will cause data
> abort. Add DEFER_PROBE error check for fuse clock in tegra_fuse_readl(),
> to avoid enabling of fuse clock, before clock is available.
> 
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
> index 3eb44e6..21b39b7 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -186,7 +186,7 @@ u32 __init tegra_fuse_read_early(unsigned int offset)
>  
>  int tegra_fuse_readl(unsigned long offset, u32 *value)
>  {
> -	if (!fuse->read)
> +	if (!fuse->read || (PTR_ERR(fuse->clk) == -EPROBE_DEFER))
>  		return -EPROBE_DEFER;

What about the case where fuse->clk is NULL or a different error value?

Jon

-- 
nvpublic
