Return-Path: <SRS0=m5en=DV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E6CC433DF
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 04:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AA7522227
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 04:15:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="evb3lUcP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgJNEPZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Oct 2020 00:15:25 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:9952 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgJNEPZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Oct 2020 00:15:25 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f867b210001>; Tue, 13 Oct 2020 21:14:25 -0700
Received: from [10.19.100.177] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct
 2020 04:15:18 +0000
Subject: Re: [PATCH v3 09/15] arm64: tegra210: XUSB PADCTL add "nvidia,pmc"
 prop
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <robh@kernel.org>,
        <jonathanh@nvidia.com>, <kishon@ti.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-10-jckuo@nvidia.com> <20200928131859.GJ3065790@ulmo>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <f4b73f5f-ecb4-a04f-552c-5f70ac34ff8b@nvidia.com>
Date:   Wed, 14 Oct 2020 12:15:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928131859.GJ3065790@ulmo>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602648865; bh=gdwix/fqcZp1HpCm+a/EFNedQeQ+/22dDZjpUawqx+U=;
        h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=evb3lUcPjJftqxM6Ngouw3tEc1dr1PICmLC7wy1SRx7G20lBPKH/UQhKPQkyWs4Tr
         +pvL2wxelJ63MvATjQbMV5CBPQSisZI9onDXymrqi//LvjoUjRgUimhMdqpkYhxMBp
         yBIW4m+vgHDyL6Um4jEiKs4+xJH5qdTl9zklQzaUq3xYwmsocNxcL/BNPrJE76js1x
         uR0dXQf1wc3nLIoOl6egwVFHjvR4RKORztyTglsrP0jQ6ROr5OmnFakNC9VZDV3g19
         RK8VllpZOgDWnNxfzzDnJRiXqm4/MOXSgw/PBfKYeODy8QZSvpLYMJEGB1+QaUAu1x
         2yO0v9rI8E+ww==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

I will add a dt-bindings commit for this change.

Thanks for review.
JC

On 9/28/20 9:18 PM, Thierry Reding wrote:
> On Wed, Sep 09, 2020 at 04:10:35PM +0800, JC Kuo wrote:
>> PMC driver provides USB sleepwalk registers access to XUSB PADCTL
>> driver. This commit adds a "nvidia,pmc" property which points to
>> PMC node to XUSB PADCTL device node.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>> v3:
>>    no change
>>
>>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> index 829f786af133..67c90a0ea32e 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> @@ -1040,6 +1040,7 @@ padctl: padctl@7009f000 {
>>  		reg = <0x0 0x7009f000 0x0 0x1000>;
>>  		resets = <&tegra_car 142>;
>>  		reset-names = "padctl";
>> +		nvidia,pmc =  <&tegra_pmc>;
> 
> I hadn't noticed before but it looks like the DT bindings haven't been
> updated with this new property.
> 
> Thierry
> 
