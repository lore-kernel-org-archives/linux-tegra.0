Return-Path: <SRS0=iIVP=EJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D00C2D0A3
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 18:14:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12DCD22243
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 18:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604427296;
	bh=5UltucK6s2A1DMaA85HSo+6/+RGCiSN47Y1rerLA9wQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-ID:From;
	b=EH7SpidQ61vqmnWTA2LV930S2axe3Cpd+Iu4yrkJiWx/pvzmicCH6F0qASOtTHaRz
	 3MdWZE56bOTwI6iVJygnThmo1CdAk0zYJGxlfgVztXQI5/XhE+kaUpFYDmLlsr2wfA
	 VxYm/wuuzOX+dxrnCaIxPX3tV0KHAvJz32pIQCbQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729217AbgKCSOz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:14:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:38038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729198AbgKCSOz (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 3 Nov 2020 13:14:55 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B114207BB;
        Tue,  3 Nov 2020 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604427295;
        bh=5UltucK6s2A1DMaA85HSo+6/+RGCiSN47Y1rerLA9wQ=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=QmFbZigE6zpz66C8ex8lIelJQhfdgOP38AZUWug+EFvW5K7tioEDKs7Z9aMNs9QD+
         hyPOj75RdUH6f+byu0qv704PemX1jqDZqa9xYv8IMUJgQolgFf62i2fFsoQvCxulOj
         b72m0x0McSZ7Sbjm65m19X6vzPc/aXRjvtnpnWZo=
Date:   Tue, 03 Nov 2020 18:14:45 +0000
From:   Mark Brown <broonie@kernel.org>
To:     spujar@nvidia.com, jonathanh@nvidia.com, perex@perex.cz,
        "trix@redhat.com" <trix@redhat.com>, thierry.reding@gmail.com,
        lgirdwood@gmail.com, tiwai@suse.com
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org
In-Reply-To: <20201101172412.2306144-1-trix@redhat.com>
References: <20201101172412.2306144-1-trix@redhat.com>
Subject: Re: [PATCH] ASoC: tegra: remove unneeded semicolon
Message-Id: <160442726962.14840.14493047027283567209.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 1 Nov 2020 09:24:12 -0800, trix@redhat.com wrote:
> A semicolon is not needed after a switch statement.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: remove unneeded semicolon
      commit: 0246c6cb246f36ffcac0b843da179ab6510e139b

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
