Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD28C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 17 May 2022 08:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242149AbiEQIBr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 May 2022 04:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242151AbiEQIBp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 May 2022 04:01:45 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D443EABF
        for <linux-tegra@vger.kernel.org>; Tue, 17 May 2022 01:01:42 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id i19so33047443eja.11
        for <linux-tegra@vger.kernel.org>; Tue, 17 May 2022 01:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bUC5qooCkXEBvM8/KC7BA0VGv7TO8mNCzaiXDokrDsQ=;
        b=EiE/bxLhEziHG2s/bDv6Lxoin3dlIGvWYbTUlK+vE1vKxmN1tNhtKoWu2pYQ5KR3nZ
         AUX1yhsr5/lcbUt4t+RDDSWs2fD1fCVSz8+95Z6D2zEp/Y35e7YZYHSCt++gE9h0yhZ4
         7aPf/N60wlDY45FyVafs4cYpG/1HuUkkPc1XJnoSSXYXZmby6ShGNZWQLKs1OVThOasO
         yLmQKe3miMu0nKknPcsK/jfM/xUhMBrUDJd+bRj5lfnSlNjZW35NNyawyPB8jPpGLFl2
         kpKKqe27ag1IEVm27tT8pzAOLoGgcFG4mBGWAjvw8oqxvndr4S3sJokMmRYXaqMsFLfa
         PQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bUC5qooCkXEBvM8/KC7BA0VGv7TO8mNCzaiXDokrDsQ=;
        b=ZHSWgFv3Be1HQQ68n/SKVGXAVbYGvZaUCChZXovCoRnf7N9Q1O1funT9FxfHbJ5HF7
         P/FZTOmlPv0GlFucjdJFaQVY3uZJc4QdmiqiPE42IpTI/dHBUXzabAPxGRnM5SGQqAgP
         PX78b8HK6tVqBKGdHklFlRAVub04855NJPcIEm5CRLDPlRinXkEQEp2sbcrl5x+r+62g
         OSwn5G8+zJD9lsEZqYiDStcafyRAeX3z5fJqI2NNj/k8OZxPOrzmvJjNo82ySFzG4ux3
         8ZJGiUxHFPrDkx27+5zDTpnAq7/31+uxbF9kCyA6HG6M0N467yjF37wbqFCsygus+sM0
         tHVw==
X-Gm-Message-State: AOAM530HXQ1U1KvOkEtxB2s1NRDxBDr5P6EJpuOFko4J4U0btO49PZqw
        xN4ScWhAIsfyMgRFns5IvTOknA==
X-Google-Smtp-Source: ABdhPJzyl8icDf8IgeEBFf6+3TEG9rkINLpv/OlZb6E4YCi4ETBNhQvDM95JnxmiJF6TXJMlTCEwgw==
X-Received: by 2002:a17:907:7b9b:b0:6fe:22cb:3adb with SMTP id ne27-20020a1709077b9b00b006fe22cb3adbmr11583841ejc.560.1652774501551;
        Tue, 17 May 2022 01:01:41 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id gz15-20020a170907a04f00b006f5294986besm721119ejc.111.2022.05.17.01.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 01:01:41 -0700 (PDT)
Message-ID: <424b02f3-eb53-68d0-bfee-5488dbcefa71@linaro.org>
Date:   Tue, 17 May 2022 10:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 03/13] arm64: tegra: Add Host1x and VIC on Tegra234
Content-Language: en-US
To:     cyndis@kapsi.fi, thierry.reding@gmail.com, jonathanh@nvidia.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        digetx@gmail.com
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mikko Perttunen <mperttunen@nvidia.com>
References: <20220516100213.1536571-1-cyndis@kapsi.fi>
 <20220516100213.1536571-4-cyndis@kapsi.fi>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220516100213.1536571-4-cyndis@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/05/2022 12:02, cyndis@kapsi.fi wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Add device tree nodes for Host1x and VIC on Tegra234.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 46 ++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index cb3af539e477..cae68e59580c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -454,6 +454,52 @@ misc@100000 {
>  			status = "okay";
>  		};
>  
> +		host1x@13e00000 {

Generic node names, if that possible. Since the bindings do not exist in
the next, I actually cannot figure out what's host1x...

> +			compatible = "nvidia,tegra234-host1x";
> +			reg = <0x13e00000 0x10000>,
> +			      <0x13e10000 0x10000>,
> +			      <0x13e40000 0x10000>;
> +			reg-names = "common", "hypervisor", "vm";
> +			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +			             <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "syncpt0", "syncpt1", "syncpt2", "syncpt3", "syncpt4",
> +			                  "syncpt5", "syncpt6", "syncpt7", "host1x";
> +			clocks = <&bpmp TEGRA234_CLK_HOST1X>;
> +			clock-names = "host1x";
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			ranges = <0x15000000 0x15000000 0x01000000>;
> +			interconnects = <&mc TEGRA234_MEMORY_CLIENT_HOST1XDMAR &emc>;
> +			interconnect-names = "dma-mem";
> +			iommus = <&smmu_niso1 TEGRA234_SID_HOST1X>;
> +
> +			vic@15340000 {

The same... vic is usually a vectored interrupt controller, so this
should be interrupt-controller. Unless it is something entirely else, so
then you need to come with a generic name.


Best regards,
Krzysztof
