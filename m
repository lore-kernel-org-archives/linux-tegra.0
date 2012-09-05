From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Input: tegra: move platform data header
Date: Tue, 4 Sep 2012 23:06:00 -0700
Message-ID: <20120905060600.GA25962@core.coreip.homeip.net>
References: <1346798431-28839-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1346798431-28839-1-git-send-email-swarren@wwwdotorg.org>
Sender: linux-input-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 04, 2012 at 04:40:31PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> Move the Tegra KBC platform data header out of arch/arm/mach-tegra, as
> a pre-requisite of single zImage.
> 
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Applied, thank you Stephen.
 
> ---
>  drivers/input/keyboard/tegra-kbc.c                 |    2 +-
>  .../mach/kbc.h => include/linux/input/tegra_kbc.h  |    0
>  2 files changed, 1 insertions(+), 1 deletions(-)
>  rename arch/arm/mach-tegra/include/mach/kbc.h => include/linux/input/tegra_kbc.h (100%)
> 
> diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
> index 2c1c9ed..5faaf25 100644
> --- a/drivers/input/keyboard/tegra-kbc.c
> +++ b/drivers/input/keyboard/tegra-kbc.c
> @@ -29,8 +29,8 @@
>  #include <linux/of.h>
>  #include <linux/clk.h>
>  #include <linux/slab.h>
> +#include <linux/input/tegra_kbc.h>
>  #include <mach/clk.h>
> -#include <mach/kbc.h>
>  
>  #define KBC_MAX_DEBOUNCE_CNT	0x3ffu
>  
> diff --git a/arch/arm/mach-tegra/include/mach/kbc.h b/include/linux/input/tegra_kbc.h
> similarity index 100%
> rename from arch/arm/mach-tegra/include/mach/kbc.h
> rename to include/linux/input/tegra_kbc.h
> -- 
> 1.7.0.4
> 

-- 
Dmitry
