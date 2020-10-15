Return-Path: <SRS0=Wy30=DW=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EC3C433E7
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Oct 2020 08:12:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5283522249
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Oct 2020 08:12:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="kNLITBVk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387627AbgJOIMm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Oct 2020 04:12:42 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17519 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbgJOIMm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Oct 2020 04:12:42 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f88046d0000>; Thu, 15 Oct 2020 01:12:29 -0700
Received: from [10.19.101.17] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 08:12:36 +0000
Subject: Re: [PATCH v3 15/15] xhci: tegra: Enable ELPG for runtime/system PM
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <robh@kernel.org>,
        <jonathanh@nvidia.com>, <kishon@ti.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-16-jckuo@nvidia.com> <20200928140653.GO3065790@ulmo>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <d9447d2e-d82d-57cb-b813-c883a502c2d1@nvidia.com>
Date:   Thu, 15 Oct 2020 16:12:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928140653.GO3065790@ulmo>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602749549; bh=6PqcFwgSJ+dhMzTW5dj7WOiueaJtj942uzt9t8W6JAk=;
        h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=kNLITBVk6U2GLyLLHIureiAdLBNtU9LXHo6GXPSBRzelmlZjpfqugnQWM/VvKLJsP
         9keay22ksDEazKstTbrUwk2IZH0jSkxM2zAQDnYa7GVfTve7bWs/lShzbArq2JyJXX
         LcpEBR93/fGPokAajQIXfrzlnWFb5R69rKNAI+PJPOmcVQIzG27l2OmHDpm+1Y2dUg
         xa+mkBV1F20v5/kjIJDucHnEo6TAgxk0rLtflieniEudoWEabAJ429zmGUrLVHTROF
         FIouBG/IeYx3kNAU6FhZJ2iEa8Gv4+RUSlEc4WfF/VPGgPo0MOzehPaLuJBbnv1lBh
         BnX6hyu2TNSjA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

I will amend accordingly and submit new patch.

Thanks for review.
JC

On 9/28/20 10:06 PM, Thierry Reding wrote:
> On Wed, Sep 09, 2020 at 04:10:41PM +0800, JC Kuo wrote:
>> This commit implements the complete programming sequence for ELPG
>> entry and exit.
>>
>>  1. At ELPG entry, invokes tegra_xusb_padctl_enable_phy_sleepwalk()
>>     and tegra_xusb_padctl_enable_phy_wake() to configure XUSB PADCTL
>>     sleepwalk and wake detection circuits to maintain USB lines level
>>     and respond to wake events (wake-on-connect, wake-on-disconnect,
>>     device-initiated-wake).
>>
>>  2. At ELPG exit, invokes tegra_xusb_padctl_disable_phy_sleepwalk()
>>     and tegra_xusb_padctl_disable_phy_wake() to disarm sleepwalk and
>>     wake detection circuits.
>>
>> At runtime suspend, XUSB host controller can enter ELPG to reduce
>> power consumption. When XUSB PADCTL wake detection circuit detects
>> a wake event, an interrupt will be raised. xhci-tegra driver then
>> will invoke pm_runtime_resume() for xhci-tegra.
>>
>> Runtime resume could also be triggered by protocol drivers, this is
>> the host-initiated-wake event. At runtime resume, xhci-tegra driver
>> brings XUSB host controller out of ELPG to handle the wake events.
>>
>> The same ELPG enter/exit procedure will be performed for system
>> suspend/resume path so USB devices can remain connected across SC7.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>> v3:
>>    use 'unsigned int' for PHY index
>>    remove unnecessary 'else'
>>    drop IRQF_TRIGGER_HIGH when invokes devm_request_threaded_irq()
>>    
>>  drivers/usb/host/xhci-tegra.c | 389 +++++++++++++++++++++++++++++++---
>>  1 file changed, 360 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
>> index aabff8ee0bb3..ba3f40e78171 100644
>> --- a/drivers/usb/host/xhci-tegra.c
>> +++ b/drivers/usb/host/xhci-tegra.c
>> @@ -15,9 +15,11 @@
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/of_device.h>
>> +#include <linux/of_irq.h>
>>  #include <linux/phy/phy.h>
>>  #include <linux/phy/tegra/xusb.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/usb/ch9.h>
>>  #include <linux/pm.h>
>>  #include <linux/pm_domain.h>
>>  #include <linux/pm_runtime.h>
>> @@ -224,6 +226,7 @@ struct tegra_xusb {
>>  
>>  	int xhci_irq;
>>  	int mbox_irq;
>> +	int padctl_irq;
>>  
>>  	void __iomem *ipfs_base;
>>  	void __iomem *fpci_base;
>> @@ -269,10 +272,13 @@ struct tegra_xusb {
>>  		dma_addr_t phys;
>>  	} fw;
>>  
>> +	bool suspended;
>>  	struct tegra_xusb_context context;
>>  };
>>  
>>  static struct hc_driver __read_mostly tegra_xhci_hc_driver;
>> +static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime);
>> +static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime);
> 
> Can we reshuffle the code to avoid these predeclarations? Looks like
> they're only used in tegra_xusb_runtime_{suspend,resume}(), so perhaps
> move the implementations right before those?
> 
> Thierry
> 
