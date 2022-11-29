Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E04C4332F
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Nov 2022 17:16:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbiK2RQ3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Nov 2022 12:16:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236441AbiK2RQ1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Nov 2022 12:16:27 -0500
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88CDA663F0
        for <linux-tegra@vger.kernel.org>; Tue, 29 Nov 2022 09:16:25 -0800 (PST)
Received: by mail-oi1-f177.google.com with SMTP id e205so15911647oif.11
        for <linux-tegra@vger.kernel.org>; Tue, 29 Nov 2022 09:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THotrQ+HKot/E2rMLzTFR9eqJ1xQO8AkKJR+hbvGfOE=;
        b=J3KH8u2ULsWjZtG+3SPzk9zuzzLzeaihOVyXLiAe+m0qzO1t2mxcT5pSM8YhKyqtyT
         SFoFSJ0Je/NMfHILBotrXK/mEJ3fNYF81FWResHHiem4H5IjwqgPU+M5xbNtQuRjw//d
         BOp+ZLp00+8SxcwYBDOq4jYskMAIcwqkXgxRZDfpiio8zkLB6T4w91cQI1NtBOFto98n
         wM5BuU8w4q4nRmMtZmAHhmBWN5mloyt/nfoyKSsQGGjnU1sLmQp/T/F/rLhjH9Iax+NP
         4lu8vUYB0idM/Pj0AUSDaCz68YzZBnANIP0Wcz3HiTRcs+OwdOtYWTrGLx2rnGc/j7QO
         I2eQ==
X-Gm-Message-State: ANoB5pmA27gn0U4Kbqw7bjXdUfZGSwxJDbG9ywpjkIzTebwaBdc/a7oX
        OgPEi6W91TAGRYXPAAP+9QOAM2BwQQ==
X-Google-Smtp-Source: AA0mqf6WUU4MwYNWgHsrvAQF0xaTM/RleksXvP6Rlc9Wt/p3oMlZ3xm/Zz0dzwlQ3U14bxAtyAb1ww==
X-Received: by 2002:a05:6808:21a4:b0:354:b8bc:ce96 with SMTP id be36-20020a05680821a400b00354b8bcce96mr18575003oib.169.1669742184709;
        Tue, 29 Nov 2022 09:16:24 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 45-20020a9d02b0000000b0066ac42bc8a4sm6149007otl.33.2022.11.29.09.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 09:16:23 -0800 (PST)
Received: (nullmailer pid 3847321 invoked by uid 1000);
        Tue, 29 Nov 2022 17:16:23 -0000
Date:   Tue, 29 Nov 2022 11:16:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm@kernel.org, soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2 4/7] dt-bindings: Changes for v6.2-rc1
Message-ID: <20221129171623.GA3838985-robh@kernel.org>
References: <20221121171239.2041835-1-thierry.reding@gmail.com>
 <20221121171239.2041835-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121171239.2041835-4-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Nov 21, 2022 at 06:12:36PM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:
> 
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-dt-bindings-v2
> 
> for you to fetch changes up to 97351cd8bea8e284cf62b4b7f35fa12059b47d7f:
> 
>   dt-bindings: usb: tegra-xusb: Convert to json-schema (2022-11-21 13:27:30 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> dt-bindings: Changes for v6.2-rc1
> 
> New memory client IDs and IOMMU stream IDs, as well as new compatible
> strings are introduced to support more hardware on Tegra234. Some device
> tree bindings are converted to json-schema to allow formal validation.
> 
> ----------------------------------------------------------------
> Jon Hunter (1):
>       dt-bindings: tegra: Update headers for Tegra234
> 
> Mikko Perttunen (2):
>       dt-bindings: Add headers for NVDEC on Tegra234
>       dt-bindings: Add bindings for Tegra234 NVDEC
> 
> Sandipan Patra (1):
>       dt-bindings: pwm: tegra: Document Tegra234 PWM
> 
> Thierry Reding (4):
>       dt-bindings: pinctrl: tegra: Convert to json-schema
>       dt-bindings: pinctrl: tegra194: Separate instances
>       dt-bindings: pwm: tegra: Convert to json-schema
>       dt-bindings: usb: tegra-xusb: Convert to json-schema

This one has warnings due to upstream dtc changes. Details here[1].

Rob

[1] https://lore.kernel.org/all/CAL_JsqKFS5nKRihLL60zfqtNujrYGaxN7sp7SbYA_ajC4w2rpQ@mail.gmail.com/
