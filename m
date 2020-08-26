Return-Path: <SRS0=/nj9=CE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D55DC433E3
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Aug 2020 13:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C14222BEB
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Aug 2020 13:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598450075;
	bh=u85ko2OuVP6wGKE15YFhjeSNQhFhMt3mvPfJj8qAAl8=;
	h=Date:From:To:To:To:CC:Cc:Subject:In-Reply-To:References:List-ID:
	 From;
	b=mdKBjWdBBDNWCoK3qxVfkLHxOLBNQyzeY6OCgSDnopL4nprk8nkKiWrhhe+vHH0p8
	 zcI9Tb9XGb4hc9rI/aqt4V1QwBMhZHoyw0SIE1XhauPb2IyH5EKuDjpCvY7ATbNWrJ
	 pKLf9EyzpnaN8aOuJF45vMfShP1tpuPfDxWpJmvk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730539AbgHZNy2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Aug 2020 09:54:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:33268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730485AbgHZNyQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Aug 2020 09:54:16 -0400
Received: from localhost (unknown [70.37.104.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADB5922BEA;
        Wed, 26 Aug 2020 13:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598450055;
        bh=u85ko2OuVP6wGKE15YFhjeSNQhFhMt3mvPfJj8qAAl8=;
        h=Date:From:To:To:To:CC:Cc:Subject:In-Reply-To:References:From;
        b=q5DJdtp4hijWYe6ekaUag0OWXYyzvVb/cJ2iXwUWb3A501XhRsn2732n5Ib8PDS1B
         QNC14cJG2X4RvZXf8QRnSiej50S0ROqRzoPS0IbEI7Fybwyv8SWwwZlJzHbbvYN1BR
         3WY1hv7RTQxDgmN96lt/LvTGRV6xHeDCP03Voe9Q=
Date:   Wed, 26 Aug 2020 13:54:15 +0000
From:   Sasha Levin <sashal@kernel.org>
To:     Sasha Levin <sashal@kernel.org>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>
CC:     <skomatineni@nvidia.com>, <linux-tegra@vger.kernel.org>
Cc:     stable@vger.kernel.org
Subject: Re: [PATCH v3 5/6] arm64: tegra: Add missing timeout clock to Tegra194 SDMMC nodes
In-Reply-To: <1596673949-1571-6-git-send-email-skomatineni@nvidia.com>
References: <1596673949-1571-6-git-send-email-skomatineni@nvidia.com>
Message-Id: <20200826135415.ADB5922BEA@mail.kernel.org>
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 5425fb15d8ee ("arm64: tegra: Add Tegra194 chip device tree").

The bot has tested the following trees: v5.8.2, v5.7.16, v5.4.59, v4.19.140.

v5.8.2: Build OK!
v5.7.16: Build OK!
v5.4.59: Build OK!
v4.19.140: Failed to apply! Possible dependencies:
    1ea067183d8a ("arm64: dts: tegra210: Add sdmmc pad auto calibration offsets")
    22248e91bee0 ("arm64: dts: tegra186: Add SDMMC4 DQS trim value")
    24005fd1b3b4 ("arm64: dts: Add Tegra186 sdmmc pinctrl voltage states")
    2602c32f15e7 ("arm64: tegra: Add P2U and PCIe controller nodes to Tegra194 DT")
    2c3578b3f309 ("arm64: tegra: Remove extra compatible for Tegra194 SDHCI")
    351648d0cc6d ("arm64: tegra: Support 200 MHz for SDMMC on Tegra194")
    3db6d3ba0863 ("arm64: tegra: Add display support on Tegra194")
    41408c215ab7 ("arm64: dts: tegra186: Add sdmmc pad auto calibration offsets")
    4e0f12299194 ("arm64: tegra: Add SDMMC auto-calibration settings")
    5d2249dda08e ("arm64: tegra: Add ACONNECT, ADMA and AGIC nodes")
    63af8bcd23a6 ("arm64: dts: tegra210: Add SDHCI tap and trim values")
    6641af7e1fa7 ("arm64: dts: Add Tegra210 sdmmc pinctrl voltage states")
    686ba00900bb ("arm64: tegra: Add thermal zones on Tegra194")
    6a574ec70c52 ("arm64: tegra: Add PWM controllers on Tegra194")
    6f90c6f0db83 ("arm64: dts: tegra186: Add SDHCI tap and trim values")
    a38570c22e9d ("arm64: tegra: Add nodes for TCU on Tegra194")
    badb80bed041 ("arm64: tegra: Add CEC controller on Tegra194")
    be9b887f3bba ("arm64: tegra: Add the memory subsystem on Tegra194")
    d5237c7c9bbe ("arm64: tegra: Describe interconnect paths on Tegra194")
    dbb72e2c305b ("arm64: tegra: Add configuration for PCIe C5 sideband signals")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha
