Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D037EC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Sep 2021 13:08:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B680D6103D
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Sep 2021 13:08:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233473AbhIJNJV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Sep 2021 09:09:21 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:45030 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233446AbhIJNJT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Sep 2021 09:09:19 -0400
Received: by mail-ot1-f44.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so2110738otg.11;
        Fri, 10 Sep 2021 06:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=283Y9UlcMi+APx5COV8qDm1rdMUU5aXjcw1zhBbMwjw=;
        b=c84gC3DYZ6HqKV2RCL7Nbh9ZMO1GEF8CY3OkyRhngBK8oQ2YqLrWEhkUPFwcPqSDfS
         2fS/cnDfe9vYXTEjnqebbpbDbtNeNMpthUuCFSsMPoAb7iUt+SjN0dslWPK10p+IzCgU
         zVNv59URICEWcI5X1Pp6m1akoE2AK3FoGRqzy2VmuIPZHUS8tX8O/iurPD9lXBnd+BcG
         FTrRqGZs34VcuYeaLmtaDvt4N3yGVU2Tz/TS+VbNVVXeHVZo0n/pX1Bqul/l5R+mWByH
         E8H1+NBTI3B40NbCRuqoxCJc+1hf/2fgfcDlT/fdBmjyGqGuEULvLUPlGhX532DVwJre
         E5vA==
X-Gm-Message-State: AOAM532obo3efghdnNIvn8WWvSNqatkTh0NbP2YaDnR+q/sf7eIuEPGh
        hfkAKBCXc8uIvv8/DLCu6Q==
X-Google-Smtp-Source: ABdhPJxV1nuJALXEy7y62dHRYbTZIvGmh4x5J83MUZxSWKiJ5l8KiRjl6RNLgHuhCAfQpQrnxr78Jg==
X-Received: by 2002:a05:6830:788:: with SMTP id w8mr1983528ots.235.1631279287960;
        Fri, 10 Sep 2021 06:08:07 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p81sm1235173oia.48.2021.09.10.06.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 06:08:05 -0700 (PDT)
Received: (nullmailer pid 2509935 invoked by uid 1000);
        Fri, 10 Sep 2021 13:08:04 -0000
From:   Rob Herring <robh@kernel.org>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, robh+dt@kernel.org,
        linux-tegra@vger.kernel.org, daniel@ffwll.ch,
        devicetree@vger.kernel.org, airlied@linux.ie
In-Reply-To: <20210910104247.1206716-2-mperttunen@nvidia.com>
References: <20210910104247.1206716-1-mperttunen@nvidia.com> <20210910104247.1206716-2-mperttunen@nvidia.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: Add YAML bindings for NVDEC
Date:   Fri, 10 Sep 2021 08:08:04 -0500
Message-Id: <1631279284.846111.2509934.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 10 Sep 2021 13:42:45 +0300, Mikko Perttunen wrote:
> Add YAML device tree bindings for NVDEC, now in a more appropriate
> place compared to the old textual Host1x bindings.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
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
>  .../gpu/host1x/nvidia,tegra210-nvdec.yaml     | 104 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml:104:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1526459

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

