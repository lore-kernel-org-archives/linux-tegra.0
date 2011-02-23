From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH] ARM: Tegra: Make tegra_dma_init a postcore_initcall
Date: Wed, 23 Feb 2011 09:35:50 -0800
Message-ID: <AANLkTikcO=VH3R5KaxCSJoEyKdueO+Tcr13a9KSJ6MM1@mail.gmail.com>
References: <1298481080-27120-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1298481080-27120-1-git-send-email-swarren@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, olof@lixom.net, konkers@android.com
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 9:11 AM, Stephen Warren <swarren@nvidia.com> wr=
ote:
> The following commit makes the Tegra APB DMA engine fail to initializ=
e
> correctly: 0cf6230af909a86f81907455eca2a5c9b8f68fe6
> ARM: tegra: Move tegra_common_init to tegra_init_early
>
> The reason is that tegra_init_early_ calls tegra_dma_init which calls
> request_threaded_irq, which fails since the IRQ hasn't yet been marke=
d
> valid; that only happens in tegra_init_irq, which gets called after
> tegra_init_early.
>
> This used to work OK, since tegra_init_early was tegra_common_init, w=
hich
> got called after tegra_init_irq, basically from the beginning of
> tegra_harmony_init.
>
> Solve this by converting tegra_dma_init to a postcore_initcall. This =
makes
> it execute late enough that IRQs are marked valid, and avoids having =
to
> add it back to every machine's init function.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> =A0arch/arm/mach-tegra/common.c | =A0 =A03 ---
> =A0arch/arm/mach-tegra/dma.c =A0 =A0| =A0 =A01 +
> =A02 files changed, 1 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/commo=
n.c
> index 516e100..b6ab3f8 100644
> --- a/arch/arm/mach-tegra/common.c
> +++ b/arch/arm/mach-tegra/common.c
> @@ -81,7 +81,4 @@ void __init tegra_init_early(void)
> =A0 =A0 =A0 =A0tegra_init_clock();
> =A0 =A0 =A0 =A0tegra_clk_init_from_table(common_clk_init_table);
> =A0 =A0 =A0 =A0tegra_init_cache();
> -#ifdef CONFIG_TEGRA_SYSTEM_DMA
> - =A0 =A0 =A0 tegra_dma_init();
> -#endif
> =A0}

Can you also drop the #include <mach/dma.h> from common.c?
