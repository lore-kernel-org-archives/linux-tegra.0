Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE43C7618A
	for <linux-tegra@archiver.kernel.org>; Mon, 20 Mar 2023 06:50:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCTGud (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 20 Mar 2023 02:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjCTGuc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 20 Mar 2023 02:50:32 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B604CC12
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 23:50:30 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id eh3so42491506edb.11
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 23:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679295029;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wj4WynA14eSwo6K51yMvmcoA5/a3JwG1vvZ3FaUvQ1M=;
        b=ECqEoacD5pA+uDfGkOxrYKMJe9xoIYpaL1FErEIcOZhygH1SqPIcJCE4o6UJ8NuTtN
         Egzqyoqx6z1/O9d6sR/4jYj1zhbgYL1uA5oXduBKgM92NYFsQi8++JueUNaAAfgHyHG4
         UfJixjWZzgTSzuWwxfDVNmSykHG0T6vmzbNtXHbazseL2+k8VnifEvYk6Mc4zh3mNsQx
         6hmnksVTfkmTN3g+WjxyJR6hb2E7u7I9C5qtjFiwhwkys65OxyGT5rFE9UHwxtZLPJTX
         RKicJpKUsoxcSRf62R1D70Z6hVDvUETlkYTjMZzG6Oeb/1acmbd8fCK/02FLBM5fsRub
         dZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679295029;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wj4WynA14eSwo6K51yMvmcoA5/a3JwG1vvZ3FaUvQ1M=;
        b=kUI8gxLiTCNWdPC684nWmg+KFHTXhCUQFs0R7aKDoY2dKSS8Wl9r5SSucfuL35fu85
         uZ6Nkt1d0a/TbcV+cjZOQ87jjaqXxlaAVyktKVCygShqOxNtLTs+g5gXryKpFZGCoocs
         ry20SA/ldeS1ppsEzrJekhAi5+04G70vQEGyebs31Zf3xwtxW8FBEy8mDLlf/ltiTgry
         YKYgWQ2WoYGFC+Bi1E6BAAxBUe3O+fnq7VmqFJGe8lrrx2IX1p1amusyPX2QVvdu5+no
         kYef4QDx9Optc73h2oPYdDJ31U7U3bcrERu676mKXTQQJtNShsYftb92UfTyKuhfU2yf
         4wUw==
X-Gm-Message-State: AO0yUKX9GmvhSO2pSgL3zLjIZ38ObKamXwsJwcJx2KQhVQfc4c/WAEeB
        AyIpqDQQ/iKATakL69H86di6Kw==
X-Google-Smtp-Source: AK7set9QpZqIcKoGfXB1SFdpyb3b41HOT5g49Kv6AMDFHzZd3PBDNF2IhGtr0UzRZjmg14il1RLtFg==
X-Received: by 2002:a17:907:a042:b0:930:310:abed with SMTP id gz2-20020a170907a04200b009300310abedmr6901628ejc.54.1679295029076;
        Sun, 19 Mar 2023 23:50:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:4428:8354:afb6:2992? ([2a02:810d:15c0:828:4428:8354:afb6:2992])
        by smtp.gmail.com with ESMTPSA id l19-20020a170906079300b00932ed432475sm2829544ejc.124.2023.03.19.23.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 23:50:27 -0700 (PDT)
Message-ID: <a464381c-bdff-4b8e-6e41-229fbf332372@linaro.org>
Date:   Mon, 20 Mar 2023 07:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] arm64: dts: smaug: Add EMC frequency change tables
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, arnd@arndb.de, linux-tegra@vger.kernel.org
References: <20230319194255.124589-1-diogo.ivo@tecnico.ulisboa.pt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230319194255.124589-1-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 19/03/2023 20:42, Diogo Ivo wrote:
> Add the reserved-memory regions of the nominal and derated tables setup by
> the bootloader so that the EMC frequency change code can access them.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index 709f3f417a19..a74826ae97b4 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -30,6 +30,22 @@ memory {
>  		reg = <0x0 0x80000000 0x0 0xc0000000>;
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		nominal: emc-table@f67cc000 {
> +			compatible = "nvidia,tegra210-emc-table";
> +			reg = <0x0 0xf67cc000 0x0 0xbea0>;
> +		};
> +
> +		derated: emc-table@f67d7ea0 {
> +			compatible = "nvidia,tegra210-emc-table";
> +			reg = <0x0 0xf67d7ea0 0x0 0xbea0>;
> +		};
> +	};
> +
>  	host1x@50000000 {
>  		dc@54200000 {
>  			status = "okay";
> @@ -1735,6 +1751,11 @@ pmc@7000e400 {
>  		status = "okay";
>  	};
>  
> +	emc: external-memory-controller@7001b000 {

Node names should be generic, so memory-controller.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Check your code for warnings (dtc, dtbs_check). Node with unit address
requires reg or ranges.

Best regards,
Krzysztof

