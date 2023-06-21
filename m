Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE950EB64DC
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jun 2023 17:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbjFURhe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Jun 2023 13:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230481AbjFURhb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Jun 2023 13:37:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA64F1BDA;
        Wed, 21 Jun 2023 10:37:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 85006615FF;
        Wed, 21 Jun 2023 17:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7EFC433C0;
        Wed, 21 Jun 2023 17:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687369048;
        bh=Ofow7TPhTby78fiLDgvFRr9YEMU8BzTuo+3QlFVgybo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lcSfXMrPdldMiaJQp2qajwo1CJIGRK0b0TT5+todi+ByYMIHp/+iz46WCmF/qHTWI
         xeLA/2Be/C0VpWNQC03aaSP66+R7uN1lEd70E0FgyZiC66F9S1Vnfv09rXlbgxTKLU
         rRuw3+V6HSOVfOwvv1mjk0gkcp6X3E4945HBE+GE7Wt/yaSOjea0qmJJq3XhMl2pNE
         9p4CDIaWAmGzfK+z6ChGnkxI23mNaBJyDTgF4Pe50tJ1KHE52Og6CTMW9RyFzisQEW
         eqbk6CdnsYIZTiPhUG9ZQJSZNyLCJxryfzW9Dx0V9SrvscZ13ATLxdTkDC1NCnnG9X
         vos3EDlyhA3/Q==
Date:   Wed, 21 Jun 2023 23:07:23 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     jckuo@nvidia.com, kishon@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, nkristam@nvidia.com,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: tegra: xusb: check return value of devm_kzalloc()
Message-ID: <ZJM1U9RPV4DUPgWp@matsya>
References: <20230531073950.145339-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230531073950.145339-1-claudiu.beznea@microchip.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31-05-23, 10:39, Claudiu Beznea wrote:
> devm_kzalloc() returns a pointer to dynamically allocated memory.
> Pointer could be NULL in case allocation fails. Check pointer validity.
> Identified with coccinelle (kmerr.cocci script).

Applied, thanks

-- 
~Vinod
