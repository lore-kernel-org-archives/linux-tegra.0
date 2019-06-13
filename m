From: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2] memory: tegra: Fix -Wunused-const-variable
Date: Thu, 13 Jun 2019 11:27:57 -0700
Message-ID: <CAKwvOdnDw4X4odqiwqWze78BjOn04zatnU9WgOcv9Jw3RXLaPA@mail.gmail.com>
References: <CAKwvOdn930hhHcnCA9arJ5=9SsT-6BfFC_1punmUZX2xWM-Hnw@mail.gmail.com>
 <20190613182610.238801-1-nhuck@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613182610.238801-1-nhuck@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nathan Huckleberry <nhuck@google.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 13, 2019 at 11:26 AM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
> Changes from v1 -> v2:
> * Moved definition of tegra124_mc_emem_regs into existing ifdef

Thanks for sending the v2, LGTM.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> --- a/drivers/memory/tegra/tegra124.c
> +++ b/drivers/memory/tegra/tegra124.c
> @@ -33,28 +33,6 @@
>  #define MC_EMEM_ARB_MISC1                      0xdc
>  #define MC_EMEM_ARB_RING1_THROTTLE             0xe0
>
> -static const unsigned long tegra124_mc_emem_regs[] = {
> -       MC_EMEM_ARB_CFG,
> -       MC_EMEM_ARB_OUTSTANDING_REQ,
> -       MC_EMEM_ARB_TIMING_RCD,
> -       MC_EMEM_ARB_TIMING_RP,
> -       MC_EMEM_ARB_TIMING_RC,
> -       MC_EMEM_ARB_TIMING_RAS,
> -       MC_EMEM_ARB_TIMING_FAW,
> -       MC_EMEM_ARB_TIMING_RRD,
> -       MC_EMEM_ARB_TIMING_RAP2PRE,
> -       MC_EMEM_ARB_TIMING_WAP2PRE,
> -       MC_EMEM_ARB_TIMING_R2R,
> -       MC_EMEM_ARB_TIMING_W2W,
> -       MC_EMEM_ARB_TIMING_R2W,
> -       MC_EMEM_ARB_TIMING_W2R,
> -       MC_EMEM_ARB_DA_TURNS,
> -       MC_EMEM_ARB_DA_COVERS,
> -       MC_EMEM_ARB_MISC0,
> -       MC_EMEM_ARB_MISC1,
> -       MC_EMEM_ARB_RING1_THROTTLE
> -};
> -
>  static const struct tegra_mc_client tegra124_mc_clients[] = {
>         {
>                 .id = 0x00,
> @@ -1049,6 +1027,28 @@ static const struct tegra_mc_reset tegra124_mc_resets[] = {
>  };
>
>  #ifdef CONFIG_ARCH_TEGRA_124_SOC
> +static const unsigned long tegra124_mc_emem_regs[] = {
> +       MC_EMEM_ARB_CFG,
> +       MC_EMEM_ARB_OUTSTANDING_REQ,
> +       MC_EMEM_ARB_TIMING_RCD,
> +       MC_EMEM_ARB_TIMING_RP,
> +       MC_EMEM_ARB_TIMING_RC,
> +       MC_EMEM_ARB_TIMING_RAS,
> +       MC_EMEM_ARB_TIMING_FAW,
> +       MC_EMEM_ARB_TIMING_RRD,
> +       MC_EMEM_ARB_TIMING_RAP2PRE,
> +       MC_EMEM_ARB_TIMING_WAP2PRE,
> +       MC_EMEM_ARB_TIMING_R2R,
> +       MC_EMEM_ARB_TIMING_W2W,
> +       MC_EMEM_ARB_TIMING_R2W,
> +       MC_EMEM_ARB_TIMING_W2R,
> +       MC_EMEM_ARB_DA_TURNS,
> +       MC_EMEM_ARB_DA_COVERS,
> +       MC_EMEM_ARB_MISC0,
> +       MC_EMEM_ARB_MISC1,
> +       MC_EMEM_ARB_RING1_THROTTLE
> +};
> +

-- 
Thanks,
~Nick Desaulniers
