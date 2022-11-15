Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1970C433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Nov 2022 01:43:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbiKOBnm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 14 Nov 2022 20:43:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbiKOBnl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Nov 2022 20:43:41 -0500
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FECC2BEF;
        Mon, 14 Nov 2022 17:43:41 -0800 (PST)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-13be3ef361dso14547919fac.12;
        Mon, 14 Nov 2022 17:43:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPSN0bhl4Pvy0knVMeLhRbxCJPEwnyjEdlWvNKr01fk=;
        b=PKm0PXzkoG4msZzu8ZGZ2yjTdMJPxEhcIH20EYcnKOgaUblCFg++bz21Kk+PK8Rhwr
         7/g+2jSHjS2PZTVFgSd17XlJgOajWAllyNJf4h5YV5QPDr/GwJWfoE4eUjOSDsw02cAz
         /R247h4j9NnK/mSs2NhtemYg8yG5VkD0NdaSMdUaVcBz3zhK/isFBOVdIaKxaR/mAG8k
         ml19QsN/garHI/wpNzX8TOGzurrdeJmk0hcPVeNQoilfGWLkyDBPdgSyZERR3DcpWGiD
         r7biFqxSCFAms1bx7wEQJL7D3AUVywZ+ThFj8MLTGetWyqkNuTUiiKaH8vYbO/NZlBup
         JAoA==
X-Gm-Message-State: ANoB5pmEHlP3pc/iQrPjv8P52psAJpsIO19Bgh7oSfPeBUiW5k2xvb++
        s65+h1E9bFYUMqNHPYAcDJCi0V97Ng==
X-Google-Smtp-Source: AA0mqf7CgjTcTXW/WqylmOYen0+RrraIHOdfcGL7wsb/4wUoM2FYXy1w0RIZv5UTRqE9f6/0K7YqMw==
X-Received: by 2002:a05:6871:450d:b0:13c:39cd:5ad0 with SMTP id nj13-20020a056871450d00b0013c39cd5ad0mr7830718oab.143.1668476620372;
        Mon, 14 Nov 2022 17:43:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l9-20020a056870f14900b00127fbb7afffsm5842941oac.5.2022.11.14.17.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 17:43:39 -0800 (PST)
Received: (nullmailer pid 3959000 invoked by uid 1000);
        Tue, 15 Nov 2022 01:43:41 -0000
Date:   Mon, 14 Nov 2022 19:43:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: tegra124-dfll: Convert to
 json-schema
Message-ID: <20221115014341.GA3956095-robh@kernel.org>
References: <20221111152843.627286-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111152843.627286-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 11, 2022 at 04:28:42PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra124 (and later) DFLL bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/clock/nvidia,tegra124-dfll.txt   | 155 ----------
>  .../bindings/clock/nvidia,tegra124-dfll.yaml  | 277 ++++++++++++++++++
>  2 files changed, 277 insertions(+), 155 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml

Looks fine, but you either have to convert the pinctrl binding first or 
drop it from the example.

Rob
