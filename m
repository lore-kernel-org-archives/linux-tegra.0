Return-Path: <SRS0=4r7m=DC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB377C4346E
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Sep 2020 00:12:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51DFF239A1
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Sep 2020 00:12:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyClMLHU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgIYAM6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 20:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIYAM6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 20:12:58 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED982C0613CE;
        Thu, 24 Sep 2020 17:12:57 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y11so807291lfl.5;
        Thu, 24 Sep 2020 17:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PBjgiLAVSoJgxT17zOaTxqyfbhjh2QfCjso7UAkKS6w=;
        b=PyClMLHUz5XkszhIsBYpSCSD24UXHk2Fq0eHt1+0sSz9aqQow4/Ts3mvjms4vmM2xB
         AqP8sBz90ZxlkvxshCBCQK1fSx0keyumDt1aAF7iee74Cf6rlfgGTkIsd3M+SEX7B7kJ
         Z9oONbbvZhUzm7jm4S8HjZu3XS73NkSWVDjuEjvQ/YmlZkgshMPc8ZEFBGA2VBIFa8tA
         Io2P0LdsTPi9Gj6srGxntRGPKUmNlOeJE9mXSiLg1QT2FSX1eH4acvMl9WEjLQZkoqxv
         Bedbb8JVRjJyvtoYlOuzpW9cZy2xPrw5F3pUc02rNGkQhUwK1n46LahTqbNmWnwVccZn
         IBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PBjgiLAVSoJgxT17zOaTxqyfbhjh2QfCjso7UAkKS6w=;
        b=AlLM3+3swmm/u9wrDrjE/pTYrZ6cyu7pSXlkPKwapC2sZ/eKdQs6p52EMWl66RkT3b
         4HF5l6cpylcdT9O0Ms+CtB+IUAcR2233NruZoioge3a/9MgxZ8o32dhBsrCT4hTrcqm5
         rTFKhrPegMrcuO7AnLGVgJf1NOkAmCFszHVfNAV3XY/W1BiYRSFtDr8l9Tnfh5SgeAGw
         HUHuSEAqK0dEaLynDhiCxxiVpiq3gclC6vtpepsyZHnKMY558G4KNpkdInCO7zMl7JZF
         6X9QtBgmVFVuQE3cSgcjsu+jy8YFxhlWWOlHYR00Qgs7BffCAJJv9nyy9oOmMhkBNifR
         +Ccg==
X-Gm-Message-State: AOAM532DoZHvv3/85KawfI7nCMfayG3qlQdP+oRcdOLqQRPlC6zAhiAY
        4ahBdWtJT06GRQa3jheSmWDMZ8sJ18M=
X-Google-Smtp-Source: ABdhPJyNVc10NeKfqnrZD5h8TUnpb/DgCHWGN04GvZ7x8/q1fz7C79zcLT2VBhL01kgjAlOMHKbcbQ==
X-Received: by 2002:ac2:495a:: with SMTP id o26mr462064lfi.94.1600992774207;
        Thu, 24 Sep 2020 17:12:54 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id y21sm727120lff.155.2020.09.24.17.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 17:12:53 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] ARM: tegra: Add device-tree for Ouya
To:     Peter Geis <pgwipeout@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200923210352.1176386-1-pgwipeout@gmail.com>
 <20200923210352.1176386-2-pgwipeout@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <df2d6a8d-8a6c-464b-8f35-a7994ea01534@gmail.com>
Date:   Fri, 25 Sep 2020 03:12:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923210352.1176386-2-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

...
> +/ {
> +	model = "Ouya Game Console";
> +	compatible = "ouya,ouya", "nvidia,tegra30";
> +
> +	aliases {
> +		rtc0 = &pmic;
> +		rtc1 = "/rtc@7000e000";
> +		serial0 = &uartd; /* Debug Port */
> +		serial1 = &uartc; /* Bluetooth */
> +		mmc0 = &sdmmc4; /* eMMC */
> +		mmc1 = &sdmmc3; /* WiFi */

Thierry may want to sort these aliases in alphabet order.

> +	};

...
> +		pmic: pmic@2d {
> +			compatible = "ti,tps65911";
> +			reg = <0x2d>;
> +
> +			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +			#interrupt-cells = <2>;
> +			interrupt-controller;
> +
> +			ti,system-power-controller;

Are the ti,sleep-keep-ck32k and other properties not needed for Ouya
like they are needed for Nexus 7?

...
> +	sdmmc3: mmc@78000400 {
> +		status = "okay";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		bus-width = <4>;
> +		non-removable;

Recently I added assigned-clocks here for Nexus7/A500 DTs in order to
get true 50MHz for the WiFi SDIO.

> +		mmc-pwrseq = <&wifi_pwrseq>;
> +		vmmc-supply = <&sdmmc_3v3_reg>;
> +		vqmmc-supply = <&vdd_1v8>;
