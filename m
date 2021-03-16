Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB81C433E6
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 18:01:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22A28650D9
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 18:01:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239642AbhCPSBN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 14:01:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:46816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239575AbhCPSAV (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 14:00:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3575965134;
        Tue, 16 Mar 2021 18:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615917620;
        bh=3R/vB/7tMgve+KQBBMahuJ86d+Jwqw3flfkV7zUdYPo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=on8wn5iY+hTmZj0WcRhLLacBP55sAvgJ6lJQWjuz0SxTcA/JhtlNl8CmcvTMjejPY
         jkxVPvrDOg8LOcnC7iYgCIRDGV2dEL3L3oK4BKkCviDX7HNGkxREk4z5CBgvk2h+PT
         oVupmcurRB7Xs+RtVTg2pIAWjMN6ABztWP1DfdYrHz1MX7JxYpVnDLF/2MJ0OMjGV+
         hdEI+fObwtxcD/MEnaKQ/I0x3qD+hfqPjanlldJPcvOQgFZBwUr5Pp/MwvjnPTRzA6
         nENU/aJDKAh40WjgvxSCtHDZhFZsStfHjpEQnPMnBmj6TU2PvPlZLLQH3H/JsnfWfv
         GPdxKY1vktzfg==
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com
Cc:     Mark Brown <broonie@kernel.org>, kuninori.morimoto.gx@renesas.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        oder_chiou@realtek.com, jonathanh@nvidia.com,
        thierry.reding@gmail.com, michael@walle.cc,
        alsa-devel@alsa-project.org, sharadg@nvidia.com
Subject: Re: [PATCH 0/2] Do not handle MCLK device clock in simple-card-utils
Date:   Tue, 16 Mar 2021 17:59:48 +0000
Message-Id: <161591744695.13544.12030388405319375507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
References: <1615829492-8972-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 15 Mar 2021 23:01:30 +0530, Sameer Pujar wrote:
> With commit 1e30f642cf29 ("ASoC: simple-card-utils: Fix device module clock")
> simple-card-utils can control MCLK clock for rate updates or enable/disable.
> But this is breaking some platforms where it is expected that codec drivers
> would actually handle the MCLK clock. One such example is following platform.
>   - "arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dts"
> 
> In above case codec, wm8904, is using internal PLL and configures sysclk
> based on fixed MCLK input. In such cases it is expected that, required PLL
> output or sysclk, is just passed via set_sysclk() callback and card driver
> need not actually update MCLK rate. Instead, codec can take ownership of
> this clock and do the necessary configuration.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: simple-card-utils: Do not handle device clock
      commit: 8ca88d53351cc58d535b2bfc7386835378fb0db2
[2/2] ASoC: rt5659: Update MCLK rate in set_sysclk()
      commit: dbf54a9534350d6aebbb34f5c1c606b81a4f35dd

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
