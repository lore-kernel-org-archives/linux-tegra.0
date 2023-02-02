Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AACC636D4
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Feb 2023 12:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232142AbjBBMVe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Feb 2023 07:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjBBMVd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Feb 2023 07:21:33 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C3438D627
        for <linux-tegra@vger.kernel.org>; Thu,  2 Feb 2023 04:21:24 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso1231954wms.4
        for <linux-tegra@vger.kernel.org>; Thu, 02 Feb 2023 04:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/4U8p8He8nf0F/Q+zKUZ6JAva9Y3IADx+ImOxMwVjs=;
        b=DZVRTdZJ2TGTimuGoUq+e4aS2CgltVg9zGenQm3Q6L3Qknfq09JAq2Lk3bI3Ep+Xra
         Y2YuJxGUB2Kj/j3uYg9GzAL0M4YVqii/ci1/1/VWgJA/yCTWEm10VkgqDYP8ZzckDPwx
         dWYaVTrOnasI9nlHPfhiNudTvvBX6OLMXo1gcGVofXKgBGSPx5s904/ha6KiVkVW/eDn
         0uZvqYUOxnXOXfj1ObF/PkqJiBf7w5apOEU/BviWew69ZimqYRHHwopcPUojTLBsJp9K
         KBjoxfKoXTlrIGVRnyfocC5+Xj1BerZ6skEYjfON7I7uM7h3/WlsCnasF+OQojWp3oEv
         EULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/4U8p8He8nf0F/Q+zKUZ6JAva9Y3IADx+ImOxMwVjs=;
        b=ji6CZqDo9Z0T05gqCbQBBz31dPbFn5lpfAeEXjeHoH8e3LpbCHpkzbliaBvzumwy/f
         ifKD+KAbsURfu0WQmLk2St3ETZUHvqO+BP5PcWYpQNWTYaFmkT5HSrxkPgR3eudJjhUQ
         vcFvu4LWEalCL903TA4RWDsEVLy4COL8m/MhK0d39fakOLXuLhJbWJM1fZJog/Ko8MFR
         69Y/r9EZVAlhPIuzheeiGNb6AhNAvbmDp+FASlk8qhFPNPR1AOtJxNOMWldj6E/VOUzm
         uMa0QKcWiT7z/T88MoXKaQEbrnmMCrEE631OzUKZoR1pi3cL6RXmv+PLgbjb6ejvaEpK
         yD4w==
X-Gm-Message-State: AO0yUKUXr1xwd/fNTomaGgL0CdDyDQw4q+o4CN2q+Eu/oMZx1ga1XjYk
        LIj7l8C8eCePfxsKpgC6IO0YBQ==
X-Google-Smtp-Source: AK7set8gVqTsm/vSxOdXJguhERmSsywifTBAe6FbEDkp0QG4XpfNm6PCN3fFrU/+InV20PS1v4kD7w==
X-Received: by 2002:a05:600c:19c6:b0:3db:2647:a012 with SMTP id u6-20020a05600c19c600b003db2647a012mr6298917wmq.40.1675340482770;
        Thu, 02 Feb 2023 04:21:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a1c5416000000b003dc3f3d77e3sm4824975wmb.7.2023.02.02.04.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 04:21:22 -0800 (PST)
Message-ID: <78155653-62ff-e367-e243-eb546ec285d1@linaro.org>
Date:   Thu, 2 Feb 2023 13:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 20/23] memory: tegra30-emc: fix interconnect registration
 race
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-21-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201101559.15529-21-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 01/02/2023 11:15, Johan Hovold wrote:
> The current interconnect provider registration interface is inherently
> racy as nodes are not added until the after adding the provider. This
> can specifically cause racing DT lookups to fail.
> 
> Switch to using the new API where the provider is not registered until
> after it has been fully initialised.
> 
> Fixes: d5ef16ba5fbe ("memory: tegra20: Support interconnect framework")
> Cc: stable@vger.kernel.org      # 5.11
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

