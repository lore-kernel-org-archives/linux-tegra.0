Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED14EC4742C
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 07:39:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C6B12227F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Nov 2020 07:39:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zoFy6B5R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgKPHfL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Nov 2020 02:35:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:46070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbgKPHfL (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Nov 2020 02:35:11 -0500
Received: from localhost (unknown [122.171.203.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3076B2225B;
        Mon, 16 Nov 2020 07:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605512111;
        bh=q/aV6BETidJj5qfGklpuHG9pcL5E7HlwZh2nF/BUMqU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zoFy6B5Rr2YtcwzvXPsC7QdD066J5wgmlAW/yC2oJkPoSjVQSuqofCK192PRPi8RI
         NBUy4bArmqDIAALOM+oXXn0W6rprAqHOJ/glN5Qr4y0BUJM78lE77fDW4DaX6maDoM
         i4249bjm59QzgGLM2srAtsmJvCEHimUvDi7g8BRk=
Date:   Mon, 16 Nov 2020 13:05:06 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] phy: tegra: Constify static device_type structs
Message-ID: <20201116073506.GK7499@vkoul-mobl>
References: <20201109215844.167954-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109215844.167954-1-rikard.falkeborn@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 09-11-20, 22:58, Rikard Falkeborn wrote:
> The only usage of tegra_xusb_pad_type and tegra_xusb_port_type is to
> assign their address to the type field in the device struct, which is a
> const pointer. Make them const to allow the compiler to put them in
> read-only memory.

Applied, thanks

-- 
~Vinod
