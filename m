Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20436C001DE
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 08:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbjGQID2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 04:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjGQID1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 04:03:27 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8487C19F
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 01:03:23 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9926623e367so613091866b.0
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 01:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689581002; x=1692173002;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZHHwD1zM4Zx8LGWaUEDa1H6Zt0saXCDHWEyOcVi++E=;
        b=lpwPHa34dU6D0PS/3roFsr48qQ5n/DyS9+8Fdzja1ODIgukpS2BJ41TYv76huRH4h2
         oFCfmniU6wMh8iz8aENGRP9e35Z1EFYnexDAQ4PAGNCvLZJTr2FvwaIyVbi5Zh/CnpsP
         LsccJVfP4ahGjt6Qg1i//laWNwaQszNR2iEUOE7eS/ry3DmQlCPH1KdLEMHGn2LWIOxw
         CQiBKdTIZH2XBmUiXOYfE9cAadWogyAgfmr/fcku5g1Fo+Z6IRO4hMCWabNdcTTELyrB
         /gvVH1kd7EdXFl2pdvkvnbgkgAS683EDk1VXQ7PgxQRbQkvl1UzWmXhi++wwgLQf8YMk
         tYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689581002; x=1692173002;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZHHwD1zM4Zx8LGWaUEDa1H6Zt0saXCDHWEyOcVi++E=;
        b=AgTWf2E3JdFinqTQSF0iTDeEPF6WqpiPND0qgLy6VC+R8AbToIwGwVlnEMDvlcgIBH
         M/cHdUS+sUaFFL4ATeUoE886MHtzlQAIbl3SQUV+74Y5NaYODULDCW+VqXdBhLF0Wvgs
         IP66a+4k7sr+vw2OeMajcNBxM2feYKfZ/y9K1zDMxBh1ZrKtj7zbNLBivSmJD4EOBs9F
         K1NfoQruZTl8PBwUvHZ0A5DnhGX4C9nIBN8SZC4lWr4cUsRUdwDlT7BHhf+Uz5q9BIj5
         b2lEopgOE3qWA1EOf/O3IgtmsDs3PQI23ANiX8gRF36yqCpU07AuPITqODyRFqHEIYoL
         1Nyw==
X-Gm-Message-State: ABy/qLYk2WTO0+dP5XxCt02ip9vmaHEYzOgXkjSWivdX4Ld1h76zzVqy
        U9MZhduPomwkxDBEA8i4xAx7Og==
X-Google-Smtp-Source: APBJJlHMkwln++jumBBEk8DQG95I5uNY+j0lnVLVVsO5g9bfv405MjUbtG/FCeNexvNQ0BiCPxywmQ==
X-Received: by 2002:a17:906:2096:b0:982:2ece:2a32 with SMTP id 22-20020a170906209600b009822ece2a32mr10958981ejq.26.1689581001747;
        Mon, 17 Jul 2023 01:03:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h4-20020a1709063b4400b00989027eb30asm328939ejf.158.2023.07.17.01.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 01:03:21 -0700 (PDT)
Message-ID: <b3755c4b-fee0-85e3-4066-fb20c1ad99a3@linaro.org>
Date:   Mon, 17 Jul 2023 10:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: tegra: Fix HSUART for Smaug
Content-Language: en-US
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230714101018.10617-1-diogo.ivo@tecnico.ulisboa.pt>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230714101018.10617-1-diogo.ivo@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 14/07/2023 12:10, Diogo Ivo wrote:
> After commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
> reset-names") was applied, the HSUART failed to probe and the following
> error is seen:
> 
>  serial-tegra 70006300.serial: Couldn't get the reset
>  serial-tegra: probe of 70006300.serial failed with error -2
> 
> Commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
> reset-names") is correct because the "reset-names" property is not
> needed for 8250 UARTs. However, the "reset-names" is required for the
> HSUART and should have been populated as part of commit a63c0cd83720c
> ("arm64: dts: tegra: smaug: Add Bluetooth node") that enabled the HSUART
> for the Pixel C. Fix this by populating the "reset-names" property for
> the HSUART on the Pixel C.
> 
> Fixes: a63c0cd83720 ("arm64: dts: tegra: smaug: Add Bluetooth node")
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> index 2c608d645642..bcb533cc002c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -1364,6 +1364,7 @@ serial@70006000 {
>  
>  	uartd: serial@70006300 {
>  		compatible = "nvidia,tegra30-hsuart";
> +		reset-names = "serial";

Why reset-names is board specific? This makes little sense. If you need
reset-names, then it is part of SoC.

Best regards,
Krzysztof

