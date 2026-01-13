Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB0B3939DC;
	Tue, 13 Jan 2026 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326700; cv=none; b=imPhrijd4B9080ZdvHL2RHtyW7HEmEupG3ACwj/b5e0bIuWXGYoY+D4vfxX9up9sNkzwQufIC0W7UBTgZhg/lUPvf4JUh1pOPNSWGzUZ9tMR1c8kHCB4g+AMYdpXHJJw9otEfn/gcUFbZiOps0+0lHZyWnKxtGvLAhe1K3st1KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326700; c=relaxed/simple;
	bh=10zQeU5WM4clM49eCDfr1OSK1mAYISug4JW8t9JKyd8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AlTO1WKkAeNtFevnBcNmT3ztBfmjR9LP5m5lUUe/39CcEArQwNk66uHudLG9EkXdEgo5UTnmSfve9m/xl0Gv43yPWodj+xPrScUSVOadJVpW3+r5s5htieBKfrCOOQ6Q01maeMOTsJPdNovrmZwhGrnbWb0sIbrkHeFkXGStTj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I49ASSMs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I49ASSMs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4A3C19422;
	Tue, 13 Jan 2026 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768326700;
	bh=10zQeU5WM4clM49eCDfr1OSK1mAYISug4JW8t9JKyd8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I49ASSMs+bWY/Ei99TBbNiUbgFC8SwdLEVr66m3ZPJDxjmKMvxhxfWaDACrdWKuzB
	 myzhAWHeUgwtxsr2+hXvI7K63mqREdybpE1XXLz59Q/7T9EEgrymfpS8rscT16aqp4
	 f36yUevmWQHZCNq36BrGrae36W8D72vpAd2kM/Z8dHyQ8BT/XrQ7Yr8sUhCt18+bUJ
	 M4Cm6UtovhF/5z+iygkQ86SIoh1Bb23d82apxStVhcuX8TmFnPisdCf9pxWJDVjbhG
	 U827SKnFRIBWJDK8Frj+S8hCXs0ac1agJQQk1/7ERRcayqijYl/mmWwaah2chVc2+V
	 ATqKzU97n/3pQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20260108143158.351223-1-jonathanh@nvidia.com>
References: <20260108143158.351223-1-jonathanh@nvidia.com>
Subject: Re: [PATCH 0/3] ASoC: dt-bindings: realtek,rt5640: Various fixes
Message-Id: <176832669841.1106728.13139168898095349975.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 17:51:38 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 08 Jan 2026 14:31:55 +0000, Jon Hunter wrote:
> This series includes fixes for the realtek,rt5640 dt-binding to address
> a few warnings that are observed when running the CHECK_DTBS=y for some
> DTBs that use this codec.
> 
> Jon Hunter (3):
>   ASoC: dt-bindings: realtek,rt5640: Document mclk
>   ASoC: dt-bindings: realtek,rt5640: Update jack-detect
>   ASoC: dt-bindings: realtek,rt5640: Document port node
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: realtek,rt5640: Document mclk
      commit: 66b47b9c069fa548db64bde6a32d3b33aa05f740
[2/3] ASoC: dt-bindings: realtek,rt5640: Update jack-detect
      commit: 25b858474497b5f7e2198f6fc9381488d9bdb55d
[3/3] ASoC: dt-bindings: realtek,rt5640: Document port node
      commit: b540b4e157c4b24d0501e5e50ffba598d066de42

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

