Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A796EC4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 14:23:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9058B60F5C
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 14:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239873AbhHQOXi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Aug 2021 10:23:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:51220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237912AbhHQOXe (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Aug 2021 10:23:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 223C160FDA;
        Tue, 17 Aug 2021 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629210180;
        bh=BghacR8oaU4UL7U6wQSFD1t7wDKOPESMTm6bkFZ1ZZE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vAbAFVUvZH/p5z1b6N/U8D5YVzQyTPrQ+UYTVz4FiYK555tiEmJn6WpL/qUlbCKRF
         VYCT1xRWJntGK9gsvEVaK/J1GGArhUBlskIU/1es7azdUXXMsTOp9a4ha2PIa6Wvsb
         /gK08/JG2MU9NJoqHGLTi5HMk76tNKjzMcOMOoRuXXcchNqk7j8wSTI2e/TCQSxlF5
         FA/O0vSzOOj4+cuqggkcBf9tJp4AGqx44x5mxCuuynHXLAVoSMp7v1zLXK5lEl98Fq
         jHgqGoWE/OVYOJatX3z13JdNwiameSv00d+ge8V4WjwAJGeV0UWNsEDhnV4JJQw1fB
         rzjCZjJK3zekQ==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Aakash Hemadri <aakashhemadri123@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 0/2] ASoC: tegra30: Fix use of of_device_get_match_data
Date:   Tue, 17 Aug 2021 15:22:33 +0100
Message-Id: <162920984134.3104.358684242050344444.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1629148177.git.aakashhemadri123@gmail.com>
References: <cover.1629148177.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 17 Aug 2021 02:44:50 +0530, Aakash Hemadri wrote:
> This patchset fixes my previous incorrect patches.
> 
> 356b94a32a75 ("ASoC: tegra30: i2s: Use of_device_get_match_data")
> 80165bb80433 ("ASoC: tegra30: ahub: Use of_device_get_match_data")
> 
> Aakash Hemadri (2):
>   ASoC: tegra30: ahub: Fix incorrect usage of of_device_get_match_data
>   ASoC: tegra30: i2s: Fix incorrect usage of of_device_get_match_data
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tegra30: ahub: Fix incorrect usage of of_device_get_match_data
      commit: ea2efedefbc34f782db396c3d90e80aa1fff57a5
[2/2] ASoC: tegra30: i2s: Fix incorrect usage of of_device_get_match_data
      commit: 240fdf3f42fc6505adecaf5a74fac75b3c702cf1

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
