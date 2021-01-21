Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B15CC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 01:00:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F13523602
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 01:00:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387532AbhAUA74 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 19:59:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:53928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387742AbhAUAIB (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 19:08:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96F5523731;
        Thu, 21 Jan 2021 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611187638;
        bh=q2ZTBy/GMJKRUdA87t2kPuxFQS8sPWRWpmZxf4B5WZw=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=g2+cM8NWD1hKgEPNQrvsuKvIAvkCC+K0aLHdyDPTSjm7q1b69lV904geZC9cnNIBK
         H8Hpm+KBO2GbwUbfwKvWBePgmlBYcSV3H9hyLFAfVC0OQ7AAaBCm/BYRJPsBT4SjmO
         VZUvFT4vHZ+06rT7DkgySHrWf6p257TkbnCw/g5xVOgfUqd1ygUWaaPxRBSfyAyUin
         IogOaPW8jcLTlo6sUhsi7rqykapkWUWqN/5ShkgzJeeowCdjSPFiEVU9sOjtFVXj61
         T6dnemTJJDqnJy2pt76eqigPi5Qdqiy9PRYz2lOWBEALC4I0ne8ts1NqyIuX7SI36w
         udU2Tr9OIaeOA==
From:   Mark Brown <broonie@kernel.org>
To:     robh+dt@kernel.org, Sameer Pujar <spujar@nvidia.com>,
        thierry.reding@gmail.com
Cc:     sharadg@nvidia.com, linux-tegra@vger.kernel.org,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        kuninori.morimoto.gx@renesas.com
In-Reply-To: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
Subject: Re: (subset) [RESEND PATCH v6 0/6] Tegra210 audio graph card
Message-Id: <161118753483.45718.690579581482519791.b4-ty@kernel.org>
Date:   Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 19 Jan 2021 14:58:10 +0530, Sameer Pujar wrote:
> This series adds audio graph based sound card support for Tegra210
> platforms like Jetson-TX1 an Jetson-Nano. The following preparatory
> audio graph enhancement series is already merged.
>  * https://patchwork.kernel.org/project/alsa-devel/list/?series=375629&state=*
> 
> Following are the summary of changes:
>  * Add graph/audio-graph based schemas or schema updates for Tegra210
>    component and machine drivers.
>  * Add Tegra audio graph machine driver.
>  * Add required DT support for Jetson-TX1/Nano.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: dt-bindings: tegra: Add graph bindings
      commit: 9e0f86fdcdab6a0e183ad4ec2410453985b4cf3c
[2/6] ASoC: dt-bindings: tegra: Add json-schema for Tegra audio graph card
      commit: a9f22c03a8ac5d21ce7a9b9307d9654c963a1f9c
[3/6] ASoC: tegra: Add audio graph based card driver
      commit: 202e2f7745437aa5b694de92cbd30bb43b23fbed

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
