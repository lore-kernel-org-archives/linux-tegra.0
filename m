From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH V3 1/5] ARM: tegra: add pending SGI checking API
Date: Mon, 17 Dec 2012 18:42:24 -0800
Message-ID: <CAMbhsRSorDf-BebFn+t39zOK4VX4N0Fu0iPrM7XpKZcssTgX9A@mail.gmail.com>
References: <1355797861-12759-1-git-send-email-josephl@nvidia.com>
 <1355797861-12759-2-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1355797861-12759-2-git-send-email-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Warren <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 17, 2012 at 6:30 PM, Joseph Lo <josephl@nvidia.com> wrote:
> The "powered-down" CPU idle mode of Tegra cut off the vdd_cpu rail, it
> include the power of GIC. That caused the SGI (Software Generated
> Interrupt) been lost. Because the SGI can't wake up the CPU that in
> the "powered-down" CPU idle mode. We need to check if there is any
> pending SGI when go into "powered-down" CPU idle mode. This is important
> especially when applying the coupled cpuidle framework into "power-down"
> cpuidle dirver. Because the coupled cpuidle framework may have the
> chance that misses IPI_SINGLE_FUNC handling sometimes.

This problem exists for any GIC-based SoC, and needs to be fixed in
gic_cpu_save or gic_dist_save, whichever one loses the interrupt.

> For the PPI or SPI, something like the legacy peripheral interrupt. It
> still can be maintained by Tegra legacy interrupt controller. If there
> is any pending PPI or SPI when CPU in "powered-down" CPU idle mode. The
> CPU can be woken up immediately. So we don't need to take care the same
> situation for PPI or SPI.
>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> V3:
> * move the static mapping of GIC addr into tegra_pending_sgi
> V2:
> * new in V2
> ---
>  arch/arm/mach-tegra/irq.c |   15 +++++++++++++++
>  arch/arm/mach-tegra/irq.h |   22 ++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-tegra/irq.h
>
> diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
> index b7886f1..c9976e3 100644
> --- a/arch/arm/mach-tegra/irq.c
> +++ b/arch/arm/mach-tegra/irq.c
> @@ -45,6 +45,8 @@
>
>  #define FIRST_LEGACY_IRQ 32
>
> +#define SGI_MASK 0xFFFF
> +
>  static int num_ictlrs;
>
>  static void __iomem *ictlr_reg_base[] = {
> @@ -55,6 +57,19 @@ static void __iomem *ictlr_reg_base[] = {
>         IO_ADDRESS(TEGRA_QUINARY_ICTLR_BASE),
>  };
>
> +bool tegra_pending_sgi(void)
> +{
> +       u32 pending_set;
> +       void __iomem *distbase = IO_ADDRESS(TEGRA_ARM_INT_DIST_BASE);
> +
> +       pending_set = readl_relaxed(distbase + GIC_DIST_PENDING_SET);
> +
> +       if (pending_set & SGI_MASK)
> +               return true;
> +
> +       return false;
> +}
> +
>  static inline void tegra_irq_write_mask(unsigned int irq, unsigned long reg)
>  {
>         void __iomem *base;
> diff --git a/arch/arm/mach-tegra/irq.h b/arch/arm/mach-tegra/irq.h
> new file mode 100644
> index 0000000..5142649
> --- /dev/null
> +++ b/arch/arm/mach-tegra/irq.h
> @@ -0,0 +1,22 @@
> +/*
> + * Copyright (c) 2012, NVIDIA Corporation. All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __TEGRA_IRQ_H
> +#define __TEGRA_IRQ_H
> +
> +bool tegra_pending_sgi(void);
> +
> +#endif
> --
> 1.7.0.4
>
