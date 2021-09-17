Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21C6C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Sep 2021 00:49:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A65E46120F
	for <linux-tegra@archiver.kernel.org>; Fri, 17 Sep 2021 00:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241862AbhIQAuc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Sep 2021 20:50:32 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:45823 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241940AbhIQAua (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 20:50:30 -0400
Received: by mail-io1-f50.google.com with SMTP id a22so10127053iok.12;
        Thu, 16 Sep 2021 17:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=6zodSke86hnlsQe7klR3A5X+2RRUPHUNpKbftVQV0oE=;
        b=x2mUSsdNt8gKcACGf2jT2oRKZ7nG/6AL1zulEay/qO5efzJvCVIykWByxE0jtstkUu
         9+F8WlHhPLjADFVwjCRSuWaAxQi6H/fAyqizO5jV6Tywrbw6NGbM7+K2Nla+0TYPCkBM
         2Ki06InVFwqNFwkfD6WEWBlSqoJtCIxBiRxu7IFSazPl5QdorQ3ej6CGVxWV9TRy0a9N
         vGNrG1SczZZfetEDHG1A5NSAI8BsJrYx8Sq2ltN+DRXodAhdYssAZJyooLmF/QA/ff06
         3ftvUgTImVUABvCbG/AKvNpU/E/EaliVHoe7S94NesMVt6pTkvUj83pGSspbFa1DTpIs
         DKcA==
X-Gm-Message-State: AOAM532Fg4wjJbXTUkTqAKqSyHjM33CH38CKUdoPYgvg2/FX3wVkm5Dg
        VbyKq02vJ+BE3Ik6LZkPsQ==
X-Google-Smtp-Source: ABdhPJxbqFS9VhfN7t4ZOhlO3skieDQOI5xZyT2eWGR/1mS9FuokN01beDwOIfVzeVBuy/bDqxtasA==
X-Received: by 2002:a6b:7710:: with SMTP id n16mr6311114iom.101.1631839748848;
        Thu, 16 Sep 2021 17:49:08 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net. [96.84.70.89])
        by smtp.gmail.com with ESMTPSA id z15sm2498669ioh.28.2021.09.16.17.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 17:49:08 -0700 (PDT)
Received: (nullmailer pid 1484025 invoked by uid 1000);
        Fri, 17 Sep 2021 00:49:06 -0000
From:   Rob Herring <robh@kernel.org>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     daniel@ffwll.ch, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        airlied@linux.ie, devicetree@vger.kernel.org, robh+dt@kernel.org,
        jonathanh@nvidia.com
In-Reply-To: <20210916145517.2047351-2-mperttunen@nvidia.com>
References: <20210916145517.2047351-1-mperttunen@nvidia.com> <20210916145517.2047351-2-mperttunen@nvidia.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: Add YAML bindings for NVDEC
Date:   Thu, 16 Sep 2021 19:49:06 -0500
Message-Id: <1631839746.871547.1484024.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 16 Sep 2021 17:55:15 +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v6:
> * Elaborated description for nvidia,host1x-class.
> * Added default value for nvidia,host1x-class.
> v5:
> * Changed from nvidia,instance to nvidia,host1x-class optional
>   property.
> * Added dma-coherent
> v4:
> * Fix incorrect compatibility string in 'if' condition
> v3:
> * Drop host1x bindings
> * Change read2 to read-1 in interconnect names
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 108 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml:108:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1528902

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

