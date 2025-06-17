Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EBE199E9D;
	Tue, 17 Jun 2025 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166502; cv=none; b=VowpRTHlg2HAVJab1dV6MilqeYarW0/Xu1F1sbmxx3zCCOyMmPX1NaPLR1fMiYxkvH02KIYdFI5P03Y52EPtmb3Ca6misv0R3y4TYYfso7Gz+XB2y3rG/PsrGOUI6ZYJ/7ARAxSE0KhN3wwJ6uhkUdTneYjCjPCW4sBemCHszxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166502; c=relaxed/simple;
	bh=fkLB4KJre60wZsb+cBk8QXhaiGcgNVN5pkbyduMuRgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MNTlfxY/SXaRi9u0VSo7So1TsmgCb/QFx4kKCpDn0CLOg8gr1DTolKgnHVIFwcMmpmaVn2nP76dsEA3PfcX2N8FsIhfJXcw575XeYqtAF5zytwpY0tP2WZZLsqD75StDFSEH9tuVQs1zi7F+OircIydOhBTRbDoOtd+/CaV4mAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMVNIq7s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMVNIq7s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809BFC4CEE3;
	Tue, 17 Jun 2025 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750166501;
	bh=fkLB4KJre60wZsb+cBk8QXhaiGcgNVN5pkbyduMuRgM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cMVNIq7scUGAicrvb3WCnalpEkMC8AU8op2D06fAzQaWGa1PvKS+F+Pfm9lopy532
	 myHNPd+EggBz2OGjUv08dXIK03bthrzbxAAuV0GicuqI1Retmi9ORC1jie5nKNErRk
	 6nFDVhQfZMAHHpeKOXUkAHx5zSa4JM2wBqAlbhjYMx7DKkFDGVi8KPa6xWL6rjSaLV
	 OHyohUza2dy1eioFMDTOBoFShbwZuuSnuQLLpr/mKk3FhvB5lWlU5grFLDejlkavO4
	 W+K4bhKtWQ4Zwu3INOT3jEUqwYUNSpYTsWItaygjMZtNXtQcTUGmAy+rTBUVjpIyIf
	 /FU30L73gNAtw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 thierry.reding@gmail.com, jonathanh@nvidia.com, sheetal@nvidia.com, 
 u.kleine-koenig@baylibre.com, mkumard@nvidia.com, rituc@nvidia.com, 
 ruc_gongyuanjun@163.com, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250617032103.1725040-1-nichen@iscas.ac.cn>
References: <20250617032103.1725040-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: tegra: AHUB: Remove unneeded semicolon
Message-Id: <175016649927.38619.12894561378049163567.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 14:21:39 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Tue, 17 Jun 2025 11:21:03 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: AHUB: Remove unneeded semicolon
      commit: d9f38d9824bfb1b046d2e720349d2f45959ab184

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

