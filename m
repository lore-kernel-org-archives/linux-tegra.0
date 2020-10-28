Return-Path: <SRS0=qFEE=EE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116BFC56201
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 00:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC595206BE
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 00:22:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="lCmm40q1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390771AbgJ2AWN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:22:13 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:1414 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388930AbgJ1WiG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Oct 2020 18:38:06 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9937530001>; Wed, 28 Oct 2020 02:18:11 -0700
Received: from [10.2.171.164] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 09:18:01 +0000
Subject: Re: [PATCH v4 10/16] dt-bindings: phy: tegra-xusb: Add nvidia,pmc
 prop
To:     Rob Herring <robh@kernel.org>, <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <jonathanh@nvidia.com>,
        <kishon@ti.com>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
 <20201016130726.1378666-11-jckuo@nvidia.com> <20201019214046.GA3645734@bogus>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <4d190cc1-d01d-9064-0b28-ed7f48858ebd@nvidia.com>
Date:   Wed, 28 Oct 2020 17:18:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019214046.GA3645734@bogus>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603876691; bh=Uicj8tp9XPp1EuN3JiOQD2NdkQG03jiexELbBTYXEFQ=;
        h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=lCmm40q1pu/ss7empc91Sutt+HYjjOzzxXrZuqa59DIk+5YYJRBGBEU/rGxyI0PqZ
         zlRqu9mMCv72cKIjAgLv2524f3MbhSAMJG73Bj3CGt7Bdddc2YINS8Rw5WtY3IXQ9D
         1lAyChykD8CarsLI3vVHxCN70Fkf5DpVZifL017dGi1uBBOEcLxAbReMXAl2Xy+A7m
         BOhOYGLtGGVTMzpek8DZ+qtGmpPKPWTEZyNSXv+TPVjF7yVeTMT52o/kVJQmFHh936
         9E3gyu+qopP8HWSF1fXuTGG76wpdHxqdo7yaItJPAmeyOvpWh4wP1vE8hxyWLj91s5
         zbFQogP8F0/Ow==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/20/20 5:40 AM, Rob Herring wrote:
> On Fri, Oct 16, 2020 at 09:07:20PM +0800, JC Kuo wrote:
>> This commit describes the "nvidia,pmc" property for Tegra210 tegra-xusb
>> PHY driver. It is a phandle and specifier referring to the Tegra210
>> pmc@7000e400 node.
>>
>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>> ---
>> v4:
>>    new change to document "nvidia,pmc" prop
>>
>>  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt      | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> index 38c5fa21f435..ea559baeb546 100644
>> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>> @@ -54,6 +54,7 @@ For Tegra210:
>>  - avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
>>  - dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
>>  - hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
>> +- nvidia,pmc: phandle and specifier referring to the Tegra210 pmc@7000e400 node.
> 
> 'Tegra210 pmc@7000e400' is kind of specific. Going to update this for 
> every address and chip?
> 
> If there's only one PMC, you can just find the compatible PMC node. Then 
> you don't need a DT update.
> 
> Rob
> 
Hi Rob,
Thanks for your review and suggestion. Yes, there is only one PMC node. You mean
I can retrieve the PMC node with the following code and if do do DT update is
not required, right?

	np = of_find_compatible_node(NULL, NULL, "nvidia,tegra210-pmc");

JC
