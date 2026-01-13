Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5B038E111;
	Tue, 13 Jan 2026 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305299; cv=none; b=hsdyeNWQ+iFISf/ajK2njPUlM8ZTxl6oBjym6KREZ97my2YpuUjbA/2HTWumLyYLiEfywM0hG8fq/lvL4rkhoP5vWTn1BEMs21kt+8Z5vciFlhd6QftWS9xgJ4tWnxC56Z22705DFV1fY1JhMzsdIYEJcG+vHsFDddff6TWqyb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305299; c=relaxed/simple;
	bh=CFWJPDW4Bmsd+4rc280pWmc9e2+5HQsELdgsgDhcnzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RQH0gKlnUt5YF55hnXn2iIxHZKiSjvybhrzqCQyCIw8+VEeGG50lp6PKNPx94a4/c3jiFke4SZ2qa9f8TfMyvQyn7U4e2cth8aYYsbUfjcsHYvvf5rtKuUvNJAQfThrUKXMEpbsjexLXCZAjUcqEezQGLuSrhTOv8q0uDKz63iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bc3xLi3o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bc3xLi3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C239CC116C6;
	Tue, 13 Jan 2026 11:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768305298;
	bh=CFWJPDW4Bmsd+4rc280pWmc9e2+5HQsELdgsgDhcnzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bc3xLi3ovwng0SHgc7E0ZCS1HWJ0RbySeNhfOw3F0/a0fduw4Fouo+qQY2Odlsmh/
	 TiDASFBf6f6YkW24un8cJ0/rpU42KsouWjxdBENIcy427bM25vAFBqOZN7eeQJqYxc
	 7mtRKf+14p0GC/AVJjzCvGr3vXc0YvzzTa7qMTCRAYuCVI6siPhbam6Hm4wIOApIOb
	 fnZIn0mGd3maRxCB/JhgdyEXRW7kWsT4S2kBg1lZSOlaGEIRq7DfSYIYe+uAdPij6q
	 0FC58LboqDBqpe5SKcuWYEWjSCFz/a0l1YhmM95kq0934t2jBtUcVSkRhoh3RzAHXI
	 M1lryowLdncww==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, "Sheetal ." <sheetal@nvidia.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251217132524.2844499-1-sheetal@nvidia.com>
References: <20251217132524.2844499-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Revert fix for uninitialized flat cache
 warning in tegra210_ahub
Message-Id: <176830529652.30686.12970434427679074870.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 11:54:56 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 17 Dec 2025 18:55:24 +0530, Sheetal . wrote:
> Commit 4d4021b0bbd1 ("ASoC: tegra: Fix uninitialized flat cache warning
> in tegra210_ahub") attempted to fix the uninitialized flat cache warning
> that is observed for the Tegra210 AHUB driver. However, the change broke
> various audio tests because an -EBUSY error is returned when accessing
> registers from cache before they are read from hardware. Revert this
> change for now, until a proper fix is available.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Revert fix for uninitialized flat cache warning in tegra210_ahub
      commit: f34b32745e2c9f85ee33b42e7a8cdaa1ee1c16a3

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

