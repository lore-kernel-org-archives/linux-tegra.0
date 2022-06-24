Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4B2C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jun 2022 00:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbiFXA5E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 23 Jun 2022 20:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiFXA5E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Jun 2022 20:57:04 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E82562CC
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jun 2022 17:57:02 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id t3-20020a17090a510300b001ea87ef9a3dso1281408pjh.4
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jun 2022 17:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hxVvB/m7x0pgtjlNYBhWurxvqaAULbnSfJFRHQ6dHo4=;
        b=LMOQw6GJtSJ54E9LC8aXS8JjU9Xiug7/qsvW5QpPNmC0/MUnxPZkcpO1Kb8rHGenmc
         lzbcmdRhC0vjEKRRF4+bOY4vbkzgMM9VmvQwGETZ+0v11g31c8Qsl1WyIoHK+XAl0pH8
         wjYyASMIZDd9LL3/pPH5ZqxwgTBtIZ1YV/51WxozXcXv+PEAxXA4Yrz3HrhdLsPvrZ2v
         j7rmSzSxDBqageafcUNeyQqx1gTt9yLe8/ujf7aHo2CY0Pq4vK1G30e7UKaohGd5bYGZ
         nY+t942ghnZQJA6KYZDoryFEFXUk71S5ZMSF8DiMFo8YbTY6rJFGWF8oxaspQ5YaclkS
         HTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hxVvB/m7x0pgtjlNYBhWurxvqaAULbnSfJFRHQ6dHo4=;
        b=1cblXv3o+MUFCCAv57r2joFfxFUD21+4NSruLyd7deKXs8uJaBTKl2qcXaEBsk5ZLF
         gFpW4IZEMYJxHXY5+hv6UHlDmcRmaaJm2wzTMGRV60eHnrrAdnHVmhYs3DmiRp/SOeg+
         l5oHK4Lj/5iLpRnJuVesWDBmqjLVNDty2dJDdKCSWK5Pug4t1hndRfldLGt76Wfka5ft
         Rz+mN3cLwrbl3eNZBDAHeNw+O3SJcQt7x2xgt50TTNWpyVRF2pMOiJwkAzoQKjPZy/uS
         CQfXpnqL5BpvpaOd88w6HwbTXMNswzOUmo4RjJ5GJCToFX01JeqdM0H0tUJjlG/WXy46
         qiTw==
X-Gm-Message-State: AJIora+V8zK/mspf26GaoUMAJ63Niw40Cy8133Dmiw3udnF+6TBJU6ti
        04dSlDBM4OeQQw7WdjS95J5DMw==
X-Google-Smtp-Source: AGRyM1u/rQOGJQmJ3cvPtnGI8BOb90GaJ9FhnlhNwV1scpb7V7CBR/z3hC4vp9WD7hspkr0FrliEYw==
X-Received: by 2002:a17:90b:4c48:b0:1ec:a20e:a9bf with SMTP id np8-20020a17090b4c4800b001eca20ea9bfmr790585pjb.209.1656032222483;
        Thu, 23 Jun 2022 17:57:02 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id v20-20020a1709028d9400b001690a6394b6sm390283plo.247.2022.06.23.17.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 17:57:01 -0700 (PDT)
Date:   Fri, 24 Jun 2022 06:27:00 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/31] soc/tegra: Migrate to dev_pm_opp_set_config()
Message-ID: <20220624005700.oj4etaajbutvsym7@vireshk-i7>
References: <cover.1653564321.git.viresh.kumar@linaro.org>
 <449b344f037c7ef1970bc84d31e0d4c4cb4d2951.1653564321.git.viresh.kumar@linaro.org>
 <20220624004831.po35sowzfo4c47b3@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624004831.po35sowzfo4c47b3@vireshk-i7>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 24-06-22, 06:18, Viresh Kumar wrote:
> +       struct dev_pm_opp_config config = {
> +               /*
> +                * For some devices we don't have any OPP table in the DT, and
> +                * in order to use the same code path for all the devices, we
> +                * create a dummy OPP table for them via this. The dummy OPP
> +                * table is only capable of doing clk_set_rate() on invocation
> +                * of dev_pm_opp_set_rate() and doesn't provide any other
> +                * functionality.
> +                */
> +               .clk_names = NULL,
> +               .clk_count = 1,
> +       };

Slight modification here, sorry about that. We just need to set the
name as NULL and not the array itself.

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index cd53e46c4058..6a099d764cce 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -116,7 +116,7 @@ int devm_tegra_core_dev_init_opp_table(struct device *dev,
                 * of dev_pm_opp_set_rate() and doesn't provide any other
                 * functionality.
                 */
-               .clk_names = NULL,
+               .clk_names = (const char *[]){ NULL },
                .clk_count = 1,
        };

-- 
viresh
