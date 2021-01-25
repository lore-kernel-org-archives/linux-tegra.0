Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB44C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Jan 2021 18:12:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0049822583
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Jan 2021 18:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731258AbhAYSMa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 25 Jan 2021 13:12:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:43326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731260AbhAYSDn (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Jan 2021 13:03:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A997522583;
        Mon, 25 Jan 2021 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611597782;
        bh=XauW+yiq9PtiLTCRxGls7vBx60Zpm0LmrZUr+oXBxRo=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=iyq9f8V840omIGOnw2ZyP+t+wGGLaWsJi36buJoF3okaMAmncHZjs9AC21hcRAElb
         yqTDVa30Jw162sTNEl3jiFgoyB5JJ9mEXIWfw9eMEENGZpBHz9npyz4RvpoayfKf21
         Teo47zlSRs0sgrFb9dH7lyy1RIbcV0iBG3nHJ0InaCIwAEkuco4dxzgd5VUu9aEJWt
         0gF2YTKOOPQqdQLzvuXd/PDfkbEeaiQTstPPYUsavZQ0pMoQuaDTgCsMI+Blq/a0mq
         Ky9bPMrzekERI75Gc8ep0meyQaGuSw0GlLZlLgAPYmWY+sIvpGn0MUQ7pV8h/PJZ6b
         gzMpXxZM7rWEw==
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
In-Reply-To: <20210120003154.26749-1-digetx@gmail.com>
References: <20210120003154.26749-1-digetx@gmail.com>
Subject: Re: (subset) [PATCH v3 0/6] Clock and reset improvements for Tegra ALSA drivers
Message-Id: <161159774049.2212.2964424673309683521.b4-ty@kernel.org>
Date:   Mon, 25 Jan 2021 18:02:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 20 Jan 2021 03:31:48 +0300, Dmitry Osipenko wrote:
> This series improves the handling of clock and reset controls of
> NVIDA Tegra ALSA drivers. Tegra HDA and AHUB drivers aren't handling
> resets properly, which needs to be fixed in order to unblock other patches
> related to fixes of the reset controller driver since HDA/AHUB are bound
> to fail once reset controller driver will be corrected. In particular ALSA
> drivers are relying on implicit de-assertion of resets which is done by the
> tegra-clk driver. It's not the business of the clk driver to touch resets
> and we need to fix this because it breaks reset/clk programming sequences
> of other Tegra drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/6] ASoC: tegra: ahub: Add missing resets
      commit: 24a41a38dd2df065ee942221c2fae5e314770865
[5/6] ASoC: tegra: ahub: Use clk_bulk helpers
      commit: 6d8ac9b1dd2f138f4aa39008994600f561eeede8
[6/6] ASoC: tegra: ahub: Reset hardware properly
      commit: ed9ce1ed2239909c23d48c723c6549417c476246

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
