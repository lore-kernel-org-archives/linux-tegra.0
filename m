Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C415C43460
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 16:49:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BD7B61422
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Apr 2021 16:49:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238103AbhDVQuH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Apr 2021 12:50:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238068AbhDVQuE (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Apr 2021 12:50:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6AA961421;
        Thu, 22 Apr 2021 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619110169;
        bh=ymvNTAzPs1hJfdICUfxeM0TUkETJ86MqJiCa/fX97No=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JcVRN0HOh/N7pfhQKYAfWAuDuB+A3C1DkW+QraKzS+7yuOVOghfzbwdEnsSKfsVA/
         CJPKRdO25ZGIS5UMnTMTNq5x3aMJzvZII4QDrGubi05uD9VxmDAJaN2Xtqfnuyj8KB
         sXI9ZW/xw6Z8rp26qkxcEpUAA3WHBNuqbelNuYE2GAyUH+CfXKfe53qUdo+wdLGwqr
         DK3TtI/fJF9Dal0Hi2Q0fsKLPsVChd/A+kdgryHFCvLbzrd8hDmJNKO9xUcRo0CnWk
         6tlg/qAlf3J3XrpY3her/Ny13MAA7M9iUe5spvvn7RrKdWSZpLOk1M1o2tNJNuae2P
         FSRKgEP+I2mNg==
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, Qiushi Wu <wu000273@umn.edu>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: tegra: mark runtime-pm functions as __maybe_unused
Date:   Thu, 22 Apr 2021 17:48:48 +0100
Message-Id: <161910991989.37460.309965109490904776.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210422133418.1757893-1-arnd@kernel.org>
References: <20210422133418.1757893-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 22 Apr 2021 15:34:00 +0200, Arnd Bergmann wrote:
> A reorganization of the driver source led to two of them causing
> a compile time warning in some configurations:
> 
> tegra/tegra20_spdif.c:36:12: error: 'tegra20_spdif_runtime_resume' defined but not used [-Werror=unused-function]
>    36 | static int tegra20_spdif_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> tegra/tegra20_spdif.c:27:12: error: 'tegra20_spdif_runtime_suspend' defined but not used [-Werror=unused-function]
>    27 | static int tegra20_spdif_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> tegra/tegra30_ahub.c:64:12: error: 'tegra30_ahub_runtime_resume' defined but not used [-Werror=unused-function]
>    64 | static int tegra30_ahub_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> tegra/tegra30_ahub.c:43:12: error: 'tegra30_ahub_runtime_suspend' defined but not used [-Werror=unused-function]
>    43 | static int tegra30_ahub_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: mark runtime-pm functions as __maybe_unused
      commit: ccd4cc3ed0692aef8a3b4566391c37eb168d8d32

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
