Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9382E311975;
	Wed, 26 Nov 2025 17:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178866; cv=none; b=eEuuEGVGIZsu1qGiThwP6Jc0o5JkBvCH0R+4uV0wspezXGMlmeP52+u4Ewyb2FTRAdFOkhh+NX5FjtYE/Gz9RJZ9ZHQZb0piLeQ91HFrz3mn2jXGbOPxH/Wx1MiSy7JKTMUyBb+bb9DX+9Oqt7bMp4NGQk52BHvR0ucRkzPB7jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178866; c=relaxed/simple;
	bh=ll+ORNjbZjiC02X0B3VJnVOYAFk1cQ0LXy03CCjnaiA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bWAVY1bLfm+P1gGzsY39FW9h60sFS8QsAhdqpOViLY0MgX5eJmyNnV96slorN1jYpEXJ3s2aFxzRtaq+hYYpZQhbenGrOSTKXJH01J0WvbFkcYPteQ6ycOfrdKpcOKSLNc6CnfJFmOfTa1bPXWAclWlPxAjAMkPLvT1lglAZptM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAm+E/q0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAm+E/q0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21232C113D0;
	Wed, 26 Nov 2025 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764178866;
	bh=ll+ORNjbZjiC02X0B3VJnVOYAFk1cQ0LXy03CCjnaiA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cAm+E/q0GaA2z8RawcwgMd5B24QdxbmhMuP5r8ysSefhW2KjoDatEIMBH1a/au22Z
	 4wp/kP1HFjG/BmHXfYj7y5XgmkQkqApPH23aXdrkFMJ1AK4Nmq/rBx78wUjsm5xP9o
	 Tt/y+lxaD8EdhtcBel66vJMnGJXFTe2swp5frvZxr2/iUrwJXlgflTENMyFhC/iWe7
	 Xkvl7i7M7FEWTAT0J9sgBvgyiM2j5aGLUHfvSisOC2BWjtkt9PAXLqUXLVvh19Mdqr
	 xm9qET6bm8EgJPkCcJ8KcZ6087e+att4VXRvg/Wn0BQgFtXKPlot0TopPziyorrwDT
	 wP6aI+f4WazTw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Sameer Pujar <spujar@nvidia.com>, linux-sound@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Lavra <flavra@baylibre.com>
In-Reply-To: <20251126112926.4126757-1-flavra@baylibre.com>
References: <20251126112926.4126757-1-flavra@baylibre.com>
Subject: Re: [PATCH] sound: soc: tegra: remove Kconfig dependency on
 TEGRA20_APB_DMA
Message-Id: <176417886387.96001.35728681085818486.b4-ty@kernel.org>
Date: Wed, 26 Nov 2025 17:41:03 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 26 Nov 2025 12:29:26 +0100, Francesco Lavra wrote:
> The ALSA SoC driver for Tegra runs also on SoCs without the Tegra20 APB DMA
> controller (e.g. Tegra234).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound: soc: tegra: remove Kconfig dependency on TEGRA20_APB_DMA
      commit: bcf016aa87fb448cea24fa25e02ccebce06b5a56

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

