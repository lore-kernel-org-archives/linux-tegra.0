Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA19629A3FB;
	Mon, 14 Apr 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639008; cv=none; b=rUa3t8w+HbJ05DRvgnybGMi5QLxJVKSZph47RRc8uAZPpJf1A1q/hXlz/pIrSAkiNeH8WeuN4FJjNC/cV8SKhUrDw3iO9wdiXH0de71Lf1QAhAZoVxaUaqbQ1tV9pmRxvO1NkZ8xMkfEcm74AMOViygI4qWOTWKJlDfEM/Vrs3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639008; c=relaxed/simple;
	bh=PdHvFX8m1ZGaUZsuTkKwmAqbC5tc6BlLINvpkCC6R4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bUYTPgdVmbYKa7AAD7gXEhTf4/kTERgLSwGEchFWGnsRzehIJ9wiLGZojBr5uEIsaB/IgyRmDkVU1NbJhE89t9O95WFPdfEIi1CvQ0Qcit7ChMZnv30YTU5yndVG6r91oyTkLP9ZJ1EK4KOlmCFLkkWKdvJEStE/m0VMsnLdSm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/5/t7IU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/5/t7IU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A910FC4CEEB;
	Mon, 14 Apr 2025 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744639007;
	bh=PdHvFX8m1ZGaUZsuTkKwmAqbC5tc6BlLINvpkCC6R4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i/5/t7IULMbDTfC6RF86h5ODO0c4DZTXQy7QstKtVDA6ckWSUsqvGaT8i6GreSgEZ
	 MrvBhqxgFo/oJST1vlxkq8VZ2JgrBnZfuAATfeCZSd89yF9lx4yzQOyB+0Eu1iEb+7
	 CLNeo0sGHODDSIgl83RxEBsVIMgxz2IP0zKkhS2QvsLsaOXkWohxUs0JJoevc3mWxi
	 LoOh5O0chsAEOT1KQKIla/ukhCg5VD+1Q6wmvw5gIlhFMK6EWXhTBPIxJ9I604nlAq
	 mZkfqs9DuL7nMAfvQod+V3qPl8cxdsMda8+lpjUjiHgPPw/dNYaErZrQZWU2XZv3xD
	 tlkuorydqSHZw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, "Sheetal ." <sheetal@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com, 
 spujar@nvidia.com
In-Reply-To: <20250404105953.2784819-1-sheetal@nvidia.com>
References: <20250404105953.2784819-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: soc-pcm: Fix hw_params() and DAPM widget
 sequence
Message-Id: <174463900542.86688.12975575965483573998.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:56:45 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 04 Apr 2025 10:59:53 +0000, Sheetal . wrote:
> Issue:
>  When multiple audio streams share a common BE DAI, the BE DAI
>  widget can be powered up before its hardware parameters are configured.
>  This incorrect sequence leads to intermittent pcm_write errors.
> 
>  For example, the below Tegra use-case throws an error:
>   aplay(2 streams) -> AMX(mux) -> ADX(demux) -> arecord(2 streams),
>   here, 'AMX TX' and 'ADX RX' are common BE DAIs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: Fix hw_params() and DAPM widget sequence
      commit: 9aff2e8df240e84a36f2607f98a0a9924a24e65d

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

