Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1081C2BB9A
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82DB823434
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 13:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgLQNse (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 08:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbgLQNsd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 08:48:33 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166DDC061794;
        Thu, 17 Dec 2020 05:47:53 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 23so57462916lfg.10;
        Thu, 17 Dec 2020 05:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RQQZWATGx9Cd9i1SGEZJb8vdX4uN6McAm/OXt010CwM=;
        b=usrS9/X19WJNJE8tTPznZiyGQ0vhFySggMlc9YeT0s6XcIDl1dLOkz6RZj6uoiSgkw
         5Y31qJ85Y6/qOqSqJQ1JQ3XUR99iXNgQUnIFTtO74ap5eRIDlv7hq6eQKHlYIP/4iRqS
         kD1MmFetx/sNic5eBl0OTBseCT6rjU0skJARBRBHqoFN+jQyhi+JEUwrVFeaGGc0xlyB
         EA8GCGsRI5rUS0eJSyiW5JtuIqFrLdR3dsCGWFTvOxctK1ZWgj5mvGTzehejVDjYvte3
         xmrBS2oY0MTtFQ20AEgJ2KHVJUkTalyr+glQSeQnsw5ktGtwGELo9K3ZyFtUN6I5iyer
         wrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RQQZWATGx9Cd9i1SGEZJb8vdX4uN6McAm/OXt010CwM=;
        b=a4Ew0G52H0CjtnHdV3XTUdt6TKMtSZKMqzN7OLFdmp9ebC/PXzS7axcV2s1Rll5VD7
         DAy0kavId40hiolwPtW/nyTUaS6C5lNJpZekS1wsyvS5sQM31d+r+7xmkn3K9AZYNB0U
         0R5eIsdbkSfzW+RxOU62DysWAasuxEY5kKlcclHbDCd9f3WUEQjDmO/Lxpl2gUPmg5Ct
         H/RLKA8K09AU1l4yxzy+w4OzzbSClclibNH+wbnhRqnp4KcMPSrEb/Q5VdnaVuwY2vQ1
         hX7R6+GQeAJ+4UyQ0imFWLKOHtNmVNN1pgHWQkZ6t4WXvQyRwguPhXsgpUBEFOTHWoNF
         jntw==
X-Gm-Message-State: AOAM5339/+QA6uLJiWOxC6YJt+mihaZCXU/skj3qZmNZ2zRlelLH0GHp
        ifWmQVR0p3OG11fm0bA0PEH4wl/cf2E=
X-Google-Smtp-Source: ABdhPJzG17Emu1MTKnWWJvYGQc2YlnLBE7nkVNKRt1ypoqbop6IRJ12yLj6k28JXsShAJRIBlMyEZQ==
X-Received: by 2002:a05:6512:706:: with SMTP id b6mr16181992lfs.115.1608212871402;
        Thu, 17 Dec 2020 05:47:51 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id d12sm673175ljl.111.2020.12.17.05.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 05:47:50 -0800 (PST)
Subject: Re: [PATCH v2 2/8] usb: phy: tegra: Support waking up from a low
 power mode
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Ion Agorria <ion@agorria.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201217094007.19336-1-digetx@gmail.com>
 <20201217094007.19336-3-digetx@gmail.com> <X9teRPo/MadN79NI@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3c204a61-86ae-1bbe-1442-527831f15232@gmail.com>
Date:   Thu, 17 Dec 2020 16:47:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <X9teRPo/MadN79NI@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.12.2020 16:33, Thierry Reding пишет:
>> +	/* PHY won't resume if reset is asserted */
>> +	if (phy->wakeup_enabled)
>> +		goto chrg_cfg0;
>>  
>>  	val = readl_relaxed(base + USB_SUSP_CTRL);
>>  	val |= UTMIP_RESET;
>>  	writel_relaxed(val, base + USB_SUSP_CTRL);
>>  
>> +chrg_cfg0:
> I found this diffcult to read until I realized that it was basically
> just the equivalent of this:
> 
> 	if (!phy->wakeup_enabled) {
> 		val = readl_relaxed(base + USB_SUSP_CTRL);
> 		val |= UTMIP_RESET;
> 		writel_relaxed(val, base + USB_SUSP_CTRL);
> 	}
> 
>>  	val = readl_relaxed(base + UTMIP_BAT_CHRG_CFG0);
>>  	val |= UTMIP_PD_CHRG;
>>  	writel_relaxed(val, base + UTMIP_BAT_CHRG_CFG0);
>>  
>> +	if (phy->wakeup_enabled)
>> +		goto xcvr_cfg1;
>> +
>>  	val = readl_relaxed(base + UTMIP_XCVR_CFG0);
>>  	val |= UTMIP_FORCE_PD_POWERDOWN | UTMIP_FORCE_PD2_POWERDOWN |
>>  	       UTMIP_FORCE_PDZI_POWERDOWN;
>>  	writel_relaxed(val, base + UTMIP_XCVR_CFG0);
>>  
>> +xcvr_cfg1:
> Similarly, I think this is more readable as:
> 
> 	if (!phy->wakeup_enabled) {
> 		val = readl_relaxed(base + UTMIP_XCVR_CFG0);
> 		val |= UTMIP_FORCE_PD_POWERDOWN | UTMIP_FORCE_PD2_POWERDOWN |
> 		       UTMIP_FORCE_PDZI_POWERDOWN;
> 		writel_relaxed(val, base + UTMIP_XCVR_CFG0);
> 	}
> 
>>  	val = readl_relaxed(base + UTMIP_XCVR_CFG1);
>>  	val |= UTMIP_FORCE_PDDISC_POWERDOWN | UTMIP_FORCE_PDCHRP_POWERDOWN |
>>  	       UTMIP_FORCE_PDDR_POWERDOWN;
>>  	writel_relaxed(val, base + UTMIP_XCVR_CFG1);
>>  
>> +	if (phy->wakeup_enabled) {
> Which then also matches the style of this conditional here.

I'll change it in v3, thanks.


