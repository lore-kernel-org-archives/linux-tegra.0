From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [tip: core/kprobes] arm/ftrace: Use __patch_text()
Date: Fri, 7 Feb 2020 11:17:47 +0100
Message-ID: <20200207101747.GE14914@hirez.programming.kicks-ass.net>
References: <20191113092636.GG4131@hirez.programming.kicks-ass.net>
 <157544841563.21853.2859696202562513480.tip-bot2@tip-bot2>
 <10cbfd9e-2f1f-0a0c-0160-afe6c2ccbebd@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <10cbfd9e-2f1f-0a0c-0160-afe6c2ccbebd@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, x86 <x86@kernel.org>, Denys Vlasenko <dvlasenk@redhat.com>, linux-tip-commits@vger.kernel.org, Brian Gerst <brgerst@gmail.com>, ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org, tip-bot2 for Peter Zijlstra <tip-bot2@linutronix.de>, Jon Hunter <jonathanh@nvidia.com>, rabin@rab.in, Linus Torvalds <torvalds@linux-foundation.org>, Thierry Reding <thierry.reding@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, james.morse@arm.com, Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 23, 2020 at 12:26:46AM +0300, Dmitry Osipenko wrote:

> > @@ -97,10 +94,7 @@ static int ftrace_modify_code(unsigned long pc, unsigned long old,
> >  			return -EINVAL;
> >  	}
> >  
> > -	if (probe_kernel_write((void *)pc, &new, MCOUNT_INSN_SIZE))
> > -		return -EPERM;
> > -
> > -	flush_icache_range(pc, pc + MCOUNT_INSN_SIZE);
> > +	__patch_text((void *)pc, new);
> >  
> >  	return 0;
> >  }
> > 
> 
> Hello,
> 
> NVIDIA Tegra20/30 are not booting with CONFIG_FTRACE=y, but even with
> CONFIG_FTRACE=n things are not working well.

> [   13.363523] 8<--- cut here ---
> [   13.366887] Unable to handle kernel paging request at virtual address 3e24fca3
> [   13.370342] pgd = f9397380
> [   13.373625] [3e24fca3] *pgd=00000000
> [   13.377274] Internal error: Oops: 5 [#1] SMP THUMB2
> [   13.381086] Modules linked in:
> [   13.384372] CPU: 1 PID: 209 Comm: systemd-journal Not tainted 5.5.0-rc7-next-20200122-00177-g9b7833ca2e7a #983
> [   13.387929] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [   13.391500] PC is at __seccomp_filter+0x86/0x370
> [   13.395103] LR is at __seccomp_filter+0x77/0x370
> [   13.398584] pc : [<c0194d56>]    lr : [<c0194d47>]    psr: 600e0033
> [   13.402211] sp : ee6f3ee0  ip : ee6f3f20  fp : ee6f2000
> [   13.405769] r10: ffff0000  r9 : 7fff0000  r8 : ee6f3f20
> [   13.409844] r7 : 7fff0000  r6 : ee6b7280  r5 : 00000014  r4 : 7fff0000
> [   13.413776] r3 : 3e24fc7f  r2 : 00000000  r1 : 3e24fca7  r0 : ee6f3f20
> [   13.417382] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA Thumb Segment none
> [   13.420991] Control: 50c5387d  Table: 2e76404a  DAC: 00000051
> [   13.424667] Process systemd-journal (pid: 209, stack limit = 0x90194d37)
> [   13.428331] Stack: (0xee6f3ee0 to 0xee6f4000)
> [   13.432082] 3ee0: 00000008 00000000 c0fa23a8 c0c65958 00000008 000000c5 00000006 00000000
> [   13.435959] 3f00: 00000004 00000002 00000000 00000000 00000014 b6f5d4d0 edc96ee8 ee600908
> [   13.439786] 3f20: 00000006 40000028 b6e3cd56 00000000 00000014 00000000 00000002 00000000
> [   13.444285] 3f40: 00000000 00000000 00000000 00000000 00000014 00000000 b6f5d4d0 00000000
> [   13.448432] 3f60: 00000000 9445a58a 00000000 00000014 ffffe000 00000000 00000006 c01011e4
> [   13.452202] 3f80: ee6f2000 00000080 00000000 c01080d5 00000014 b6f5d4d0 00000000 00000006
> [   13.456025] 3fa0: c01011e4 c0101195 00000014 b6f5d4d0 00000014 00000002 00000000 00000000
> [   13.459872] 3fc0: 00000014 b6f5d4d0 00000000 00000006 b6f5d4e0 befa5610 00000002 00000000
> [   13.463736] 3fe0: 00000006 befa5518 b6eb6c7d b6e3cd56 800e0030 00000014 00000000 00000000
> [   13.467570] [<c0194d56>] (__seccomp_filter) from [<c01080d5>] (syscall_trace_enter+0x45/0xac)
> [   13.471520] [<c01080d5>] (syscall_trace_enter) from [<c0101195>] (__sys_trace+0x9/0x34)
> [   13.475592] Exception stack(0xee6f3fa8 to 0xee6f3ff0)
> [   13.480012] 3fa0:                   00000014 b6f5d4d0 00000014 00000002 00000000 00000000
> [   13.484127] 3fc0: 00000014 b6f5d4d0 00000000 00000006 b6f5d4e0 befa5610 00000002 00000000
> [   13.488248] 3fe0: 00000006 befa5518 b6eb6c7d b6e3cd56
> [   13.492318] Code: 68f3 4640 f103 0128 (6a5b) 4798
> [   13.496597] ---[ end trace 2190b04c04a417a2 ]---

Is that crash with FTRACE=y or =n ?

This really isn't making much sense to me, Will, Mark, any clues?
