Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC36CC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 22:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243748AbhLMWmh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 17:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243752AbhLMWmd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 17:42:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573A2C061574;
        Mon, 13 Dec 2021 14:42:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 22AD0B816C8;
        Mon, 13 Dec 2021 22:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B517C34600;
        Mon, 13 Dec 2021 22:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639435351;
        bh=eGOn9R4/r9WTJ3fguC8+nzmsSiBmWCn5D/O1wRbjkec=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=ELty3FkCr60mWZyKXZzkFM074a0u2GLBDsaPaxay6zH+YMAKnjCRtZ7TfvOPeFBix
         GTTwtDLrwmtWj5DA/WcThDztMsAbraIw48yxtYolzZlBATX5xVE7nVM1JtDUcylzn+
         TwALQqlGFHlOsCCgec/TuGvocfwi57W9xkxz1V2k1FPRBAyVxQs9sKBTP2LiFj0HLC
         RB7GllpXVT6SFwB+O1RjZSMKarlIhALb3rdLJCLtD8o5OEPmBRgXNZ4QoHYtat039O
         hx6RE7MFR22eHQTKe0dkE9r0ABOBJ3zvbqPH4GcKGwRC/+kHaBM3XJa3c2GoivDxLJ
         0HYqR8oSQzriA==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211206154624.229018-1-thierry.reding@gmail.com>
References: <20211206154624.229018-1-thierry.reding@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: tegra: Document interconnects property
Message-Id: <163943534909.1016050.10549071402255477167.b4-ty@kernel.org>
Date:   Mon, 13 Dec 2021 22:42:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 6 Dec 2021 16:46:24 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the interconnects and interconnect-names properties to the bindings
> for the sound card on various NVIDIA Tegra based boards. These are used
> to describe the device's memory paths to and from memory.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: tegra: Document interconnects property
      commit: 5f9155a7d2dc067d72a95b42168f944c7710c0d5

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
