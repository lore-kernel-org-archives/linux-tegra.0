Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7289EC7619A
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Mar 2023 06:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbjCUGa3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Mar 2023 02:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjCUGa1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Mar 2023 02:30:27 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F5472BB
        for <linux-tegra@vger.kernel.org>; Mon, 20 Mar 2023 23:30:21 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id y4so55665186edo.2
        for <linux-tegra@vger.kernel.org>; Mon, 20 Mar 2023 23:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679380220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1ju9SHjn0EjnX+WJqAHc/qHXQe1M1fQAhQ9irmoRLI=;
        b=mr0vXSG40cowcVbTWCszpsULDay3AkUTvIQNoxE/6Cjdl1xcl62ZeQlMkGQvvXsDrk
         s4fxDaxslwg5/yMeL9Ig8LjT0F7SmaOuNm65fwSM2bZe5ypr3cel0Ym+RHZioMD/nru5
         mMy6+NbhCnExJz0K0P+hxhwIn0NkAa4h4MZxQgBzN6hTWdEbIq57nKVhxXhzIB42Oay3
         Gx67k8oY5N18LvZkJWFuaADFe/nYmF39zpxfXmBPtyLWan8sSBohpvoxtAOGBJVJH9CZ
         2v+cmkV/91ZdgOLSTGAfnMkrBAWuXHXaYvxR640AZPv1BnGpo6zztRbBxugYNMnk9t0j
         FvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1ju9SHjn0EjnX+WJqAHc/qHXQe1M1fQAhQ9irmoRLI=;
        b=E9GoZHHFTa6iO0qreBWBKP4m+xTtkTBPwBKVeeTONfbMM8efqxN1beNNuROruSBB6M
         Ci01kvUWfNIZ1yb9kKF1222AdaEvKZ0JstCslgJkvAQn0FhWDVyoCuwRI6nfdvqoUzI3
         wPURkJrvOAcqr4J1DKPKUJwFggnYRDGfEzPK8jajAcNnkTizwBl6hHBiXp8xrYd1VL3G
         Zql4yUWhUGkSqJTmGLtSaHmLiF+gCdiDuQkrL/uRjSWFeRAmVW/8ZEcM0jxBlwyCEbdb
         Aqohbq28L88Li1fn+J4+YPQwYT0OHs9qcNikK7tp+wLh+/vzbohcf6k4jbdYWhl7+Anb
         Lkdg==
X-Gm-Message-State: AO0yUKUt6lKR+K5cCRsVkp1dS8zCfRecugwjBB1+meTio2PMXl579NLr
        1roP234aiQEzb1mHlenMRMs9TQ==
X-Google-Smtp-Source: AK7set/mnHhzkLfQ6NWBr4tgSxgW7U8c3Ph5LCp/K+YZdlpgbxJUDmtb0MS2Ksnkrt0SN/5/D3IQvQ==
X-Received: by 2002:a17:906:391b:b0:92b:eca6:43fc with SMTP id f27-20020a170906391b00b0092beca643fcmr1611701eje.64.1679380220208;
        Mon, 20 Mar 2023 23:30:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id hy14-20020a1709068a6e00b009351546fb54sm1717874ejc.28.2023.03.20.23.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 23:30:19 -0700 (PDT)
Message-ID: <35359dee-5803-0cbb-b3d2-89aa6461f6a5@linaro.org>
Date:   Tue, 21 Mar 2023 07:30:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: phy: Drop unneeded quotes
To:     Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Yu Chen <chenyu56@huawei.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Vincent Shih <vincent.sunplus@gmail.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>
Cc:     linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-can@vger.kernel.org
References: <20230320233955.2921179-1-robh@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320233955.2921179-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/03/2023 00:39, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

