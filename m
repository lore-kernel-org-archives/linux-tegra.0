Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCCFC433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Feb 2021 20:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58D0564E6F
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Feb 2021 20:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234081AbhBQUZg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Feb 2021 15:25:36 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:37451 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233971AbhBQUZf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Feb 2021 15:25:35 -0500
Received: by mail-ot1-f42.google.com with SMTP id s6so5562009otk.4;
        Wed, 17 Feb 2021 12:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=s6+jiEiqCZSmw0WMNbsaPBiNOtVW1ybg9lWNP/Vo0aY=;
        b=oSOIcVfVGd/x+WiId7bHOv8SzzztYtnyqPTcsNPU2muKhmZtzJlChm3Royx2nYMBP/
         iblNePpTNu0bk7bohChRA39athvuCaLnZurPeC06Fmo+TFTTPhtkTI6ibcIU6Ia1YI2d
         ip6fR5JEcnhJ1+sKve06UqQCh3qI9doLJufAhpOGYwoBNaZ1McnTAa8AojmDI0LK4hkR
         9LiCPdQFaaqQeGiXxzwGpn35Pq7czn/a445bzqsQ+chj4yJgZ4fZVtnQlmIfe31clWBJ
         Bwv5944FHv980uTw3K8LLg2eqfM5OjjjmZncMyOYKJWTGwFZ4CA7mLf8t6xb7GBuaSC4
         Sk/g==
X-Gm-Message-State: AOAM532rHEYD+Zt7FXD8L93Gi/vTnSn8CzDnDMzpElp3q0IR+tSpNLmv
        cFePFivRuJVS+R3aHfYmtg==
X-Google-Smtp-Source: ABdhPJxb/kwWM+0rGGbP7NNjMiSRCWUIh9XpWfTxKh8s9XYiNqqRpDWijLxBslAleJdVs5vdjhmLww==
X-Received: by 2002:a9d:6c4c:: with SMTP id g12mr647306otq.53.1613593493067;
        Wed, 17 Feb 2021 12:24:53 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t2sm619827otj.47.2021.02.17.12.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 12:24:52 -0800 (PST)
Received: (nullmailer pid 2681056 invoked by uid 1000);
        Wed, 17 Feb 2021 20:24:51 -0000
From:   Rob Herring <robh@kernel.org>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     daniel@ffwll.ch, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org, airlied@linux.ie
In-Reply-To: <20210213101512.3275069-2-mperttunen@nvidia.com>
References: <20210213101512.3275069-1-mperttunen@nvidia.com> <20210213101512.3275069-2-mperttunen@nvidia.com>
Subject: Re: [PATCH 1/3] dt-bindings: Add YAML bindings for Host1x and NVDEC
Date:   Wed, 17 Feb 2021 14:24:51 -0600
Message-Id: <1613593491.434667.2681055.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 13 Feb 2021 12:15:10 +0200, Mikko Perttunen wrote:
> Convert the original Host1x bindings to YAML and add new bindings for
> NVDEC, now in a more appropriate location. The old text bindings
> for Host1x and engines are still kept at display/tegra/ since they
> encompass a lot more engines that haven't been converted over yet.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../gpu/host1x/nvidia,tegra20-host1x.yaml     | 129 ++++++++++++++++++
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     |  90 ++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 220 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra20-host1x.yaml
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml:90:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1440164

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

