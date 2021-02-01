Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F432C4332E
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Feb 2021 16:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE71064DA5
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Feb 2021 16:47:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhBAQrY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 1 Feb 2021 11:47:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:33938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231290AbhBAQrS (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 1 Feb 2021 11:47:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D75164DE3;
        Mon,  1 Feb 2021 16:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612197996;
        bh=BYN4P1D4rCCkAfn2duFYF1Tx4dpo/sxwz9GZpqd6Qlw=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=DZ+iSaq96VTB8qAtZSWN49K2u7fgM7Lr9aFt108RTS6WIxrnf95RSPs8WwZE+l3CA
         HPVcZg5aC7TmWnRNRiEbdFWUNqgejuF2HzjaCWAKUj79KIjqoSYuSd00AMXGImeeWX
         58UGCE/sn7pXy3yyskgkZNqq73YjlfrdLjRIC3nJhEGUPsEM9b4czxM2LBn5H54NU+
         FF1HuOO8550hbJI3b+PdNP2iOdn5sLohVtcGl58Q2IccN6n6fbjilBZYaDnAN/qxe7
         ZBvHvaOPeDJ5MM67nOrsWL2oibk/d5yLKr8m0hjEzUfAfgE7kLz8lqAehjTQXuoPZ2
         Rhwylk+veJkXg==
From:   Mark Brown <broonie@kernel.org>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sameer Pujar <spujar@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org
In-Reply-To: <20210129125915.2652952-1-geert+renesas@glider.be>
References: <20210129125915.2652952-1-geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: tegra: SND_SOC_TEGRA_AUDIO_GRAPH_CARD should depend on SND_SOC_TEGRA
Message-Id: <161219793994.46194.18131030130174715049.b4-ty@kernel.org>
Date:   Mon, 01 Feb 2021 16:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 29 Jan 2021 13:59:15 +0100, Geert Uytterhoeven wrote:
> Audio Graph Card based Tegra driver is only useful on NVIDIA Tegra SoCs.
> Hence add a dependency on SND_SOC_TEGRA, to prevent asking the user
> about this driver when configuring a kernel without Tegra sound support.
> 
> Wrap all Tegra sound config options inside a big if/endif block, instead
> of just adding the dependency to the single config option that does not
> have it yet, to preventing similar future mistakes.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: SND_SOC_TEGRA_AUDIO_GRAPH_CARD should depend on SND_SOC_TEGRA
      commit: e86caa011c80507783e5975bca1458f28c1d2b8c

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
