From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tip: core/kprobes] arm/ftrace: Use __patch_text()
Date: Thu, 23 Jan 2020 00:26:46 +0300
Message-ID: <10cbfd9e-2f1f-0a0c-0160-afe6c2ccbebd@gmail.com>
References: <20191113092636.GG4131@hirez.programming.kicks-ass.net>
 <157544841563.21853.2859696202562513480.tip-bot2@tip-bot2>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <157544841563.21853.2859696202562513480.tip-bot2@tip-bot2>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tip-bot2 for Peter Zijlstra <tip-bot2-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-tip-commits-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Peter Zijlstra (Intel)" <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Andy Lutomirski <luto-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>, Brian Gerst <brgerst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, rabin-66gdRtMMWGc@public.gmane.org, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, x86 <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

04.12.2019 11:33, tip-bot2 for Peter Zijlstra пишет:
> The following commit has been merged into the core/kprobes branch of tip:
> 
> Commit-ID:     5a735583b764750726621b0396d03e4782911b77
> Gitweb:        https://git.kernel.org/tip/5a735583b764750726621b0396d03e4782911b77
> Author:        Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> AuthorDate:    Tue, 15 Oct 2019 21:07:35 +02:00
> Committer:     Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CommitterDate: Wed, 27 Nov 2019 07:44:25 +01:00
> 
> arm/ftrace: Use __patch_text()
> 
> Instead of flipping text protection, use the patch_text infrastructure
> that uses a fixmap alias where required.
> 
> This removes the last user of set_all_modules_text_*().
> 
> Tested-by: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> Cc: Andy Lutomirski <luto-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
> Cc: Brian Gerst <brgerst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Denys Vlasenko <dvlasenk-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: H. Peter Anvin <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>
> Cc: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Peter Zijlstra <peterz-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
> Cc: james.morse-5wv7dgnIgG8@public.gmane.org
> Cc: rabin-66gdRtMMWGc@public.gmane.org
> Link: https://lkml.kernel.org/r/20191113092636.GG4131-Nxj+rRp3nVydTX5a5knrm8zTDFooKrT+cvkQGrU6aU0@public.gmane.org
> Signed-off-by: Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/kernel/Makefile |  4 ++--
>  arch/arm/kernel/ftrace.c | 10 ++--------
>  2 files changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> index 8cad594..a885172 100644
> --- a/arch/arm/kernel/Makefile
> +++ b/arch/arm/kernel/Makefile
> @@ -49,8 +49,8 @@ obj-$(CONFIG_HAVE_ARM_SCU)	+= smp_scu.o
>  obj-$(CONFIG_HAVE_ARM_TWD)	+= smp_twd.o
>  obj-$(CONFIG_ARM_ARCH_TIMER)	+= arch_timer.o
>  obj-$(CONFIG_FUNCTION_TRACER)	+= entry-ftrace.o
> -obj-$(CONFIG_DYNAMIC_FTRACE)	+= ftrace.o insn.o
> -obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o insn.o
> +obj-$(CONFIG_DYNAMIC_FTRACE)	+= ftrace.o insn.o patch.o
> +obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+= ftrace.o insn.o patch.o
>  obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o insn.o patch.o
>  obj-$(CONFIG_KEXEC)		+= machine_kexec.o relocate_kernel.o
>  # Main staffs in KPROBES are in arch/arm/probes/ .
> diff --git a/arch/arm/kernel/ftrace.c b/arch/arm/kernel/ftrace.c
> index bda949f..2a5ff69 100644
> --- a/arch/arm/kernel/ftrace.c
> +++ b/arch/arm/kernel/ftrace.c
> @@ -22,6 +22,7 @@
>  #include <asm/ftrace.h>
>  #include <asm/insn.h>
>  #include <asm/set_memory.h>
> +#include <asm/patch.h>
>  
>  #ifdef CONFIG_THUMB2_KERNEL
>  #define	NOP		0xf85deb04	/* pop.w {lr} */
> @@ -35,9 +36,7 @@ static int __ftrace_modify_code(void *data)
>  {
>  	int *command = data;
>  
> -	set_kernel_text_rw();
>  	ftrace_modify_all_code(*command);
> -	set_kernel_text_ro();
>  
>  	return 0;
>  }
> @@ -59,13 +58,11 @@ static unsigned long adjust_address(struct dyn_ftrace *rec, unsigned long addr)
>  
>  int ftrace_arch_code_modify_prepare(void)
>  {
> -	set_all_modules_text_rw();
>  	return 0;
>  }
>  
>  int ftrace_arch_code_modify_post_process(void)
>  {
> -	set_all_modules_text_ro();
>  	/* Make sure any TLB misses during machine stop are cleared. */
>  	flush_tlb_all();
>  	return 0;
> @@ -97,10 +94,7 @@ static int ftrace_modify_code(unsigned long pc, unsigned long old,
>  			return -EINVAL;
>  	}
>  
> -	if (probe_kernel_write((void *)pc, &new, MCOUNT_INSN_SIZE))
> -		return -EPERM;
> -
> -	flush_icache_range(pc, pc + MCOUNT_INSN_SIZE);
> +	__patch_text((void *)pc, new);
>  
>  	return 0;
>  }
> 

