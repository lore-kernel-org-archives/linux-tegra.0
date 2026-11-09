Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310689;
	b=zF2fWyJ54qmzskFPXaRkCj6f6DlwngrgvLhZ8nF3jvc9OAERz2guppmyOSVpc0RFThUU
	 e/cMvoiRXAJQXxc+Ax1Cr35CQfmW/tuBbmZHp3tY8dsGxo0jn29vqFN7zFXpe7g60kCch
	 ONk45KjaDbgBpeHAVvzmQhpPWVScygYfwHSe85qO0H2iD4T8hvz4HfkHNHLCdqTxH8DOE
	 6CEvvPVJVr+5I0q3FIMnNlNRn9cUC8eZRd9E5mMuXLZt/QXPinlZB9WB+tRDho38jkusw
	 Znen+uuhFcmUcWWEYVZ557rxZpj2fKERTTJYnbrT5Aus2j7nc9K7R06D805OwX24vSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310689;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=iorjE9z8QyUMJ1RAj7sx526U6HMd38S2kCHhClS7b6g=;
	b=N9YcCfCepbSs2DvvOPc0iEIsy/aZfupHvLM2+7ILALHd6oHP0gayOrOidFebfc4aTc3b
	 ewSoPZHfbfgLW66TxrqmTJA6y82dYsQODxni8w2whk3wKYzEoE2GweyCOO1+GrzVc2XcD
	 c/gHab20Zsej9MBS6ZnxQ72nXW/zT7ZhJwLX5HXab1vsavKidq7cp54bPoYpQTaG9dHa6
	 OxAXQxh/Ds4c/FEXY1/pFDFoBEnhU2Lkwu03QINvbAYw82vEqks6gF4/M63VGXVxnor2u
	 hjKjpmVWvJjM9LqkPwWjfQ2m3RVp0Eqpi28Ecknj280K2vkkh7z8s7VWD+wnzU3HkLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ax6ncekN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5047A60A2602;
	Tue, 10 Nov 2026 11:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ax6ncekN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B267B1F008A5;
	Tue, 10 Nov 2026 11:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794310688;
	bh=iorjE9z8QyUMJ1RAj7sx526U6HMd38S2kCHhClS7b6g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ax6ncekNiCm0/WnNpBe+QkJAmkI4oOEbuK1DQjWXxBTCEqs+Zdr8PJVEdRCbQ2/Os
	 k3ve5AQxcXxUNprkLBWYlkPxNonI1WWsvSpfsesZno+5vEPAN4kmtQioXc0BV7CF7N
	 dJ9qfoI8VrnE343YvqwStJo7+RtLcXpf1J1OJGxgPz1WfGB0IJjTPeaykorRUY8ZyE
	 ky8+kRroM9PJhysCoSYiIe+x+VOdcviDs5+8yvlk96SCd/WOR6Lf/86xpTDlf0WRRc
	 ITPy1m6FlZV+Do87p+giooag+XfwYVkkf/y8Qxkt7mFVhRVq1TNaJocHluzyQ8crZ0
	 ulUL1ciCT0RVA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id DD327310B69B;
	Tue, 10 Nov 2026 11:38:05 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
 Leon Romanovsky <leon@kernel.org>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] ASoC: dt-bindings: Add/Update
 #sound-dai-cells to Tegra related codecs
Message-Id: <179426618773.3711751.13100572621405559085.b4-ty@b4>
Date: Mon, 09 Nov 2026 23:16:27 +0000
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2055; i=broonie@kernel.org;
 h=from:subject:message-id; bh=A+08dPCEhdxswcFtASv+WxHVH5TxmCKisizGltwDYZk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+M8km/VJniHrW+p9ny5PeO+7p2vtsNz344FYtx6RTw
 s9nFZzUUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgInsaWFkmGFb5NbXJjzjkOzK
 dYxzlN65vLrC2Dztvs4t4cJKsakM6owMtxgurhS816Je0et9kDP5QfHViM3a1mY28hkvFD4vELD
 nAwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 14:40:50 +0200, Svyatoslav Ryhel wrote:
> ASoC: dt-bindings: Add/Update #sound-dai-cells to Tegra related codecs
> 
> Add/Update #sound-dai-cells to some codecs often used by Tegra devices.
> Document #sound-dai-cells property for i2s and ac97 nodes of Tegra20
> and Tegra30 devices since they all provide a single dai cell. Add these
> properties to SoC level Tegra audio-related nodes. This is required for
> creating more complex audio paths.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/7] ASoC: dt-bindings: maxim,max98088: Document #sound-dai-cells property
      https://git.kernel.org/broonie/sound/c/062bf3ac1ff2
[3/7] ASoC: dt-bindings: realtek,rt5631: Document #sound-dai-cells property
      https://git.kernel.org/broonie/sound/c/084a4da7eee3
[4/7] ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
      https://git.kernel.org/broonie/sound/c/0f4a5bcb3245
[5/7] ASoC: dt-bindings: wlf,wm8994: Update #sound-dai-cells property
      https://git.kernel.org/broonie/sound/c/c90862fdb96e
[6/7] ASoC: dt-bindings: nvidia,tegra20/tegra30: Document #sound-dai-cells property
      https://git.kernel.org/broonie/sound/c/6ffb307005e8

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

