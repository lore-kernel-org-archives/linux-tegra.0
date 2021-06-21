Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F76C48BC2
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 18:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2195F61358
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Jun 2021 18:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhFUStZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Jun 2021 14:49:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:40888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232238AbhFUStW (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Jun 2021 14:49:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D78B6128C;
        Mon, 21 Jun 2021 18:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624301226;
        bh=4ynnjLFGqT7jeVoGFXKGU1jJH+2RzYGaTP4Lm67YYMU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ny0E3T5RoNSybmXudw3iIbk8cMmu/KS9qAH9i8fLgRzSJaZmj2gYncYDR1q4PxVWF
         b53Dac9NfbCRhF4c/Pu5hqX2OOncLEZdiud6h9ABGt4UKzGoaqoeXkNAkTIikKcjED
         ZpUyFrsKKDml4i5FpwOV/Jf8nt47FRt25QdyDC5x16cjpaCr2mlwMYA7GTBo+++NBc
         fjzRr5kPx0J3mIRqqqSHtG23xpNgsE4279mr18+yvS2zd4Y355uLorxYYaBb33HCP7
         ZfuXWv8qN/8uYwdhiJ+7gcHryjUsEKraB5b9igFkVt7KpP2GxEXbmqRmfv05P5jNdt
         IpdJ4mewPLiqQ==
From:   Mark Brown <broonie@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ASoC: tegra: Fix a NULL vs IS_ERR() check
Date:   Mon, 21 Jun 2021 19:46:02 +0100
Message-Id: <162430055263.9224.14507478089189972560.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <YMyjOKFsPe9SietU@mwanda>
References: <YMyjOKFsPe9SietU@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 18 Jun 2021 16:44:24 +0300, Dan Carpenter wrote:
> The tegra_machine_parse_phandle() function doesn't return NULL, it returns
> error pointers.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix a NULL vs IS_ERR() check
      commit: 3aed3ddf9639a4f915984177ff8a2253f3f8acfe

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
