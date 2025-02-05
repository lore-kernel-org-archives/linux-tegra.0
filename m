Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C5222D4D5;
	Wed,  5 Feb 2025 12:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759463; cv=none; b=JANX49vaB3U2vZpfxNVYi3QTvQJRMxXpfPHFm8Z9VVFvTPggF9jIWINO92EZLe4poUcOu0knBnl6c5D26rUTsrCoW11iwT9jjKrJLrQovoLT694XYkFE+Lj2TVW8kx6kOxR9Hrt+ntO3D0K+ekvRuvb2alUuu+lIEdc7BzoDf60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759463; c=relaxed/simple;
	bh=ykF7Gf+vTxj6q7kByCS0b9VG8rwjXiLsDJrPiDjtRbU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AE+fjMUDh+xFr/w3AkO2fQx2PlY0+uylEGwkB10Nfn2gLSJbUuccCebBPfzlcTLnmv+JIi3KyKbHL4F4jCFcSsmnYTJekSJKgS2G1fhVeeiPoX/qahud/RFm8ShGPXv46PwgpWq9IoBPYbKn5bUF1XH3ZRSCz5ecGq4PtixYz1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMplDV/k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMplDV/k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41EBC4CEE4;
	Wed,  5 Feb 2025 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759463;
	bh=ykF7Gf+vTxj6q7kByCS0b9VG8rwjXiLsDJrPiDjtRbU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VMplDV/kZKPDWEz3wRzzrBz2FmLo4Mkwnk1x9n14GZhifDcsduZfyb4B6e2WqwiSP
	 bfnvXnTnMLIvqKm6ZSNnnH2INQoAQSxjd9iADS6Yxj6GbclPxjkAwvhptk9oqhCImo
	 OpyHw9FuRJoRKFZ8W0HXxmJBhn1TMbVXGn53dPN+mXAhUFu2/4/ptu7oOExL5Ppcyb
	 /dG/53SnpUdlRFiNZ27WFtYzaSerB3ox6Pspv+BmM8RZTkDlVP0bRbFYporOAybsKQ
	 Ytdlr3UJxYC3LcqdYl72SZ9IZTYs6wSRJexgB3i8rLvs4Atj90jcT1dIgChqmCcbaA
	 +pJVPXwoAegiw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, "Sheetal ." <sheetal@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 lgirdwood@gmail.com, jonathanh@nvidia.com, thierry.reding@gmail.com, 
 mkumard@nvidia.com, spujar@nvidia.com
In-Reply-To: <20250121110928.1799377-1-sheetal@nvidia.com>
References: <20250121110928.1799377-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Add interconnect support
Message-Id: <173875946142.32457.3346189191163709126.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:21 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 21 Jan 2025 11:09:28 +0000, Sheetal . wrote:
> Add interconnect framework support to set required audio bandwidth
> based on PCM device usage. The maximum bandwidth is determined by
> the number of APE PCM devices and maximum audio format supported.
> 
> If interconnect property is not defined or INTERCONNECT config
> is not enabled then the audio usecase will still function.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Add interconnect support
      commit: 4a91fe4c0d683c56044579fb263c660f5d18efac

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

