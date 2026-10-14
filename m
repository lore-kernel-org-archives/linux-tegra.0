Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4AD485515;
	Thu, 15 Oct 2026 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060285; cv=none; b=dKoo4QLCsnMwBoX87yVxQVN1bM61rMmT4JcyUPTbwciNomQIn9s5icJdgkpcU7XfI94Ls2ifc8G4kEchkuNLmXeI30hQRCNKWkWUjWXRVO35xlKoKnHtR41RbVStga2MzKBCTIAxBP3fkxxLdDTu0HhwUyaeGQwjMR6UXFB8EMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060285; c=relaxed/simple;
	bh=8s9WPA5xRPW3zkli3mcv126kpJ1ImNBdVQyHu1OlFVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rHtmx6Ly0zbMbQ/hnMLkYw2NPAtYliz1kRK8rfkYTMPWUTkEKYbcJ3eVL46c7iZwKCODx6EYXAJQPQOoDR+UUMROLZ/KdmOvzFK3NkBuIbqSqY62+vNbn4F8/zRxRqdlDdRC7ZbRvAdp9UGplWNdk4WZsxuQUDSyvC7lCHfd3HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chhpwKGK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chhpwKGK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8995F1F000C4;
	Thu, 15 Oct 2026 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792060284;
	bh=GgG5/7AXvaq/iFfJgULH7jRlgvitqo/IGXQVg44lcGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=chhpwKGK2BQPGyb3AfW8vvJ1N88u6ydT3rUcMUNR5rMBL7u1HG3QfyFnlaaz4zkOH
	 gBrP7TwJcIqBRUiwjvEShY1lMz9aLhStI+GALPYSNwVrv3IQfyJXj1IgA6KYFGODn6
	 hleb3OYUFz5YGG9wKzs4lk49Kwf/PAvLJiextjpFPfpiBhjMO2+9hwj6iyEN7FW9AG
	 i7Fm0HvQbuDpkmE5UbNo8EkF9ZPLnoTKBABUCA+1P2eAUmf6CpyvIVzAiBJl1hObP/
	 eU1v5DfI72VieIQuH6JN4HSalRFujonf9DoJAeD26nwUJEDxJ2UjoVFguuumWvvLpP
	 DgRWrdg/hBaDQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261014120148.126160-1-clamor95@gmail.com>
References: <20261014120148.126160-1-clamor95@gmail.com>
Subject: Re: [PATCH v2 0/2] ASoC: tegra: Support WM8994 by machine driver
Message-Id: <179198365033.228143.4661366281162373638.b4-ty@b4>
Date: Wed, 14 Oct 2026 14:14:10 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1444; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8s9WPA5xRPW3zkli3mcv126kpJ1ImNBdVQyHu1OlFVg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIurC7fUFC2eydbPN+qqNMfAuqN+iuy+LKSPgs3nToef
 jxMJCulo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABO5wMPI0Le94HUm7343GY+H
 zFxxcbX5F5m0AvbqdGQ1Xp225B33T4a/Au9Ocr5iWuJcKyOhulyfS35ylZRqcfnblVya11W/lzk
 xAwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 14 Oct 2026 15:01:46 +0300, Svyatoslav Ryhel wrote:
> ASoC: tegra: Support WM8994 by machine driver
> 
> Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
> machine driver. The WM8994 codec is found on devices like LG Optimus 2X
> (P990/star) and Samsung Captivate Glide (SGH-i927).

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: dt-bindings: nvidia,tegra-audio: Document WM8994 CODEC
      https://git.kernel.org/broonie/sound/c/5b4d158b309a
[2/2] ASoC: tegra: Support WM8994 by machine driver
      https://git.kernel.org/broonie/sound/c/e38398539f79

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

