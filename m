Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E007723ED5A;
	Mon, 17 Mar 2025 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206667; cv=none; b=qY5VZ+7tqbq5SHuBvGE/mL8nYBLsr7MA3Dk7+BoY8IRB1vl7cwjpTjW/ROPb81KfjRf1+erX6focVWXaiHVyPDrvNzOt0g+XV49gY1mqRXj0ihYOe7jMYqaruTT+ig/5T5FklAOHc00ZES2T+uiRVkDTuRv3iQR4aqEWifDoZvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206667; c=relaxed/simple;
	bh=Y+YGybTwdUVkmfjxKggKP3yQRtEpic9iLyWLwUYHf7Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NQNZ+18yxDW1rTCnCEGw3MojKIBzof5E0rDSTlUQ4/6ssYsi1dS/Syel0A1tuLp9ujRsNMI9g5ehC27fTeh9MBvo1qlD+fWfBCQY8KsrxhaedJ95+tb7WLqGEaxPfzEJ3xMSZUzPMaInlz57X/jwPjK8tmz/dkHBukMgvIdd3fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uV7tjhIF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uV7tjhIF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C78C4CEEF;
	Mon, 17 Mar 2025 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742206666;
	bh=Y+YGybTwdUVkmfjxKggKP3yQRtEpic9iLyWLwUYHf7Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uV7tjhIFjf1HfRQxlyeNKpobQZP6XRe2zPaLpUjoTpN01oLgFmIiFGYq+G/ecikXN
	 tziBmb7fbD2Fqgmg/lr3AuwMD0Uj+U3tGeP9aHWr2x1LBs6GvsQX7fX+QC3OtatYzC
	 GOOBwWqFeLplIUWlCbI9r37Mscz3BoPymoBnCxEfeIWELps3Cs4Tn9Iqz7a7DxPqU9
	 IA+NOSt51oJAx4SXHqgLmO+rQJtPcs0xJyI8pQP387Oqo7FwJYZrxd7YVfOgyPqKkN
	 x02cKT9gSPRyFlzu90lz57oDKq+qBKiKF84YMFvSkYn/c1eRdKq0GfmF2h5SUUrJI/
	 dJuUgKStm2pCg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, "Sheetal ." <sheetal@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com, 
 spujar@nvidia.com, Ritu Chaudhary <rituc@nvidia.com>
In-Reply-To: <20250311062010.33412-1-sheetal@nvidia.com>
References: <20250311062010.33412-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Use non-atomic timeout for ADX status
 register
Message-Id: <174220666440.86423.15072032170869045785.b4-ty@kernel.org>
Date: Mon, 17 Mar 2025 10:17:44 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 11 Mar 2025 06:20:10 +0000, Sheetal . wrote:
> ADX startup() callback uses atomic poll timeout on ADX status register.
> 
> This is unnecessary because:
> 
> - The startup() callback itself is non-atomic.
> - The subsequent timeout call in the same function already uses a
>   non-atomic version.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Use non-atomic timeout for ADX status register
      commit: f1d742c35b659fb0122da0a8ff09ad9309cb29d8

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

