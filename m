Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDEDC4361B
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Dec 2020 11:03:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D5CC22288
	for <linux-tegra@archiver.kernel.org>; Sat, 19 Dec 2020 11:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgLSLDC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 19 Dec 2020 06:03:02 -0500
Received: from mail-ej1-f43.google.com ([209.85.218.43]:45212 "EHLO
        mail-ej1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgLSLDB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 19 Dec 2020 06:03:01 -0500
Received: by mail-ej1-f43.google.com with SMTP id qw4so6851050ejb.12;
        Sat, 19 Dec 2020 03:02:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uV8NM4ewui2V4x6VSIOE6oo6nIoQPudLTeEHvVfs8JQ=;
        b=eReCBfLOw1653/4FSszhT3VTwnNYpyzIxBxVx/BbInNkOXlb5uLSkzsJ15xzrPmdvc
         0BKWyf578T8rUmlDCNmrEJahfRGtuBPQ/KLEk5X06KLQW1G7UCV4CAejadt3tIRxzVe1
         6ptC3rOfA3YYlS+k9v3IkWppzsIMdXjRPUnHGJE3HZQQ8jkQNmFVM43eIbS8IB1NV6wG
         51JC1d/2kDj5k2RWIFu+8iqbevMw7v7iBr0THxmrpyB0DtQLX1X6XMHWuT2Xp5h6KNSw
         gHlf3gqDKpWsyYFz5yDiu7N7ZY3daYmys1nGX5k8N5WAHcndQ3OUtMRbbjQ9Xlc2Ftqj
         EdpA==
X-Gm-Message-State: AOAM531n3vMbtwOmyYa0q3bl9mUuGTlgEfMlPRAhMAuDZR7Z6Y/ucYGC
        5LNRxGCBOIhc79IJdy+a4L0=
X-Google-Smtp-Source: ABdhPJzxz67/afVC/FecrdBWnQo3YhrStnV8UwyX/FnI8M7nQ7PMaAAZLXFCUP8jKCtTVxGcSTk9gg==
X-Received: by 2002:a17:907:1004:: with SMTP id ox4mr7872260ejb.240.1608375739292;
        Sat, 19 Dec 2020 03:02:19 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id i26sm6569740eja.23.2020.12.19.03.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 03:02:18 -0800 (PST)
Date:   Sat, 19 Dec 2020 12:02:16 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 41/48] memory: tegra20-emc: Use
 devm_tegra_core_dev_init_opp_table()
Message-ID: <20201219110216.GB5323@kozik-lap>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-42-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-42-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Dec 17, 2020 at 09:06:31PM +0300, Dmitry Osipenko wrote:
> Use common devm_tegra_core_dev_init_opp_table() helper for the OPP table
> initialization.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 57 +++---------------------------
>  1 file changed, 4 insertions(+), 53 deletions(-)

If there was no more Tegra MC work planned, this could easily go via
Tegra SoC tree. However I expect still work of your interconnect
patches, so maybe it's better to stick these in same tree.

In such case I would need a stable tag with the
devm_tegra_core_dev_init_opp_table() helper for memory controller tree.

Best regards,
Krzysztof

