Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46C9C433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 14:21:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD73C619C7
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 14:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhC3OUx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 10:20:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:47376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230243AbhC3OUY (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 10:20:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07770619C7;
        Tue, 30 Mar 2021 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617114024;
        bh=QcHxx2zsCVkFSj++zTZkHjusUnw+j8RM6dy2xwbFHic=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uwQgNOd57q894Ks8xKG5aFT8Q1GjegSdec1RRY/d7ykI5G2GoHEB4eSi4OMJxSM9f
         4UubpJB0ulbkbM1Ou5zDz4MN5H0A7MJPE4j/j5oWOa3e/LS0fh+cBHoNupOrbqAFUG
         gv6dHHxKAinpdiamybijZ/Taf4g4UCIQie5x2HHGFQWTfB2vX4yy/c1PK74n6Cc4O3
         4bGvrfy8SeLFNgpJF66JOm6fHD424dpjmKsJBwDuSikqLzEB7Saz7ZdBgztK+pDhxF
         diD6Z8L7nC2PyHq55hGqR1EaqiV8YhwC79ZoRWp1bgNvo3aGSCXjpgCsq7Ftd35jVv
         wgtFktSqJZmsA==
Date:   Tue, 30 Mar 2021 19:50:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 04/13] phy: tegra: xusb: Rearrange UPHY init on
 Tegra210
Message-ID: <YGMzoxhv5UYR+t/e@vkoul-mobl.Dlink>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
 <20210325164057.793954-5-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325164057.793954-5-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 25-03-21, 17:40, Thierry Reding wrote:
> From: JC Kuo <jckuo@nvidia.com>
> 
> This commit is a preparation for enabling XUSB SC7 support.
> It rearranges Tegra210 XUSB PADCTL UPHY initialization sequence,
> for the following reasons:
> 
> 1. PLLE hardware power sequencer has to be enabled only after both
>    PEX UPHY PLL and SATA UPHY PLL are initialized.
>    tegra210_uphy_init() -> tegra210_pex_uphy_enable()
>                         -> tegra210_sata_uphy_enable()
>                         -> tegra210_plle_hw_sequence_start()
>                         -> tegra210_aux_mux_lp0_clamp_disable()
> 
> 2. At cold boot and SC7 exit, the following bits must be cleared after
>    PEX/SATA lanes are out of IDDQ (IDDQ_DISABLE=1).
>    a. XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN,
>    b. XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN_EARLY
>    c. XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN
> 
>    tegra210_pex_uphy_enable() and tegra210_sata_uphy_enable() are in
>    charge of bringing lanes out of IDDQ, and then AUX_MUX_LP0_* bits
>    will be cleared by tegra210_aux_mux_lp0_clamp_disable().
> 
> 3. Once UPHY PLL hardware power sequencer is enabled, do not assert
>    reset to PEX/SATA PLLs, otherwise UPHY PLL operation will be broken.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
