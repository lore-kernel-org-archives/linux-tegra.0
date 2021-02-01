Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C9FC43381
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Feb 2021 16:47:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DFBE64EA8
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Feb 2021 16:47:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbhBAQrP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 1 Feb 2021 11:47:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:33890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231168AbhBAQrN (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 1 Feb 2021 11:47:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6873464DA5;
        Mon,  1 Feb 2021 16:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612197991;
        bh=rnfT7QC1QylsfBHlTLq503WKQd1AGk542dN4U3+Qa+w=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=nP7mncKo6tpJ+dPF1HascPqMRADMqPbHpiJvvLU4U8esPVyaqJe1OaRKi3qLn4KuL
         //BSDcCV1J1S+LkJk5Otc++esTcn7MdY3ddpJ5G+c85ERtessJTvHZcZ0IvA6uMAol
         +vv/9QHJE3GNbMHmiEvY51Rbo5/4lCVSUSwkQS6GCFswOQZvHkeEIXCeX3HbIoftVR
         JXEiHH2mCnU/hH/FwHvDY7VdGMo7+5ulZeZEaMi+03BnXqKx1qbAZpZPPJNT6/4lVA
         p7fqkEVrV4YCn6oFjlmAUevfZT7F31PcRgil9Z3hQvjtYljKWsTF3m06LEAR//Jmt8
         4aBCNdDS6BaSw==
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>, thierry.reding@gmail.com,
        lgirdwood@gmail.com, robh+dt@kernel.org
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        sharadg@nvidia.com, kuninori.morimoto.gx@renesas.com,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
Subject: Re: (subset) [PATCH v2 0/9] Tegra186 and Tegra194 audio graph card
Message-Id: <161219793995.46194.8766382899018359652.b4-ty@kernel.org>
Date:   Mon, 01 Feb 2021 16:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 29 Jan 2021 23:57:37 +0530, Sameer Pujar wrote:
> This series adds support for audio graph based solution on Tegra186 and
> Tegra194. This enables audio paths for I2S, DMIC and DSPK modules.
> 
> Depending on the platform Jetson TX2 or Jetson AGX Xavier, required I/O
> module instances are enabled. Since the latter board has on board audio
> codec, DT support for the same is enabled and external audio playback and
> capture can be used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: dt-bindings: rt5659: Update binding doc
      commit: 6bbb859012e905736c852b518be16c653e451967
[2/9] ASoC: dt-bindings: tegra: Add iommus property to Tegra graph card
      commit: 70f0bc65f6cf757fa4cca2d6fcb84f613bc0d8cc
[3/9] ASoC: audio-graph-card: Add clocks property to endpoint node
      commit: 531e5b7abbde3c190aeff5b13c17f7ef3e0f3543
[4/9] ASoC: rt5659: Add Kconfig prompt
      commit: 563c2681d4313f55b9b1d9a8f635946cd4972170

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
