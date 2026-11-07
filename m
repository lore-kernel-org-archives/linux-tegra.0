Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145433;
	b=dtSnB/zLUrBPIED6i8g2wJahF+20lwZiIhqzrziha321SWA06k5ZFoZI5wDrclfCqEbp
	 NfUCm5GNupByb6cSR9ZRceqb0561CaDD6zI3482QTkVDlRqnJ5k8B/ExI9HdTw3NjfCqA
	 121F5v+ChSvrXB7rcyE5PU9Bu3dWQfTOjAc1R53fVlH+cMb78jNwGFU5OpvmP0RXBY8Pe
	 Z4jDI/aXIYpaqfsigwgCX1lXvSLADQ/SfWZccEb7hJpsmctDK3PnfhNqtC0vicK6RJe76
	 Q7WMt930oC/YJdLSUAJNvhwFO7t8eLrUpomKDeOB4H9NSUP54G7otr4xLPbe+ICTf+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145433;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=jyyfi9t7z31wdkTHmBUQ+fMjVugiO0ZSiqAAX6XBmWo=;
	b=nl9jzFBdEy/w75k2fMo1+VFj+JxYj0X+NxAwvFDsr0iWXSLm+U8z6pozMWi03dczrS5b
	 M0SQGkB9vFcus3ePeUfdesuNWUOOXOn8M8X4qDzuv8XLX53xYSfrbC4xDlx9o+HKbIG7Q
	 T+Vz1yLvGZgeleacPmqKsuAfOKviNwueCfuRX59MIklJXJhfRaby/xtips8qA9nUa9iHk
	 MXShqzeQ5+F3oaE4zS0ct2jfR3Ykpn5pJzZC96f8z5+tFc1D+3ORAqzyurQ9CwqxmkGq6
	 Dj8GfWCZQGPYbyQ0VTuLyu2OpCURFcfR6s68dKq2Dy7OoD0YYFIhS4iy86wqZuyaE1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KmEm1nen;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E388606A31C;
	Sun,  8 Nov 2026 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KmEm1nen
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD131F0089F;
	Sun,  8 Nov 2026 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145432;
	bh=jyyfi9t7z31wdkTHmBUQ+fMjVugiO0ZSiqAAX6XBmWo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KmEm1nene8y5H8YorJ2KRg5kGano5wehoYWehx59XQwh6nbfg+wLpWI7ykKJHGA8+
	 XjEYFtlTep4KzIrl/MjDyEz8kia4Cdl8FSRZsHaYUs7Vlt9Wy352qd5zm60UUqI1EU
	 ZqKNm118tao/pIyRIbuTnADUnfc8e8TiTNDLXlNkJvBUZEGbdEssLzLl4JNj5shYf1
	 P9SOxvb91sxb3ZhDwaJ7tERKogQZt1oKWvxX/emZ2N9PDSauCMYM6k0nvkAdqvl4iA
	 uGpm1+G36g1JcjJjXX2nwxqZMte2dIMLb+d8XrfCccAnrY/PgpV8XBbf+wPvW/y6Ac
	 RKTADLvVCyGkg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 10EB92C79254;
	Sun, 08 Nov 2026 13:43:49 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261015130628.184279-1-clamor95@gmail.com>
References: <20261015130628.184279-1-clamor95@gmail.com>
Subject: Re: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio:
 Consolidate all codec support into a single schema
Message-Id: <179406677464.3424803.4552675393907616069.b4-ty@b4>
Date: Sat, 07 Nov 2026 15:52:54 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=broonie@kernel.org;
 h=from:subject:message-id; bh=RfJx6lDOMYyTez8kNouHxAYi+GWa9mMB09aKjLXIHII=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+1ExoXDHtyaVVrSsXWZ27yHzj/fWsE7G8OdZRR4pNJ
 SXPr+lR7ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEJOcxMjxtvfr0zYHl2U9l
 BUuS+aa//X6yYX7o/F3rtMRvu3o6afAx/LNaqvJ7YeOSDosOI6lD7uwBt9kDltxuyGZOyyn9ftb
 KjRsA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 15 Oct 2026 16:06:27 +0300, Svyatoslav Ryhel wrote:
> ASoC: dt-bindings: nvidia,tegra-audio: Consolidate all codec support into a single schema
> 
> The number of codecs supported by the NVIDIA Tegra audio complex is
> increasing, which leads to an increasing number of bindings with minimal
> changes. The main differences between codecs are the compatible strings
> and possible pin configurations. With the introduction of auxiliary
> devices, a definitive description of possible pin configurations becomes
> nearly impossible.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate all codec support into a single schema
      https://git.kernel.org/broonie/sound/c/ad6111b192c5

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

