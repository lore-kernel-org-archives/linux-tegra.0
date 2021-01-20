Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4106BC433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 02:03:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 012992245C
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 02:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbhATBnz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 20:43:55 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8876 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbhATBnw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 20:43:52 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60078aaa0000>; Tue, 19 Jan 2021 17:43:06 -0800
Received: from [10.19.109.31] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan
 2021 01:43:00 +0000
Subject: Re: [PATCH v6 04/15] phy: tegra: xusb: tegra210: Do not reset UPHY
 PLL
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <robh@kernel.org>,
        <jonathanh@nvidia.com>, <kishon@ti.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20210119085546.725005-1-jckuo@nvidia.com>
 <20210119085546.725005-5-jckuo@nvidia.com> <YAbkABc68aMTvIyr@ulmo>
From:   JC Kuo <jckuo@nvidia.com>
Organization: NVIDIA
Message-ID: <f389ab2f-1ecf-9eb5-6897-f780a27f4fec@nvidia.com>
Date:   Wed, 20 Jan 2021 09:42:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YAbkABc68aMTvIyr@ulmo>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611106986; bh=7ZWJjA3V1BT8uXEoBJb4nujxJszYGXToGqMzgsjGGFY=;
        h=Subject:To:CC:References:From:Organization:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=Y0G9aiLxpNBJoGv63xS+8ysFT8PWHMqh+wxlTDSkRUzlwYbtHZSz9M876pF0JmHyn
         WJfi7TVUl8oPq+nMtRK575C6RKbH1eJI9GuO4k7iGa9t9nw7jUWmk4/5jNPaSWnROq
         BTCAbhkY5bmLt1AuiqqypRGjAGPyVNzqfjtz8sXKMabPBZi/QVGMRoFnwATyxgZaUR
         m2OrSKX4xQHLIFSJm8gDmfDODNFaIfopdEXijBNGPwarAmajfIFOCRR6cYay36wT5+
         a1NEJv9HYE3MAzmVpPP5aQvxie4zQvscRJEpS1+Yuu2F0nTUcE3dR3SmcacZi6kSxP
         Mn62fT258b/XQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 1/19/21 9:52 PM, Thierry Reding wrote:
> On Tue, Jan 19, 2021 at 04:55:35PM +0800, JC Kuo wrote:
>> Once UPHY PLL hardware power sequencer is enabled, do not assert
>> reset to PEX/SATA PLLs, otherwise UPHY PLL operation will be broken.
>> This commit removes reset_control_assert(pcie->rst) and
>> reset_control_assert(sata->rst) from PEX/SATA UPHY disable procedure.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>> v6:
>>    no change
>> v5:
>>    no change
>> v4:
>>    no change
>> v3:
>>    new, was a part of "phy: tegra: xusb: Rearrange UPHY init on Tegra210"
>>
>>  drivers/phy/tegra/xusb-tegra210.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
>> index 4dc9286ec1b8..9bfecdfecf35 100644
>> --- a/drivers/phy/tegra/xusb-tegra210.c
>> +++ b/drivers/phy/tegra/xusb-tegra210.c
>> @@ -502,7 +502,6 @@ static void tegra210_pex_uphy_disable(struct tegra_xusb_padctl *padctl)
>>  	if (--pcie->enable > 0)
>>  		return;
>>  
>> -	reset_control_assert(pcie->rst);
>>  	clk_disable_unprepare(pcie->pll);
>>  }
>>  
>> @@ -739,7 +738,6 @@ static void tegra210_sata_uphy_disable(struct tegra_xusb_padctl *padctl)
>>  	if (--sata->enable > 0)
>>  		return;
>>  
>> -	reset_control_assert(sata->rst);
>>  	clk_disable_unprepare(sata->pll);
>>  }
> 
> Isn't this going to break things between here and patch 5 where the
> hardware sequencer is enabled? If so, it might be better to move this
> into patch 5 so that things stay functional and bisectible.
Hi Thierry,
Yes, I will move it into patch 5.

Thanks,
JC

> 
> Thierry
> 
