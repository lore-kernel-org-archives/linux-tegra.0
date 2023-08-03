Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B31FC001DE
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Aug 2023 00:49:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbjHCAtC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Aug 2023 20:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjHCAtC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Aug 2023 20:49:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB7D2698;
        Wed,  2 Aug 2023 17:49:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D6AF161B98;
        Thu,  3 Aug 2023 00:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F68FC433C7;
        Thu,  3 Aug 2023 00:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691023740;
        bh=Pvq5frbtl47VBHXbziUG/NXXU+2orY1g6R2nNjKYPrM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PzDZ/u+gqybbnptSCRejEsTzwcPZul38Nf47+cwjrWAqWK7CZE/2KBviozk4G7TYr
         x1RI5xz9G73EHqzDkX3zhFz1UkyomjwolP/oJs7bklLb75+oh8g7kR5sHkXbjUEPwL
         1TTJd5bvCs3AlXdCpXrR+XB0DKu1fKdKK0z8z2pvXugxF7wd7QAgTWImoZKB4XaVAk
         9iaqX7VOd14OMWtN8mgz79N0sZPmP/4P2yq3aPtf5ivuF4Mc4lDowmYrUp8gujdLAF
         Hb9M39GDKEAstsvbXQcL5bpo0emA6Khud8buW4rOSIOR9k5c4v1QoSlzn3bFs1t53o
         ziSmzH8dQ2ImA==
Received: (nullmailer pid 1607213 invoked by uid 1000);
        Thu, 03 Aug 2023 00:48:58 -0000
Date:   Wed, 2 Aug 2023 18:48:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 5/7] dt-bindings: arm: tegra: pmc: Restructure pad
 configuration node schema
Message-ID: <169102373798.1607137.12779262559549558207.robh@kernel.org>
References: <20230726162744.2113008-1-thierry.reding@gmail.com>
 <20230726162744.2113008-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726162744.2113008-5-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Wed, 26 Jul 2023 18:27:42 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The pad configuration node schema in its current form can accidentally
> match other properties as well. Restructure the schema to better match
> how the device trees are using these.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - remove quirks that are no longer needed with latest dt-schema
> 
> Changes in v2:
> - highlight quirks working around possible core schema
> - use phandle: true instead of fully redefining it
> - drop unneeded status property definition
> 
>  .../arm/tegra/nvidia,tegra20-pmc.yaml         | 171 +++++++++++-------
>  1 file changed, 109 insertions(+), 62 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

