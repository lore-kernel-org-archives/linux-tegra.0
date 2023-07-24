Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 444B0C001DF
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Jul 2023 16:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbjGXQLt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Jul 2023 12:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjGXQLs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Jul 2023 12:11:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 208B6FB;
        Mon, 24 Jul 2023 09:11:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A977F61248;
        Mon, 24 Jul 2023 16:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA29C433C7;
        Mon, 24 Jul 2023 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690215107;
        bh=tIx1GddcREd27jG8KtAYJIrOrKErN2gF7MQCLYaFQdw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YVqR4SsSoqzCwcRmXIN2tNmUUr9bjfs9zJy1f1o4cYhvufDn4Z5Jjv2mXoLTBsp9g
         g49ZTNfsMpA/aL5ZYOK4Tu320v0zhvKyFuyOPpBBp8Jhfh1OvjpF7sGmOba6bgTZO7
         8DxMBKuRjpri8zK3UOVn0ZeUWFyBqhbhe69kWK0zwGOrneIoDFxfgnFE4N42qxhM9j
         PuHb5BCu7tp/PQUIxUog0ds72nm8oQrrjf9Sxt039Tsqs5aeoDTRPTHVhEhseMHKhE
         HRt1gREFmECFwb419Fcbj6vEUQSd6yvfcpuo5LYp00xhACGczS3LHJAb0IzZRXXmlN
         ZKwcYxgq+Oy7g==
Received: (nullmailer pid 3672661 invoked by uid 1000);
        Mon, 24 Jul 2023 16:11:45 -0000
Date:   Mon, 24 Jul 2023 10:11:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: tegra: Document Tegra132
 compatible
Message-ID: <169021510461.3672460.11252287930356769004.robh@kernel.org>
References: <20230721131322.2991364-1-thierry.reding@gmail.com>
 <20230721131322.2991364-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721131322.2991364-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Fri, 21 Jul 2023 15:13:22 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Tegra132 clock and reset controller is largely compatible with the
> version found on Tegra124 but it does have slight differences in what
> clocks it exposes, so a separate compatible string is needed.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/clock/nvidia,tegra124-car.yaml        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

