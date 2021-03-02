Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A3FC433DB
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:25:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D97364DD8
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbhCCDRj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:17:39 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:32973 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381800AbhCBIqh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 03:46:37 -0500
Received: by mail-wr1-f48.google.com with SMTP id 7so18954494wrz.0;
        Tue, 02 Mar 2021 00:46:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=69MhIKzfJHQHYQ5oYHVlFUrLycuJ1vsu6Q89RKIZ76I=;
        b=l1rebV3enwoxgQSRU3dO1WtRjhBJxG5cHJs8DzfWF0VTI1NiFGVkRNZKhnlvfSS7Gj
         DthO7C3k2MOljT2cxhVoOnkLMrocvxjVUBIlP7OL2nNh+s8in313naKCUs8zTXxtjtie
         nSyvhX0OwQZr1pkExq+Xsz/F6NOlACjjRGRtBc48Wekoxl6SOD4QkuspGhQn+H3QJAAp
         XHzwKpoLoNBJQwnpBSUCc59SA9PLUvfQVYCETLfRdWCBkS6YLDQRlikp+xRUK0VjpNJP
         GdihN1UON2wZWhGev6mku5jc2jIijtndGh0kfXOZRGcvjneEk4Ib49CFJVZ+vxSaIfiX
         rrSQ==
X-Gm-Message-State: AOAM531TR3SjGCHPgDhb6NtOaqnPfi63Gy80Ky6pZhVIGkXinIs04UOO
        9b2/9+s4adtncboHnPHMc7E=
X-Google-Smtp-Source: ABdhPJyyqHHSdtoEAN4AcW/WmgfTTcbOGrslCOGyXWlQ2d9rGoIu2+0Ei2nXXykyJWO8d4Qr59jNNg==
X-Received: by 2002:adf:e582:: with SMTP id l2mr21116779wrm.207.1614674755215;
        Tue, 02 Mar 2021 00:45:55 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id z9sm27555628wrv.56.2021.03.02.00.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 00:45:54 -0800 (PST)
Date:   Tue, 2 Mar 2021 09:45:53 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra: Replace DEFINE_SIMPLE_ATTRIBUTE with
 DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <20210302084553.xd4xocoveykv5pm6@kozik-lap>
References: <1614243958-55847-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1614243958-55847-1-git-send-email-yang.lee@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Feb 25, 2021 at 05:05:58PM +0800, Yang Li wrote:
> Fix the following coccicheck warning:
> ./drivers/memory/tegra/tegra124-emc.c:1207:0-23: WARNING:
> tegra_emc_debug_min_rate_fops should be defined with
> DEFINE_DEBUGFS_ATTRIBUTE
> ./drivers/memory/tegra/tegra124-emc.c:1237:0-23: WARNING:
> tegra_emc_debug_max_rate_fops should be defined with
> DEFINE_DEBUGFS_ATTRIBUTE
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/memory/tegra/tegra124-emc.c | 4 ++--

Thanks, applied.

Best regards,
Krzysztof

