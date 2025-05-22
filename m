Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193332236E0;
	Thu, 22 May 2025 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747923751; cv=none; b=FFGgcto6pkq7ZSL7jcQ83hf/i3UaDJ/OTgCWqKw3ZyDpxdGdQcGDxQD/XII9Slx7nky9ZDcqACGE8tPT95RWTlrylh53CzFxd/WfjoOk+S72kiRlDKhaxgwn24cyzH+uO4L88IjW0n4bh/VRByQ/JFwlKJt/qbjdgubCCJrm93s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747923751; c=relaxed/simple;
	bh=af1wkIPmu0wtzjZfFWYUrFSXewdr+W6mEJt3TOe6tHs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=StsVcQqh47bgjKuNLHu4yO29RDkXY+anqDpTSWkkQjpaK2DN8o8Hz6jLhUUd4LJVb8ceXNllXNsgBfkagErC6KEG1CVz7aoDuBhu1eNeOHmSw9IzDnXxUg6ce+ayUmDGXXJ5i+OhSnrCCixhuwX4RMCdMEkgHW4uMZ7nQbCEIBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5HU/BUc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5HU/BUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9001C4CEF1;
	Thu, 22 May 2025 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747923750;
	bh=af1wkIPmu0wtzjZfFWYUrFSXewdr+W6mEJt3TOe6tHs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I5HU/BUcvyYVpmOva6SAY1sca7cFrpp+eSjSllYMu3wLer2EMbpLd48x6Sf4DJ8T0
	 KtJ3fomKsiqYGMneeVnY1dg7g70Y64u6xviUdQy1n9vt7zysOLAfhQFUiF/5jeRx32
	 5IrXhdBaot7EM6l6LuDZGALIrSSBO3HsUUCDa3IDs3tYRpgqpMDdz5nQ1tBpdnyLf4
	 dEEsjyVUMdmX5kYZGqwE4b7mu0uOGiiXvosHoI07VzobhZnrDx/9kspCeUP7uwVNDY
	 NwDdIch5sTRs7yB+hhebudJXpbDUHX3kC8xj7IxYFM/C8+Rq/zIF+IwGBjEPvjdMmQ
	 /2dMGd4jMNq8g==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 lgirdwood@gmail.com, "Sheetal ." <sheetal@nvidia.com>
Cc: perex@perex.cz, tiwai@suse.com, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
 spujar@nvidia.com, mkumard@nvidia.com
In-Reply-To: <20250512051747.1026770-1-sheetal@nvidia.com>
References: <20250512051747.1026770-1-sheetal@nvidia.com>
Subject: Re: [PATCH v3 00/11] Add Tegra264 support in AHUB drivers
Message-Id: <174792374755.97913.2208583690041067416.b4-ty@kernel.org>
Date: Thu, 22 May 2025 15:22:27 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 12 May 2025 05:17:36 +0000, Sheetal . wrote:
> The patch series includes the necessary changes to enable
> support for the Tegra264 platforms in AHUB drivers.
> 
> Changelog
> =========
> v2 -> v3:
> --------
>  - Patch 1/11: Update commit message and update binding doc with info
>    that the properties are not relevant for Tegra210.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] dt-bindings: ASoC: admaif: Add missing properties
        commit: 37240f703041439cd8a39abd670dbfc0e75b725c
[02/11] dt-bindings: ASoC: Document Tegra264 APE support
        commit: 628dafc476eb658544ad6b5b3592bfcd82597051
[03/11] ASoC: tegra: CIF: Add Tegra264 support
        commit: 35c0d1de8e669878797e40cc625f4bdc37c3e084
[04/11] ASoC: tegra: ADMAIF: Add Tegra264 support
        commit: 7668c6378b0577893bcf8c0f272b6ed099e0787d
[05/11] ASoC: tegra: ASRC: Update ARAM address
        commit: fa83757df3f40c05b5ab4154253e8aeefa31a9a6
[06/11] ASoC: tegra: Update PLL rate for Tegra264
        commit: 1fb500476f609008ee1c499540af32c4fa5a19de
[07/11] ASoC: tegra: I2S: Add Tegra264 support
        commit: b3354438d89867654b4a95a9630fd3393e275e33
[08/11] ASoC: tegra: AMX: Add Tegra264 support
        commit: fd509c6f8e4028539bf35d80e3bcdce7b3ba0f9f
[09/11] ASoC: tegra: ADX: Add Tegra264 support
        commit: 7dc8299fbb1c8e6373e8e55d562b7674ee37b2b0
[10/11] ASoC: tegra: AHUB: Add Tegra264 support
        commit: 4152d33ab162d5378f57cd757e1de5cb4867dfb4
[11/11] ASoC: tegra: Tegra264 support in isomgr_bw
        commit: 7d852b34be4df61ae4327b47c39701d0f7ffcc70

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

