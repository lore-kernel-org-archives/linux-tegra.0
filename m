Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A976C433ED
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 18:13:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 406E86023C
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 18:13:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235592AbhDASNb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236837AbhDASHj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 14:07:39 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0ECAC0319C5;
        Thu,  1 Apr 2021 10:18:30 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso2733001oti.11;
        Thu, 01 Apr 2021 10:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LIjI2NUwDFlAYdJOBAJek6rk7rUaA28ZeDcvyQ9Nhm0=;
        b=Q/L10nBE34UdT/g10T0xeDrajVtKUuryGAwndb66qHC5CgF2643yeNksqQSMV/HIyJ
         jnQc0o1OdlLBbb1lW8yp+3mMRCO5sKdHKHhEuLnGskOGEeHzvE/DVs3ikGVhFDAmbJFC
         MjR97vbLSOSyWF7575Io1gZaHTCnZg750h5jBV5eP7QEvrKgkm+KZpmMKZx4tgfuCsCc
         qtmg2Z/c5xp/XVMI0X3aWJueyeo3zvGPQMkGIdJdy0cCk1ZNJavY6WgBlLt5PT65ycNO
         CO1DoFqo1yi2E8hmj9aCKkXPaXv0eGhLvhRUkgCvHkTssxINBWv0eI03CGQSyw5HfaSf
         Dmsw==
X-Gm-Message-State: AOAM530+cEQ3siN6gyib1aRb5vIoRhm3LIC6MreKZkEIl9oU7RZsyA5D
        XJgY8qSVFBOfmuJFN3wkoQ==
X-Google-Smtp-Source: ABdhPJzTwRBGIosUW74Hf7hJbz23dNYIA7uex/H49XPguHIvYAQWA7pqj4y6jdKNAirvM1WZ0YDtZg==
X-Received: by 2002:a05:6830:1515:: with SMTP id k21mr7651423otp.269.1617297506910;
        Thu, 01 Apr 2021 10:18:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m14sm1316149otn.69.2021.04.01.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:18:26 -0700 (PDT)
Received: (nullmailer pid 637987 invoked by uid 1000);
        Thu, 01 Apr 2021 17:18:25 -0000
Date:   Thu, 1 Apr 2021 12:18:25 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: memory: tegra20: mc: Convert to
 schema
Message-ID: <20210401171825.GA637934@robh.at.kernel.org>
References: <20210330230445.26619-1-digetx@gmail.com>
 <20210330230445.26619-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330230445.26619-5-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 31 Mar 2021 02:04:43 +0300, Dmitry Osipenko wrote:
> Convert Tegra20 Memory Controller binding to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra20-mc.txt  | 40 ----------
>  .../memory-controllers/nvidia,tegra20-mc.yaml | 79 +++++++++++++++++++
>  2 files changed, 79 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
