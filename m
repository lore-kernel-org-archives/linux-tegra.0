Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393FEC433ED
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Apr 2021 16:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A067613BA
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Apr 2021 16:02:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236696AbhDPQC6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Apr 2021 12:02:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:35364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239335AbhDPQC4 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Apr 2021 12:02:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E14BF613B0;
        Fri, 16 Apr 2021 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618588951;
        bh=GgzZ0S+TgsvHcoC+LS+Zot6MiDm3+O3n6aq2TyBHn60=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d9PZNU2LNTwlRHAPEkF0S6monO2uDS2mcc4it4hoHaGu/Y7/eonEDt5FaE96zznmH
         GQePLHkm0HLyr988BjTpM60SM5Hv4yOfhXEa1+CvH9iqvZLsvaDcT+rxmemVSQYZ/X
         8kDWY3oGojvgiKqiFDFEXH52tqLszM/9FZ47EnR1aW92eD+ASL6Vp3BHsj6wXSEBTv
         25SoaKJ2Bm14ZXnkcxwOBT/j5YLyC/fTT4Q/IFHP1Qt5GwrloWJwAnPYnKHNjPMt5F
         /DF/cfpxetQVk9TwvQLW9ZaCe20XeZ+l6GmzAEFr4yudiZBNYK7y6xOa3Uh74niDEm
         dl1iwCcXj6isQ==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: Propagate errors on too many links
Date:   Fri, 16 Apr 2021 17:01:48 +0100
Message-Id: <161858869853.28833.11333855316963570344.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416071147.2149109-1-thierry.reding@gmail.com>
References: <20210416071147.2149109-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 16 Apr 2021 09:11:46 +0200, Thierry Reding wrote:
> The DAI counting code doesn't propagate errors when the number of
> maximum links is exceeded, which causes subsequent initialization code
> to continue to run and that eventually leads to memory corruption with
> the code trying to access memory that is out of bounds.
> 
> Fix this by propgating errors when the maximum number of links is
> reached, which ensures that the driver fails to load and prevents the
> memory corruption.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: simple-card-utils: Propagate errors on too many links
      commit: 0f687d826736a5b4eee03170382fe54d413b912a
[2/2] ASoC: simple-card-utils: Increase maximum number of links to 128
      commit: 343e55e71877415a23372388b3e0c59a9bba42f6

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
