Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C35C001B0
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Jul 2023 16:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjGXQEu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Jul 2023 12:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjGXQEt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Jul 2023 12:04:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44828E;
        Mon, 24 Jul 2023 09:04:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 61E946123D;
        Mon, 24 Jul 2023 16:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332D2C433C8;
        Mon, 24 Jul 2023 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690214687;
        bh=HbpZ9oQ3b4U8JfwdURL1FRlf1QZwT8Ze6kLldfPeBy4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F32vopvrm41nFh64D682kgb8RZmA115oSC4d2LvuG8h4P2kVkUhYLVoIzcEXfUnOD
         KrRMIjqy7E32PNPbNNILSY6y1hSVpE0gnJe1IRGwmGbTioW6Gncjx/FoiMjN6E+MPA
         6z1Ty/wt5IfKZDuCxNHuDfQs45FhTIQJ95fBfd04IqbTfxNFVTlrRqhtOVoPW7MqUT
         yEhbU6UcTEi12oKrd4E/q2hW2LtlLQMQBeVPmN9rmJGG7BcxiIVQ0txyVGVPbQrx7/
         IAesopocZlRtcez/ztb5KPwpTVyEJbP4k0VdXZonlvs9jyCPDrHs0dVw9PsEhbisok
         +yLNP6gjL21sg==
Received: (nullmailer pid 3628418 invoked by uid 1000);
        Mon, 24 Jul 2023 16:04:46 -0000
Date:   Mon, 24 Jul 2023 10:04:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH v3] dt-bindings: arm: tegra: nvec: Convert to json-schema
Message-ID: <169021468589.3628360.8918610789656519699.robh@kernel.org>
References: <20230721124623.2988445-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721124623.2988445-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Fri, 21 Jul 2023 14:46:23 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA embedded controller bindings from the free-form text
> format to json-schema.
> 
> Acked-by: Marc Dietrich <marvin24@gmx.de>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - rename node to i2c to clarify that it's a repurposed I2C controller
> - drop unused #address-cells and #size-cells
> 
> Changes in v2:
> - drop $ref for standard clock-frequency property
> - use 4 spaces for indentation in example
> - move to soc/tegra directory
> ---
>  .../bindings/arm/tegra/nvidia,nvec.txt        | 21 -----
>  .../bindings/soc/tegra/nvidia,nvec.yaml       | 84 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,nvec.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,nvec.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

