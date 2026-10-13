Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A0323A99F;
	Thu, 15 Oct 2026 10:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060280; cv=none; b=NcRMK6iyAm4J078Jd9iNodHZtV1AgFca8LLzZ3rj4FPxvh5eisLKJBUO54HPpWW2mMjYUaj7fA6AZ90ipBD2rK9ySnz4ZdewV5Tlp98Rp2Ok9AJIRPqATh0cprxCEjQR3aEOQMlmLfZvtuK9GoLczwTxsel7MM1OFLS0RProNJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060280; c=relaxed/simple;
	bh=V9iS4ieuPnfHzPZZny0yXAivZ7S5887E2Ryt7bxpybs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FHy8gJ2R6sgAVNTUiy/mEZ2TyOb0Rfkld2M0BJBKmN3RlYUiOswIXNr+ld8G03QFDzFUB0Od0r8tc4bspF/5E1laj5w9v3ZnMHhSGnIYpEWTJTLSigz95AV1/ulRi3n4EtAxfibQKWMzm/dfUGnYg4nx1xlNiNmdqpnfnqtTILU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDoRSE1T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDoRSE1T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73441F000C6;
	Thu, 15 Oct 2026 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060278;
	bh=ryir/QV58VCmwKkmYSoaIesUIwwZqvVwTJHU9ee2snQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TDoRSE1TxHRinCPwEojlKJ+DObWfTwq+ahuO7MFuloB7kp5XyywoMe73SgW/H8TYN
	 vKxKblv+CWOIiV7lH6trp8f/VWZ/jNfnSyOl5OGf5dydei7i5iFK0/6huhIF+nc7Y3
	 +rTdN4Z3M+WKpVBGbJYMq2ktlTY8Y2ZJbIhs+IgJ2oBWjW3gsri2fxws28ao2llXNF
	 e/DQYvNXGB81fhc7Irt28pObQ6LflsLwOsJ+mBJWdDwoK10Xcm1cGMoo0JqvEdULOr
	 8MVqdY9QXJ6L1KbCTsYy3XMTni/YI7XAQz9IK74zrcQy2umkEaU3O2pcov1rMowrxC
	 k14McB4lvP5gg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Sheetal <sheetal@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261013180253.477605-1-clamor95@gmail.com>
References: <20261013180253.477605-1-clamor95@gmail.com>
Subject: Re: [PATCH v1 0/2] ASoC: tegra: Support auxiliary devices
Message-Id: <179191591268.42298.15005844930396092873.b4-ty@b4>
Date: Tue, 13 Oct 2026 19:25:12 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503; i=broonie@kernel.org;
 h=from:subject:message-id; bh=V9iS4ieuPnfHzPZZny0yXAivZ7S5887E2Ryt7bxpybs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurC4ymdOmuN1li7nUMwHJLRWJu296W8dbL23xv/nl+
 uuKp5o/O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARk4sM/739gz9/fJ4qNP/l
 vK6ppxf9fnOo4ZTdIsdsL/8c9ahfaaqMDDe+sS86b3vexL12/ompixdvWOt1QWVx3IFFIanVdg+
 9s3kB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 13 Oct 2026 21:02:51 +0300, Svyatoslav Ryhel wrote:
> ASoC: tegra: Support auxiliary devices
> 
> Add support for auxiliary devices, such as amplifiers, sound-muxes or dsp,
> to be added to the sound card.
> 
> Svyatoslav Ryhel (2):
>   ASoC: nvidia,tegra-audio-common: Document nvidia,aux-devs property
>   ASoC: tegra: Support auxiliary devices
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: nvidia,tegra-audio-common: Document nvidia,aux-devs property
      https://git.kernel.org/broonie/misc/c/6d222e9806de
[2/2] ASoC: tegra: Support auxiliary devices
      https://git.kernel.org/broonie/misc/c/3892339e4fed

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

