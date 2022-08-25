Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13ECC32774
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Aug 2022 06:35:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235727AbiHYGfg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Aug 2022 02:35:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234076AbiHYGff (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Aug 2022 02:35:35 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F53DA0243
        for <linux-tegra@vger.kernel.org>; Wed, 24 Aug 2022 23:35:34 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bt10so13964431lfb.1
        for <linux-tegra@vger.kernel.org>; Wed, 24 Aug 2022 23:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=EvKjZn6Jwen4vu3P72obwS4c6ve0NpMMiuM5nFUjsc4=;
        b=hA4GPgaoc/uO4LTyPl6C3Xt+kHB33H1tgfQHneoEsl2dH6kJVkPkiVqziKkgko6psm
         sykCnNuBjKSGW65OLNnTjZsc1gMvL8pxzST7G8ZaC26d1V9GnCb8gADMrX52Pg5WmWCC
         MFk+i+s7g5Oj+JlpHgSvV2gIhBbpO8NKxa5qw7xPHWMlOMRk1AL6omhiRuXnNvaZnV7C
         hzs9IqK1KglzKfqWlH1w0ETUDb9CENa5j95XHDtoTAK8Tdo/Y/REu5u5q9EduEq8Rjsd
         lawoJlipNd21qz0GU9CDOlfVn2/cLAWisLJlvtML6nXytSjRYSh6PEQckm243xqW+hR8
         iTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=EvKjZn6Jwen4vu3P72obwS4c6ve0NpMMiuM5nFUjsc4=;
        b=LNFQirbKldeNbUMNzmoOgsPbeCV/kwKv6CVBlnChflgeQH8VworuuSZipna7MsM2rd
         2P91zAkaLbWYa8TAc6yviJS8zHceab1rfL6ap7U6iwAO7nE4RAa3Va/XMpjbIyleDFK4
         SP9zgHt+UnxaT2qIc2TsAPAevuWAyPJ4DGcPZA3PaaAZQmCifqZE9Sl7zOM/6u0+6TVh
         byC4/HA7z+NIlQNvYdMZrNXea+RFk4se57c0laXg8n1aOiR3wPAabOgDV5XctUq3PF/z
         TBsoGRJ22CoPGTrS5YQsfOJqwT/0HaYbxUZCBHzpSTKZInKc0Edzfyh/TjXaJ44l9U8J
         8UqQ==
X-Gm-Message-State: ACgBeo1OuHTrZBU9+Nsn6sb6/utyEkGwvZ1IWOndwG5cUvw4EYP2QoJY
        TXgRG0SLGftFlX2MYt06rAIerA==
X-Google-Smtp-Source: AA6agR4MXfi9uA9HEyxEy5/qdbVPXms4C7TdYuwdEmdffkyYQy/oAl819Jf7A8eMC6blyL3NxEOxFA==
X-Received: by 2002:a19:6a05:0:b0:492:f775:6f43 with SMTP id u5-20020a196a05000000b00492f7756f43mr638867lfu.10.1661409332398;
        Wed, 24 Aug 2022 23:35:32 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id k16-20020a05651c10b000b00260fdfdd23csm329602ljn.109.2022.08.24.23.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:35:31 -0700 (PDT)
Message-ID: <3ea10afc-61f4-a5ac-aef9-16ddc6f845e6@linaro.org>
Date:   Thu, 25 Aug 2022 09:35:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] ARM: configs: replace CONFIG_NO_HZ=y with
 CONFIG_NO_HZ_IDLE=y
Content-Language: en-US
To:     Stefan Hansson <newbie13xd@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org
References: <20220822161018.16101-1-newbie13xd@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822161018.16101-1-newbie13xd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 22/08/2022 19:10, Stefan Hansson wrote:
> According to https://www.kernel.org/doc/html/latest/timers/no_hz.html,
> CONFIG_NO_HZ=y should be replaced by CONFIG_NO_HZ_IDLE=y for newer
> kernels, so let's reflect that in the 32-bit ARM defconfigs.
> 
> Signed-off-by: Stefan Hansson <newbie13xd@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> # Samsung

Best regards,
Krzysztof
