Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4006E16BE17;
	Sat, 24 Aug 2024 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724494415; cv=none; b=FPrm5db/Md/jkMP91gfEJvpjtx7namxvBLUHRhAsbwlnOcV3c70Rd/MPsfnkM7/TjB1MkXrlBjPGB+vta3MkAvd3Z/2Hjhn14aaL5sGrtmISh3hwS5ZyUye50oUXKSThFtKzSsjhKB4XzOhklmIz+xG8S9YzY8BZFGSfd5C5Ym8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724494415; c=relaxed/simple;
	bh=wbbTWTMOAUc/1HYInY9BhuXOIB1ltFFcuxx4S0QXILI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EJgODepYpbBJaKkqoQpqi4IxoQiwJIrDnaqBVUkoLMMexK+B/J9n8AJlPZfq67yrKya3TyZdRaXAJ3VV795VqZGeAp3Vfrcs0H0GDnBT6Xwl2JwGU9mqyFzQc7hr1mTrQwyJpgjzV90sUPu6fs/IIL71HUolheu95sKuFj53WY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgI0wbJ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgI0wbJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F8BC32781;
	Sat, 24 Aug 2024 10:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724494415;
	bh=wbbTWTMOAUc/1HYInY9BhuXOIB1ltFFcuxx4S0QXILI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BgI0wbJ4x8Fbw9Ham1dvuiSkMfbNMkf/gDhim9JSCAEbIAWNAZjXiIHxahDBiwQka
	 XvzJaqi2z52ZYgT3VPTmU0jK3uIcq96PI18NKtjKa97EjgRNkSfMprX3vljhVqTQI/
	 NKXcO4Oohr6nmiXWpFKZ90JtRagAa5XKhXE4fXDyuXwPeMIzNsc1txTji2fveA0lbe
	 z2ELLlkjoHFYq2lX2c6q79BKt4vNl+5RU39n0cDLin1U17zgg3YnRdX8gpMbjI6H+D
	 SoJGW0KQN5taAkWyAbP1b+mBx9L+pGMn8y2HuFsJEhb1r2PDOPi62fGTJRgFRL5u/U
	 4f7w3m9W5O9Uw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 thierry.reding@gmail.com, jonathanh@nvidia.com, mkumard@nvidia.com, 
 rituc@nvidia.com, jbrunet@baylibre.com, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, robelin@nvidia.com
In-Reply-To: <20240823144342.4123814-1-spujar@nvidia.com>
References: <20240823144342.4123814-1-spujar@nvidia.com>
Subject: Re: [PATCH 0/2] Fixes for Tegra audio
Message-Id: <172449441067.846858.2296683917418072165.b4-ty@kernel.org>
Date: Sat, 24 Aug 2024 11:13:30 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 23 Aug 2024 14:43:40 +0000, Sameer Pujar wrote:
> This is a small series which fixes two bugs which were discovered
> on NVIDIA Jetson AGX Orin platform.
> 
> The first patch in the series fixes a KASAN UAF bug discovered
> during suspend/resume testing. This is a core DAPM fix.
> 
> The second patch fixes CBB error and this is Tegra in AHUB driver.
> This error happens when Tegra audio drivers were built as part of
> kernel image.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dapm: Fix UAF for snd_soc_pcm_runtime object
      commit: b4a90b543d9f62d3ac34ec1ab97fc5334b048565
[2/2] ASoC: tegra: Fix CBB error during probe()
      commit: 6781b962d97bc52715a8db8cc17278cc3c23ebe8

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

