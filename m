Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3316DC433B4
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Apr 2021 05:59:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 023836141E
	for <linux-tegra@archiver.kernel.org>; Wed, 28 Apr 2021 05:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235964AbhD1F76 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 28 Apr 2021 01:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235809AbhD1F76 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 28 Apr 2021 01:59:58 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99E2C061574;
        Tue, 27 Apr 2021 22:59:13 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z13so16277340lft.1;
        Tue, 27 Apr 2021 22:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xzsNPh8QJ6rpsJx8qwIaGMl2EdqborjifVRsL559zII=;
        b=CPcR0MoJChypavoUphSD8hGQFZU4QOt7bP+noLN+UIescw+eezNc/5HJ9ZLpzJSsQl
         vKbO76KN4pryjdUPLwxbrW+7svnNq515fHMf3OwCl4i/c9Dh/tQRzl3XNPmtfeVhdxxC
         l72eCxG857HLpk/8yyoUH8m0tg/+rXviICqfkAoYBECNoSFvLEXReUVQryFg516nc7ra
         ZNntlFWga7kct/i/fkJGoUqmbjOAYDP3cCtJkOTfe08j2CUo7qyvziQOOAQpSWv1ZZHx
         oSnFVVep1FE2vDsXn+8F4HjNQSzCKNQgVkyB5NkjWyPxhtaLP/UfCIWr3+tKIFhW3AQH
         n9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xzsNPh8QJ6rpsJx8qwIaGMl2EdqborjifVRsL559zII=;
        b=EnwXIJQQGjPJcX4ogpzPCGRb3GS1ek7ZxtM+ER09tncG1xvHuuu5uEhw2UhsYS21aq
         N+2GmO44cJiBK4JNpiiLmjm1Iu/A9jLcPmghqP/aTC77QMeqpou0tRdAf29I+0RUdBzY
         WbSvZSOoF4LWk/ZXCmjH5GOHAHXxG67og6SAB21AnmiVThBVtS2auua/ioppLErYCOJj
         NEa/WSLTkWSnWOiW8X1P4hz55Ysc9JsVh77uCwFo7razSmRjdl2fvjogQNRKBqRsqbPv
         h2rEreU7tJXv5J3w51ifdKXcXxjkmjTZSfS5MUM0+pG+cMfwe5CuQwdONrlmkwHPatpG
         5lDw==
X-Gm-Message-State: AOAM532nmDNrJDq1R8jMXn//7FqM0y5NIiQ2u77DQ+VDSDBtrt2Jg8ZR
        RnnLGZk7aVUYoKXgzXdTWBOFDYSjD+g=
X-Google-Smtp-Source: ABdhPJwsJ1Jsc5Axp48FVR/3lWWuUQbuDEtjYM5zGB1C8ohK+lxiIL9cMk1ms9SHkd0hBC/ccjCAgA==
X-Received: by 2002:a19:5517:: with SMTP id n23mr5471964lfe.554.1619589552307;
        Tue, 27 Apr 2021 22:59:12 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru. [109.252.193.102])
        by smtp.googlemail.com with ESMTPSA id i7sm469674lfv.258.2021.04.27.22.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Apr 2021 22:59:11 -0700 (PDT)
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
Message-ID: <8032d476-8104-1218-30c6-9fd670c3e7b5@gmail.com>
Date:   Wed, 28 Apr 2021 08:59:11 +0300
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
> Note that an earlier proposal was to use the existing simple-framebuffer
> device tree bindings to transport this information. Unfortunately there
> are cases where this is not enough. On Tegra SoCs, for example, the
> bootloader will also set up a color space correction lookup table in the
> system memory that the display controller will access during boot,
> alongside the framebuffer. The simple-framebuffer DT bindings have no
> way of describing this (and I guess one could argue that this particular
> setup no longer is a "simple" framebuffer), so the above, more flexible
> proposal was implemented.

Will simple-framebuffer be able to use that reserved region
transparently? Or will it require a custom simple-framebuffer driver?

Could we make simple-framebuffer support a part of this series?
