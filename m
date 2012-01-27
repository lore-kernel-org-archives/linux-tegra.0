From: Murali N <nalajala.murali@gmail.com>
Subject: Re: [PATCH v1 8/8] ARM: tegra: support for secondary cores on Tegra30
Date: Fri, 27 Jan 2012 11:28:47 +0530
Message-ID: <CAF0Txbpy-oeTkdotDVcoFUu50F7OLvxv_1PKwwxVb_UBmfnOmA@mail.gmail.com>
References: <1327597641-7519-1-git-send-email-pdeschrijver@nvidia.com>
	<1327597641-7519-9-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1327597641-7519-9-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, Gary King <gking@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 26, 2012 at 10:37 PM, Peter De Schrijver
<pdeschrijver@nvidia.com> wrote:
>
> Add support for bringing up secondary cores on Tegra30. On Tegra30 se=
condary
> CPU cores are powergated, so we need to turn on the domains before we=
 can bring
> the CPU cores online. Bringing secondary cores online happens early d=
uring the
> ssytem boot, so we call powergating initialization from platform earl=
y_init

small spelling correction "system"

> function.
>
> Based on work by:
>
> Scott Williams <scwilliams@nvidia.com>
> Colin Cross <ccross@android.com>
> Alex Frid <afrid@nvidia.com>
>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
> =C2=A0arch/arm/mach-tegra/headsmp.S | =C2=A0 32 +++++++++++++++++++++=
++++
> =C2=A0arch/arm/mach-tegra/platsmp.c | =C2=A0 52 +++++++++++++++++++++=
+++++++++++++++++++-
> =C2=A02 files changed, 83 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/headsmp.S b/arch/arm/mach-tegra/head=
smp.S
> index bb13e22..925c4a0 100644
> --- a/arch/arm/mach-tegra/headsmp.S
> +++ b/arch/arm/mach-tegra/headsmp.S
> @@ -188,6 +188,38 @@ __die:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0str =C2=A0 =C2=A0 r1, [r7, #0x340] =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ CLK_RST_CPU_CMPLX_SET
> =C2=A0#endif
> =C2=A01:
> +#ifdef CONFIG_ARCH_TEGRA_3x_SOC
> + =C2=A0 =C2=A0 =C2=A0 mov32 =C2=A0 r6, TEGRA_FLOW_CTRL_BASE
> +
> + =C2=A0 =C2=A0 =C2=A0 cmp =C2=A0 =C2=A0 r10, #0
> + =C2=A0 =C2=A0 =C2=A0 moveq =C2=A0 r1, #FLOW_CTRL_HALT_CPU0_EVENTS
> + =C2=A0 =C2=A0 =C2=A0 moveq =C2=A0 r2, #FLOW_CTRL_CPU0_CSR
> + =C2=A0 =C2=A0 =C2=A0 movne =C2=A0 r1, r10, lsl #3
> + =C2=A0 =C2=A0 =C2=A0 addne =C2=A0 r2, r1, #(FLOW_CTRL_CPU1_CSR-8)
> + =C2=A0 =C2=A0 =C2=A0 addne =C2=A0 r1, r1, #(FLOW_CTRL_HALT_CPU1_EVE=
NTS-8)
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Clear CPU "event" and "interrupt" flags and=
 power gate
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0it when halting but not before it=
 is in the "WFI" state. */
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r0, [r6, +r2]
> + =C2=A0 =C2=A0 =C2=A0 orr =C2=A0 =C2=A0 r0, r0, #FLOW_CTRL_CSR_INTR_=
=46LAG | FLOW_CTRL_CSR_EVENT_FLAG
> + =C2=A0 =C2=A0 =C2=A0 orr =C2=A0 =C2=A0 r0, r0, #FLOW_CTRL_CSR_ENABL=
E
> + =C2=A0 =C2=A0 =C2=A0 str =C2=A0 =C2=A0 r0, [r6, +r2]
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Unconditionally halt this CPU */
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r0, #FLOW_CTRL_WAITEVENT
> + =C2=A0 =C2=A0 =C2=A0 str =C2=A0 =C2=A0 r0, [r6, +r1]
> + =C2=A0 =C2=A0 =C2=A0 ldr =C2=A0 =C2=A0 r0, [r6, +r1] =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @ memory barrier
> +
> + =C2=A0 =C2=A0 =C2=A0 dsb
> + =C2=A0 =C2=A0 =C2=A0 isb
> + =C2=A0 =C2=A0 =C2=A0 wfi =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 @ CPU should be power gated here
> +
> + =C2=A0 =C2=A0 =C2=A0 /* If the CPU didn't power gate above just kil=
l it's clock. */
> +
> + =C2=A0 =C2=A0 =C2=A0 mov =C2=A0 =C2=A0 r0, r11, lsl #8
> + =C2=A0 =C2=A0 =C2=A0 str =C2=A0 =C2=A0 r0, [r7, #348] =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@ CLK_CPU_CMPLX_SET
> +#endif
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the CPU still isn't dead, just spin =
here. */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0b =C2=A0 =C2=A0 =C2=A0 .
> =C2=A0ENDPROC(__tegra_cpu_reset_handler)
> diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/plat=
smp.c
> index fa1178d..672a751 100644
> --- a/arch/arm/mach-tegra/platsmp.c
> +++ b/arch/arm/mach-tegra/platsmp.c
> @@ -24,7 +24,9 @@
> =C2=A0#include <asm/mach-types.h>
> =C2=A0#include <asm/smp_scu.h>
>
> +#include <mach/clk.h>
> =C2=A0#include <mach/iomap.h>
> +#include <mach/powergate.h>
>
> =C2=A0#include "chipid.h"
> =C2=A0#include "flowctrl.h"
> @@ -42,6 +44,8 @@ static void __iomem *scu_base =3D IO_ADDRESS(TEGRA_=
ARM_PERIF_BASE);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(IO_ADDRESS(TEGRA_CLK_RESET_BASE) + 0x340)
> =C2=A0#define CLK_RST_CONTROLLER_RST_CPU_CMPLX_CLR \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(IO_ADDRESS(TEGRA_CLK_RESET_BASE) + 0x344)
> +#define CLK_RST_CONTROLLER_CLK_CPU_CMPLX_CLR \
> + =C2=A0 =C2=A0 =C2=A0 (IO_ADDRESS(TEGRA_CLK_RESET_BASE) + 0x34c)
>
> =C2=A0#define CPU_CLOCK(cpu) (0x1<<(8+cpu))
> =C2=A0#define CPU_RESET(cpu) (0x1111ul<<(cpu))
> @@ -73,11 +77,54 @@ static int tegra20_power_up_cpu(unsigned int cpu)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> +static int tegra30_power_up_cpu(unsigned int cpu)
> +{
> + =C2=A0 =C2=A0 =C2=A0 u32 reg;
> + =C2=A0 =C2=A0 =C2=A0 int ret, pwrgateid;
> + =C2=A0 =C2=A0 =C2=A0 unsigned long timeout;
> +
> + =C2=A0 =C2=A0 =C2=A0 pwrgateid =3D tegra_cpu_powergate_id(cpu);
> + =C2=A0 =C2=A0 =C2=A0 if (pwrgateid < 0)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return pwrgateid;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* If this is the first boot, toggle powergate=
s directly. */
> + =C2=A0 =C2=A0 =C2=A0 if (!tegra_powergate_is_powered(pwrgateid)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D tegra_powe=
rgate_power_on(pwrgateid);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 return ret;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Wait for the po=
wer to come up. */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout =3D jiffie=
s + 10*HZ;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if (tegra_powergate_is_powered(pwrgateid))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto remove_clamps;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 udelay(10);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } while (time_befo=
re(jiffies, timeout));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ETIMEDOUT;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> +remove_clamps:
> + =C2=A0 =C2=A0 =C2=A0 /* CPU partition is powered. Enable the CPU cl=
ock. */
> + =C2=A0 =C2=A0 =C2=A0 writel(CPU_CLOCK(cpu), CLK_RST_CONTROLLER_CLK_=
CPU_CMPLX_CLR);
> + =C2=A0 =C2=A0 =C2=A0 reg =3D readl(CLK_RST_CONTROLLER_CLK_CPU_CMPLX=
_CLR);
> + =C2=A0 =C2=A0 =C2=A0 udelay(10);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Remove I/O clamps. */
> + =C2=A0 =C2=A0 =C2=A0 ret =3D tegra_powergate_remove_clamping(pwrgat=
eid);
> + =C2=A0 =C2=A0 =C2=A0 udelay(10);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Clear flow controller CSR. */
> + =C2=A0 =C2=A0 =C2=A0 flowctrl_write_cpu_csr(cpu, 0);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> =C2=A0int __cpuinit boot_secondary(unsigned int cpu, struct task_stru=
ct *idle)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int status;
>
> - =C2=A0 =C2=A0 =C2=A0 /* Force the CPU into reset. The CPU must rema=
in in reset when the
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* Force the CPU into reset. The CPU must=
 remain in reset when the
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * flow controller state is cleared (which=
 will cause the flow
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * controller to stop driving reset if the=
 CPU has been power-gated
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 * via the flow controller). This will hav=
e no effect on first boot
> @@ -98,6 +145,9 @@ int __cpuinit boot_secondary(unsigned int cpu, str=
uct task_struct *idle)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case TEGRA20:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D teg=
ra20_power_up_cpu(cpu);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> + =C2=A0 =C2=A0 =C2=A0 case TEGRA30:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D tegra30=
_power_up_cpu(cpu);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D -EI=
NVAL;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> --
> 1.7.7.rc0.72.g4b5ea.dirty
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel




--
Regards,
Murali N
