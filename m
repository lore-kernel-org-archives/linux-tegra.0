From: Colin Cross <ccross@android.com>
Subject: Re: [PATCH] arm/tegra: add support for tegra30 interrupts
Date: Wed, 2 Nov 2011 11:13:59 -0700
Message-ID: <CAMbhsRQ7JwzQDmFYf7frwfBvvtkUqdENkmrxtMLRvb-PFbixiw@mail.gmail.com>
References: <1320248292-22736-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1320248292-22736-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Gary King <gking@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 2, 2011 at 8:38 AM, Peter De Schrijver
<pdeschrijver@nvidia.com> wrote:
> Tegra30 has 1 extra legacy interrupt controller. Use the GIC ITLinesN=
umber
> field to determine how many interrupt controllers we have and initial=
ize
> appropriately. Also make room for the extra tegra30 interrupts by mov=
ing
> the GPIO IRQ base. This shouldn't affect existing code as it determin=
es the
> correct IRQ number for GPIOs using TEGRA_GPIO_TO_IRQ()
>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
> =A0arch/arm/mach-tegra/include/mach/iomap.h | =A0 =A03 +++
> =A0arch/arm/mach-tegra/include/mach/irqs.h =A0| =A0 14 +++++++-------
> =A0arch/arm/mach-tegra/irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 15 =
++++++++++-----
> =A03 files changed, 20 insertions(+), 12 deletions(-)
>

<snip>

> diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
> index 8ad82af..aad335b 100644
> --- a/arch/arm/mach-tegra/irq.c
> +++ b/arch/arm/mach-tegra/irq.c
<snip>
> @@ -112,8 +114,12 @@ static int tegra_retrigger(struct irq_data *d)
> =A0void __init tegra_init_irq(void)
> =A0{
> =A0 =A0 =A0 =A0int i;
> + =A0 =A0 =A0 void __iomem *distbase;
> +
> + =A0 =A0 =A0 distbase =3D IO_ADDRESS(TEGRA_ARM_INT_DIST_BASE);
> + =A0 =A0 =A0 num_ictlrs =3D readl_relaxed(distbase + GIC_DIST_CTR) &=
 0x1f;

Check num_ictlrs against ARRAY_SIZE(ictlr_reg_base)

Other than that:
Acked-by: Colin Cross <ccross@android.com>
