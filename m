Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FEA2517AF;
	Tue, 10 Mar 2026 01:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773106863; cv=none; b=MBCZXbKsT1mhC48zFDOhW6CDBUaf2nG0cl5zCDak82ACzSSwb5wJQnBuErI912CLlf10sSCBGOTnpcfZq3r2zHRVdLWnsMizo9u4uIW9hG4nbKrznAbzftVc7Ft+c9hGiwj6QZVpLogwYTiwooS5fspTzoT9YIDostbUU1n5qbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773106863; c=relaxed/simple;
	bh=zlwc+tx+AWlMJs8E8p03tjRU0ejrx8Ov89tKfIG0qZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JTPVovVSA/OqLptv3EBZa0X/p3G3wOwWA+r4FRHJs/X2eTsTra2K4anonsVP1jTg8i0uC8LQIBetiUioItdIEYEhPuiQNPV64xpuOqmu7Y//hd1Kwkn1SMamUFaTqr5dSnhxQNyLLxRBOAEuoAHfoGS/wSqOt/rMyb/IJI3JbJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NShoTRTT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NShoTRTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3FCC19423;
	Tue, 10 Mar 2026 01:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773106863;
	bh=zlwc+tx+AWlMJs8E8p03tjRU0ejrx8Ov89tKfIG0qZg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NShoTRTTYdFz4XcTTOPg4W+2WqjzlnRq/9byBzF5nvXpVzyjii+wUt+LOJ28ur6wz
	 v7PzGQtPKnavB09pw5FcVBuHOi6gEZUqbeH+aBD1CdbGElFnMU/KvdnzaHCMKMIchX
	 id7c6lhJEquKL9A13DdhwcxOmXPIfcTHIZuE4R7GnF7Msh2gjEHMu7TMgv6XhY/TmG
	 iB9cqxq5xHgzv5KWZ83WnINd1cj/vNB3IFCqJiJTMFMOsoW88D4snGsKcwgDcY9HSg
	 JtwhFboMNBCVwDg8gakU4gLBkODw5WppV0XbKo3M6rl2q6JJjbqneDw72fZr3GxUCj
	 xqrHopPjHiN0Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 "Sheetal ." <sheetal@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sameer Pujar <spujar@nvidia.com>, Mohan kumar <mkumard@nvidia.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260303100249.3214529-1-sheetal@nvidia.com>
References: <20260303100249.3214529-1-sheetal@nvidia.com>
Subject: Re: [PATCH v2 0/2] ASoC: tegra: Add Tegra238 sound card support
Message-Id: <177310686018.362709.882997583976128066.b4-ty@kernel.org>
Date: Tue, 10 Mar 2026 01:41:00 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-83dbb

On Tue, 03 Mar 2026 15:32:47 +0530, Sheetal . wrote:
> Add Tegra238 sound card support in the Tegra audio graph card driver,
> as Tegra238 requires different PLLA and PLLA_OUT0 clock rates compared
> to other Tegra platforms.
> 
> Changes in v2:
> - Drop SPDX-FileCopyrightText year update from patch 2/2
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: tegra: Add compatible for Tegra238 sound card
      (no commit info)
[2/2] ASoC: tegra: Add support for Tegra238 soundcard
      commit: 1bc17c67194716f53037685b7059a22cc1a911b2

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

