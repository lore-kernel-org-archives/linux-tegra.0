Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9428C64E90
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Dec 2020 14:00:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 932CE206A5
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Dec 2020 14:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2AQ4EuJh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403878AbgLAOAD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Dec 2020 09:00:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:46072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403876AbgLAOAD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 1 Dec 2020 09:00:03 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B2252087C;
        Tue,  1 Dec 2020 13:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606831161;
        bh=SHp7eaAwZTN3BkgN+c7TZJwujK5lNNvfX/qySWd+RSE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=2AQ4EuJh02HKDNm7ukxhJyP1tv1y2ycLwyYZuhPEBF84sBLrHM9s/zdVt6k3tQYKr
         mIP/YhoczBEY5xSCUCU8wZxIzlR2xW08ZG/KhtWIn8vbuH2M9DfmdfW62G+65mLLvj
         pzcsQzqZp9pysisIKR7maQIvFerK32RH6R93k2sk=
From:   Mark Brown <broonie@kernel.org>
To:     thierry.reding@gmail.com, robh+dt@kernel.org,
        Sameer Pujar <spujar@nvidia.com>
Cc:     sharadg@nvidia.com, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
In-Reply-To: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
References: <1606413823-19885-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v6 0/6] Tegra210 audio graph card
Message-Id: <160683107678.35139.14772386553150233276.b4-ty@kernel.org>
Date:   Tue, 01 Dec 2020 13:57:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 26 Nov 2020 23:33:37 +0530, Sameer Pujar wrote:
> This series adds audio graph based sound card support for Tegra210
> platforms like Jetson-TX1 an Jetson-Nano. The following preparatory
> audio graph enhancement series is already merged.
>  * https://patchwork.kernel.org/project/alsa-devel/list/?series=375629&state=*
> 
> Following are the summary of changes:
>  * Add graph/audio-graph based schemas or schema updates for Tegra210
>    component and machine drivers.
>  * Add Tegra audio graph machine driver.
>  * Add required DT support for Jetson-TX1/Nano.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: tegra: Add graph bindings
      (no commit info)
[2/3] ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
      (no commit info)
[3/3] ASoC: tegra: Add audio graph based card driver
      (no commit info)

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
