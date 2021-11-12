Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2DBC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:49:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23982610FF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbhKLNvy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:51:54 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:33421 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235111AbhKLNvi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:51:38 -0500
Received: by mail-oi1-f171.google.com with SMTP id q25so12412637oiw.0;
        Fri, 12 Nov 2021 05:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=0EE4KsF+OgiJSD3HtrRh5W0ABKfJTM6vicTgTPUjLh8=;
        b=3hjCd+1qljRYhXDiWzWtsyeGLrkuXNhg0czQcV96fVGoIIyb8owVbe5T7SPZ7l0IQG
         3e2XXgUmcPzJ8sRCO2+Pyn7QE2ByobF3G2KNgQNW5i37KMrFzQNWJNUqmX/Fjd+zlOPj
         YvJLNw4c34pfxrCAou4nQjQLTTjxxra5v1pryHDxWdpJMtgdVBEaeC6Vm6nMbmmLXqfh
         Z6LILnIYUv+N9LJ7CBnllU9GQhK8gdn1oaWjiNGC6hWeTOk04oLWnSMS2EXlGNC/jph7
         dwt6NNSkxvxetmRe+XWrHrgrB6cd0Zy4TBvgvdUDdVo3CA82weEpjsqyo5ldIOm8pD5d
         xzDw==
X-Gm-Message-State: AOAM530QcFAK5M1ukMV82yWntaNPQu9n0dDLX6zux4zw1Y06JOxoPb2/
        uE9fZsJJu8YyB16vS8LsVw==
X-Google-Smtp-Source: ABdhPJzf8gAJai4ZfK0FkvJvtMTJ0PWPG81aKnLD+BaMcYYaFn9ZWOOWnEO/l8QCvNWTRIGNuDM2+A==
X-Received: by 2002:a05:6808:bc2:: with SMTP id o2mr8218384oik.115.1636724926982;
        Fri, 12 Nov 2021 05:48:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 16sm1325675oix.46.2021.11.12.05.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:48:46 -0800 (PST)
Received: (nullmailer pid 2463369 invoked by uid 1000);
        Fri, 12 Nov 2021 13:48:37 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20211112120518.3679793-6-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com> <20211112120518.3679793-6-thierry.reding@gmail.com>
Subject: Re: [PATCH 05/15] dt-bindings: rtc: tegra: Convert to json-schema
Date:   Fri, 12 Nov 2021 07:48:37 -0600
Message-Id: <1636724917.117688.2463368.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:05:08 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra RTC bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/rtc/nvidia,tegra20-rtc.txt       | 24 ---------
>  .../bindings/rtc/nvidia,tegra20-rtc.yaml      | 54 +++++++++++++++++++
>  2 files changed, 54 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml: 'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.example.dt.yaml:0:0: /example-0/timer@7000e000: failed to match any schema with compatible: ['nvidia,tegra20-rtc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1554301

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

