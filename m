Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60663C63793
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jul 2021 09:11:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4366D60C3D
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jul 2021 09:11:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhGVIao (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jul 2021 04:30:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231331AbhGVIan (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jul 2021 04:30:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60D136008E;
        Thu, 22 Jul 2021 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626945079;
        bh=++tXS1XNNR5+rOMypNW2O4Nv6hWoVgGOYZurO92H4JY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XlIALtpBUEMrYlgS4RRMoNWt3+tyZx+kbipoYTOe/Rwjy54VFXUop4TXiBfHABqB4
         1wedigSd9A+i7OSzJItb7quozecjCXtepaU0R9aWN9up4Vv6ukGx13VgI+VhRrh3/0
         mX53A2HUJbqoPNupVaC3mcuz0Qm1/Z1h4cOa1qKUREzyPr/gYFLpMpE+iK+SjOoS/s
         m8q1/1JpBi7UPnmGnP+OyWQDKfKzhlE0jXeXxvYLBW+QEwwjU0hXfMqkaJwO1TDwge
         KnR8xTIscBhdVY5qH8iQJaNWQZa6tv0dT6z7uYfzhXfVX4xamAmeMaYlSN3gczmZha
         4IDpOSjhOqF1g==
Date:   Thu, 22 Jul 2021 14:41:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: tegra: xusb: mark PM functions as __maybe_unused
Message-ID: <YPk2M8rNvorkkb8d@matsya>
References: <20210721152550.2976003-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721152550.2976003-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21-07-21, 17:25, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When these are not referenced, gcc prints a harmless warning:
> 
> drivers/phy/tegra/xusb.c:1286:12: error: 'tegra_xusb_padctl_resume_noirq' defined but not used [-Werror=unused-function]
>  1286 | static int tegra_xusb_padctl_resume_noirq(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/phy/tegra/xusb.c:1276:12: error: 'tegra_xusb_padctl_suspend_noirq' defined but not used [-Werror=unused-function]
>  1276 | static int tegra_xusb_padctl_suspend_noirq(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 

Applied, thanks

-- 
~Vinod
