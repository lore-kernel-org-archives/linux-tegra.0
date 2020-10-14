Return-Path: <SRS0=m5en=DV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDD5C43457
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 03:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A84A21D7F
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 03:21:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="NbYay9iI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729582AbgJNDVN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Oct 2020 23:21:13 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10838 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgJNDVN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Oct 2020 23:21:13 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f866e500000>; Tue, 13 Oct 2020 20:19:44 -0700
Received: from [10.19.100.177] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct
 2020 03:21:07 +0000
Subject: Re: [PATCH v3 04/15] phy: tegra: xusb: tegra210: Do not reset UPHY
 PLL
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <robh@kernel.org>,
        <jonathanh@nvidia.com>, <kishon@ti.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-5-jckuo@nvidia.com> <20200928130618.GE3065790@ulmo>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <0ec9045c-8722-d7cd-20f0-2c163be75619@nvidia.com>
Date:   Wed, 14 Oct 2020 11:21:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928130618.GE3065790@ulmo>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602645584; bh=MpUvsa/wMAY7BzkAhwbdXgZgbZYHy0ZGBz0aDP8EC30=;
        h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=NbYay9iIS0u9b13wMqVg/7m1S5/uQvHx3hDHKgGcf/5ALGojoN25hgrvBf5wfO7Tm
         UP71jMjVDMeE+zWpx5YyjWdxHaEX8H2re8CDEEWVQeTqNCIIikzOYnO4UVnZTNex2v
         1J6Izi/vusu2n1rzG1eiLDeLn4nxLakh72KqFnuOJNq0pXaduNDJAV+P3geg73VtOk
         QxoiCAIrGre9Wcqgo3WR+HvDlG0Qsr1Cu1YBLXV/P/6JFsbBHJvADGHGzgeBTgAHpZ
         6EWk1/jrgDJyGCxyxyX1LwTXU7F/Td7ZuEjqP8WGw8gDDpC8q0CAbiPwJwQn87Wl6c
         ncdUMJmQJor/Q==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Asserting reset to a PLL when it's managed by hardware power sequencer would
break sequencer's state machine. Putting PLL in reset doesn't save some extra power.

Thanks for review.
JC

On 9/28/20 9:06 PM, Thierry Reding wrote:
> On Wed, Sep 09, 2020 at 04:10:30PM +0800, JC Kuo wrote:
>> Once UPHY PLL hardware power sequencer is enabled, do not assert
>> reset to PEX/SATA PLLs, otherwise UPHY PLL operation will be broken.
>> This commit removes reset_control_assert(pcie->rst) and
>> reset_control_assert(sata->rst) from PEX/SATA UPHY disable procedure.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>> v3:
>>    new, was a part of "phy: tegra: xusb: Rearrange UPHY init on Tegra210"
>>
>>  drivers/phy/tegra/xusb-tegra210.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
>> index f06e7bc7a51b..ef4bbcbed60b 100644
>> --- a/drivers/phy/tegra/xusb-tegra210.c
>> +++ b/drivers/phy/tegra/xusb-tegra210.c
>> @@ -504,7 +504,6 @@ static void tegra210_pex_uphy_disable(struct tegra_xusb_padctl *padctl)
>>  	if (--pcie->enable > 0)
>>  		goto unlock;
>>  
>> -	reset_control_assert(pcie->rst);
>>  	clk_disable_unprepare(pcie->pll);
>>  
>>  unlock:
>> @@ -746,7 +745,6 @@ static void tegra210_sata_uphy_disable(struct tegra_xusb_padctl *padctl)
>>  	if (--sata->enable > 0)
>>  		goto unlock;
>>  
>> -	reset_control_assert(sata->rst);
>>  	clk_disable_unprepare(sata->pll);
>>  
>>  unlock:
> 
> Does this mean that we can no longer reset these PLLs anymore? Is that
> safe? Would we ever need to reset them for recovery or similar? For
> power saving, is disabling the clock enough, or could we save some extra
> power by putting the PLLs into reset?
> 
> Thierry
> 
