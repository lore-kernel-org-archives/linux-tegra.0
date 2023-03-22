Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63921C6FD1F
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Mar 2023 18:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjCVSro (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Mar 2023 14:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbjCVSrk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Mar 2023 14:47:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D05553732;
        Wed, 22 Mar 2023 11:47:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3D6D5B81D0A;
        Wed, 22 Mar 2023 18:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6634BC433D2;
        Wed, 22 Mar 2023 18:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679510851;
        bh=u8UI3anzvvAnUM7lDxG8OSsCeqbCrYbcKIou7gbQiO0=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=d5L8UlkwOmiMvW1Ci3xQaHqkhzMx8WEMMEy+gVMlth9c4VVAXoN8K5BPZMyEAAgQh
         hXWgDA52UnBQpAkAauWlPic8ML/U53LDT0qncnlYkGte5ZJfq8GeeGpUW8xYSM+voA
         wWmqvggAAI6sskpVHXYNNcX76aHXyXNQ9x4mCon0PD7W8aIS7B7oJ2sCPwolfGanGc
         hWj/LMLMHSV1pXLH6lF8oDihzfU6nJ4p3qJvtT3lwAmiazEbYbO+LeILg9tBzITwvg
         Il2d4oQodVziSwt22ZevbLfmb+0iOTw5DQGQRJDug/HpkFzrJw+ebC9z1TwT28Fmuf
         T1b8DpXCwF0xw==
From:   Mark Brown <broonie@kernel.org>
To:     lgirdwood@gmail.com,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     perex@perex.cz, tiwai@suse.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
In-Reply-To: <20230322014330.97079-1-jiapeng.chong@linux.alibaba.com>
References: <20230322014330.97079-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: tegra: remove unneeded semicolon
Message-Id: <167951084865.1092488.3890931311762738091.b4-ty@kernel.org>
Date:   Wed, 22 Mar 2023 18:47:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 22 Mar 2023 09:43:30 +0800, Jiapeng Chong wrote:
> ./sound/soc/tegra/tegra_asoc_machine.c:206:3-4: Unneeded semicolon.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: remove unneeded semicolon
      commit: 59385ed41c37b609c70a1ebb46003e4cc6685ec0

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

