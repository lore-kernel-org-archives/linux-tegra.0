Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C939CC55ABD
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 07:51:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68C9E222B9
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 07:51:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+1l9mCr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbgKPHtn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Nov 2020 02:49:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:47874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727879AbgKPHtn (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Nov 2020 02:49:43 -0500
Received: from localhost (unknown [122.171.203.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B44192225E;
        Mon, 16 Nov 2020 07:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605512982;
        bh=sjPBesIJi3zyXIxDps7N7oYZaEQOIv4C1Ue24MRmAX4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S+1l9mCrbGg2Olh+hXFQsCYUA24kOYPRadbHf5S5VUVy6L05Wlzujpwgu9ZB0fJqA
         nQ6nKyY+djOJBz0aGZ8SplkfojuI2Q9RCHkjsiU/Tkj1bWfx1uqbBNiekbsBblT70V
         p6GsWywEfViYr0RsURSPLEwR2ap+IIXARm77oDNg=
Date:   Mon, 16 Nov 2020 13:19:38 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] phy: tegra: Don't warn on probe deferral
Message-ID: <20201116074938.GP7499@vkoul-mobl>
References: <20201111103708.152566-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111103708.152566-1-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11-11-20, 10:37, Jon Hunter wrote:
> Deferred probe is an expected return value for devm_regulator_bulk_get().
> Given that the driver deals with it properly, there's no need to output a
> warning that may potentially confuse users.

Applied, thanks

-- 
~Vinod
