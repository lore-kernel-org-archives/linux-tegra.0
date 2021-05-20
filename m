Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD19C433ED
	for <linux-tegra@archiver.kernel.org>; Thu, 20 May 2021 22:03:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C2B461363
	for <linux-tegra@archiver.kernel.org>; Thu, 20 May 2021 22:03:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhETWEb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 20 May 2021 18:04:31 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:34647 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbhETWEa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 May 2021 18:04:30 -0400
Received: by mail-ot1-f48.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso16285649ote.1;
        Thu, 20 May 2021 15:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fTSRjsOcuZx8pYPM4Y1kMmkhvEZ09jKFF24Yv3fC00A=;
        b=H+G9gIGTg0BvZLee2lSN+fx5fcHXS9Gf45tz5U8JlnnXxZeWeWUNGA+7cICfNKXono
         8Bp6E1CIrj3gV7NEw+NrD5P0Tu4GzMyMPYxEogY4fXLz5TNIesaBKOVkJhzFnnMYZDzf
         P5i3DOAb1ysXLMPRHn3Qs8q525HnjFJKjVAjwR65D+UPt5VsYnedPr/Al0E0JTeaNwsa
         7hbKDgtz7WHOpliGnC4n638DDvhvXYnbFarvo2UWlpsyIuSr7yh8oXK6Ipcghn2HGxH5
         47xQtRpgAueJVPd1F/QqHpWLcciOwifediSq0L4dFj0/9jHBBZZZwTKi65m3dW9YAeta
         qh4Q==
X-Gm-Message-State: AOAM530+o5Fwtr8CX9GCLljcm7thn+1+4F0qkVonIEM9mzMdj6EmOusI
        qI2X5c0cMZsHZrSxy+uuVw==
X-Google-Smtp-Source: ABdhPJwtAU3l1c6DBNoU2f0LgsDgxOJkyUKiPWVnTMvPY2Qx9BfZ0T12uREJKY4gARMRp8ykv2eAJw==
X-Received: by 2002:a9d:e88:: with SMTP id 8mr5249701otj.239.1621548188615;
        Thu, 20 May 2021 15:03:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n13sm799982oov.30.2021.05.20.15.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:03:07 -0700 (PDT)
Received: (nullmailer pid 2071988 invoked by uid 1000);
        Thu, 20 May 2021 22:03:06 -0000
Date:   Thu, 20 May 2021 17:03:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: reserved-memory: Document memory
 region specifier
Message-ID: <20210520220306.GA1976116@robh.at.kernel.org>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423163234.3651547-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Apr 23, 2021 at 06:32:30PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Reserved memory region phandle references can be accompanied by a
> specifier that provides additional information about how that specific
> reference should be treated.
> 
> One use-case is to mark a memory region as needing an identity mapping
> in the system's IOMMU for the device that references the region. This is
> needed for example when the bootloader has set up hardware (such as a
> display controller) to actively access a memory region (e.g. a boot
> splash screen framebuffer) during boot. The operating system can use the
> identity mapping flag from the specifier to make sure an IOMMU identity
> mapping is set up for the framebuffer before IOMMU translations are
> enabled for the display controller.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../reserved-memory/reserved-memory.txt       | 21 +++++++++++++++++++
>  include/dt-bindings/reserved-memory.h         |  8 +++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 include/dt-bindings/reserved-memory.h

Sorry for being slow on this. I have 2 concerns.

First, this creates an ABI issue. A DT with cells in 'memory-region' 
will not be understood by an existing OS. I'm less concerned about this 
if we address that with a stable fix. (Though I'm pretty sure we've 
naively added #?-cells in the past ignoring this issue.)

Second, it could be the bootloader setting up the reserved region. If a 
node already has 'memory-region', then adding more regions is more 
complicated compared to adding new properties. And defining what each 
memory-region entry is or how many in schemas is impossible.

Both could be addressed with a new property. Perhaps something like 
'iommu-memory-region = <&phandle>;'. I think the 'iommu' prefix is 
appropriate given this is entirely because of the IOMMU being in the 
mix. I might feel differently if we had other uses for cells, but I 
don't really see it in this case. 

Rob
