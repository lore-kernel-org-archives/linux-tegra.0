Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038DFC43461
	for <linux-tegra@archiver.kernel.org>; Sat, 24 Apr 2021 07:26:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFC166146D
	for <linux-tegra@archiver.kernel.org>; Sat, 24 Apr 2021 07:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhDXH1G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 24 Apr 2021 03:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhDXH1C (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 24 Apr 2021 03:27:02 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909EFC061574;
        Sat, 24 Apr 2021 00:26:23 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u25so19786803ljg.7;
        Sat, 24 Apr 2021 00:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/pJRpObwgC760iXpBExu4yIVJmUUKVTuscTwMhK6LQU=;
        b=ufNx7c9rAdtARmP9/JGD2i8irzKzBRSUyNH+9fvRN92zRA0OBFhfjptFeAgu+DuB3q
         yfX+4Igr2ZTDK9BRrc56DlEvUt+BBNnplt01tCzit9YLV863swcxCrDFmUCr2AxIGVcC
         CA1deu2tXBGXlYmES7M4hHClqef3U0Z9Cc/5ESgmSCPAuPP+bV0Ejsxuz3yVgliRBNhq
         l5BHr8X0Lv0ae2Tcj/rgHxe19zUdxI6ucYdDvEo2Cgcmnq1RoX2WrGx7Zp+88tFQ+DRS
         iiC+cWOgjjaQN4BtP4v067DB6fjKQN6kZkQzdUOd2FMGfmB9Pv2H9LF2GfnYd4Oe/pkg
         jxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/pJRpObwgC760iXpBExu4yIVJmUUKVTuscTwMhK6LQU=;
        b=d6mIzzsi8RkTpBJEywPKdCo2+CV99ljHcpQUHqXmvCifvTbPFJj7S13Um8voFdjL6D
         Dp5f/A7hK80CQNAMkTR+QgdEXn9TC2EoiQKbz4xbhcKxplVH60XrENbuXtKZ7qLe/nSD
         DLSVpLMeARMPRS6Ftr1lfVjFsFm70iGoGfePM3gd0zwbsk3VRe6wIuy+L7pWbupmXJ1C
         m321DrGpCE9EurauBgOTh4vmcVAYnHcO+Aa6Ief4CB2isurQRYpiFZlWjC2VkCYIFDKn
         QGE5WbChpYWBwM+EVZF0AJ8nR9WtYZTLXdIEz+ja5jQPciL/qVUoY4b7Rjv/lGOisNGu
         PXWA==
X-Gm-Message-State: AOAM530gigHi1VGReaNYMSCMWpiLSh5rDa83JQ6ALbI+Hc8D+aHyVNxb
        gjzAS+u0WSU2kB/q1hzH9jj6mmVoluo=
X-Google-Smtp-Source: ABdhPJx3Cw5Vif+11oahK6V5zTzAwV00Iy/2ZrdiZkutRiszn4jYJ2cW57uWFklKK5dsA9oi5EN2hA==
X-Received: by 2002:a2e:8054:: with SMTP id p20mr5032381ljg.439.1619249181690;
        Sat, 24 Apr 2021 00:26:21 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-103.dynamic.spd-mgts.ru. [109.252.193.103])
        by smtp.googlemail.com with ESMTPSA id t17sm749859ljd.35.2021.04.24.00.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Apr 2021 00:26:21 -0700 (PDT)
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
Message-ID: <869ec3a2-26df-2ce8-bd21-b681d6ef3985@gmail.com>
Date:   Sat, 24 Apr 2021 10:26:20 +0300
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
> Hi,
> 
> this is an updated proposal to solve the problem of passing memory
> regions that are actively being accessed during boot. The particular
> use-case that I need this for is when the bootloader has set up the
> display controller to scan out a boot splash screen. During boot the
> DMA/IOMMU glue code will attach devices to an IOMMU domain and by
> doing so enable IOMMU translations. Typically this will be before a
> device driver has had a chance to either disable the display
> controller or set up a new framebuffer and map it to the IOMMU.

Hello Thierry,

Is it always safe to enable SMMU ASID in a middle of a DMA request made
by a memory client?

The memory controller supports blocking DMA requests, which we are
already using for the memory hot-resetting. A block could be needed
before ASID is toggled. This needs to be clarified.
