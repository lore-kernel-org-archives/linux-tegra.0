From: Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add basic SecureOS support
Date: Fri, 7 Jun 2013 19:13:18 +0100
Message-ID: <20130607181318.GC29344@localhost.localdomain>
References: <1370503687-17767-1-git-send-email-acourbot@nvidia.com>
 <51B0BC80.9040007@wwwdotorg.org>
 <20130606180824.GC3320@localhost.localdomain>
 <CAAVeFuJkV3VVfeinLrjCCef9ZqJNvKurQwVWnJsW-bZqniTQ1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFuJkV3VVfeinLrjCCef9ZqJNvKurQwVWnJsW-bZqniTQ1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Chris Johnson <CJohnson-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Karan Jhavar <kjhavar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 07, 2013 at 06:03:54PM +0900, Alexandre Courbot wrote:
> On Fri, Jun 7, 2013 at 3:08 AM, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org> wrote:
> >> I think we need to separate the concept of support for *a* secure
> >> monitor, from support for a *particular* secure monitor.
> >
> > There is no fixed set of functionality implemented by these interfaces,
> > so it might be better to think in terms of a generic "firmware" concept.
> >
> >
> > Come to think of it...
> >
> > One option could be to have some standard baseline firmware calling
> > conventions, so that we could have a few specific backends -- perhaps
> > this could be built on the "method" notion used by PSCI
> >
> > (see Documentation/devicetree/bindings/arm/psci.tst; this is probably
> > the most developed firmware interface binding we have today)
> >
> > There, method = "smc" means:
> >
> >         populate registers in a certain way
> >         SMC #0
> >         return results from register to caller in a certain way
> >
> > and method = "hvc" means:
> >
> >         populate registers in a certain way
> >         HVC #0
> >         return results from register to caller in a certain way
> >
> >
> > The backend method arch/arm/kernel/psci.c:__invoke_psci_fn_smc()
> > is probably close to what's needed for the tegra secureos case,
> > so in theory it could be common, along with some of the DT binding
> > conventions.
> >
> > The backends, and the convention for binding a firmware interface
> > to the appropriate backend, could then theoretically be handled
> > by a common framework.
> 
> I'm not sure whether we could use the same backend for many different
> firmwares. If I understand you correctly, you propose to have a
> backend to the "smc" call that would cover the needs of all firmwares
> that rely on the smc instruction to invoke the firmware/secure
> monitor.
> 
> I can understand the logic, but I'm not sure this is needed or even
> possible. For instance, the implementation you have in
> __invoke_psci_fn_smc assumes 4 arguments, while Tegra's only needs 3.
> Also (and although I have to confess I am not very knowledgeable about
> the "SecureOS" covered by this patch and need to double-check what
> follows), in Tegra's case registers r3-r11 can be altered by the
> secure monitor and need to be preserved - something you don't need to
> do with PSCI.

One way to make the backend generic would be to have something like
one of the following (some syntax omitted due to laziness):

	u32 __naked __call_smc(u32 r0, ...) 
	{
		asm volatile (
			stmfd	sp!, {r4-r11,lr}
			smc	#0
			ldmfd	sp!, {r4-r11,pc}
			::: "memory"
		);
	}

	/* The above works for up to 4 u32 arguments */

	u32 __naked __call_smc(u32 r0, ...) 
	{
		asm volatile (
			mov	ip, sp
			stmfd	sp!, {r4-r11,lr}
			ldmia	ip, {r4-r11}
			smc	#0
			ldmfd	sp!, {r4-r11,pc}
			::: "memory"
		);
	}

	/*
	 * Works for up to 13 u32 arguments, provided the stack is deep
	 * enough to provide suitable garbage data to fill the registers
	 * if the caller supplied fewer arguments (a bit of a hack)
	 */

	u32 __naked __call_smc(struct pt_regs *regs) {

		asm(
			stmfd	sp!, {r4-r11,lr}
			/* load regs from <regs> */
			smc #0
			/* save regs back to <regs> */
			ldmfd	sp!, {r4-r11,pc}
		);
	}

	/*
	 * Most generic,  least-efficient version.
	 * Can return up to 13 u32 results instead of just one.
	 * For convenience, the r0 value returned by the SMC could be
	 * left in r0 so that it also determines the return value of the
	 * function.
	 *
	 * Most of the time, SMC shouldn't be called on any hot path,
	 * otherwise the performance battle is already lost -- so it may
	 * not be crucial to reach the maximum possible efficiency for
	 * these calls.
	 */


A particular firmware's Linux glue code might have to put extra stuff
around calls to generic_smc, but at least generic_smc itself wouldn't
need to be reinvented, and the firmware-specific glue code could usually
avoid asm.

> Another example is the function that Tomasz shown
> (https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/arch/arm/mach-exynos/exynos-smc.S?id=refs/tags/next-20130606
> ), which preserves r4-r11 but also assumes r3 is an argument - that's
> again another slightly different convention.

... for which the above implementations of __call_smc() should work too.

> All in all the needs of the various firmwares might end up being just
> different enough that we need to have a different backend for each of
> them. The firmware_ops defined in arch/arm/include/asm/firmware.h
> perform the abstraction at a higher level, which seems more fit here
> IMHO.
> 
> Alex.

Indeed.  If you think you could work with one of the above generics, we
could try it and see what it looks like though.

If it's an awkward fit, I might be being too optimistic.

Cheers
---Dave
