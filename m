From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCHv2 4/4] ARM: tegra: irq: Add tegra_eoi
Date: Tue, 03 May 2011 10:29:33 +0100
Message-ID: <1304414973.27863.2.camel@e102144-lin.cambridge.arm.com>
References: <1304284213-11950-5-git-send-email-ccross@android.com>
	<1304288854-11011-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1304288854-11011-1-git-send-email-ccross@android.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Colin Cross <ccross@android.com>
Cc: Russell King <linux@arm.linux.org.uk>, Erik Gilling <konkers@android.com>, Marc Zyngier <Marc.Zyngier@arm.com>, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-tegra <linux-tegra@vger.kernel.org>, lakml <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Hi Colin,

On Sun, 2011-05-01 at 23:27 +0100, Colin Cross wrote:
> Implement irq_eoi to allow the GIC irq chip flow controller to
> be changed to fasteoi.
> 
> Signed-off-by: Colin Cross <ccross@android.com>
> ---
> v2: Add tegra_eoi without removing tegra_ack, patch can now be
>     merged safely before Will Deacon's gic fasteoi patch
> 
>  arch/arm/mach-tegra/irq.c |    9 +++++++++
>  1 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
> index da17491..4956c3c 100644
> --- a/arch/arm/mach-tegra/irq.c
> +++ b/arch/arm/mach-tegra/irq.c
> @@ -95,6 +95,14 @@ static void tegra_ack(struct irq_data *d)
>         tegra_irq_write_mask(d->irq, ICTLR_CPU_IEP_FIR_CLR);
>  }
> 
> +static void tegra_eoi(struct irq_data *d)
> +{
> +       if (d->irq < FIRST_LEGACY_IRQ)
> +               return;
> +
> +       tegra_irq_write_mask(d->irq, ICTLR_CPU_IEP_FIR_CLR);
> +}
> +
>  static int tegra_retrigger(struct irq_data *d)
>  {
>         if (d->irq < FIRST_LEGACY_IRQ)
> @@ -116,6 +124,7 @@ void __init tegra_init_irq(void)
>         }
> 
>         gic_arch_extn.irq_ack = tegra_ack;
> +       gic_arch_extn.irq_eoi = tegra_eoi;
>         gic_arch_extn.irq_mask = tegra_mask;
>         gic_arch_extn.irq_unmask = tegra_unmask;
>         gic_arch_extn.irq_retrigger = tegra_retrigger;
> --
> 1.7.4.1

Just the job!

Acked-by: Will Deacon <will.deacon@arm.com>

Thanks,

Will
