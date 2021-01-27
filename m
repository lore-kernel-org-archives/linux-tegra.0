Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC24C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 19:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EBD664DC5
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 19:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbhA0TbL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 14:31:11 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13267 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbhA0TbD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 14:31:03 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6011bf440001>; Wed, 27 Jan 2021 11:30:12 -0800
Received: from [10.26.73.116] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 19:30:10 +0000
Subject: Re: [PATCH] arm64: tegra: Add support for Jetson Xavier NX with eMMC
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20210127175250.326390-1-jonathanh@nvidia.com>
 <YBGxkd1Ig5/2R0aG@ulmo>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <291061a5-1e69-b35f-a57f-ef54d6424e49@nvidia.com>
Date:   Wed, 27 Jan 2021 19:30:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YBGxkd1Ig5/2R0aG@ulmo>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611775812; bh=S+nYE7hkUXr+/e29IA/XJ7pOEuSMQW3ynpZxm8hS+fM=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=oWo9ZsgbIkgTv0mXq+iS0rsyN8lqvMbnX/XoSbRpOASfUzj2zfUV1wOttNLhqcGxs
         ZxX4AouH3dbhB7HmcM13pwR2rA74vcYTjVS0KzTkOUHUYXsgh/fx91UMA4qIR+L/sC
         nk7VbrHGdolsLSxrlRravcwvUb5GbNp5l3f4Hlu2+a9cxOYVt0NUtIovxXrVXvbRuW
         Jn4X1PNPuDUUeWpJUomq3Y1YmDH7NuBNWlcmf4rmodZkLualvC8dX1sm+CBHA0LD0D
         x02oiJC+yGpfi5S2KrzHLpC2r8afv1hc/8mk+YxJ1a2DdpnOQewBkE9K54KpojGwAd
         VxHbKitrJpyOA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 27/01/2021 18:31, Thierry Reding wrote:
> On Wed, Jan 27, 2021 at 05:52:50PM +0000, Jon Hunter wrote:
>> There are two versions of the Jetson Xavier NX system-on-module; one
>> with a micro SD-card slot and one with an eMMC. Currently, only the
>> system-on-module with the micro SD-card slot is supported and so add
>> necessary device-tree changes to add support for the eMMC version.
>>
>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>> ---
>>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>>  .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 351 +-----------------
>>  .../nvidia/tegra194-p3509-0000+p3668-0001.dts |  10 +
>>  .../boot/dts/nvidia/tegra194-p3509-0000.dtsi  | 351 ++++++++++++++++++
>>  .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 282 +-------------
>>  .../boot/dts/nvidia/tegra194-p3668-0001.dtsi  |  19 +
>>  .../arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 284 ++++++++++++++
>>  7 files changed, 669 insertions(+), 629 deletions(-)
>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi
>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
> 
> This looks good, although I must say this is difficult to review. Maybe
> it would help if this was split into two patches where first the files
> are split for tegra194-p3509-0000+p3668-0000 and the second patch adds
> only the files for the new SKU.

Yes, OK I will do that. I must admit the diff is not very clear.

Jon

-- 
nvpublic
