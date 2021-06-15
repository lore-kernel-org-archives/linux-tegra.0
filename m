Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8440C48BDF
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 12:06:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C652B61461
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 12:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhFOMI4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 08:08:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230179AbhFOMIz (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 08:08:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6AE66140C;
        Tue, 15 Jun 2021 12:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623758811;
        bh=/daMUTS8B/5YNsD/HuXDLshXDtUc1JGW3xyBGeJw/yM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hkVDK9KWawPhP92D2ldhtMc+k8ajdcN9uO0ANsOwNPl9XCIVuM4zjCqpMCAq7udOb
         Uo9H5kL16cqzDCAnmHjb9p0H8vzYsizFRmjuT68SX0688y5IU3Q5OYXBWZAfKhxhMj
         DPFk5zozzj2Aai8BLWobghkX0HPN8uvUkJ8ctHlS0h7Lh5Q6YurnTZ7/WxID8u32mX
         /HH8P0Fpkg5qB76uJd590AVzepWFmabjJmDJ9ryN29WEsxTSpGXVB4zzQHvvdSHTL6
         PNsS2wkVlvLUP9Y9mPw8DSa0vtc4wC8x3ri5ff/LIzu41z1vz0WdLrblD1yG+YId/p
         COE1EBQEcqqcg==
From:   Mark Brown <broonie@kernel.org>
To:     Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ion Agorria <ion@agorria.com>, Takashi Iwai <tiwai@suse.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v6 0/4] Unify NVIDIA Tegra ASoC machine drivers
Date:   Tue, 15 Jun 2021 13:06:26 +0100
Message-Id: <162375817572.30661.13025882740801686844.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210529154649.25936-1-digetx@gmail.com>
References: <20210529154649.25936-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 29 May 2021 18:46:45 +0300, Dmitry Osipenko wrote:
> This series squashes all the ASoC machine drivers into a single one,
> this change was suggested by Jon Hunter. It also sets driver_name and
> components string of each card, allowing userspace alsa-lib to find
> UCMs at predictable path.
> 
> Changelog:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: tegra: Set driver_name=tegra for all machine drivers
      commit: f6eb84fa596abf28959fc7e0b626f925eb1196c7
[2/4] ASoC: tegra: Unify ASoC machine drivers
      commit: cc8f70f5603986a99e7775f3cc4a10d337b82a4d
[3/4] ASoC: tegra: Specify components string for each card
      commit: c16aab8ddc645f129880a266c1626b07b41f7c55
[4/4] ASoC: tegra: Squash utils into common machine driver
      commit: 8c1b3b159300cc5ef6ba0d4b039ef68e766d46e3

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
