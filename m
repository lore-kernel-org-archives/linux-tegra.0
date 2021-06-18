Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48018C48BDF
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 12:33:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D10861222
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Jun 2021 12:33:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhFRMfN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Jun 2021 08:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhFRMfM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Jun 2021 08:35:12 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266CEC061574
        for <linux-tegra@vger.kernel.org>; Fri, 18 Jun 2021 05:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GG/hzykWmjeuPWurcE+pQYoL+q+WES40boSaQP7qAGQ=; b=B7a4qegVmyb2qfJUldd1u6muL5
        80BlKdY59HRgafRgOLS4n7eQMSiw1+GvHSgP3I3LRTyzxGG7Thy8s0L/jd19wmspza8Bgl6ZyJoVQ
        K3Wb/JByqidNxSKsDJKxNy7pVZGbWknQ/f0QnCR/jpdWUQITAreprjcX+mosGJQvDA6wTQ+ZxF0EK
        d+ts+XF5WpsaLYUryn5KT1UsGZkBaxfaWjhgkCcBKskknMTf6KVskMIg8Q0dOEeRTM35RqIIbOP8v
        FndrxBkbjsN4EF3Pz9TZpb8ZwZHyrrV/gEOXFfhpSDUlQaMQ6jQfzeLLRw+Q0MKDwIw1Z3aT2uexM
        3vD0Y/wA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1luDgC-0006uH-B8; Fri, 18 Jun 2021 15:33:00 +0300
Subject: Re: [PATCH v2] soc: tegra: Add Tegra186 ARI driver
To:     Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210617121307.792386-1-mperttunen@nvidia.com>
 <YMyLqnbwOAyvXMPU@orome.fritz.box>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <2f8c1195-7863-b5d3-0720-1d167f3fff27@kapsi.fi>
