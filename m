Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EF5C4743C
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Jun 2021 16:09:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 813A06102A
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Jun 2021 16:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhFWQMK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Jun 2021 12:12:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:51018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229933AbhFWQMF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Jun 2021 12:12:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D47F26102A;
        Wed, 23 Jun 2021 16:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624464587;
        bh=jsOJ4tViYkaDX1h4CbGlivmMmyPzx1/JuUZmlGIyyZM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b374ARq/X2aHJ6HY7X6iSCTeVVqfe5TeNpF+lEEN4T3YFAeGiHHBVJ0bKT1Fmvp/v
         k6SbB+VwtRym4euz3YYCbvuaP8eMG0SctDh+OYyLv8k1OBzhKUi9bGH0PpmOwYOu83
         +zJVtWRNsWX933HbkKw1Sw70OLcQtTL/693M9AmSnN+YdaXmTdCtt86k0IfPC2YZ3q
         QxWMlLqjYExZMXO845a/jWapyLPQcWuTbJFJoT6N5Ce/LHNhKiRInjh6j2W2KOWyyr
         /isdVS2CjsrAFI92cM56GtS0tl0oHHp0DFAFTWL0QIWl/Go3HbPVtMtZHXT5ncOemE
         gtNCktRaRGEcQ==
From:   Mark Brown <broonie@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Subject: Re: [PATCH -next 0/4] ASoC: tegra: Use devm_platform_get_and_ioremap_resource()
Date:   Wed, 23 Jun 2021 17:08:58 +0100
Message-Id: <162446397757.55213.13647791401168219427.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210618024722.2618842-1-yangyingliang@huawei.com>
References: <20210618024722.2618842-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 18 Jun 2021 10:47:18 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.
> 
> Yang Yingliang (4):
>   ASoC: tegra20: i2s: Use devm_platform_get_and_ioremap_resource()
>   ASoC: tegra20: spdif: Use devm_platform_get_and_ioremap_resource()
>   ASoC: tegra: tegra210_admaif: Use
>     devm_platform_get_and_ioremap_resource()
>   ASoC: tegra30: ahub: Use devm_platform_get_and_ioremap_resource()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: tegra20: i2s: Use devm_platform_get_and_ioremap_resource()
      commit: 8ad9e5baa90f76c5125b23419fc458e206371bce
[2/4] ASoC: tegra20: spdif: Use devm_platform_get_and_ioremap_resource()
      commit: 8d81f0da47bbea7f4eb6cdae5210c8c3bd8ce50f
[3/4] ASoC: tegra: tegra210_admaif: Use devm_platform_get_and_ioremap_resource()
      commit: c29b6382d23c8bea604033f98604b7b1e543b1e7
[4/4] ASoC: tegra30: ahub: Use devm_platform_get_and_ioremap_resource()
      commit: fc8344e63e595fa1f2e783aaae0253570cd8eea8

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
