Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8F1C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 07:00:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EFA464DFD
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Jan 2021 07:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhA2HAH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Jan 2021 02:00:07 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:37882 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhA2HAC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Jan 2021 02:00:02 -0500
Received: by mail-wm1-f44.google.com with SMTP id m1so3036380wml.2;
        Thu, 28 Jan 2021 22:59:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I0gYgB0si4DzJnhX+tVmzjnF6SImyHl28jVz6fS8z7c=;
        b=muz5QSNgdmZo7nehhy2IGBe99gDhj3hdq8hSq+qkGxa84Se3xSk2yTmbdS/XLJoXEu
         +bcihP9r82zn8n9emzH81RUtyqbjwMA4w9qvADSQczq7BM/ol6uPxN/VguVeR8y5NC2K
         /1k1AHuMfLX+PvXako5sZw+XQgP3307yz/zc3pbeLelPzk5Ut9z14Wt2A8x0N79yuFjQ
         A9VsbHLckSaSaDWc4Ko/7VbguiemVAxC9GoUYeyPBW9j0xoHcwKq7WNB2UI7DtevRVIW
         7x7TUf9vyrcod6WM/CdMaBmW6zk1Ae2pDz3B3tCpETYbAMWOZPUnGxCpjy7qirmnGiMO
         4mnQ==
X-Gm-Message-State: AOAM532U0iFlxP0+2ct5kYb3FerExeC7H/YLBHZm+zWyucV1krJt/cfq
        369e3cYgq7cPDiXpRF3Dktw=
X-Google-Smtp-Source: ABdhPJw64TQRP5+5Gnp1J0WTxzWh5qUF3vzgVg/gzqdsVo4nTtt7H1pRcyiCbbcGO16Ddwdoa6k2lQ==
X-Received: by 2002:a1c:4986:: with SMTP id w128mr2340685wma.89.1611903560343;
        Thu, 28 Jan 2021 22:59:20 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id q16sm15137243wme.1.2021.01.28.22.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 22:59:18 -0800 (PST)
Date:   Fri, 29 Jan 2021 07:59:17 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: Remove calls to dev_pm_opp_set_clkname()
Message-ID: <20210129065917.ctod3hjbdsdu5v3g@kozik-lap>
References: <0f22cc1791d8b88c50a9790c2dc19455b34ec7b0.1611742564.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0f22cc1791d8b88c50a9790c2dc19455b34ec7b0.1611742564.git.viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jan 27, 2021 at 03:46:22PM +0530, Viresh Kumar wrote:
> There is no point calling dev_pm_opp_set_clkname() with the "name"
> parameter set to NULL, this is already done by the OPP core at setup
> time and should work as it is.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> ---
> V2: Update tegra124 as well.
> 
> Krzysztof, please take this through your tree, it doesn't have any
> dependency in the OPP tree.
> ---
>  drivers/memory/tegra/tegra124-emc.c | 13 ++-----------
>  drivers/memory/tegra/tegra20-emc.c  | 13 ++-----------
>  drivers/memory/tegra/tegra30-emc.c  | 13 ++-----------
>  3 files changed, 6 insertions(+), 33 deletions(-)

Thanks, applied.

Best regards,
Krzysztof

