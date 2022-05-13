Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A05C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 13 May 2022 09:14:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358864AbiEMJOk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 May 2022 05:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378929AbiEMJOj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 May 2022 05:14:39 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC91189E4A
        for <linux-tegra@vger.kernel.org>; Fri, 13 May 2022 02:14:37 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id f2so3547934wrc.0
        for <linux-tegra@vger.kernel.org>; Fri, 13 May 2022 02:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=CW5oysuhHH0T6UKtZPWsecK0beDO6jnAZmenUi2ss0E=;
        b=A7psNxJmGrVJ+J9U+bnAM2YX+yTLW5VbSz6c24Bqm0Qpq6rJ+EDTy/WrUPXaauaxFk
         GNkJNkr2xOwxoUjJcAGTw4u6M9FuEw7F1L3Lkw8JVnhsYKXq4T4EVomWhYTrF/+smORy
         bhP/jfgiW5VyoirUiVgOqnuBlV+DGbBT0QI3Ob0mA71laitPMBPHLiS+1gcgzcKCbVq0
         y9muAAMOWhUX5u1x8/LWVh9FOnNZHD7RGExP4C3G0Jfd0lxOZhrgwxXxBFrNV4CqmWgA
         epuDPPHyciGABwoK4PnoPpRlicg/4rgLgFJmaQ0/HzTM+03yS/HnTdtx6dS7XUbIiy9V
         GNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CW5oysuhHH0T6UKtZPWsecK0beDO6jnAZmenUi2ss0E=;
        b=pl2/TWnx8LSpOdf3g6g8M5I3xcOhrufn/TbIqzYXQIDLDQINa0Wm6HqMTXhOtmfdRS
         AIxbeP61yYVfjb7tko0lmgoYSRPf+1BEA+3gssy2w/FQhtcjmwlcVQ/OuASS+ATx+r1j
         cdTg3ayRlEGGu82oW9mbhh81J1M6hWaYJVTZQlfGVn3MB8eYEJHQjHgOwtWR+3ewLEb5
         /FQ3avpOhlmJjaoJ6uIIKysYNOlPYJK20pFKMkt657pejANQxv99mF2KUC3AowFwK+PU
         8KigS2HgKbpiMxdbQwx60FD64nxw8nyQHOE8DAXdsTsXD8HILzFpXcMOpZIhDlQMC5j1
         B+6A==
X-Gm-Message-State: AOAM5318I8Oj10+a4l2TsvTifZtIR6YHKZm61i+xn0rxPh1WqQPy7BVn
        SziuyQtITlYepy3O7QNvI6V/Zw==
X-Google-Smtp-Source: ABdhPJzmx072v4Jw3a4mFgDvXSy2gaV5qpVtsOb0dnOo4Q5dT0UugJORKQp3EpEkhkA9UMinsUo+dQ==
X-Received: by 2002:a05:6000:2aa:b0:20c:5a12:20dc with SMTP id l10-20020a05600002aa00b0020c5a1220dcmr3164173wry.316.1652433276220;
        Fri, 13 May 2022 02:14:36 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e23-20020adf9bd7000000b0020aca418f26sm1660330wrc.1.2022.05.13.02.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 02:14:35 -0700 (PDT)
Message-ID: <8b678b2a-dbb1-f29e-4090-698badf078fe@linaro.org>
Date:   Fri, 13 May 2022 11:14:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] arm64: tegra: Add Tegra234 GPCDMA device tree node
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Akhil R <akhilrajeev@nvidia.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220512090052.47840-1-akhilrajeev@nvidia.com>
 <20220512090052.47840-3-akhilrajeev@nvidia.com>
 <36bb53d0-80b3-f79e-a599-6acb98d0c872@linaro.org>
 <6510d8be-38a7-8470-d832-15b948671703@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6510d8be-38a7-8470-d832-15b948671703@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 13/05/2022 10:39, Jon Hunter wrote:
> 
> On 13/05/2022 09:32, Krzysztof Kozlowski wrote:
>> On 12/05/2022 11:00, Akhil R wrote:
>>> Add device tree nodes for Tegra234 GPCDMA
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>> ---
>>>   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 43 ++++++++++++++++++++++++
>>>   1 file changed, 43 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>> index cb3af539e477..860c3cc68cea 100644
>>> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
>>> @@ -21,6 +21,49 @@
>>>   
>>>   		ranges = <0x0 0x0 0x0 0x40000000>;
>>>   
>>> +		gpcdma: dma-controller@2600000 {
>>> +			compatible = "nvidia,tegra194-gpcdma",
>>> +				      "nvidia,tegra186-gpcdma";
>>> +			reg = <0x2600000 0x210000>;
>>> +			resets = <&bpmp TEGRA234_RESET_GPCDMA>;
>>> +			reset-names = "gpcdma";
>>> +			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
>>> +			#dma-cells = <1>;
>>> +			iommus = <&smmu_niso0 TEGRA234_SID_GPCDMA>;
>>> +			dma-coherent;
>>> +			status = "okay";
>>
>> okay is by default for new nodes.
> 
> Just so I know, is it recommended then to drop the status in this case 
> or is it OK to leave as is?

If this is a new node, then please drop it. Less code.

Of course it would be entirely different if this was overriding an
existing node with status=disabled.


Best regards,
Krzysztof
