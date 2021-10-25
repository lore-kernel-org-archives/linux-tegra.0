Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E70C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Oct 2021 16:40:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E398A60F22
	for <linux-tegra@archiver.kernel.org>; Mon, 25 Oct 2021 16:40:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234061AbhJYQmY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 25 Oct 2021 12:42:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:47294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234063AbhJYQmT (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Oct 2021 12:42:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A6DA60F92;
        Mon, 25 Oct 2021 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635179996;
        bh=fF5cSayVIa+Mq3//Y3/uSO0Zcvx9pJtBzmiNBJwGKIw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q/YlcQMjKKhERE3IWcGzFMLjvBy5e2e5bV8/oxn4AgdQDBog+RAL2W2mJkaqD9vhD
         0ATBospMg+U38SaEZi2miHhgMwogH046tmQ3PUxHzsDmPN7gItNeH+ACN92XGB3EA9
         krCbSoAxc9LhLkqDoRRGNf8hPY+94cDv3/sU+yoPetn97oBQYslUxv8yvy4H6/4iL7
         OhueefBfTiWftsKBrTJt7a5pu5M7uj1t65JjMgG+U9IoqxLfpbe3uOKRmANHWnTHjm
         xcHVPRH414b/8vbaY/MYDyiQB8DC/8v4a/ToG15UxKKIV2Ww3z1HuzuXNcLWEOoiLJ
         vdJ0vI1qiGxFw==
From:   Mark Brown <broonie@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 1/2] ASoC: tegra: Restore AC97 support
Date:   Mon, 25 Oct 2021 17:39:28 +0100
Message-Id: <163517996155.3558038.6605154852450538832.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211024192853.21957-1-digetx@gmail.com>
References: <20211024192853.21957-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 24 Oct 2021 22:28:52 +0300, Dmitry Osipenko wrote:
> The device-tree of AC97 codecs need to be parsed differently from I2S
> codecs, plus codec device may need to be created. This was missed by the
> patch that unified machine drivers into a single driver, fix it. It should
> restore audio on Toradex Colibri board.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tegra: Restore AC97 support
      commit: de8fc2b0a3f9930f3cbe801d40758bb1d80b0ad8
[2/2] ASoC: tegra: Set default card name for Trimslice
      commit: 824edd866a13db7dbb0d8e26d2142f10271b6460

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
