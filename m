Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E46C63697
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 05:29:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15D51246F1
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 05:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Yb5KFb6b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgKSF2m (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Nov 2020 00:28:42 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11052 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgKSF2m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 00:28:42 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb602800000>; Wed, 18 Nov 2020 21:28:32 -0800
Received: from [10.19.109.31] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 05:28:35 +0000
Subject: Re: [PATCH v4 10/16] dt-bindings: phy: tegra-xusb: Add nvidia,pmc
 prop
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>
CC:     <gregkh@linuxfoundation.org>, <jonathanh@nvidia.com>,
        <kishon@ti.com>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
 <20201016130726.1378666-11-jckuo@nvidia.com> <20201019214046.GA3645734@bogus>
 <20201113162043.GD1408970@ulmo>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <6e5f8508-3781-a747-acc2-e627f35bf0e8@nvidia.com>
Date:   Thu, 19 Nov 2020 13:28:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113162043.GD1408970@ulmo>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605763712; bh=TbSd8j4mjbxV6TDL5wwizNGDRQJcKzqBjWD7XgjSVPc=;
        h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=Yb5KFb6b9NSX7LVRKYw4Atmfq3fprFwu5Qkau6fLngaF/8lW1vkBliquNLBHDLwrF
         LsliIIUqMWd+abYAwNSUN5T1FTHMkp6ks5A2EjFmeoJUSexLazEwOEaSbGhSu2QAb3
         oXKMaOQktc9aeYCtBommyOxvdJaU7Mblf9UgmKpUMUOkv6b6aUGI8zYdAnMGLYMPv6
         TbCImitP0XRNODoEvhIA0fRZTliFvlcMe10QjLeYn5jiRK0MZqOda0fAx/DDwl4uTa
         CUS4jGJjmkpZVdgq+6+eOalWFr/etbigfoTfac7QuofUjoEcchiT+YcN1zM1OSnxRI
         EyzfKyhWBMFJA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/14/20 12:20 AM, Thierry Reding wrote:
> On Mon, Oct 19, 2020 at 04:40:46PM -0500, Rob Herring wrote:
>> On Fri, Oct 16, 2020 at 09:07:20PM +0800, JC Kuo wrote:
>>> This commit describes the "nvidia,pmc" property for Tegra210 tegra-xusb
>>> PHY driver. It is a phandle and specifier referring to the Tegra210
>>> pmc@7000e400 node.
>>>
>>> Signed-off-by: JC Kuo <jckuo@nvidia.com>
>>> ---
>>> v4:
>>>    new change to document "nvidia,pmc" prop
>>>
>>>  .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt      | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>>> index 38c5fa21f435..ea559baeb546 100644
>>> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>>> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
>>> @@ -54,6 +54,7 @@ For Tegra210:
>>>  - avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.05 V.
>>>  - dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
>>>  - hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V.
>>> +- nvidia,pmc: phandle and specifier referring to the Tegra210 pmc@7000e400 node.
>>
>> 'Tegra210 pmc@7000e400' is kind of specific. Going to update this for 
>> every address and chip?
>>
>> If there's only one PMC, you can just find the compatible PMC node. Then 
>> you don't need a DT update.
> 
> I did advise against doing the lookup by compatible string because I
> think it has a couple of downsides. On one hand it's going to create an
> additional maintenance burden on the XUSB pad controller driver because
> the PMC is usually not compatible between SoC versions, so for every new
> SoC generation we'll have to add the PMC compatible string to the XUSB
> pad controller driver.
> 
> On the other hand, this is new functionality and we can easily gate that
> on the existence of this phandle, so it doesn't impact DT backwards
> compatibility. That also has the advantage of explicitly listing the
> dependency between the PMC and the XUSB pad controller in DT, so if we
> ever do get around to come up with an even better mechanism to resolve
> these dependencies than deferred probe, we do have the data already
> available.
> 
> Thierry
> 
Hi Thierry,
Thanks for the ideas. I will stay with the adding "nvidia,pmc" phandle property
implementation. As for the DT document change, I will modify it with below.

nvidia,pmc: phandle and specifier referring to the Tegra210 PMC node.

Thanks,
JC
