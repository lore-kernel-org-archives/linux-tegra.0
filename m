Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488FDC46467
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Jan 2023 17:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbjARR0d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 18 Jan 2023 12:26:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjARR02 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 18 Jan 2023 12:26:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41D7759565;
        Wed, 18 Jan 2023 09:26:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8AFAC61903;
        Wed, 18 Jan 2023 17:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F421C433EF;
        Wed, 18 Jan 2023 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674062785;
        bh=Ie8gYGGf5+xcu1uU0rnQr9KYWVko0DdTHmrDJiqVhVs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N9YJdpRKAsc+RIFHGEI11cQ1FSgRNsehYucyNBBuGzvp7wwHeweHsBroVChj3fvkD
         c5mar+fT5cKko4SLHwkJKlIUzSPbjMYCfFG6jPgeRHIXOruzZbuCn/aWRNLSQNuHJ4
         /j1aFJg+y5NP1EsPUCpzVPZLtxjTy3TJ4jC4s+GkZ87S5HTZkeys8qZsUajydGcFSc
         0BpwHuUT1ETF7jW3sYdq3R5tzjkt5ri4aIYs2Qwa0VeunCAiF+yY3CHPS2POWT8/W+
         k/j6mEXj+FSUgH20NjJzOKoIXOl9q4QkQudKzfaD5bn0T/I2p23X0KsCsZuSZT+yYm
         d8KeHVHGVXnjw==
Date:   Wed, 18 Jan 2023 22:56:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: phy: tegra-xusb: Convert to json-schema
Message-ID: <Y8grvSQa7raCn8q5@matsya>
References: <20230113150804.1272555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113150804.1272555-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 13-01-23, 16:08, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra XUSB pad controller bindings from free-form text
> format to json-schema.

Applied, thanks

-- 
~Vinod
