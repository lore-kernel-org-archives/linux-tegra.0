Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D70C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22252604DA
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235282AbhKLPFC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 10:05:02 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:37518 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbhKLPFB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 10:05:01 -0500
Received: by mail-ot1-f53.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so13353143otg.4;
        Fri, 12 Nov 2021 07:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=kOEufQVZI0BrI7LuPRN4qS0HPEEz/Vbkkh5HQHq4qhE=;
        b=ZYJSfOQVIzjuweaewbiknoYFbUaMMGxLUq1fkr+hi94G9gqqb9xr+a1ZjvhzhlCsGq
         5vUvbYk6rr/rzyYp8Ir+AxEU2J4FhawXsIM2VLlTFV5i4+GgrSvLoiauVUUV0oX4szFZ
         P0EuQnrzOj8YiO7Wp0N8YXjgpSp7DrPZZevNL6te+okEzjt2sOxrnj1mcxj00kACqpWL
         va/FOIJQ/ywwXcqinm2QmVPpGmTTDtC8UClY9TAizhnOQra5q9f6I+Za1lhEjN1ApKiZ
         hQkvqwb+o8rrXDgUFTU5b68iDRD9rWIIEx3dobQRjQ+YI1UsnMGAljU9B4j1JNmVrTyT
         5X4w==
X-Gm-Message-State: AOAM5305iaTFhXQgPvOkEvPxx3TTj5b86inrfjVC81BaNKpjYDIqrsDR
        g99nCDc5WcREhINxmCvsE5J5ByTtCA==
X-Google-Smtp-Source: ABdhPJzXjvrSczFnaz12NXIx0PZTeUKha1Hbo6b1S56wkq2O6hDSkmJlTC9bTKUTsfEZbl2pnf9MVA==
X-Received: by 2002:a05:6830:3499:: with SMTP id c25mr13491792otu.206.1636729329073;
        Fri, 12 Nov 2021 07:02:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a16sm1183189otj.79.2021.11.12.07.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 07:02:08 -0800 (PST)
Received: (nullmailer pid 2842419 invoked by uid 1000);
        Fri, 12 Nov 2021 15:01:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211112120518.3679793-16-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com> <20211112120518.3679793-16-thierry.reding@gmail.com>
Subject: Re: [PATCH 15/15] dt-bindings: serial: Document Tegra234 TCU
Date:   Fri, 12 Nov 2021 09:01:59 -0600
Message-Id: <1636729319.995745.2842418.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:05:18 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible string for the TCU found on the Tegra234 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/serial/nvidia,tegra194-tcu.yaml    | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1554322


tcu: $nodename:0: 'tcu' does not match '^serial(@.*)?$'
	arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dt.yaml

