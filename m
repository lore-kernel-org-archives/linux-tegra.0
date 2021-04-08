Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB16C433B4
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 14:09:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C32F61153
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 14:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbhDHOJR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Apr 2021 10:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231970AbhDHOHi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Apr 2021 10:07:38 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7010C061763;
        Thu,  8 Apr 2021 07:07:25 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j18so4264660lfg.5;
        Thu, 08 Apr 2021 07:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TJcr9cvILOsR83iPEcG9C3+sEcWBlz1cuJ33HFWdX20=;
        b=MgDJPAUOp1kVGai1ZVDK657ce69upxvFvsbTWGJiFshVSZ1wFhg4CtVXKGeNvLiX1M
         Fa0+9/BryRX98B76IgH3N/pk+npU+ZUuiNakd6gRNWS3y/bIaPDXvNGfkiA/5+uCGjst
         7xj+UaRMaag5mOL5Fltt3BB26CHpnVihGqV0cstMmi1WyOLrZWRw0S7Xjhwu2HMKqIpm
         hMSMQ1H240JZt+MxlWMWRtHTr62x/b+PKL0rPEMO4efxHhwtfMjukyYoM9jX02q7OlDR
         li5s9Ue0LjXU9/rSDlqwhkL2Zt04owiaGcvOPkfRG5f2HwNXkzGUuUWe4PbarBpma6aK
         4+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TJcr9cvILOsR83iPEcG9C3+sEcWBlz1cuJ33HFWdX20=;
        b=okWXg7Hm1qxxglFBvsFNc8z+n7ggs548e8SX43l8FZhHH++FtlNopDnq1Rn0ce5xMr
         4M+bCJX7o745ickkiKfH/J1mrU5swXb98uJdxagVPMupTXIaPZGhEpCUV0L/3siOxy3m
         T1vw7+2soC8JrfWtqYwAqdg8WU4I2l+Q9HOqJQ0dhCSLucY0cF0nzpJAVKoUowXWrhls
         IG2F/Xs2SPVMAW0L+SvXBJMzbqO8HoToSZ3CR2gfAhONNpU+EWLrvvfce5bHsDqxm84d
         SL2c37ApawfPOK8mJETDuNjMUxrAeO2IIBuHkoCT45vMCAbL8gmZniqUEIxuo40vzWg/
         0X/A==
X-Gm-Message-State: AOAM533XVaDzy3eiqwiZc5qtS8EfBFSEHcOoXmYfK4DRa4FwaiaHd2vf
        LyDyMa1u+6S/grc6dqgznuiIS63I6V4=
X-Google-Smtp-Source: ABdhPJwPDmmkxMFJYhXtbEBLUKyhyn62rxoyHEIGpRZywVaswcXTRyokDYUxbtgruq6YpVw9ciFcSg==
X-Received: by 2002:a19:f503:: with SMTP id j3mr6487566lfb.114.1617890843954;
        Thu, 08 Apr 2021 07:07:23 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-85.dynamic.spd-mgts.ru. [109.252.193.85])
        by smtp.googlemail.com with ESMTPSA id z30sm648970lfg.162.2021.04.08.07.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 07:07:22 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] iommu/tegra-smmu: Defer attachment of display
 clients
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210328233256.20494-1-digetx@gmail.com>
 <YG75urcXAb90Jj12@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c4b42a3d-d260-9a69-4ee7-8ad586741f8c@gmail.com>
Date:   Thu, 8 Apr 2021 17:07:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YG75urcXAb90Jj12@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

08.04.2021 15:40, Thierry Reding пишет:
> On Mon, Mar 29, 2021 at 02:32:55AM +0300, Dmitry Osipenko wrote:
>> All consumer-grade Android and Chromebook devices show a splash screen
>> on boot and then display is left enabled when kernel is booted. This
>> behaviour is unacceptable in a case of implicit IOMMU domains to which
>> devices are attached during kernel boot since devices, like display
>> controller, may perform DMA at that time. We can work around this problem
>> by deferring the enable of SMMU translation for a specific devices,
>> like a display controller, until the first IOMMU mapping is created,
>> which works good enough in practice because by that time h/w is already
>> stopped.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/iommu/tegra-smmu.c | 71 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 71 insertions(+)
> 
> In general I do see why we would want to enable this. However, I think
> this is a bad idea because it's going to proliferate the bad practice of
> not describing things properly in device tree.
> 
> Whatever happened to the idea of creating identity mappings based on the
> obscure tegra_fb_mem (or whatever it was called) command-line option? Is
> that command-line not universally passed to the kernel from bootloaders
> that initialize display?

This is still a good idea! The command-line isn't universally passed
just because it's up to a user to override the cmdline and then we get a
hang (a very slow boot in reality) on T30 since display client takes out
the whole memory bus with the constant SMMU faults. For example I don't
have that cmdline option in my current setups.

> That idealistic objection aside, this seems a bit over-engineered for
> the hack that it is. See below.
> 
>> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
>> index 602aab98c079..af1e4b5adb27 100644
>> --- a/drivers/iommu/tegra-smmu.c
>> +++ b/drivers/iommu/tegra-smmu.c
>> @@ -60,6 +60,8 @@ struct tegra_smmu_as {
>>  	dma_addr_t pd_dma;
>>  	unsigned id;
>>  	u32 attr;
>> +	bool display_attached[2];
>> +	bool attached_devices_need_sync;
>>  };
>>  
>>  static struct tegra_smmu_as *to_smmu_as(struct iommu_domain *dom)
>> @@ -78,6 +80,10 @@ static inline u32 smmu_readl(struct tegra_smmu *smmu, unsigned long offset)
>>  	return readl(smmu->regs + offset);
>>  }
>>  
>> +/* all Tegra SoCs use the same group IDs for displays */
>> +#define SMMU_SWGROUP_DC		1
>> +#define SMMU_SWGROUP_DCB	2
>> +
>>  #define SMMU_CONFIG 0x010
>>  #define  SMMU_CONFIG_ENABLE (1 << 0)
>>  
>> @@ -253,6 +259,20 @@ static inline void smmu_flush(struct tegra_smmu *smmu)
>>  	smmu_readl(smmu, SMMU_PTB_ASID);
>>  }
>>  
>> +static int smmu_swgroup_to_display_id(unsigned int swgroup)
>> +{
>> +	switch (swgroup) {
>> +	case SMMU_SWGROUP_DC:
>> +		return 0;
>> +
>> +	case SMMU_SWGROUP_DCB:
>> +		return 1;
>> +
>> +	default:
>> +		return -1;
>> +	}
>> +}
>> +
> 
> Why do we need to have this two-level mapping? Do we even need to care
> about the specific swgroups IDs?

It's not clear to me what you're meaning here, the swgroup IDs are used
here for determining whether client belongs to a display controller.

> Can we not just simply check at attach
> time if the client that's being attached is a display client and then
> set atteched_devices_need_sync = true?

The reason I made atteched_devices_need_sync opt-out for display clients
instead of
opt-in is to make it clear and easy to override this option once we will
support the identity mappings.

- attached_devices_need_sync = true;
+ attached_devices_need_sync = no_identity_mapping_for_display;
