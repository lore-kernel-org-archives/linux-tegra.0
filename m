Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FB5C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 21:04:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCC9961AFF
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Nov 2021 21:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237263AbhKOVGw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Nov 2021 16:06:52 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:34603 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348991AbhKOUBd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Nov 2021 15:01:33 -0500
Received: by mail-ot1-f49.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso29403500otj.1;
        Mon, 15 Nov 2021 11:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=h+J1vaRpXcdhcsrNBSmrsbk4IyQ3tb4/aPu9pmZiLEo=;
        b=cIAjWzAXrd4zPwbWqoeCgTgsp9SBJs4IDlISAXZaHVOEmZQx1c6YkOUQUxxQQ8Oi0o
         OHAUiq4L6GBrtOqTnK915Z6oJqb2zgKaX6T+S8HR2vgX6M0B0kNnSEM0ZT3BJdB1fEKN
         vfGe+3K3uvOY/2RBVQY5retOfGXkCf1kOGdxG/TXod6lypkrhhEDho/UkHf89ep8saLC
         9bif5JQFhkDZM880ihKXXn6AdcqEMnesCv/+8uk3gJe7P37Ukmi+nMpC7ySUGce/qVjW
         1pU7276gyjUAal0tPjhCsCClng16FvKplzYHeu3CwjWjWNarGx0REM+H1F4fjc/DuIuc
         PW0A==
X-Gm-Message-State: AOAM532mZefc5/WRHfKetlP4dOvjLlt/jOHagWkv0wNEwQCqXIrOeB8O
        3dRCCyTEAqMI7ILtB+OELnen3OT+9w==
X-Google-Smtp-Source: ABdhPJyRURepV+1IaiJnVPG/Z5JL0u11kbv3R2qh4yDVX84o2UIEGJdGww+DOnf28Cs/UjaKZt8JxA==
X-Received: by 2002:a9d:6346:: with SMTP id y6mr1408110otk.154.1637006317343;
        Mon, 15 Nov 2021 11:58:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 111sm3196849otu.55.2021.11.15.11.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 11:58:36 -0800 (PST)
Received: (nullmailer pid 1287655 invoked by uid 1000);
        Mon, 15 Nov 2021 19:58:35 -0000
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org
In-Reply-To: <20211115151707.287764-1-jonathanh@nvidia.com>
References: <20211115151707.287764-1-jonathanh@nvidia.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add YAML bindings for NVENC and NVJPG
Date:   Mon, 15 Nov 2021 13:58:35 -0600
Message-Id: <1637006315.810213.1287654.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 15 Nov 2021 15:17:06 +0000, Jon Hunter wrote:
> Add YAML device tree bindings for the Tegra NVENC and NVJPG Host1x
> engines.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../gpu/host1x/nvidia,tegra210-nvenc.yaml     | 104 ++++++++++++++++++
>  .../gpu/host1x/nvidia,tegra210-nvjpg.yaml     |  94 ++++++++++++++++
>  2 files changed, 198 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.example.dt.yaml: nvenc@154c0000: interconnects: [[4294967295, 28, 4294967295], [4294967295, 43, 4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.example.dt.yaml: nvenc@154c0000: interconnect-names:1: 'read-1' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.example.dt.yaml: nvenc@154c0000: interconnect-names: ['dma-mem', 'write'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1555346

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

