Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07560C77B7F
	for <linux-tegra@archiver.kernel.org>; Mon,  8 May 2023 13:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbjEHNdd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 May 2023 09:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233699AbjEHNdc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 May 2023 09:33:32 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D41518916
        for <linux-tegra@vger.kernel.org>; Mon,  8 May 2023 06:33:30 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bc5197d33so8635214a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 08 May 2023 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683552809; x=1686144809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rGZFobhDL5KrtJvIVQA1pg81QY7WNmO1VNXBMl/SSNw=;
        b=yUZoZ3P6QZHl8p862Wqs7BCZ42+QTF1AZs9T+PfQDwg1GCyeIAEK20EXEMVhUiG/RD
         WuIe5l0DxrkxkZaffWceyl9N+0ygtr2dbhWnnxGuWLuoZbnRaiwTQZ80bwtx2vSQKtI1
         ow/8DPJDUZJunSCXM9kTGcy22aTEe0rdQjt6H6cxmISLaHJ7MAHWZ/QbAjHxUIiPwJWW
         t5q+SNR5UoKnX/4yrQ5XkK7BRjlc32g7eHZXUkK/hvYXQ7dit6CkCPn2AyOsv07c3hJT
         bAvjSEj9cw/jctjqBomczMsg8bNSItV17OOSGfwXfjlffnBy76gedc09A38ndgAj4osi
         IRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683552809; x=1686144809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGZFobhDL5KrtJvIVQA1pg81QY7WNmO1VNXBMl/SSNw=;
        b=cBRcud8aQ3GkggCSdtP0lH3y2M0okgnWGoCAw3qbzcHRZrq5qIPiDLGItknyBJBodZ
         jsp6R82j2CkOblCaK3XF8F2lMfXjA9RUqSSSj8zqeZpqVGXPwOXt/QODSJy4iXhzDXsc
         OpX408oakmVmNrtdkMfU5aEOe2CiI7uyJ+czuoi5cr4dxIPOAOt5q6hdvr/DKTjSFuXd
         ttFuhwUSPm3f1dA3SLvto4flJg3XOTjKHVXWRwbtp4eTvLBtnYljexE0BRltznSnRSCv
         X2/qKt34Ki94+kRDem3rrHVIgQV7LzOzzwEn9bgzO6Ei03GjLJyEiB7u5vN/aWZTAZUA
         5nmg==
X-Gm-Message-State: AC+VfDyBu0A/ebwQeo8UkxMz/fCtv/bsUuZt8sdfS6McWhaGx3954WJQ
        rD2/zKm6N1rjsWmbcsxBuZKVGg==
X-Google-Smtp-Source: ACHHUZ4fRkLXrslmIhIM8+Kqs1j4thCUZSlxgNvfcuzmmB7Z7emPT0GTwOPmXUpMDWZ4mddzp+epQg==
X-Received: by 2002:aa7:c849:0:b0:50b:c88b:b227 with SMTP id g9-20020aa7c849000000b0050bc88bb227mr7173469edt.35.1683552808913;
        Mon, 08 May 2023 06:33:28 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id s2-20020aa7cb02000000b0050d82f96860sm3562784edt.59.2023.05.08.06.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 06:33:28 -0700 (PDT)
Date:   Mon, 8 May 2023 15:33:25 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Peter De Schrijver <pdeschrijver@nvidia.com>
Cc:     thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        stefank@nvidia.com
Subject: Re: [PATCH 4/5] dt-bindings: Add bindings to support DRAM MRQ GSCs
Message-ID: <20230508133325.xllmriwydkczk6lh@krzk-bin>
References: <20230508122048.99953-1-pdeschrijver@nvidia.com>
 <20230508122048.99953-5-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230508122048.99953-5-pdeschrijver@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 08 May 2023 15:20:52 +0300, Peter De Schrijver wrote:
> Add bindings for DRAM MRQ GSC support.
> 
> Co-developed-by: Stefan Kristiansson <stefank@nvidia.com>
> Signed-off-by: Stefan Kristiansson <stefank@nvidia.com>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  .../firmware/nvidia,tegra186-bpmp.yaml        | 69 ++++++++++++++++++-
>  .../nvidia,tegra264-bpmp-shmem.yaml           | 40 +++++++++++
>  2 files changed, 106 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml:10:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra264-bpmp-shmem.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dts:110.31-116.11: ERROR (duplicate_label): /example-1/hsp@3c00000: Duplicate label 'hsp_top0' on /example-1/hsp@3c00000 and /example-0/hsp@3c00000
ERROR: Input tree has errors, aborting (use -f to force output)
make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dtb] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):
Documentation/usb/gadget_uvc.rst: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
MAINTAINERS: Documentation/devicetree/bindings/pwm/pwm-apple.yaml

See https://patchwork.ozlabs.org/patch/1778345

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
