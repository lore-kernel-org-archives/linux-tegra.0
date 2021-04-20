Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF43C433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 15:07:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A2EE613C9
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 15:07:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbhDTPHn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 11:07:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:60178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232450AbhDTPHn (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 11:07:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 767E2613CA;
        Tue, 20 Apr 2021 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618931232;
        bh=notO+AX1S6KlITWxKZbYDRxBIOFZVLI6wIZs30gVzzE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CuNiazsCxauu6F9r5V/3s0aWzAlE8Abv5Iy5SdLLajuqTpNBCfwOti8jIsbrSyGm+
         9iCKELjPb1EGXbbSmlzHG/gFTxbKxelDVWcnZTYCMwX6Q/eaj2g3EeOoF1kthwnLfj
         55eXG0Dixk5p5ibsuYr2E/SHO1uSuGH6mqxLYOlJ6PGllcqlg0kB3+bY0RsLJo0MmK
         WrByw3DVK0w8cDoxl/y7Iw1fu2pkhyRUeBw+5ukJMmFMfm/9/YV9IN5HPOCRg68h8T
         wvf92dM1syfqCH21pSjAwBa6Jhl0Ff4vJChLuIFL94Dvj+3RBwcFRISPxUpMxBCm2p
         QlhAwg+5P3Jvw==
From:   Mark Brown <broonie@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kernel test robot <lkp@intel.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: Allocate link info structure on heap
Date:   Tue, 20 Apr 2021 16:06:39 +0100
Message-Id: <161893058718.55483.6897930067782163061.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419164117.1422242-1-thierry.reding@gmail.com>
References: <20210419164117.1422242-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 19 Apr 2021 18:41:17 +0200, Thierry Reding wrote:
> struct link_info can grow fairly large and may cause the stack frame
> size to be exceeded when allocated on the stack. Some architectures
> such as 32-bit ARM, RISC-V or PowerPC have small stack frames where
> this causes a compiler warning, so allocate these structures on the
> heap instead of the stack.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: Allocate link info structure on heap
      commit: ec1af6c64db94e4f24e53011a77b2bf2220ae000

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
