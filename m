Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6818C433DB
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Feb 2021 07:39:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 495AA64E34
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Feb 2021 07:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbhBAHjN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 1 Feb 2021 02:39:13 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]:50972 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbhBAHjM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 1 Feb 2021 02:39:12 -0500
Received: by mail-wm1-f47.google.com with SMTP id 190so11704510wmz.0;
        Sun, 31 Jan 2021 23:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=38RAIOne83CuOp0guKoTS7RYuurIDFZ4NgL1aqPnRNk=;
        b=Pl5BCgbQ8loKIkY1hvQ6O4CnksNlLwkM+r1+IjrQ3fUJWOulM8DrsWSerK16tj9kBa
         EDhEkDL88qHMpSKYqFOOnVOUzhH8tPlX6msbLMiD2LoYC+QooqWSk2dWtaQg/maJlIeh
         KMG25U31JMaebSR8f286g4sXieqRv2CnpofVcUF9u8HEcFvHAiuARAl7mYJyIapvtzH8
         gpgSjJOsYO4yXrVer8850RXGGkpwLmMe1NagHa71hNwBYkcqv7aSVcDtLMAaxIFnYK8A
         7arVrttwaydAzk6e1wi26Tmfffx+QIoumm/1CgtY6KTVV7QNpgYOzyRVhTJXTgbTE9gZ
         OcoQ==
X-Gm-Message-State: AOAM532C+Ob0DLqaVPbidXfwLOQkSA0hIstRv5knTgMs/L8S2ZE2mgbm
        gHJ6+bvVIYrd2ggPPek7Hko=
X-Google-Smtp-Source: ABdhPJx64LuQlh+D65SQJHkegF6D9K7Zt7lxJ4PVdOOTTtpT49HGAD9JFALmgDm9+tjm6v2Gmuy9tQ==
X-Received: by 2002:a1c:7d53:: with SMTP id y80mr4526675wmc.187.1612165109999;
        Sun, 31 Jan 2021 23:38:29 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id t18sm21969780wrr.56.2021.01.31.23.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 23:38:29 -0800 (PST)
Date:   Mon, 1 Feb 2021 08:38:27 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] memory: tegra186-emc: Replace DEFINE_SIMPLE_ATTRIBUTE
 with DEFINE_DEBUGFS_ATTRIBUTE
Message-ID: <20210201073827.j7evjmxl5jx56ojl@kozik-lap>
References: <1612162840-52271-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1612162840-52271-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Feb 01, 2021 at 03:00:40PM +0800, Jiapeng Chong wrote:
> Fix the following coccicheck warning:
> 
> ./drivers/memory/tegra/tegra186-emc.c:158:0-23: WARNING:
> tegra186_emc_debug_max_rate_fops should be defined with
> DEFINE_DEBUGFS_ATTRIBUTE.
> 
> ./drivers/memory/tegra/tegra186-emc.c:128:0-23: WARNING:
> tegra186_emc_debug_min_rate_fops should be defined with
> DEFINE_DEBUGFS_ATTRIBUTE.

Please strip unrelated parts of the paths (./).

> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>

Where could I find the report? I did not get anything on my mail.

Best regards,
Krzysztof


> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/memory/tegra/tegra186-emc.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
