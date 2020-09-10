Return-Path: <SRS0=wB+u=CT=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B3CC2BB84
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 08:27:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B482420BED
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 08:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="sRks7LvN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgIJI1d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Sep 2020 04:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730317AbgIJI1Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Sep 2020 04:27:25 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B029FC061573
        for <linux-tegra@vger.kernel.org>; Thu, 10 Sep 2020 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Qq0O3IuzaP1jZ21ku5URzKK0SjbONmHfS6e6KVQLvJM=; b=sRks7LvNSDgVPiLSKHROZuypGD
        dYn5f3tL5DkXG5Cc6xDQFd+JMgUlzZbSBiaimKJ0+RYN6T6AyaQaA18+XBzwCzsXuYwXGT8O6iJoj
        a08JHhP6Zxv/EdEMFaIo8KW6Ec3GwqRGWAqQLs9ajpb8fTqFW9jQKa9o9s6pXhVR7DGK3VqP2HGqg
        DMA2+ZwxnQcwR++vAmmeyERAIG/mKPtaCmTs7C/GGZ6zRcNzob/fWB24645hCDdso0s0xH0FvPwoo
        up9qmzAp8Vlyta0TvT10Jz/pVztOlLSS4HHyy6EwnkXPtBbf79BWA6/3xsD98kkSOmz0FAPvY/9dN
        wiiCbYqA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65] helo=[192.168.1.10])
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <cyndis@kapsi.fi>)
        id 1kGHvJ-0001vJ-9G; Thu, 10 Sep 2020 11:27:17 +0300
Subject: Re: [PATCH] arm64: tegra: Wrong hsp_aon reg property size
To:     Dipen Patel <dipenp@nvidia.com>, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        mperttunen@nvidia.com
Cc:     linux-tegra@vger.kernel.org
References: <20200910070950.12941-1-dipenp@nvidia.com>
From:   Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <bcf4c638-164a-1465-a0d4-17c64cbe0576@kapsi.fi>
Date:   Thu, 10 Sep 2020 11:27:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910070950.12941-1-dipenp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 9/10/20 10:09 AM, Dipen Patel wrote:
> The hsp_aon node reg property size 0xa0000 will overlap with other
> resources. This patch fixes that wrong value with correct size 0x90000.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> 
> Fixes: a38570c22e9d ("arm64: tegra: Add nodes for TCU on Tegra194")

I think there shouldn't be a newline between Signed-off-by and Fixes; 
otherwise,

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

> ---
>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index e9c90f0f44ff..93438d2b9469 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1161,7 +1161,7 @@
>   
>   		hsp_aon: hsp@c150000 {
>   			compatible = "nvidia,tegra194-hsp", "nvidia,tegra186-hsp";
> -			reg = <0x0c150000 0xa0000>;
> +			reg = <0x0c150000 0x90000>;
>   			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
>   			             <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>   			             <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
> 
