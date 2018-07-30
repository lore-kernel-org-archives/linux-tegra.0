From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/4] ASoC: tegra: i2s: Fix typo/broken macro
Date: Mon, 30 Jul 2018 09:58:09 +0100
Message-ID: <f9e2eaad-bd5c-2e3d-f2a7-d7ea5f3a237c@nvidia.com>
References: <20180727125931.9794-1-jorge.sanjuan@codethink.co.uk>
 <20180727125931.9794-2-jorge.sanjuan@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727125931.9794-2-jorge.sanjuan@codethink.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>, lgirdwood@gmail.com, broonie@kernel.org
Cc: thierry.reding@gmail.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org


On 27/07/18 13:59, Jorge Sanjuan wrote:
> From: Edward Cragg <edward.cragg@codethink.co.uk>
> 
> Fix typo in macro TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK.
> 
> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
> Signed-off-by: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
> ---
>  sound/soc/tegra/tegra30_i2s.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/tegra/tegra30_i2s.h b/sound/soc/tegra/tegra30_i2s.h
> index 774fc6ad2026..2e561e946de2 100644
> --- a/sound/soc/tegra/tegra30_i2s.h
> +++ b/sound/soc/tegra/tegra30_i2s.h
> @@ -173,7 +173,7 @@
>  /* Number of slots in frame, minus 1 */
>  #define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT		16
>  #define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK_US	7
> -#define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK		(TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOT_MASK_US << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOT_SHIFT)
> +#define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK		(TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK_US << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT)
>  
>  /* TDM mode slot enable bitmask */
>  #define TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT	8

Thanks for fixing.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
