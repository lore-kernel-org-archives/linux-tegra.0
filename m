Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217CAC4338F
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 17:05:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0615660F58
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Aug 2021 17:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhHPRFl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 13:05:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:58138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229761AbhHPRFk (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 13:05:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 206CC60E76;
        Mon, 16 Aug 2021 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629133508;
        bh=RrPpirxSrKSMhGZJ+QCIH5ubgH4kZX6FvSaNS2s3bXQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=inuI2C2jITpMS8AKBKtJoXTf2zBpon/qSOFvDvMFs9vw9YUxzFHKdDaKaHPn5Qqeh
         RNBlEGqXdKULxwF2io8nQwSMfq59mOLIGKazvnA6NJqGafauTdoQnyB8XzM/YGyYzD
         K2QvcSVxWZC2re7K7KmlWLXE6jms0bxjyFVTcOBJgPXTOrHKGESRItexrbXUDyqpw6
         U9L/R0OqjEfux9335576InPpj9BdcZaeYQ4BYHaSG4IiYP8YeWMLV+0pbxXUdCOCou
         COvEWGf06XG9WmU77ipHafHzgWNHgAZIECGmsZCEayGWLuz1rdddf1eUbrW+YYOJ9i
         aKl57NGa3PIpw==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Aakash Hemadri <aakashhemadri123@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
        linux-tegra@vger.kernel.org, Bjorn Helgaas <bjorn@helgaas.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jawoslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ASoC: tegra: Use of_device_get_match_data
Date:   Mon, 16 Aug 2021 18:04:40 +0100
Message-Id: <162913223312.13582.10888100799475599538.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628971397.git.aakashhemadri123@gmail.com>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 15 Aug 2021 01:42:17 +0530, Aakash Hemadri wrote:
> 	Prefer `of_device_get_match_data` over `of_match_device`. This patch
> replaces of_match_device with of_device_get_match_data.
> 
> This patch series will apply cleanly on for-next
> 
> Aakash Hemadri (2):
>   ASoC: tegra30: ahub: Use of_device_get_match_data
>   ASoC: tegra30: i2s: Use of_device_get_match_data
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
      commit: 80165bb8043391f4ef4916bde947a4d805a54aa6
[2/2] ASoC: tegra30: i2s: Use of_device_get_match_data
      commit: 356b94a32a75203616e5a7c3cd2b19101bc87086

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
