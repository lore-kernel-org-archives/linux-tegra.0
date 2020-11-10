Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596B5C388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 15:21:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2B9620644
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 15:21:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730968AbgKJPVO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 10:21:14 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:39679 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730368AbgKJPVN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 10:21:13 -0500
Received: by mail-ej1-f66.google.com with SMTP id s25so18108046ejy.6;
        Tue, 10 Nov 2020 07:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7sMPHtK+YcLJGhfyVwqh2OOYZXXIIXwv/PyI82yPdK8=;
        b=AZkZ9cW/rSwDWyuqiXgbtH7SODLbfrwXJqAdfuPthYjFL+gbasx6klsUkHW4TU+AnC
         fw+XcDf1/GLuy6p/I03AZdli2VI0hkr9gdobeCDAK7sJSJMc2T/fL/GbfLSDhIcUAi5Z
         Usk9qGyr9zqL3vjlEP79NsglH3MN0f8njPzE/+h8Zd8zc/2i2AulSRhtDnr+ozNMbLEN
         XZiVz/B0VkpRmufQL0pRBw2wlfo8ssqTG8EDdazuxJnmW0MUUYf7hyOYRvzlc9qpgcYw
         cE5U1BNgrr9yh1yQjY9TG6gRyTk2hy7S2SqScxpzsErHx7egY+6/XLE46AS2UuFlzq74
         gj1Q==
X-Gm-Message-State: AOAM532Yvph1zP4wmcyNQD71uJFNmcMusH2iBqj2nt3dGe9jjGVp/1Tt
        Yc+6umZQeEPHywP0CRAlEUoQkQ6v9XI=
X-Google-Smtp-Source: ABdhPJwUY9301EUYBgmnJT+dj4+GVeqVlbKbG+QWb//JSnlXJyePGyz9WjAzqkiTjTQOvjsRdFen/g==
X-Received: by 2002:a17:906:2850:: with SMTP id s16mr21452986ejc.276.1605021670221;
        Tue, 10 Nov 2020 07:21:10 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id t3sm10827433edv.59.2020.11.10.07.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 07:21:09 -0800 (PST)
Date:   Tue, 10 Nov 2020 16:21:07 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Yu Kuai <yukuai3@huawei.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        mperttunen@nvidia.com, tomeu.vizoso@collabora.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        yi.zhang@huawei.com, zhangxiaoxu5@huawei.com
Subject: Re: [PATCH V3] memory: tegra: add missing put_device() call in error
 path of tegra_emc_probe()
Message-ID: <20201110152107.GA6203@kozik-lap>
References: <20201109164154.GA211123@kozik-lap>
 <20201110013311.2499003-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201110013311.2499003-1-yukuai3@huawei.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Nov 10, 2020 at 09:33:11AM +0800, Yu Kuai wrote:
> The reference to device obtained with of_find_device_by_node() should
> be dropped. Thus add jump target to fix the exception handling for this
> function implementation.
> 
> Fixes: 73a7f0a90641("memory: tegra: Add EMC (external memory controller) driver")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/memory/tegra/tegra124-emc.c | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)

I think you missed my previous comment about the issue being fixed
already.  Are you sure you rebased this on top of latest next?

Best regards,
Krzysztof
