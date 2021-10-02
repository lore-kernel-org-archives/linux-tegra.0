Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE0CC433EF
	for <linux-tegra@archiver.kernel.org>; Sat,  2 Oct 2021 00:17:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D1BE61AFA
	for <linux-tegra@archiver.kernel.org>; Sat,  2 Oct 2021 00:17:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbhJBASq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Oct 2021 20:18:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:56330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232462AbhJBASn (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 1 Oct 2021 20:18:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 722AF610EA;
        Sat,  2 Oct 2021 00:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633133818;
        bh=N5hEszx5y0b/1BTKlULPRntIWovz5UNiVzuxIKHXINs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=X4z4SNnwQs+hqF45oz3NrOfh2gixpvNc392kv3QAsWb1RUoMlrGwCaP/vBhysbFsq
         rS7KiS2dJXqi1OigNefP7im8Ts4eItOW7CzFrX8EEVS2hNU5X/0WsPEaQIuEUrZebM
         QjM7P7YCpdeCIxcssErbLZZn/a8J7FeYEUf2ZTHonJFYWRGiSVmRXjvfGEnxMEPx1e
         EIpRCSc9kduI7ZrLqBXSQUXyIOZB7LB/u56bhXAk4/jB8McUuovpjIitJU2/V+bNe9
         KVbzqr9DdeZOgaroNWzohecn3aDpMsZPYdOCfJCCngu/omo6+WInUj5SpFE8DqSTD9
         E41lXxoRVn1iw==
From:   Mark Brown <broonie@kernel.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
        alsa-devel@alsa-project.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: tegra: Constify static snd_soc_ops
Date:   Sat,  2 Oct 2021 01:16:29 +0100
Message-Id: <163313339131.45396.6427425261003311553.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001114517.6752-1-rikard.falkeborn@gmail.com>
References: <20211001114517.6752-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 1 Oct 2021 13:45:17 +0200, Rikard Falkeborn wrote:
> The struct tegra_machine_snd_ops is only assigned to the ops field in the
> snd_soc_dai_link struct which is a pointer to const struct snd_soc_ops.
> Make it const to allow the compiler to put it in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Constify static snd_soc_ops
      commit: 620868b2a0bd56ae814bdde2598d7d7b20538e6d

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
