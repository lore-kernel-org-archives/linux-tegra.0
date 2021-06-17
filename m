Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658D1C2B9F4
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 12:04:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D4406101A
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Jun 2021 12:04:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhFQMGH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Jun 2021 08:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231527AbhFQMGG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Jun 2021 08:06:06 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18B5C061574;
        Thu, 17 Jun 2021 05:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ONSVTi/kXecAO7V8H03TQdoNf9PX+WyPNXJRe3/v7sQ=; b=uzxZPVJhTiOi3OOpR3yGnEWNTE
        DTgOig6t+xTIAwna3vLRTyT1bA2nVUzt/NFNkri8pChy6tfrl1hABkHAH/OL9w86UyTRU0cj9qUl7
        rNcmXHtDQdvhVY84d4JVk6ZAgKbnx0R2LaWBWquWfpPK01XyD1oj6hnOi37N+20oNuWQdPt7BbzQR
        aBLVMja0ra7hgO15ifzYoc/I8Htc38+90fGfuDSjanpheLRMxi2CUFq9z/SZqhURSumRvMFLqwigW
        ZCNtpRz91Zd5W+SRdE+YlS8TXFETDF+S2nQIIcOJZnmj8PxDcLf/3gVT369P7lcHsWq+fYST3N6ul
        j7J0BOQg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1ltqkV-0004aa-Qk; Thu, 17 Jun 2021 15:03:55 +0300
Subject: Re: [PATCH 1/2] arm64: traps: Support for registering SError hooks
To:     Mark Rutland <mark.rutland@arm.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210617104053.765434-1-mperttunen@nvidia.com>
 <20210617114618.GC82133@C02TD0UTHF1T.local>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <241fa310-b13f-0444-0fa6-ca448a875917@kapsi.fi>
Date:   Thu, 17 Jun 2021 15:03:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210617114618.GC82133@C02TD0UTHF1T.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/17/21 2:46 PM, Mark Rutland wrote:
> On Thu, Jun 17, 2021 at 01:40:52PM +0300, Mikko Perttunen wrote:
>> Add the ability for drivers to register SError hooks to be run
>> on a fatal SError interrupt. This allows printing of system-specific
>> error information to aid with debugging.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Can't you dump information unconditionally in a panic notifier?
> 
> That wouldn't require any new infrastructure.

That does indeed work also, thanks for the tip! Will change to use those.

Thanks,
Mikko

> 
> Thanks,
> Mark.
> 
>> ---
>>   arch/arm64/include/asm/traps.h |  6 ++++++
>>   arch/arm64/kernel/traps.c      | 20 ++++++++++++++++++++
>>   2 files changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
>> index 54f32a0675df..054fecfa22f0 100644
>> --- a/arch/arm64/include/asm/traps.h
>> +++ b/arch/arm64/include/asm/traps.h
>> @@ -22,8 +22,14 @@ struct undef_hook {
>>   	int (*fn)(struct pt_regs *regs, u32 instr);
>>   };
>>   
>> +struct serror_hook {
>> +	struct list_head node;
>> +	void (*fn)(void);
>> +};
>> +
>>   void register_undef_hook(struct undef_hook *hook);
>>   void unregister_undef_hook(struct undef_hook *hook);
>> +void register_serror_hook(struct serror_hook *hook);
>>   void force_signal_inject(int signal, int code, unsigned long address, unsigned int err);
>>   void arm64_notify_segfault(unsigned long addr);
>>   void arm64_force_sig_fault(int signo, int code, unsigned long far, const char *str);
>> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
>> index 273066279bb5..02dbaab71ea3 100644
>> --- a/arch/arm64/kernel/traps.c
>> +++ b/arch/arm64/kernel/traps.c
>> @@ -890,8 +890,23 @@ void panic_bad_stack(struct pt_regs *regs, unsigned int esr, unsigned long far)
>>   }
>>   #endif
>>   
>> +static LIST_HEAD(serror_hook);
>> +static DEFINE_RAW_SPINLOCK(serror_lock);
>> +
>> +void register_serror_hook(struct serror_hook *hook)
>> +{
>> +	unsigned long flags;
>> +
>> +	raw_spin_lock_irqsave(&serror_lock, flags);
>> +	list_add(&hook->node, &serror_hook);
>> +	raw_spin_unlock_irqrestore(&serror_lock, flags);
>> +}
>> +
>>   void __noreturn arm64_serror_panic(struct pt_regs *regs, u32 esr)
>>   {
>> +	struct serror_hook *hook;
>> +	unsigned long flags;
>> +
>>   	console_verbose();
>>   
>>   	pr_crit("SError Interrupt on CPU%d, code 0x%08x -- %s\n",
>> @@ -899,6 +914,11 @@ void __noreturn arm64_serror_panic(struct pt_regs *regs, u32 esr)
>>   	if (regs)
>>   		__show_regs(regs);
>>   
>> +	raw_spin_lock_irqsave(&serror_lock, flags);
>> +	list_for_each_entry(hook, &serror_hook, node)
>> +		hook->fn();
>> +	raw_spin_unlock_irqrestore(&serror_lock, flags);
>> +
>>   	nmi_panic(regs, "Asynchronous SError Interrupt");
>>   
>>   	cpu_park_loop();
>> -- 
>> 2.30.1
>>
