Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E89C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 14:13:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87AA2619C8
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 14:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbhC3ONR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 10:13:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:43270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231301AbhC3OM6 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 10:12:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAECE619C7;
        Tue, 30 Mar 2021 14:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617113577;
        bh=3EtIj/RWbuCW8vrJE3TlniTyeTl35eaNnhpLSPK0Fe4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q5wC3BDexHUQ+B03VrMn1iqwD843Ut3sKwN3zm10ZiJxwdntLFeQMW4Drlmi3EYnu
         fsstGHcNoG9rkZFNO8pbmAhsX3dmQCT8OQaLZEPoMcwQTzNelsjkebVwBKsYFFYukI
         SJO0d0xNk9onsYknDkBbGpbzh9oSsgPY1OH+lLEk4i9qnO4wjs3y4U7vngOJj632XF
         tpd5H4GS1sHC036mRaj3FGFYdKhLyvkquIzE6eXN4pXP14q98gyDT0wVqq6p4X4YZd
         KeXy+kMfv0pQX2HEhw42KIQXo1thl37p8/JZ++QErXiiqNNuPJTgM5JewU4curDKm+
         jeHOLhDOx2FzA==
Date:   Tue, 30 Mar 2021 19:42:53 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 03/13] phy: tegra: xusb: Move usb3 port init for
 Tegra210
Message-ID: <YGMx5cLmX+d48XKO@vkoul-mobl.Dlink>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325164057.793954-4-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Thierry,

On 25-03-21, 17:40, Thierry Reding wrote:

> +static struct tegra_xusb_usb3_port *
> +tegra210_lane_to_usb3_port(struct tegra_xusb_lane *lane)
> +{
> +	int port;
> +
> +	if (!lane || !lane->pad || !lane->pad->padctl)
> +		return NULL;

This looks problematic to me, so if lane is NULL, it will still go ahead
and check lane->pad which would result in NULL pointer dereference.

-- 
~Vinod
