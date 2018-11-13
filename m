From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] soc/tegra: remove duplicated function declaration
Date: Tue, 13 Nov 2018 19:02:53 +0000
Message-ID: <c57a2c48-d247-04f4-2e68-0fecca5b6260@nvidia.com>
References: <1542131465-22773-1-git-send-email-byan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542131465-22773-1-git-send-email-byan@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bo Yan <byan@nvidia.com>, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 13/11/2018 17:51, Bo Yan wrote:
> The function tegra_read_chipid is declared twice in fuse.h. Remove
> the redundant declaration.
> 
> Signed-off-by: Bo Yan <byan@nvidia.com>
> ---
>  include/soc/tegra/fuse.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
> index 9b6ea0c..8fb2f8a 100644
> --- a/include/soc/tegra/fuse.h
> +++ b/include/soc/tegra/fuse.h
> @@ -60,7 +60,6 @@ struct tegra_sku_info {
>  
>  u32 tegra_read_straps(void);
>  u32 tegra_read_ram_code(void);
> -u32 tegra_read_chipid(void);
>  int tegra_fuse_readl(unsigned long offset, u32 *value);
>  
>  extern struct tegra_sku_info tegra_sku_info;

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
