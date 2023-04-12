Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF4DC77B6F
	for <linux-tegra@archiver.kernel.org>; Wed, 12 Apr 2023 16:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjDLQWf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 12 Apr 2023 12:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbjDLQWU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 12 Apr 2023 12:22:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0473976B
        for <linux-tegra@vger.kernel.org>; Wed, 12 Apr 2023 09:21:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B24B636F2
        for <linux-tegra@vger.kernel.org>; Wed, 12 Apr 2023 16:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF171C433D2;
        Wed, 12 Apr 2023 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681316517;
        bh=OMGCs9Ki/y8UGmBnO+KdZJALvU1grM+QgjO8iL+SpUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PNUDwydFe8CXlErg/3dyAOl1IG+ZJ0miN0obmi9YH7BL6BZkJEBvnigXNsZ9KjXPO
         jqP+/ejHVAy1CvFswSd+4wIPIdqYXscJiNwp9BBJFczap7nmseHpt0sZuT/QSNej1o
         z9R4uyPyuG1gP9RB0YS53LRPZN2FIkv6Pttj4JTHg2Rt00yVsRs548eHndwlDVEx3I
         ZW3uEzGog59yzZS0XfStfpIaq26bttvthQ+weprqzZHrLe5D2glQIGVxKjWXyH8p9h
         1BsCNUrbZMCHa+SUC/jUVck0fOBhhOmG38alhFZeQgxYwk/7aM8AnulA9iU5xu+pPO
         WDV+vwJoosm7w==
Date:   Wed, 12 Apr 2023 21:51:54 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     jckuo@nvidia.com, kishon@kernel.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] phy: tegra: xusb: Add missing tegra_xusb_port_unregister
 for usb2_port and ulpi_port
Message-ID: <ZDbaos9E77CAyisG@matsya>
References: <20221129111634.1547747-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129111634.1547747-1-cuigaosheng1@huawei.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 29-11-22, 19:16, Gaosheng Cui wrote:
> The tegra_xusb_port_unregister should be called when usb2_port
> and ulpi_port map fails in tegra_xusb_add_usb2_port() or in
> tegra_xusb_add_ulpi_port(), fix it.

Applied, thanks

-- 
~Vinod
