Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1A822F162;
	Wed,  5 Feb 2025 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759473; cv=none; b=rBe0q3wQ75vZ5JDjEHD+ju7ZV20ABUbEjTaR9q3T2af+OWgpvXDM1XGY2uTBGcAwBHItqSdq0aRzru+YT1Kzhu9hHeyNmTk8MVYTWJv9WTzgsfHCL0+Zt9/6f9JKxdpyF+wWFIfWqdGlVpO6nvZ952sU7phnPOZKSbBsv90E1yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759473; c=relaxed/simple;
	bh=e4x9ZDUe/siPo6t7idtJPPnEwGukGRQRmtPbHmtoEE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oV1Q92fhZZXAk4cS6ZbbRNx8knMneohOu3x2KCm1icjSMdmGKP7kQTEM0yWP4jcbmWHj7ENHYVqnHCRfcDgCW7PSo8gWcRe23CWy3VUEpa7yidUn9xdUNHBvDEc63hpXRnuPY70MCkZnY7Ncnw9BUGueCX47CdQhozOp0AaO+3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QStcy2mE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QStcy2mE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D95C4CEE8;
	Wed,  5 Feb 2025 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738759473;
	bh=e4x9ZDUe/siPo6t7idtJPPnEwGukGRQRmtPbHmtoEE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QStcy2mEtP1MyZuYt25CFdgRIaJWB62QkyfPEQZlm5lI+lOgUoKHL9RGWLGDL/0ew
	 smN7jRZyYpGCgd6EEUTKarHwejCCPHuhiCOQzUFLV/3SIwL1GaHydopG8k3ewzo6e0
	 Og3oOX78DlgfONat75b0j+eGng6Ngr68ZX8rW9CT3d9RtIcJeoWx5+dDynzxETZiR3
	 SabhaBfxaIVx88dei0eqfmDVx5NVplPj+q862K+ZXdMj80PsdsD2KSf/QljEfZnc1V
	 JkeDO8gB8w8trlg0NCnGZLkmhz61Bsxi0WstSv/JyAXdS/6qj5LQ96TjIkbfmXLQZR
	 UtWwShj4Yn0uw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, "Sheetal ." <sheetal@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com, 
 spujar@nvidia.com
In-Reply-To: <20250203105304.4155542-1-sheetal@nvidia.com>
References: <20250203105304.4155542-1-sheetal@nvidia.com>
Subject: Re: [PATCH V2] ASoC: tegra: Add interconnect support
Message-Id: <173875947150.32457.3575258063637479820.b4-ty@kernel.org>
Date: Wed, 05 Feb 2025 12:44:31 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 03 Feb 2025 10:53:04 +0000, Sheetal . wrote:
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

