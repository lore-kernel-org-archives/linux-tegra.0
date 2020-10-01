Return-Path: <SRS0=WsFM=DI=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CB9C4727F
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 22:48:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEC9520848
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Oct 2020 22:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601592485;
	bh=Nvkte901QOw+ByOlm8I9+Vi8S6WvVKEWOvVVAhYCQ9E=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=YvOigPhdSljIXeSAVBeBSDsbfDJ2vcuUOfll1PPUVdP11vJaBnSvtC48s9wChmPNA
	 Hay+MIxeHj3f0MqN4acOnOHtl/aCAUpQnqNLcxMs0cmi03T2TgsSv3aZpRMpCPoDe2
	 fSq8ZcqozErmZzY2+7K368Dz0aH1Z+etZZuyLpME=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733283AbgJAWsF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Oct 2020 18:48:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:55100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726741AbgJAWsF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 1 Oct 2020 18:48:05 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6EB1220739;
        Thu,  1 Oct 2020 22:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601592484;
        bh=Nvkte901QOw+ByOlm8I9+Vi8S6WvVKEWOvVVAhYCQ9E=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=YHt9iIJRF2vcSkJRSAu+FU6dDgHWFxnlxKaJbHm+pZbfi6KwA1RSdYTk+MJA72LSu
         MOIIeQXuwhh+G3ZsFo4eFggq6442BBudeUoQ69pKNqfCPZUWHLnnCrflGfmkc1g/NE
         wV6e4EJU+YeWfFQbXIUqPOWi03luOjMJ+lTV/dP4=
Date:   Thu, 01 Oct 2020 23:47:05 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org
In-Reply-To: <20200929112938.47599-1-miaoqinglang@huawei.com>
References: <20200929112938.47599-1-miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] ASoC: tegra: tegra_wm8753: use
 devm_snd_soc_register_card()
Message-Id: <160159237544.44588.1813029211899275864.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 29 Sep 2020 19:29:38 +0800, Qinglang Miao wrote:
> Using devm_snd_soc_register_card() can make the code
> shorter and cleaner.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: tegra_wm8753: use devm_snd_soc_register_card()
      commit: 1b59b995774a086ea74e740b2dd38bba6d3d6664

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
