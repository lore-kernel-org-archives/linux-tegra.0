Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D44EC43217
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Nov 2022 17:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233035AbiKGR6d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Nov 2022 12:58:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232910AbiKGR6Q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Nov 2022 12:58:16 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95728286F7
        for <linux-tegra@vger.kernel.org>; Mon,  7 Nov 2022 09:55:32 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id h12so17457514ljg.9
        for <linux-tegra@vger.kernel.org>; Mon, 07 Nov 2022 09:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PGr+OHpd9QR70TelEUD0vawxtEQ1HAh4AfgGSoeJdCg=;
        b=YJ1bDYl6JLlBjy8eyB95SYQZIKQOVjudBlguIR/pdlO9WhqJqZP5VFxWpqsOhj+q/F
         XPCwvsTaIC3lDzN8fuOI7q/rdvZiXOl2Uyc06eAWQTgYbkVZ3vUTB2xk5bCxCOiEzN3m
         Mig/4KNs+R8/fdK27ItXKObx4D0FoanGoi4XtUJhBebXNS7v73cRMRqO00XvHc9UHSiW
         K673Tc2Wiy+vGBC5vO7XUso8/lieNabysdAzjR/3jdnMeTMH9bYD/q/d1frObSXI0PQk
         CnD/cnz6JdKNse3zFfvIPX0y9NLRwJKX1LxMiucrA8l6H+hTF5v6191LWCt6gDGerOLG
         aV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PGr+OHpd9QR70TelEUD0vawxtEQ1HAh4AfgGSoeJdCg=;
        b=oyyPefpqtxik3xn0zB3U+bsYyIhlTh3QFgYLOLv+3RDEMpNECJjqUXcfQqM/g+xhxy
         n54mV8BrU+exboUlQFx+eXC8a5EZIEFV3KtCEQplUVFhk2s6+8KjlWair+66a+3NX3x+
         njm9L3BIdFBwtOhXEpjM8QA9o7dLEKWiqpGwxxfEzhwjZgj+v61J+9X4NTiTTMZMNpHu
         oWrHNwg2bdqvcFU91zWDaZd0W1hUFr8PLbRmjEeU6ih196QlDgx6GzjIJd/HpqdQ2buV
         5tVyarO5CBgarmcTjal6Ht0AY49hbjhT1rdjfGo9JWt9oZMxWJPHhiK+s0Q1SQiGSNAg
         SJnw==
X-Gm-Message-State: ACrzQf2UTcbslsd+WzP3zGMVlPScoUJUTUABZDCmrl57d/HJzS3hq3hd
        DMtHtmtS3++Z2kvM7VucwilEeg==
X-Google-Smtp-Source: AMsMyM4i3h9s+NDpf4TdbXxN2HKfcV0lefo8LkPXtTQWjLJHSetVxfR9aJ+uXIefvKsVbJ2ZwlNwvA==
X-Received: by 2002:a05:651c:516:b0:277:2428:3682 with SMTP id o22-20020a05651c051600b0027724283682mr6104769ljp.291.1667843730703;
        Mon, 07 Nov 2022 09:55:30 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id j10-20020a056512344a00b004afd23cf7eesm1336063lfr.168.2022.11.07.09.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 09:55:29 -0800 (PST)
Message-ID: <84b57a5c-3b29-3e40-8375-8496baabdbc9@linaro.org>
Date:   Mon, 7 Nov 2022 18:55:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/23] arm64: dts: Update cache properties for exynos
Content-Language: en-US
To:     Pierre Gondois <pierre.gondois@arm.com>,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Tsahee Zidenberg <tsahee@annapurnalabs.com>,
        Antoine Tenart <atenart@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Chester Lin <clin@suse.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        NXP S32 Linux Team <s32@nxp.com>,
        Wei Xu <xuwei5@hisilicon.com>, Chanho Min <chanho.min@lge.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Nishanth Menon <nm@ti.co>, Tero Kristo <kristo@kernel.org>,
        73@gmail.com, Martin Kepplinger <martink@posteo.de>,
        Liu Ying <victor.liu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Vadym Kochan <vadym.kochan@plvision.eu>,
        Sameer Pujar <spujar@nvidia.com>,
        Akhil R <akhilrajeev@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Shashank Prashar <s.prashar@samsung.com>,
        Sriranjani P <sriranjani.p@samsung.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-realtek-soc@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
 <20221107155825.1644604-8-pierre.gondois@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107155825.1644604-8-pierre.gondois@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 07/11/2022 16:57, Pierre Gondois wrote:
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> The 'cache-unified' property should be present if one of the
> properties for unified cache is present ('cache-size', ...).
> 
> Update the Device Trees accordingly.

Why do you send it again? This was applied.

What is more - you have way too many recipients. Mail servers reject it.
It's impossible even to reply to it...

>  			cache-sets = <2048>;

Best regards,
Krzysztof