Hello,

NVIDIA Tegra20/30 are not booting with CONFIG_FTRACE=y, but even with
CONFIG_FTRACE=n things are not working well.

Reverting this patch and "module: Remove set_all_modules_text_*()" (to
fix compilation) helps.

[   13.363523] 8<--- cut here ---
[   13.366887] Unable to handle kernel paging request at virtual address
3e24fca3
[   13.370342] pgd = f9397380
[   13.373625] [3e24fca3] *pgd=00000000
[   13.377274] Internal error: Oops: 5 [#1] SMP THUMB2
[   13.381086] Modules linked in:
[   13.384372] CPU: 1 PID: 209 Comm: systemd-journal Not tainted
5.5.0-rc7-next-20200122-00177-g9b7833ca2e7a #983
[   13.387929] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[   13.391500] PC is at __seccomp_filter+0x86/0x370
[   13.395103] LR is at __seccomp_filter+0x77/0x370
[   13.398584] pc : [<c0194d56>]    lr : [<c0194d47>]    psr: 600e0033
[   13.402211] sp : ee6f3ee0  ip : ee6f3f20  fp : ee6f2000
[   13.405769] r10: ffff0000  r9 : 7fff0000  r8 : ee6f3f20
[   13.409844] r7 : 7fff0000  r6 : ee6b7280  r5 : 00000014  r4 : 7fff0000
[   13.413776] r3 : 3e24fc7f  r2 : 00000000  r1 : 3e24fca7  r0 : ee6f3f20
[   13.417382] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb
Segment none
[   13.420991] Control: 50c5387d  Table: 2e76404a  DAC: 00000051
[   13.424667] Process systemd-journal (pid: 209, stack limit = 0x90194d37)
[   13.428331] Stack: (0xee6f3ee0 to 0xee6f4000)
[   13.432082] 3ee0: 00000008 00000000 c0fa23a8 c0c65958 00000008
000000c5 00000006 00000000
[   13.435959] 3f00: 00000004 00000002 00000000 00000000 00000014
b6f5d4d0 edc96ee8 ee600908
[   13.439786] 3f20: 00000006 40000028 b6e3cd56 00000000 00000014
00000000 00000002 00000000
[   13.444285] 3f40: 00000000 00000000 00000000 00000000 00000014
00000000 b6f5d4d0 00000000
[   13.448432] 3f60: 00000000 9445a58a 00000000 00000014 ffffe000
00000000 00000006 c01011e4
[   13.452202] 3f80: ee6f2000 00000080 00000000 c01080d5 00000014
b6f5d4d0 00000000 00000006
[   13.456025] 3fa0: c01011e4 c0101195 00000014 b6f5d4d0 00000014
00000002 00000000 00000000
[   13.459872] 3fc0: 00000014 b6f5d4d0 00000000 00000006 b6f5d4e0
befa5610 00000002 00000000
[   13.463736] 3fe0: 00000006 befa5518 b6eb6c7d b6e3cd56 800e0030
00000014 00000000 00000000
[   13.467570] [<c0194d56>] (__seccomp_filter) from [<c01080d5>]
(syscall_trace_enter+0x45/0xac)
[   13.471520] [<c01080d5>] (syscall_trace_enter) from [<c0101195>]
(__sys_trace+0x9/0x34)
[   13.475592] Exception stack(0xee6f3fa8 to 0xee6f3ff0)
[   13.480012] 3fa0:                   00000014 b6f5d4d0 00000014
00000002 00000000 00000000
[   13.484127] 3fc0: 00000014 b6f5d4d0 00000000 00000006 b6f5d4e0
befa5610 00000002 00000000
[   13.488248] 3fe0: 00000006 befa5518 b6eb6c7d b6e3cd56
[   13.492318] Code: 68f3 4640 f103 0128 (6a5b) 4798
[   13.496597] ---[ end trace 2190b04c04a417a2 ]---
[   13.520493] note: systemd-journal[209] exited with preempt_count 1
[   13.532782] systemd[1]: systemd-journald.service: Service has no
hold-off time (RestartSec=0), scheduling restart.
[   13.538055] systemd[1]: systemd-journald.service: Scheduled restart
job, restart counter is at 1.
[   13.544960] systemd[1]: Stopped Journal Service.
[   13.555123] systemd[1]: Condition check resulted in Journal Audit
Socket being skipped.
[   13.566066] systemd[1]: Starting Journal Service...
[   13.786668] systemd[1]: Started Journal Service.

[   22.013861] BUG: Bad rss-counter state mm:26c62bde type:MM_ANONPAGES
val:170

This "Bad rss-counter" seems to be a new problem and unrelated to the
offending patch, I don't recall seeing it in next-20200117 and earlier.