Date:   Fri, 18 Jun 2021 15:32:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YMyLqnbwOAyvXMPU@orome.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 6/18/21 3:03 PM, Thierry Reding wrote:
> On Thu, Jun 17, 2021 at 03:13:07PM +0300, Mikko Perttunen wrote:
>> Add a driver to hook into panic notifiers and print machine check
>> status for debugging. Status information is retrieved via SMC. This
>> is supported by upstream ARM Trusted Firmware.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v2:
>> * Changed to use panic notifier instead of serror hook
>> ---
>>   drivers/soc/tegra/Makefile       |  1 +
>>   drivers/soc/tegra/ari-tegra186.c | 80 ++++++++++++++++++++++++++++++++
>>   2 files changed, 81 insertions(+)
>>   create mode 100644 drivers/soc/tegra/ari-tegra186.c
>>
>> diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
>> index 9c809c1814bd..054e862b63d8 100644
>> --- a/drivers/soc/tegra/Makefile
>> +++ b/drivers/soc/tegra/Makefile
>> @@ -7,3 +7,4 @@ obj-$(CONFIG_SOC_TEGRA_PMC) += pmc.o
>>   obj-$(CONFIG_SOC_TEGRA_POWERGATE_BPMP) += powergate-bpmp.o
>>   obj-$(CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER) += regulators-tegra20.o
>>   obj-$(CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER) += regulators-tegra30.o
>> +obj-$(CONFIG_ARCH_TEGRA_186_SOC) += ari-tegra186.o
>> diff --git a/drivers/soc/tegra/ari-tegra186.c b/drivers/soc/tegra/ari-tegra186.c
>> new file mode 100644
>> index 000000000000..02577853ec49
>> --- /dev/null
>> +++ b/drivers/soc/tegra/ari-tegra186.c
>> @@ -0,0 +1,80 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
>> + */
>> +
>> +#include <linux/arm-smccc.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of.h>
>> +#include <linux/panic_notifier.h>
>> +
>> +#define SMC_SIP_INVOKE_MCE			0xc2ffff00
>> +#define MCE_SMC_READ_MCA			12
>> +
>> +#define MCA_ARI_CMD_RD_SERR			1
>> +
>> +#define MCA_ARI_RW_SUBIDX_STAT			1
>> +#define SERR_STATUS_VAL				BIT_ULL(63)
>> +
>> +#define MCA_ARI_RW_SUBIDX_ADDR			2
>> +#define MCA_ARI_RW_SUBIDX_MSC1			3
>> +#define MCA_ARI_RW_SUBIDX_MSC2			4
>> +
>> +static const char * const bank_names[] = {
>> +	"SYS:DPMU", "ROC:IOB", "ROC:MCB", "ROC:CCE", "ROC:CQX", "ROC:CTU",
>> +};
>> +
>> +static void read_uncore_mca(u8 cmd, u8 idx, u8 subidx, u8 inst, u64 *data)
>> +{
>> +	struct arm_smccc_res res;
>> +
>> +	arm_smccc_smc(SMC_SIP_INVOKE_MCE | MCE_SMC_READ_MCA,
>> +		      ((u64)inst << 24) | ((u64)idx << 16) |
>> +			      ((u64)subidx << 8) | ((u64)cmd << 0),
>> +		      0, 0, 0, 0, 0, 0, &res);
>> +
>> +	*data = res.a2;
>> +}
>> +
>> +static int tegra186_ari_panic_handler(struct notifier_block *nb,
>> +				      unsigned long code, void *unused)
>> +{
>> +	u64 status;
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(bank_names); i++) {
>> +		read_uncore_mca(MCA_ARI_CMD_RD_SERR, i, MCA_ARI_RW_SUBIDX_STAT,
>> +				0, &status);
>> +
>> +		if (status & SERR_STATUS_VAL) {
>> +			u64 addr, misc1, misc2;
>> +
>> +			read_uncore_mca(MCA_ARI_CMD_RD_SERR, i,
>> +					MCA_ARI_RW_SUBIDX_ADDR, 0, &addr);
>> +			read_uncore_mca(MCA_ARI_CMD_RD_SERR, i,
>> +					MCA_ARI_RW_SUBIDX_MSC1, 0, &misc1);
>> +			read_uncore_mca(MCA_ARI_CMD_RD_SERR, i,
>> +					MCA_ARI_RW_SUBIDX_MSC2, 0, &misc2);
>> +
>> +			pr_crit("Machine Check Error in %s\n"
>> +				"  status=0x%llx addr=0x%llx\n"
>> +				"  msc1=0x%llx msc2=0x%llx\n",
>> +				bank_names[i], status, addr, misc1, misc2);
> 
> This still looks rather cryptic to me. Is there some way to further
> decode things like the status and MSC registers? Or is this something
> that people are supposed to know how to intepret?

Indeed, it is very cryptic. The corresponding downstream driver does a 
lot of work to print more human-readable descriptions of these - that's 
what I used as a decoding reference as well myself.

I was thinking that having the barebones here is good to at least have 
the error data to decode manually, and we can add the more 
human-readable decoding afterwards, or perhaps provide some script to 
decode it.

> 
> Also, I'm not sure it's evident what those various banks are. Is there
> some way we can provide a description for these?

I don't know if the bank names themselves are very useful - each bank is 
decoded differently and the decoded information is the useful part.

> 
> Additional information doesn't necessarily have to go into code, but
> it'd be nice if at least there was some sort of comment somewhere that
> goes into a bit more detail so that people know how to use this. Or
> perhaps this is documented in the TRM? If so, perhaps provide a
> reference to that so that people know where to find the information.

I don't know if the TRM has this information. How to decode these values 
can be seen in

https://nv-tegra.nvidia.com/gitweb/?p=linux-nvidia.git;a=blob;f=drivers/platform/tegra/ari_mca.c;h=040d05978ca49755a68365bebe7c46f6628c5162;hb=6dc57fec39c444e4c4448be61ddd19c55693daf1

and

https://nv-tegra.nvidia.com/gitweb/?p=linux-nvidia.git;a=blob;f=include/linux/platform/tegra/ari_mca.h;h=e6e4ac3abf674a1fc93f7b0dbcac4d6e672772d6;hb=6dc57fec39c444e4c4448be61ddd19c55693daf1

Not sure if these kinds of links are very appropriate as references though.

> 
> Thierry
> 

Thanks,
Mikko
