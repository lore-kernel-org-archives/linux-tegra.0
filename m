Return-Path: <SRS0=m5en=DV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867EBC43457
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 08:38:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 241DA214D8
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 08:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="jMkplRfr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbgJNIiF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Oct 2020 04:38:05 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4074 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgJNIiD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Oct 2020 04:38:03 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f86b8af0001>; Wed, 14 Oct 2020 01:37:03 -0700
Received: from [10.19.100.177] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct
 2020 08:37:59 +0000
Subject: Re: [PATCH v3 10/15] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra210
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <robh@kernel.org>,
        <jonathanh@nvidia.com>, <kishon@ti.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-11-jckuo@nvidia.com> <20200928134057.GK3065790@ulmo>
From:   JC Kuo <jckuo@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <b2003710-fbc2-803b-134d-22b930342cd5@nvidia.com>
Date:   Wed, 14 Oct 2020 16:37:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928134057.GK3065790@ulmo>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602664623; bh=CAZydlicr6iDmsmBRxa2+Vc6d131hXksVkD+EkZjLWo=;
        h=Subject:To:CC:References:From:X-Nvconfidentiality:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=jMkplRfrnatkfiOKOy/291TSZPod/eZAbY5LO23SsyEQcuHCW9t6C+8bdDHzKv3x5
         il1rEFfZYAgcMfI/dp1JCEMEQw+Z1UfqHuXU9Snqxp/gQZWkrHPv5lU/E/vD00gYe7
         gMGaXx2WrTANBGi3tPGTHrDGFHVqDMVl5SOpzm9B2HAgetMhlkHtBUo1o0gEePblgI
         M6EQgETjhnIoOX2Sb6oegY3ah96BdFtqtZNWYwjWCCgHU4VcY7zQEBfJE+Oy2IAMN2
         PZQQHishMwT3EBhpK/onEgHbEtknr9bW8gyNU18Fjp2AFLL3wZLz6YjhWqXsiGlaY8
         Mzhyrmd+tWR5g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/28/20 9:40 PM, Thierry Reding wrote:
> On Wed, Sep 09, 2020 at 04:10:36PM +0800, JC Kuo wrote:
> [...]
>> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
> [...]
> 
> Could we add function pointers to struct tegra_xusb_lane_ops for all of
> these? That would allow us to assign them once during probe and then we
> don't have to bother with these is_*() functions and multiplexing but
> instead just call ->enable_phy_wake() and ->disable_phy_wake() directly.
Yes, I will implement in this way. Thanks for the suggestion.

> 
>> +
>> +
> 
> There's an extra blank line here.
> 
I will remove it. Thanks.

>>  static struct tegra_xusb_pad *
>>  tegra210_sata_pad_probe(struct tegra_xusb_padctl *padctl,
>>  			const struct tegra_xusb_pad_soc *soc,
>> @@ -2293,6 +3225,8 @@ tegra210_xusb_padctl_probe(struct device *dev,
>>  			   const struct tegra_xusb_padctl_soc *soc)
>>  {
>>  	struct tegra210_xusb_padctl *padctl;
>> +	struct device_node *node, *np = dev->of_node;
> 
> We only need dev->of_node once, so I don't think we need to store it in
> a local variable. Just make this:
> 
> 	struct device_node *np;
> 
>> +	struct platform_device *pmc_dev;
> 
> I'd call this pdev, which is the canonical name for variables pointing
> to a platform device.
> 
>>  	int err;
>>  
>>  	padctl = devm_kzalloc(dev, sizeof(*padctl), GFP_KERNEL);
>> @@ -2306,6 +3240,23 @@ tegra210_xusb_padctl_probe(struct device *dev,
>>  	if (err < 0)
>>  		return ERR_PTR(err);
>>  
>> +	node = of_parse_phandle(np, "nvidia,pmc", 0);
>> +	if (!node) {
> 
> And make this:
> 
> 	np = of_parse_phandle(dev->of_node, "nvidia,pmc", 0);
> 	if (!np) {
> 
>> +		dev_info(dev, "nvidia,pmc property is missing\n");
> 
> It might be better for this to be a warning, to make it easier to catch.
> 
>> +		goto no_pmc;
>> +	}
>> +
>> +	pmc_dev = of_find_device_by_node(node);
>> +	if (!pmc_dev) {
>> +		dev_info(dev, "pmc device is not available\n");
> 
> Same here. Also s/pmc/PMC/ in the message
> 
>> +		goto no_pmc;
> 
> Maybe call the label "out", "done" or something similar. "no_pmc" makes
> it sound like it's meant for error cases, which makes it confusing when
> you fallthrough for the success case as well.
> 
I will amend accordingly. Thanks.

> Actually, in this case it might be easier to just return here instead of
> using a goto.
> 
>> +	}
>> +
>> +	padctl->regmap = dev_get_regmap(&pmc_dev->dev, "usb_sleepwalk");
>> +	if (!padctl->regmap)
>> +		dev_info(dev, "pmc regmap is not available.\n");
> 
> Do we perhaps want to defer probe here?
The return value of dev_get_regmap() doesn't tell if PMC driver is loaded.

I will add the following to for defer probe.
	if (!device_is_bound(&pdev->dev))
		return -EPROBE_DEFER;
> 
> Thierry
> 

Thanks for review.
JC
