Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0C2C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Dec 2021 07:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbhLNHhg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Dec 2021 02:37:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbhLNHhf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Dec 2021 02:37:35 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B31C061574;
        Mon, 13 Dec 2021 23:37:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 20B3461355;
        Tue, 14 Dec 2021 07:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851FEC34604;
        Tue, 14 Dec 2021 07:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639467454;
        bh=+I7jyVRiXealtexH7w79gsPyY9yTEyVLP2AaWCCQDo8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qns4nrWTkv/V5g4S7XHLdITbSxXbc1cQdNsDOC9oCWACjpVTSQBsJ8yAfFmAasTFN
         hD8IfFTXkf3nc6xjnb7POKC2Ineb3RAflFCi6Botc+CVEdpt/Er/8KWQi6XL57v22Q
         PaP4gEVJ0G+BgeVro7PE53hfW4P24n+kahSdmEb/pET3LO6Lva0yyymydhZqxn/TM0
         9aFPingsogNitiklXxmtC9Ird/ZwtPnGnYpSJswiYhwaGWpuEEMl//LU1UiOaeh3xD
         oEPD6TjRXBzkEeUSDm6xw3bT9Y46kEkcNNDYGCh8gGXWQniAwG9xLe0uVyPuIuO7gJ
         bJWsY759hFHxg==
Date:   Tue, 14 Dec 2021 13:07:30 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Miaoqian Lin <linmq006@gmail.com>
Cc:     digetx@gmail.com, jckuo@nvidia.com, jonathanh@nvidia.com,
        kishon@ti.com, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        thierry.reding@gmail.com
Subject: Re: [PATCH v2] phy: tegra: xusb: Fix return value of
 tegra_xusb_find_port_node function
Message-ID: <YbhJugAkqdXApeGQ@matsya>
References: <942f943c-9ec8-9887-aa6d-4d133821beca@gmail.com>
 <20211213020507.1458-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213020507.1458-1-linmq006@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 13-12-21, 02:05, Miaoqian Lin wrote:
> callers of tegra_xusb_find_port_node() function only do NULL checking for
> the return value. return NULL instead of ERR_PTR(-ENOMEM) to keep
> consistent.

Applied, thanks

-- 
~Vinod
