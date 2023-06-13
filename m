Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5834AC7EE2E
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Jun 2023 10:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240655AbjFMKlq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jun 2023 06:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241953AbjFMKln (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jun 2023 06:41:43 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845D692
        for <linux-tegra@vger.kernel.org>; Tue, 13 Jun 2023 03:41:42 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-569386b7861so93551857b3.0
        for <linux-tegra@vger.kernel.org>; Tue, 13 Jun 2023 03:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686652901; x=1689244901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qo000+tMfEFV9hbsc5XmyKHzqMjtEWqkHh6QiK4Kq7s=;
        b=qMUmc60ww/4ajFHunUj0BtpTP4X/HfcNS3MKa4p2WgG2GkirJ5wh6AVhkXSgMZN22z
         Tg+cUHVX38Krjy9r4TeuuGEiMhAQMFwvuEb/rFTmPb5YkHJksF1qkUfriT0Dobk/idEl
         wc2TkevY8VmKoolqfq0bQMGg2nt2igg2mPb6rQQ2S6A8w6ZIVK400+ylusIvzoqeyOMN
         2zdFbL1mSc5HYsluM4+o0IqHq6GyJY1FB/FJ9BAttq+pxouPyZ0r1cq06YOMXYbaUzW2
         eCV3XdPDUpjnhod6HsdQssXqwRPe7SAXr8liMzszzJJIuk0pB7NRiOUZWv1Wqeyg6SL+
         7sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686652901; x=1689244901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qo000+tMfEFV9hbsc5XmyKHzqMjtEWqkHh6QiK4Kq7s=;
        b=B/RRFZ2Ve56Lcfod9alxbzCfiqLwaq7L2dOdGvB4oO4tRAq3MYNtTJG6JSxTSzD/4L
         xOzvd2XSmXGHdFLYONsO7y1j5C/G3XCEuknzquUhbykFpLf1aP8/mOqEvKXhiRQ2jy4j
         fbI+UWSZXbV5Ki6sYEkN2fw/O3QGb2MKAdrKGRsd9BdxjpcfuAtwU+F/6/enYh1L/Ydr
         FcrLWPbjNfRVvQ6JNfWH0J2+FDRVmVI6ujmp2aIAxt336D75mzxzB/Vb4L6OMjB9ROUT
         9psPFIXsvYpV0U88UcPM4mU6SN2n8MHzuXPrs7kwCKc0eDnWCM6Bq2O9DYEAyjaeoyXx
         W/2w==
X-Gm-Message-State: AC+VfDwy8vz3+7yRBH6Sz5hH2B7ueQ8o1A7XfY5C22Mi3yi9O2JtRziZ
        c8R0k7hYVLeOryoxrjoM66D6Y1hPmFuTs3W0Y8EBtw==
X-Google-Smtp-Source: ACHHUZ7wXx9rL56M5TKSV8kIC35q0vxCnpiKFzxTQQHuOUbix+dPl8Nt63ZFe8Rva1rLJeB/BK0wLo7CntP9BKwy9aY=
X-Received: by 2002:a25:8d85:0:b0:bac:ada7:140e with SMTP id
 o5-20020a258d85000000b00bacada7140emr1130861ybl.9.1686652901179; Tue, 13 Jun
 2023 03:41:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230613095624.78789-1-frank.li@vivo.com> <20230613095624.78789-9-frank.li@vivo.com>
In-Reply-To: <20230613095624.78789-9-frank.li@vivo.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 13 Jun 2023 13:41:29 +0300
Message-ID: <CAA8EJppgSg8TJOABkrNzBRYnyu33XuJF4DYmp2d++Pifx0Hpqw@mail.gmail.com>
Subject: Re: [RESEND 9/9] thermal/drivers/qcom: remove redundant msg
To:     Yangtao Li <frank.li@vivo.com>
Cc:     glaroque@baylibre.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, thara.gopinath@gmail.com,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        edubezval@gmail.com, j-keerthy@ti.com, f.fainelli@gmail.com,
        linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 13 Jun 2023 at 12:59, Yangtao Li <frank.li@vivo.com> wrote:
>
> The upper-layer devm_thermal_add_hwmon_sysfs() function can directly
> print error information.
>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c    | 4 +---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 4 +---
>  drivers/thermal/qcom/tsens.c                | 4 +---
>  3 files changed, 3 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
