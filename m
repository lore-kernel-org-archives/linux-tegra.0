Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB30E2F4A1E;
	Mon, 15 Dec 2025 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807119; cv=none; b=MRa5aIo28a0jhe0mpooHSaSvfmyxBXCYAvPGrGqcgKYYHRTn1xgKr7+1630YWmgV5TXWCxL/wKMKnQrxcblBtjE2mDDOUCJjYzMasjM/duux6xm4zip4c1BpAW1nZfkhe7vc1OfToCA0Z25HbwlMAa16Utd2Srza0HTqGl9eGSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807119; c=relaxed/simple;
	bh=Vk8sRS8+QZJdcXzr67W1agraTzLrzvrzBYhCTK9yLkk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LhIJHGHsdns7u2k3gtely32lihzftWt2UsbwF9s7BSop1m11QIOFECJZMsiwknLYc4PKBmij/QosiNKo6zd16KpQERX3D5RuZvGVc2DHjTqjFq4fxBmkxHOPwWIEy55m84ygEo21ZphJjHH2uAf2EXzioNugOxjeP9Oe4RDRPSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmRtx8N2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmRtx8N2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C80C4CEF5;
	Mon, 15 Dec 2025 13:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807119;
	bh=Vk8sRS8+QZJdcXzr67W1agraTzLrzvrzBYhCTK9yLkk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JmRtx8N2MnrY38hGONjoZcTNNgXkQhqkiozzu6XKqkecxYCP3mtt1uHlrmOuE3/z/
	 T/YHDdVd46qHgWe0jshp9W5zPz1UxRde9qWEDVFL99eGtgdfjxiUFcpmRFjV4Xi2Ht
	 EXJZ4xR2PBugZbO65Mj8VhWs0gPros3zPQEhRX/xQCbtio3Wfw3v4yZ4/oDDv5Ge3h
	 4sOhFIjuasOcRw1HWxiy6eQVzGC/JqPYuPEzj5rRCZ6tany8sGEYG3VZar8ynjFrWa
	 Kes7me2Fc9Ys1MLZw/cglk1NtyGBT3z2ZupB1Fa7yZdYWlOFFSrAsZByyTCa/Q38ci
	 j/PRW9d+8NFHw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, "Sheetal ." <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sander Vanheule <sander@svanheule.net>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251208052040.4025612-1-sheetal@nvidia.com>
References: <20251208052040.4025612-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Fix uninitialized flat cache warning in
 tegra210_ahub
Message-Id: <176580711685.161056.2870238132964388874.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:36 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 08 Dec 2025 10:50:40 +0530, Sheetal . wrote:
> The tegra210_ahub driver started triggering a warning after commit
> e062bdfdd6ad ("regmap: warn users about uninitialized flat cache"),
> which flags drivers using REGCACHE_FLAT without register defaults.
> Since the driver omits default definitions because its registers are
> zero initialized, the following warning is shown:
> 
>   WARNING KERN tegra210-ahub 2900800.ahub: using zero-initialized flat cache, this may cause unexpected behavior
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix uninitialized flat cache warning in tegra210_ahub
      commit: 4d4021b0bbd1fad7c72b9155863f5b3ccb43ae91

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

