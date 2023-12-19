Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CD639AC5;
	Tue, 19 Dec 2023 18:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbamb6wM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8CCC433C7;
	Tue, 19 Dec 2023 18:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703009215;
	bh=75Es5ASDNV/OKxp/HlaSmARaKwxlUSU1EzBIpJTahRw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bbamb6wMIQTNf2EwRtb8UiN2rGhkeT3P8P/X+6ptYEgRlQK5Da0Dsmh+XELFHeiBw
	 pbkfnuMPYvQpHiCXo99GPo74qlJW/vBKogHtjMGgJkEge+lCEBy1l5k5YiLW08nSi2
	 YzNBgl3Scxhv0zJOG/HH9nfVsGWB9sIZo/C9VEELwDkWrVWsM6eB7EgRwq8pX8c4fC
	 Mlx/oEX/JenyAaKtZ2zHR7PEAipdYLRY6TpQmPqv/NhJb1fSZxRhOU+5js1HhcbSZ7
	 BO/sVIwYoObutr8vagWBI8lvIHRIzkYCTff8tKgQusvFu4BNvGCt4E0l5sj44sJpl/
	 LqbEy6WVyTmlw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
References: <20231214-gpio-descriptors-sound-misc-v1-0-e3004176bd8b@linaro.org>
Subject: Re: [PATCH 0/4] GPIO inclusion fixes to misc sound drivers
Message-Id: <170300921190.125466.2748505947171245430.b4-ty@kernel.org>
Date: Tue, 19 Dec 2023 18:06:51 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Thu, 14 Dec 2023 14:15:41 +0100, Linus Walleij wrote:
> Mostly dropping unused headers, and a single driver rewrite.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: hisilicon: Drop GPIO include
      commit: 487b467206fb2f3a21c93759d3b0ffe7044ed197
[2/4] ASoC: qcom: sc7180: Drop GPIO include
      commit: 809fc84b371a0364160254037d2bc34a8f5ce372
[3/4] ASoC: simple-card-utils: Drop GPIO include
      commit: 4504f63321e1a581a3c0cbc8de91bd0175d94783
[4/4] ASoC: tegra: tegra20_ac97: Convert to use GPIO descriptors
      commit: 26e91f61d6b91ccfb0bbb15cbc81845dd1d223af

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

