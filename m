Return-Path: <SRS0=yNrD=DB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8B5C4727E
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 13:24:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF3DD235FD
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 13:24:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uiKhmE03"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgIXNYF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 09:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727704AbgIXNYE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 09:24:04 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C73C0613CE;
        Thu, 24 Sep 2020 06:24:04 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b12so3873510lfp.9;
        Thu, 24 Sep 2020 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a0b44wmpZAXdgeDz+6AK6vON8+BKifKjFQX2DgcijBs=;
        b=uiKhmE03qTIQPzUGVAGU134Ra6j4F1ArLNVD3F1+grmfz/UW6vh16eI2PuXn2azn2+
         CAz2NfhFYwnzsfBULM+8MpH0Zw5yul8BucieVzM6jRoe3gsKTCGoTu7zDPf3IqER+n4Q
         piq0PzFH7uw29W4/gy6Z9Aw2kHRaYmwInX1A2Ku39VSn2VjNUga8mCcVLNfbZEvpihG+
         aSm6OWBA+8Aeh1FKex8ddsJHnQUIWRugbs5SF7MiO3taXCCI75sKGCtbpNzothYu0vKq
         nw2v4sz5gKFb+nJW1ZHvPKfLL3tIHQAgCc0q89LXr6+t1ZUiPkNhDrn0AuDt6Gd9qLES
         Q7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a0b44wmpZAXdgeDz+6AK6vON8+BKifKjFQX2DgcijBs=;
        b=UAwoCBuB6HattG4cceoHNzuBg7ut69e97bmGw+ilf7MKIJTyFSeUlQKbZLXgeRTt+i
         JGF6psLJHy1N+JnIh4gwlK9MMfNy0WYhW3wWdueawQ3oQplFErABR5CLKkaAwsXYsSxL
         slkH7sfD7ooWnzQzPDksagpMnHRu5t2CuiwE9+3xR1UcZxLRgHObbdFDLySDQAXS/A8m
         MD4cCqCBLsrKJTKtRcSoVYv7jL1GAA9knphx1tGYiIkaIHeIdRMXlS5bPWWzmrYJK79D
         TSki1K+KI3n/9eqzF5Ygt4I6ahoUvKIFg5bIodrmBCUJjl8pe9wSFOw95vxuR1Mm2G2F
         CNTg==
X-Gm-Message-State: AOAM532AcVrdHOnd7+TOnIDIFxcUmWEwQ7X4vULSc/jEMWTvv2EbVQSn
        0P2gEvEZ0UzwpjuzgkXwDO6eVKIx7Ns=
X-Google-Smtp-Source: ABdhPJy1/jtedJafAGvfV5TWDSggzg+bBR8DWYMNwqmNUQtEsFh6DZbgCrxVeJaOg429gUgVx2xKPQ==
X-Received: by 2002:a19:f00e:: with SMTP id p14mr290166lfc.69.1600953841401;
        Thu, 24 Sep 2020 06:24:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id j20sm2035934lfe.132.2020.09.24.06.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 06:24:00 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] dt-bindings: reserved-memory: Document "active"
 property
To:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20200904130000.691933-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d3d69cb4-b0f9-40b0-b526-52fdc1a4b876@gmail.com>
Date:   Thu, 24 Sep 2020 16:23:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904130000.691933-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.09.2020 15:59, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Reserved memory regions can be marked as "active" if hardware is
> expected to access the regions during boot and before the operating
> system can take control. One example where this is useful is for the
> operating system to infer whether the region needs to be identity-
> mapped through an IOMMU.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/reserved-memory/reserved-memory.txt           | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> index 4dd20de6977f..163d2927e4fc 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> @@ -63,6 +63,13 @@ reusable (optional) - empty property
>        able to reclaim it back. Typically that means that the operating
>        system can use that region to store volatile or cached data that
>        can be otherwise regenerated or migrated elsewhere.
> +active (optional) - empty property
> +    - If this property is set for a reserved memory region, it indicates
> +      that some piece of hardware may be actively accessing this region.
> +      Should the operating system want to enable IOMMU protection for a
> +      device, all active memory regions must have been identity-mapped
> +      in order to ensure that non-quiescent hardware during boot can
> +      continue to access the memory.
>  
>  Linux implementation note:
>  - If a "linux,cma-default" property is present, then Linux will use the
> 

Hi,

Could you please explain what devices need this quirk? I see that you're
targeting Tegra SMMU driver, which means that it should be some pre-T186
device. Is this reservation needed for some device that has display
hardwired to a very specific IOMMU domain at the boot time?

If you're targeting devices that don't have IOMMU enabled by default at
the boot time, then this approach won't work for the existing devices
which won't ever get an updated bootloader. I think Robin Murphy already
suggested that we should simply create a dummy "identity" IOMMU domain
by default for the DRM/VDE devices and then replace it with an
explicitly created domain within the drivers.

Secondly, all NVIDIA bootloaders are passing tegra_fbmem=... via
kernel's cmdline with the physical location of the framebuffer in
memory. Maybe we could support this option?
