Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A304C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 15:56:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F1926054E
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 15:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349786AbhICP5Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Sep 2021 11:57:16 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:44840 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349790AbhICP5P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Sep 2021 11:57:15 -0400
Received: by mail-oi1-f171.google.com with SMTP id c79so7385686oib.11;
        Fri, 03 Sep 2021 08:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=OO8luS8vgFhGkY6YSH40ZaexdCs2RwuF6KUiXO6O8tY=;
        b=uSSWKmtMCe8Mlh/35lQBTUYEYpKIypt1Z9XGWwCJMU5aCpZJ28fyDw0t7zV0pAm9cl
         t0HKM33M973IL7K6/LknLC6JUlppkVUNMj1/ns6WybxC+0olshDzuyxdOI6bWQZ+U0bT
         YqQV/oDHeCaCZ/PTu44LOWXNmxxcbAO6uBy9Tix9iW7jG1Ax2/YbndiarFsESnHAXBAf
         QFzih9D+JFy0pHPkJmuQs0gZM09fnxUd6n66K8aqryljssRBjVG/HFJg8b2qO90xdafA
         H3nnoJ6l/KbCqHhsCuSOJG9vLsczFeEaZhRkNOyDVApKdThZudrYNTb79ljxM4bD9Hc/
         KJkQ==
X-Gm-Message-State: AOAM533/Z0hTBty53yeyDwCMH0kqjv80wQctGNmbn7nq2yBMdhwUkJZM
        8E2UNrXDRXRclcjPlLpadg==
X-Google-Smtp-Source: ABdhPJyLABGfu7vavSWKCNaNztOHcPGmiaVkLlo6BKMej6uKXD1qbWjFW2ILxDIMF0F0iGps99lXCw==
X-Received: by 2002:aca:ba44:: with SMTP id k65mr3229328oif.131.1630684575013;
        Fri, 03 Sep 2021 08:56:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 8sm1069046oix.7.2021.09.03.08.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 08:56:14 -0700 (PDT)
Received: (nullmailer pid 3010410 invoked by uid 1000);
        Fri, 03 Sep 2021 15:56:11 -0000
From:   Rob Herring <robh@kernel.org>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     devicetree@vger.kernel.org, jonathanh@nvidia.com,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org
In-Reply-To: <20210903083155.690022-2-mperttunen@nvidia.com>
References: <20210903083155.690022-1-mperttunen@nvidia.com> <20210903083155.690022-2-mperttunen@nvidia.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: Add YAML bindings for NVDEC
Date:   Fri, 03 Sep 2021 10:56:11 -0500
Message-Id: <1630684571.605300.3010409.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 03 Sep 2021 11:31:53 +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> v4:
> * Fix incorrect compatibility string in 'if' condition
> v3:
> * Drop host1x bindings
> * Change read2 to read-1 in interconnect names
> v2:
> * Fix issues pointed out in v1
> * Add T194 nvidia,instance property
> ---
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 109 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml:109:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1524104

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

