Return-Path: <SRS0=Wy30=DW=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544C7C43467
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Oct 2020 08:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E74C222250
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Oct 2020 08:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="LgAOxDT7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730044AbgJOIJS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Oct 2020 04:09:18 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18857 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbgJOIJR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Oct 2020 04:09:17 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8803810000>; Thu, 15 Oct 2020 01:08:33 -0700
Received: from [10.19.101.17] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 08:09:13 +0000
Subject: Re: [PATCH v3 14/15] usb: host: xhci-tegra: Unlink power domain
 devices
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <robh@kernel.org>,
        <jonathanh@nvidia.com>, <kishon@ti.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-15-jckuo@nvidia.com> <20200928135311.GN3065790@ulmo>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <829d6b5c-fe01-5215-783a-197c9a1ce184@nvidia.com>
Date:   Thu, 15 Oct 2020 16:09:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928135311.GN3065790@ulmo>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602749313; bh=3BK7jRRCak9V/eWWKWHJSftCYxf6vNxw/kgibJF3W1U=;
        h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=LgAOxDT7AdvqHhPhCWbKQIrR8b5O+s6DMIW1w28+3plNNiosY8w6W5cW+EOtJD9jD
         4prK1Ev5ttH+3Bg6GDmrUs9tdkjN7rwW6kN0O36u+iKyuDBqXBFS0vxBxOliUjpYzN
         co9zN245MCX4l0bkeP6soLBmr4ybDuGtN6UFdN14JNPGkTRg2MPbAm+fgjz0e4BQ6A
         GXw1R4FwX+rMoVzXiu3iHkSYLCpmSpmUb0VWlxKvmM/FGAwZncnEuMMXnUX0Ek1Lt4
         tA02fyNG+S5NomMbtyc6gIO7DHfKayF+LoERgyfjC+/kP4gkpyquQEWPp5S/p1A/y6
         8sPPL+eioMr1w==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

I will modify the commit message accordingly.

Thanks for review.
JC

On 9/28/20 9:53 PM, Thierry Reding wrote:
> On Wed, Sep 09, 2020 at 04:10:40PM +0800, JC Kuo wrote:
>> This commit unlinks xhci-tegra platform device with ss/host power
>> domain devices. Reasons for this change is - at elpg entry, PHY
> 
> s/elpg/ELPG/
> 
>> sleepwalk and wake configuration need to be done before powering
>> down ss/host partitions, and PHY need be powered off after powering
> 
> s/ss/SS/ here (because it's an abbreviation) and in a few cases below.
> 
> Otherwise this seems fine, though it'd be good if Jon could take a look
> since he's more familiar with the power domain setup here.
> 
> Thierry
> 
