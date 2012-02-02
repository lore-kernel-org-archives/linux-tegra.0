From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 8/8] ARM: tegra: support for secondary cores on Tegra30
Date: Thu, 2 Feb 2012 10:17:48 -0800
Message-ID: <CAMbhsRQf0fKbRA5cFvW=uArqPPDw-273zFHLVZAoTb_7qKxu=w@mail.gmail.com>
References: <1328028051-24271-1-git-send-email-pdeschrijver@nvidia.com>
	<1328028051-24271-9-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328028051-24271-9-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 31, 2012 at 8:40 AM, Peter De Schrijver
<pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Add support for bringing up secondary cores on Tegra30. On Tegra30 se=
condary
> CPU cores are powergated, so we need to turn on the domains before we=
 can bring
> the CPU cores online. Bringing secondary cores online happens early d=
uring the
> sytem boot, so we call powergating initialization from platform early=
_init
> function.
>
> Based on work by:
>
> Scott Williams <scwilliams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> Alex Frid <afrid-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/headsmp.S | =A0 32 +++++++++++++++++++++++++
> =A0arch/arm/mach-tegra/platsmp.c | =A0 52 +++++++++++++++++++++++++++=
+++++++++++++-
> =A02 files changed, 83 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/headsmp.S b/arch/arm/mach-tegra/head=
smp.S
> index bb13e22..925c4a0 100644
> --- a/arch/arm/mach-tegra/headsmp.S
> +++ b/arch/arm/mach-tegra/headsmp.S
> @@ -188,6 +188,38 @@ __die:
> =A0 =A0 =A0 =A0str =A0 =A0 r1, [r7, #0x340] =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0@ CLK_RST_CPU_CMPLX_SET
> =A0#endif
> =A01:
> +#ifdef CONFIG_ARCH_TEGRA_3x_SOC
> + =A0 =A0 =A0 mov32 =A0 r6, TEGRA_FLOW_CTRL_BASE
> +
> + =A0 =A0 =A0 cmp =A0 =A0 r10, #0
> + =A0 =A0 =A0 moveq =A0 r1, #FLOW_CTRL_HALT_CPU0_EVENTS
> + =A0 =A0 =A0 moveq =A0 r2, #FLOW_CTRL_CPU0_CSR
> + =A0 =A0 =A0 movne =A0 r1, r10, lsl #3
> + =A0 =A0 =A0 addne =A0 r2, r1, #(FLOW_CTRL_CPU1_CSR-8)
> + =A0 =A0 =A0 addne =A0 r1, r1, #(FLOW_CTRL_HALT_CPU1_EVENTS-8)
> +
> + =A0 =A0 =A0 /* Clear CPU "event" and "interrupt" flags and power ga=
te
> + =A0 =A0 =A0 =A0 =A0it when halting but not before it is in the "WFI=
" state. */
> + =A0 =A0 =A0 ldr =A0 =A0 r0, [r6, +r2]
> + =A0 =A0 =A0 orr =A0 =A0 r0, r0, #FLOW_CTRL_CSR_INTR_FLAG | FLOW_CTR=
L_CSR_EVENT_FLAG
> + =A0 =A0 =A0 orr =A0 =A0 r0, r0, #FLOW_CTRL_CSR_ENABLE
> + =A0 =A0 =A0 str =A0 =A0 r0, [r6, +r2]
> +
> + =A0 =A0 =A0 /* Unconditionally halt this CPU */
> + =A0 =A0 =A0 mov =A0 =A0 r0, #FLOW_CTRL_WAITEVENT
> + =A0 =A0 =A0 str =A0 =A0 r0, [r6, +r1]
> + =A0 =A0 =A0 ldr =A0 =A0 r0, [r6, +r1] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 @ memory barrier
> +
> + =A0 =A0 =A0 dsb
> + =A0 =A0 =A0 isb
> + =A0 =A0 =A0 wfi =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 @ CPU should be power gated here
> +
> + =A0 =A0 =A0 /* If the CPU didn't power gate above just kill it's cl=
ock. */
> +
> + =A0 =A0 =A0 mov =A0 =A0 r0, r11, lsl #8
> + =A0 =A0 =A0 str =A0 =A0 r0, [r7, #348] =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0@ CLK_CPU_CMPLX_SET
> +#endif
> +
> =A0 =A0 =A0 =A0/* If the CPU still isn't dead, just spin here. */
> =A0 =A0 =A0 =A0b =A0 =A0 =A0 .
> =A0ENDPROC(__tegra_cpu_reset_handler)
> diff --git a/arch/arm/mach-tegra/platsmp.c b/arch/arm/mach-tegra/plat=
smp.c
> index 79a241a..1fe3f58 100644
> --- a/arch/arm/mach-tegra/platsmp.c
> +++ b/arch/arm/mach-tegra/platsmp.c
> @@ -24,7 +24,9 @@
> =A0#include <asm/mach-types.h>
> =A0#include <asm/smp_scu.h>
>
> +#include <mach/clk.h>
> =A0#include <mach/iomap.h>
> +#include <mach/powergate.h>
>
> =A0#include "fuse.h"
> =A0#include "flowctrl.h"
> @@ -42,6 +44,8 @@ static void __iomem *scu_base =3D IO_ADDRESS(TEGRA_=
ARM_PERIF_BASE);
> =A0 =A0 =A0 =A0(IO_ADDRESS(TEGRA_CLK_RESET_BASE) + 0x340)
> =A0#define CLK_RST_CONTROLLER_RST_CPU_CMPLX_CLR \
> =A0 =A0 =A0 =A0(IO_ADDRESS(TEGRA_CLK_RESET_BASE) + 0x344)
> +#define CLK_RST_CONTROLLER_CLK_CPU_CMPLX_CLR \
> + =A0 =A0 =A0 (IO_ADDRESS(TEGRA_CLK_RESET_BASE) + 0x34c)
>
> =A0#define CPU_CLOCK(cpu) (0x1<<(8+cpu))
> =A0#define CPU_RESET(cpu) (0x1111ul<<(cpu))
> @@ -73,11 +77,54 @@ static int tegra20_power_up_cpu(unsigned int cpu)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> +static int tegra30_power_up_cpu(unsigned int cpu)
> +{
> + =A0 =A0 =A0 u32 reg;
> + =A0 =A0 =A0 int ret, pwrgateid;
> + =A0 =A0 =A0 unsigned long timeout;
> +
> + =A0 =A0 =A0 pwrgateid =3D tegra_cpu_powergate_id(cpu);
> + =A0 =A0 =A0 if (pwrgateid < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return pwrgateid;
> +
> + =A0 =A0 =A0 /* If this is the first boot, toggle powergates directl=
y. */
> + =A0 =A0 =A0 if (!tegra_powergate_is_powered(pwrgateid)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D tegra_powergate_power_on(pwrgat=
eid);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Wait for the power to come up. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 timeout =3D jiffies + 10*HZ;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 do {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (tegra_powergate_is_=
powered(pwrgateid))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto re=
move_clamps;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 udelay(10);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } while (time_before(jiffies, timeout))=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ETIMEDOUT;
> + =A0 =A0 =A0 }

This loop + goto seems convoluted.  Why not untangle it:
                timeout =3D jiffies + 10*HZ;
  =A0 =A0 =A0         while (tegra_powergate_is_powered(pwrgateid)) {
          =A0 =A0 =A0   =A0 =A0 =A0 if (time_after(jiffies, timeout))
  =A0 =A0 =A0           =A0 =A0 =A0   =A0 =A0 =A0 return -ETIMEDOUT;
          =A0 =A0 =A0   =A0 =A0 =A0 udelay(10);
  =A0 =A0 =A0         }

> +
> +remove_clamps:
> + =A0 =A0 =A0 /* CPU partition is powered. Enable the CPU clock. */
> + =A0 =A0 =A0 writel(CPU_CLOCK(cpu), CLK_RST_CONTROLLER_CLK_CPU_CMPLX=
_CLR);
> + =A0 =A0 =A0 reg =3D readl(CLK_RST_CONTROLLER_CLK_CPU_CMPLX_CLR);
> + =A0 =A0 =A0 udelay(10);
> +
> + =A0 =A0 =A0 /* Remove I/O clamps. */
> + =A0 =A0 =A0 ret =3D tegra_powergate_remove_clamping(pwrgateid);
> + =A0 =A0 =A0 udelay(10);
> +
> + =A0 =A0 =A0 /* Clear flow controller CSR. */
> + =A0 =A0 =A0 flowctrl_write_cpu_csr(cpu, 0);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> =A0int __cpuinit boot_secondary(unsigned int cpu, struct task_struct =
*idle)
> =A0{
> =A0 =A0 =A0 =A0int status;
>
> - =A0 =A0 =A0 /* Force the CPU into reset. The CPU must remain in res=
et when the
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Force the CPU into reset. The CPU must remain in r=
eset when the
> =A0 =A0 =A0 =A0 * flow controller state is cleared (which will cause =
the flow
> =A0 =A0 =A0 =A0 * controller to stop driving reset if the CPU has bee=
n power-gated
> =A0 =A0 =A0 =A0 * via the flow controller). This will have no effect =
on first boot
> @@ -98,6 +145,9 @@ int __cpuinit boot_secondary(unsigned int cpu, str=
uct task_struct *idle)
> =A0 =A0 =A0 =A0case TEGRA20:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0status =3D tegra20_power_up_cpu(cpu);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> + =A0 =A0 =A0 case TEGRA30:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =3D tegra30_power_up_cpu(cpu);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> =A0 =A0 =A0 =A0default:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0status =3D -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> --
> 1.7.7.rc0.72.g4b5ea.dirty
>

Other than that, Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
