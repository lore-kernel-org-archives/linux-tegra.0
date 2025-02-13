Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D872222B7;
	Thu, 13 Feb 2025 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739456976; cv=none; b=aTkr+lCjdZj3sCq3RZ06pZmkADoaJyT96qQK1LhYSryQ5VBbe+ftmVEqtkg0uDTBO4Uqw2t+Qes8vvpt6c+eMKH1Bjg2jPOG78k1Dn0RhwVSTeEnnbhinTqY+FA62hPlzvQaBw9tvOUaPw17E3HubCu310/O1nmyTq254PFbnBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739456976; c=relaxed/simple;
	bh=SCMEDYXBLdQOIxBltgGOth9KDIEdD6RrBkxTdjKACUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K7YZtTgSqvoIp2A2yfg3o0jC8136fj8sSLlrnAbsQHIFmhSfxlWj9PehzhKZpL8RgwqvLixx8EfRg48tcYyCOSBjY05lCXygP18gpp+AASaEb41q1bHtSsnTjLTy5y+ZKwvdcY8omLMefKOWKd+cwY5uy4H2YDa2anMf2+d5OqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhWbOIEb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhWbOIEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FB2C4CEE8;
	Thu, 13 Feb 2025 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739456975;
	bh=SCMEDYXBLdQOIxBltgGOth9KDIEdD6RrBkxTdjKACUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rhWbOIEbmX3NdCPumiyPRX5jPHuifNw0E8d3izJi/x59Qcyby0llk2rKXUoyL8zC8
	 gxX5DJtUuJjhySx49Ln9CSOhH1hHohDfpKzlPL7e+hbeU2CQors5eImLhr5yQyx1oy
	 1bJTwpSxeXqR4sHmXV4CwS6JUaIu1U+8e8f9/9O1ejWeu55vajdXYpP2pbn2Li8Ikh
	 d6MTjjUah/VdgqX9ZxbMnNUDLbGh0nrWd0dUOD38dpB/fXvvNhKAnXrDzhyqjxlDdu
	 huC2oABHKrsDdrCPwVbexhLlwkPpYhZg+Hs01Y5AeEG79OMPhGQq5jCkhR48hBctaq
	 IZdCTlbvwjheQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, "Sheetal ." <sheetal@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 jonathanh@nvidia.com, thierry.reding@gmail.com, mkumard@nvidia.com, 
 spujar@nvidia.com
In-Reply-To: <20250213111216.1238344-1-sheetal@nvidia.com>
References: <20250213111216.1238344-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Remove the isomgr_bw APIs export
Message-Id: <173945697410.151957.234368627529558399.b4-ty@kernel.org>
Date: Thu, 13 Feb 2025 14:29:34 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 13 Feb 2025 11:12:16 +0000, Sheetal . wrote:
> Commit 4a91fe4c0d683 ("ASoC: tegra: Add interconnect support") exported
> tegra_isomgr_adma_setbw, tegra_isomgr_adma_register and
> tegra_isomgr_adma_register APIs, but there are no users of these that
> required these symbols to be exported.
> Hence, remove the exporting of the symbols.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Remove the isomgr_bw APIs export
      commit: ae575d2145d1a2c8bb5d2835d7d54751f3b0bace

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

