Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C922A4CA;
	Mon,  7 Apr 2025 23:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068947; cv=none; b=qX7tU09mIexj8cukfcz3TU+0cLkJuGQXxRYKk5beazMbLhyrJQXScAUyA9+qtBz8O2tFRxQLYp48v+Zpob4+ibsVxqbp3mbimvQYcJfhS3/QDqVu9EJn1msoZAJg38IgXMM4e/fEwrgtEcXINnL6u4gx7/x3n2W7hZxdhlUwi1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068947; c=relaxed/simple;
	bh=I85j/jXCtEsELCZ/ADAT69aAEFPWO6QqVLphkunFpMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dkTt2A6U3lxQ5BRUrIkmqLfY9HX2IMgSFQWJDbeO9ElynZb6xf3jUwwayt/e8PTfw165E3eVk308Rk58CqKnAVKF8ZtqtWMxgH3Uang8jcIMZ5iUYJwUVFAcroz9ACwrLpaIQpqmRf9w7K1EWbGkvCKqeByno1cG530qeDmj6iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDRHFtdG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDRHFtdG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAADC4CEDD;
	Mon,  7 Apr 2025 23:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744068946;
	bh=I85j/jXCtEsELCZ/ADAT69aAEFPWO6QqVLphkunFpMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KDRHFtdG6lE+5G1JBh3khOkm1S8pA2+mwbAqHCC4qDDeat+d+dvHQLM6np60IW9Qk
	 BmP8brDh2vebAZ4zgo8Ti9NZ/rT472PhBm5igO+fw97FsxqsAewkRqJb8f1iM05So0
	 e2O6OdzgrI3kBu1xzzu9ttU2lN16uGRRKVMTpI0xqhsjlPO1XlgLAr76y/fUnbB6C/
	 I3drRYHgARamjKF/7e8mr9VYe43S69GFvonB2YZ1AiGXKHmba4FMehndhxc5AyKRIK
	 iOn+vHo0GsdtLaDx9IJcwCh1PrB8BAIV7iaVIHupJKvyllLCjXArAQNU37mlrX02vx
	 IZhbIJ8eOElPw==
From: Mark Brown <broonie@kernel.org>
To: dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: mperttunen@nvidia.com, jonathanh@nvidia.com, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mripard@kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
References: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2] ASoC: hdmi-codec: wire up the .prepare callback
 also for SPDIF DAI ops
Message-Id: <174406894377.1337819.891174664812951152.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:35:43 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sat, 29 Mar 2025 20:14:33 +0100, Martin Blumenstingl wrote:
> Commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare hook") added a
> prepare implementation. Back then the new callback was only integrated
> with hdmi_codec_i2s_dai_ops (which is used by the I2S input code-path).
> It was not added to hdmi_codec_spdif_dai_ops (which is used by the SPDIF
> input code-path).
> 
> With commit baf616647fe6 ("drm/connector: implement generic HDMI audio
> helpers") the DRM subsystem has gained a helper framework which can be
> used by HDMI controller drivers. HDMI controller drivers are often
> tightly coupled with the hdmi-codec because of the so-called HDMI audio
> infoframe (which is often managed by the display controller).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: wire up the .prepare callback also for SPDIF DAI ops
      commit: 5533518834a3acc75919e8db671f6a8539e64f42

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

