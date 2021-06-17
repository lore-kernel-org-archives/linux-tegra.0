Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365F1C2B9F4
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 11:46:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C1416140C
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 11:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbhFQLsc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Jun 2021 07:48:32 -0400
Received: from foss.arm.com ([217.140.110.172]:52404 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232243AbhFQLsb (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Jun 2021 07:48:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE1EB11FB;
        Thu, 17 Jun 2021 04:46:23 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0EC93F719;
        Thu, 17 Jun 2021 04:46:21 -0700 (PDT)
Date:   Thu, 17 Jun 2021 12:46:18 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: traps: Support for registering SError hooks
Message-ID: <20210617114618.GC82133@C02TD0UTHF1T.local>
References: <20210617104053.765434-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617104053.765434-1-mperttunen@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Jun 17, 2021 at 01:40:52PM +0300, Mikko Perttunen wrote:
> Add the ability for drivers to register SError hooks to be run
> on a fatal SError interrupt. This allows printing of system-specific
> error information to aid with debugging.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>

Can't you dump information unconditionally in a panic notifier?

That wouldn't require any new infrastructure.

Thanks,
Mark.

> ---
>  arch/arm64/include/asm/traps.h |  6 ++++++
>  arch/arm64/kernel/traps.c      | 20 ++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
> index 54f32a0675df..054fecfa22f0 100644
> --- a/arch/arm64/include/asm/traps.h
> +++ b/arch/arm64/include/asm/traps.h
> @@ -22,8 +22,14 @@ struct undef_hook {
>  	int (*fn)(struct pt_regs *regs, u32 instr);
>  };
>  
> +struct serror_hook {
> +	struct list_head node;
> +	void (*fn)(void);
> +};
> +
>  void register_undef_hook(struct undef_hook *hook);
>  void unregister_undef_hook(struct undef_hook *hook);
> +void register_serror_hook(struct serror_hook *hook);
>  void force_signal_inject(int signal, int code, unsigned long address, unsigned int err);
>  void arm64_notify_segfault(unsigned long addr);
>  void arm64_force_sig_fault(int signo, int code, unsigned long far, const char *str);
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 273066279bb5..02dbaab71ea3 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -890,8 +890,23 @@ void panic_bad_stack(struct pt_regs *regs, unsigned int esr, unsigned long far)
>  }
>  #endif
>  
> +static LIST_HEAD(serror_hook);
> +static DEFINE_RAW_SPINLOCK(serror_lock);
> +
> +void register_serror_hook(struct serror_hook *hook)
> +{
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&serror_lock, flags);
> +	list_add(&hook->node, &serror_hook);
> +	raw_spin_unlock_irqrestore(&serror_lock, flags);
> +}
> +
>  void __noreturn arm64_serror_panic(struct pt_regs *regs, u32 esr)
>  {
> +	struct serror_hook *hook;
> +	unsigned long flags;
> +
>  	console_verbose();
>  
>  	pr_crit("SError Interrupt on CPU%d, code 0x%08x -- %s\n",
> @@ -899,6 +914,11 @@ void __noreturn arm64_serror_panic(struct pt_regs *regs, u32 esr)
>  	if (regs)
>  		__show_regs(regs);
>  
> +	raw_spin_lock_irqsave(&serror_lock, flags);
> +	list_for_each_entry(hook, &serror_hook, node)
> +		hook->fn();
> +	raw_spin_unlock_irqrestore(&serror_lock, flags);
> +
>  	nmi_panic(regs, "Asynchronous SError Interrupt");
>  
>  	cpu_park_loop();
> -- 
> 2.30.1
> 
