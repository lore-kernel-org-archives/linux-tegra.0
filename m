Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA717C433ED
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Apr 2021 05:51:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C08AE613FB
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Apr 2021 05:51:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhD1Fvt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Apr 2021 01:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhD1Fvt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Apr 2021 01:51:49 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA83C061574;
        Tue, 27 Apr 2021 22:51:04 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id u20so70881403lja.13;
        Tue, 27 Apr 2021 22:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WxSDWJBKubTe8n31Ne0qppIwGIo+P1mF3Vf38REuc2Y=;
        b=crelfWOqIYnCaWLEZuJNLVQ3Ex7ONPKeatjPyvp7rwx/wDvnF0Ue6WkHPxpGANlt5p
         h8YanZj7qT5r6/dawYQgHD+QwQWRlfhXKhGks5m3TmIFUSf9JgxW2QW7CdYlFpnrUjut
         Udhcn31rlOkuBIQ66W8rJ/WXrXUVdg7+YoU4smv3PpZ7WI6FAG3oaXE3SlqNwoH79gMf
         Ry1AuaesNOgUzERt3zbhwJX9iDSGYUBf/0MLSQJRERgkJy1a/QQpCE3vFGHCwn4ETyrx
         66QApFr8V1sW4euyURXXNkiBms9A6KT7/9RwucLV3WTIQagKpuftroG6FfVRtpYxGpfo
         uATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WxSDWJBKubTe8n31Ne0qppIwGIo+P1mF3Vf38REuc2Y=;
        b=hkiFgN7BFIk+5veUGgbK+260LoyWrBG6TDAyjdxPeQW7K3WGw28npOLWXKJDchQ/Pi
         jitvTpCvbx0S+YFFJfastghF333Yqa4CBBY40zNu4Zc4kCcJnzKJsKjjYaX4lDEg3Oi7
         wpgCe/94Vkjfml1SrgU5okdeQWlc0IdjDToiAy/x6fXTBp9vG+a7fgheGhX5ugcHro6N
         9TaLYCURYqEghcSQ0Hf/lmJe2uJt0SvyEjXOv1pY6nZHbUZsTVu8yxt4ZAAVCSuCp/QF
         XygxIvRkslipaNe2dsS20GIugulI4UrwRIebcZhYhTiaexC1p/8DgR+en+Tk6e5Uu7cK
         PCvQ==
X-Gm-Message-State: AOAM533xIhHmbHbNgptbsQoD1N++RYVBlvKA5pIhLsGJNoOzK6w/lxlo
        fZGUutmt8kaORP4p42Sm0Xo/NXbkXkQ=
X-Google-Smtp-Source: ABdhPJwuAJK4aFYajohCA0T5i71uWmaClgd0xYfxsrAdmww9qbx9226OHVGHhTgkF5PAvkBApg8pLA==
X-Received: by 2002:a2e:b0c9:: with SMTP id g9mr19071704ljl.500.1619589062803;
        Tue, 27 Apr 2021 22:51:02 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru. [109.252.193.102])
        by smtp.googlemail.com with ESMTPSA id g9sm462878lfv.120.2021.04.27.22.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Apr 2021 22:51:02 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] iommu: Support identity mappings of
 reserved-memory regions
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b6d323e1-2e90-b031-60a0-3460644ea7a0@gmail.com>
Date:   Wed, 28 Apr 2021 08:51:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423163234.3651547-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.04.2021 19:32, Thierry Reding пишет:
> Note that there will be no new releases of the bootloader for earlier
> devices, so adding support for these new DT bindings will not be
> practical. The bootloaders on those devices do pass information about
> the active framebuffer via the kernel command-line, so we may want to
> add code to create reserved regions in the IOMMU based on that.

Since this change requires a bootloader update anyways, why it's not
possible to fix the bootloader properly, making it to stop all the DMA
activity before jumping into kernel?
