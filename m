From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: paz00: Fix board pinmux table.
Date: Sat, 15 Oct 2011 18:34:22 +0200
Message-ID: <201110151834.22732.marvin24@gmx.de>
References: <1318691913-9597-1-git-send-email-leon@leon.nu>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318691913-9597-1-git-send-email-leon-2ukJVAZIZ/Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Leon,

Am Samstag 15 Oktober 2011, 17:18:33 schrieb Leon Romanovsky:
> This fix updates the CDEV1 pinmux for the paz00 board to be as in the
> Harmony board. Paz00 board is originally based on Harmony design.

the fact that this patch makes sound work on paz00 does not necessary mean
that this is the "right thing" to do. First, the initial state should be
TRISTATE, because sound layer should switch between NORMAL/TRISTATE 
automaticly to save some power. Second, Android has TEGRA_PUPD_PULL_DOWN 
with sound working and I didn't found out yet why this also works.

So there is something strange going on and we should first find out what
it is. Furthermore, there is no codec (ALC5632) and no glue for paz00 yet 
in the mainline kernel (and of course no board support for it) so this can 
still wait IMHO.

I will include your patch in the series which will add sound support once
the fog has lifted a bit.

Thanks

Marc

> Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-paz00-pinmux.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/board-paz00-pinmux.c b/arch/arm/mach-tegra/board-paz00-pinmux.c
> index bdd2627..7de8182 100644
> --- a/arch/arm/mach-tegra/board-paz00-pinmux.c
> +++ b/arch/arm/mach-tegra/board-paz00-pinmux.c
> @@ -27,7 +27,7 @@ static struct tegra_pingroup_config paz00_pinmux[] = {
>  	{TEGRA_PINGROUP_ATC,   TEGRA_MUX_GMI,           TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
>  	{TEGRA_PINGROUP_ATD,   TEGRA_MUX_GMI,           TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
>  	{TEGRA_PINGROUP_ATE,   TEGRA_MUX_GMI,           TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
> -	{TEGRA_PINGROUP_CDEV1, TEGRA_MUX_PLLA_OUT,      TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
> +	{TEGRA_PINGROUP_CDEV1, TEGRA_MUX_PLLA_OUT,      TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
>  	{TEGRA_PINGROUP_CDEV2, TEGRA_MUX_PLLP_OUT4,     TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_NORMAL},
>  	{TEGRA_PINGROUP_CRTP,  TEGRA_MUX_CRT,           TEGRA_PUPD_NORMAL,    TEGRA_TRI_TRISTATE},
>  	{TEGRA_PINGROUP_CSUS,  TEGRA_MUX_PLLC_OUT1,     TEGRA_PUPD_PULL_DOWN, TEGRA_TRI_TRISTATE},
> 
