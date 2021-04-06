Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4A1C433ED
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Apr 2021 05:01:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 608A9613B3
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Apr 2021 05:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231684AbhDFFBt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Apr 2021 01:01:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:56978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229735AbhDFFBs (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 6 Apr 2021 01:01:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A8F861369;
        Tue,  6 Apr 2021 05:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617685300;
        bh=8WeA8BlYZbybMP4QgbVfLMXn2AECxnbfzOxQoXM6tPk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mqMq9hgGmOSoQ3/ueGbjFGTzsOEeuEcpMwJDCK1E4zpLXq11nEjQ7TGeppn1BgPaS
         IEhK9uga4CWLkA4YYwATl1Qq153ouTooBX/1kZXaAHpASHAMDeCBjA9P4WRyieMLBx
         kUkpydHhRoMEDYHnb1yrYD+yC8ALV6AzvK/WWHmbu+hjNRDNl1cO0iN2NEtB5Ei/S7
         cKGHX3nPcpKnhSVvQ96eQWgoDBGt5TndD+HKgwAh/tZC4PbbHvQac+Z1ufIyjM1EEG
         WJbwZeGgIiDS7AQPO4pfEsDmiE0kFPgtiBNyTC6FU4vhCtnZP0re4NM1hD1Cz2w1tT
         THwItXjHts7xQ==
Date:   Tue, 6 Apr 2021 10:31:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v9 09/13] phy: tegra: xusb: Add wake/sleepwalk for
 Tegra210
Message-ID: <YGvrMJ6FwwV3KOpt@vkoul-mobl.Dlink>
References: <20210325164057.793954-10-thierry.reding@gmail.com>
 <20210401110512.2743589-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401110512.2743589-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 01-04-21, 13:05, Thierry Reding wrote:
> From: JC Kuo <jckuo@nvidia.com>
> 
> This commit implements Tegra210 XUSB PADCTL wake and sleepwalk
> routines. Sleepwalk logic is in PMC (always-on) hardware block.
> PMC driver provides managed access to the sleepwalk registers
> via regmap framework.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
