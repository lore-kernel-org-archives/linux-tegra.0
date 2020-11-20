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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8258CC63777
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 19:24:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C4AA22240
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 19:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="GUZCygJF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgKTTX5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Nov 2020 14:23:57 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1958 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgKTTX5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Nov 2020 14:23:57 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb817c10000>; Fri, 20 Nov 2020 11:23:46 -0800
Received: from [10.26.72.149] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 20 Nov
 2020 19:23:54 +0000
Subject: Re: [PATCH 2/2] arm64: tegra: Hook up edp interrupt on Tegra132
 SOCTHERM
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, Nicolas Chauvet <kwizart@gmail.com>
References: <20201120161356.3880457-1-thierry.reding@gmail.com>
 <20201120161356.3880457-2-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <4582fdf0-32d2-d964-466c-2dcc0c7e29ac@nvidia.com>
Date:   Fri, 20 Nov 2020 19:23:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120161356.3880457-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605900226; bh=y/FT3u5odbkLzU7k/Ubqz7lfbwoHI+ry9gZh5yIUobI=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=GUZCygJFN15dD9ekfOwbZfhlFC5Vu6Rw1cbF4vbR/nWN7t+VOc1G8SnfFOwPCCc4W
         Cvu1nQSne4XblyQpTCjM6nfqVNgdWJARCLlCgYuqMDWgEl4ODqaPDosqxPjXnzJ7ae
         I/mdrGes63E4oOkH/FsKJzNeXmIgxRw7pccYGz0mAVyq+IEL+F3AggNNNrDE/gJYvq
         n+2yf+/NmzGhQcDXqRhZz3KQcDkM8ichbl0w2lq/7CYSuspBOT4xLhmUEDoo8i99Ql
         0qav6yHsTmQjzywiuTcx48wgLrzwG7LWiAfmE7FzPk2b2npgx3edomq8KXTyz5nTuc
         0ikRk8RoHsSsw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 20/11/2020 16:13, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> For some reason this was never hooked up. Do it now so that over-current
> interrupts can be logged.
> 
> Reported-by: Nicolas Chauvet <kwizart@gmail.com>
> Suggested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra132.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
> index e40281510c0c..de420a117e59 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
> @@ -865,7 +865,9 @@ soctherm: thermal-sensor@700e2000 {
>  		reg = <0x0 0x700e2000 0x0 0x600>, /* 0: SOC_THERM reg_base */
>  		      <0x0 0x70040000 0x0 0x200>; /* 2: CCROC reg_base */
>  		reg-names = "soctherm-reg", "ccroc-reg";
> -		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIT_SPI 51 IRQ_TYPE_LEVEL_HIGH>;


Looks like you got your GIT and GIC mixed up :-)

Error: /dvs/git/dirty/git-master_l4t-upstream/kernel/arch/arm64/boot/dts/nvidia/tegra132.dtsi:869.10-11 syntax error
FATAL ERROR: Unable to parse input tree
scripts/Makefile.lib:326: recipe for target 'arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb' failed
make[3]: *** [arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb] Error 1

Jon

-- 
nvpublic
