Return-Path: <SRS0=m5en=DV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBF8C433E7
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 02:26:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D59C221775
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Oct 2020 02:26:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="RkDzxZvp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgJNC0w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Oct 2020 22:26:52 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1698 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgJNC0w (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Oct 2020 22:26:52 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8661b00000>; Tue, 13 Oct 2020 19:25:52 -0700
Received: from [10.19.100.177] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct
 2020 02:26:46 +0000
Subject: Re: [PATCH v3 00/15] Tegra XHCI controller ELPG support
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <robh@kernel.org>,
        <jonathanh@nvidia.com>, <kishon@ti.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200928125438.GC3065790@ulmo>
X-Nvconfidentiality: public
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <c38fc162-c4cb-1321-e861-4d92dbfa62ee@nvidia.com>
Date:   Wed, 14 Oct 2020 10:26:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200928125438.GC3065790@ulmo>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602642352; bh=ZPJkj9lTy0tmAKdms0g6Ssia336rRRZiQeYms/qcGPk=;
        h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=RkDzxZvpllNv9fRWF18Q6EAW8AK/b3WLu3AU9iKxKvmM7kiqD6BABNUjD21mazF+h
         t6We8y6ct4dqExW56mAO8q10kZmPUHG1kjhS2dIqEVSkOEFyDM/SFcI8FGuwM0rpwY
         WVDHhQLN1rAEB3RnFtiT6V9A05pee47WQaCDIajpof+mrsLy/2Vq4RVKUqLlIZ9S7X
         jz/aO9FLktahJF0S3T9o3TI9aifhBL3GBY2t3PZlr5sw7f8W/q1nsYhrFVf/EHI+NX
         whkbSa0HEzcUP1I1k7hVHdaQc0uQBG0Z0j72IQ2n+F33GJLvlUWviLB8OEcSdyInPs
         Cy1eJiTB5dLbg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Yes, it's safe to apply "clk: tegra: Don't enable PLLE HW sequencer at init"
before the others have applied. Disabling PLLE hardware power sequencer will not
cause any functionality problem to XUSB/PCIE/SATA. The only thing changed is
PLLE won't be powered off by hardware when all clients are in low power state,
i.e., software has to explicitly power off PLLE.

Thanks for review.
JC

On 9/28/20 8:54 PM, Thierry Reding wrote:
> On Wed, Sep 09, 2020 at 04:10:26PM +0800, JC Kuo wrote:
>> Tegra XHCI controler can be placed in ELPG (Engine Level PowerGated)
>> state for power saving when all of the connected USB devices are in
>> suspended state. This patch series includes clk, phy and pmc changes
>> that are required for properly place controller in ELPG and bring
>> controller out of ELPG.
>>
>> JC Kuo (15):
>>   clk: tegra: Add PLLE HW power sequencer control
>>   clk: tegra: Don't enable PLLE HW sequencer at init
> 
> Is it safe to apply this second patch before the others have applied?
> Since we now need to explicitly enable the HW sequencer, it won't be
> enabled before the corresponding patch does that. So applying patch 2
> before the others sounds like it would break existing users of the HW
> sequencer.
> 
> Thierry
> 
