Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CDAEB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 18:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236332AbjGNSLV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Jul 2023 14:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236340AbjGNSLV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jul 2023 14:11:21 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61269270D
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jul 2023 11:10:49 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-346541baf2aso8056315ab.1
        for <linux-tegra@vger.kernel.org>; Fri, 14 Jul 2023 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1689358246; x=1691950246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ElBmMm1ZevyAKtumVID4tVMI+TD8QnK9EnzezYAZC1A=;
        b=Mpdbmrnz6XIJWmlHQJGoTmuC7D53w+ptxGvR1qzM5rcUr2yuAkawf06rjkPYMTBpFq
         l6MjPg1ZjnoCWgc8pvFZw+blKr4qxg2V0sQF1H0WVPdY6+DHII+TihuXYaBMer6Ieai0
         olDYpMIpFkabUds26CFLUeHKHqIZFPDKt93i0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689358246; x=1691950246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElBmMm1ZevyAKtumVID4tVMI+TD8QnK9EnzezYAZC1A=;
        b=MmUBMZPWvD7RoXwh9G2ognCWaO/RG50A8FD2j4vEJUA3uV1cVwJ3R2ucGCzEL1aL9W
         pU9BpW8iRikEMAnPF4BaTGFNUAG7q1oY5y9OGshJOSj//I4WgrcopvDXdoLwQZs2YfXK
         S9aBUjMNKCG/pesVyazmiAr2EOj3HVrC1iB4TK9wNwlF7CgwkZ815OHb9BjTsjasAbjD
         bKElTsEOAnIqX1J8B/IPoQKL/fg+ovINkg/k+TX+4hZYQ0/ow1Z2eGmG+6mJvHDduvqb
         nUfKH0F4T0hMS4lzb6PdF1c41+X8F+UL4DK0Gh/wF2bgguwZKpN6gOpc8ffZ9JFeAi8G
         CKFA==
X-Gm-Message-State: ABy/qLYZ0OIViJApw+ioiC+NMy4n0fz0LEWUiClMRD+sQKBQ6Xr4SpPA
        C9uIZDAx7EhPW/vPxKuInXgQrw==
X-Google-Smtp-Source: APBJJlGUGWVq3dRmIhivYzT09y1C8kNKMoIaBZuLBrLyn6F4EFbPgbam3zAfvH0LyeRyezDMUEgn+A==
X-Received: by 2002:a05:6e02:221e:b0:346:bf9:76fb with SMTP id j30-20020a056e02221e00b003460bf976fbmr2505344ilf.6.1689358246007;
        Fri, 14 Jul 2023 11:10:46 -0700 (PDT)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id ee14-20020a056638292e00b0042ad6abe0bbsm2820039jab.20.2023.07.14.11.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 11:10:44 -0700 (PDT)
Message-ID: <2af8ba3f-566a-756e-48bf-3e723bc713da@ieee.org>
Date:   Fri, 14 Jul 2023 13:10:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [greybus-dev] [PATCH] staging: Explicitly include correct DT
 includes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
        Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
        Christian Gromm <christian.gromm@microchip.com>
Cc:     devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org
References: <20230714175002.4064428-1-robh@kernel.org>
From:   Alex Elder <elder@ieee.org>
In-Reply-To: <20230714175002.4064428-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 7/14/23 12:50 PM, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For drivers/staging/greybus/arche-platform.c:

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/axis-fifo/axis-fifo.c             | 6 ++----
>   drivers/staging/greybus/arche-platform.c          | 1 +

. . .

