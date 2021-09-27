Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3709C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 17:48:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A554E60F92
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 17:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236013AbhI0RuL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Sep 2021 13:50:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:58980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238039AbhI0Rtf (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Sep 2021 13:49:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2B9B60F44;
        Mon, 27 Sep 2021 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632764877;
        bh=lo3kLlw5h5aHwdcYgQl4VN4lrcsP1+8zGxGcSHb/GQA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GXRWUQj/b3t2srHXAW4Ed6kMTId/0B+ful0yK8Xd8IwtBOW3BKWxERiqMs76VweLq
         1T/4JfH4U/6zpLj0/gIeDfIHJrSp6ZrQ+uLEXjohPQIDLDUb8+kcfOKpWeUl7H3xl2
         BnpWsGnur/yQCfrq4Xm/q17Cw4z2SQUkP0f4z0lF1nQcHgA8mavLJGauD3lIBbig2A
         UBGyI2yklOr1VqHbLsMvdA+vRHOROQHOm3eMcVMls7PJQxM5IBkw3kEf/LNuQJyT6R
         Y4fbfaWx7YNkQsJZ6in8JrEBwsiTmZ5D3RZUCXFUAVRGZ3Hsl9QxtTK/kZvkYWjbkt
         /+v5Vztz4Dukw==
From:   Mark Brown <broonie@kernel.org>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Sameer Pujar <spujar@nvidia.com>
Cc:     Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] ASoC: tegra: Constify static snd_soc_dai_ops structs
Date:   Mon, 27 Sep 2021 18:45:44 +0100
Message-Id: <163276442023.18200.4951268393685654520.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210922205438.34519-1-rikard.falkeborn@gmail.com>
References: <20210922205438.34519-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 22 Sep 2021 22:54:38 +0200, Rikard Falkeborn wrote:
> The only usage of these is to assign their address to the ops field in
> the snd_soc_dai_driver struct, which is a pointer to const. Make them
> const to allow the compiler to put them in read-only memory.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Constify static snd_soc_dai_ops structs
      commit: 313fab4820f3b1040bc1bd27cd4c7f69572951e8

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
