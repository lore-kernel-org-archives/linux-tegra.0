Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7414282F2F;
	Tue,  5 May 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777987393; cv=none; b=Wa+sqkvDGjGne9al8XAtr8EUHmtaJOB+lYvgaWjiJwY+/lt2LaoI0clGpirf8WyLnkje/65bFw3VQ+CLOVqYIyxK7TnudP06sTwTcnOey+wNtJIV8LRLNBVfxDYfqJxF+T6xnQUgtpXblOZThRL6UUg6UoMdtSdIARHagl5NyKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777987393; c=relaxed/simple;
	bh=cefudk32snOl/nbbvFdfp5Vnw/EQCTWqq5PCVaxb3Qo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pwUg3+0Ndhd61tKxcbA2cX4fgYBjJTO9KNQ4QtSGE0cSbZx95Xup71sDluz8dOMYilgq1BBj9NzeC2WhzZwOc4vHGM3TB7NDa1Qxewvw7EJ+cVGsbmbBEYEycCWqqr8OPWdsNpV2+4hB7oPPdFTnr6gQcVomYBygaY6CRDBrUKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkYpK2pR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkYpK2pR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97E4C2BCB4;
	Tue,  5 May 2026 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777987392;
	bh=cefudk32snOl/nbbvFdfp5Vnw/EQCTWqq5PCVaxb3Qo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=rkYpK2pRxq7d9ml/8BrXHNIVzBelWfsJF2TH3LPXWtB2cV99dAyBvB8zTqqJXZnMY
	 MzHCKiIqtcRuCca4DVRjOlq24BbpNH8loMORCuNiLuidLcuyfq8fMWYLwVlH+cc+tn
	 7TOhhYZZNerTdS6IAH071Sefz4k1vRepSAf1aO9bFGH+F2H3Vxe3BpJfeTYbAcEsXD
	 UYZiG38zX72VdeyPFbEd9XK6Klt52t2oiZRzQmbjcnVcfw0ZaclgMXLjly2uVhuryc
	 FPcb9uNNExz1rcKi68iJgudygnnibYVnBZd7/Ee2XjrwByZ01X6MPPx6rN1OJDY3p6
	 FgYTwwru7c00w==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] ASoC: tegra: Move MODULE_DEVICE_TABLE next to the
 table itself
Message-Id: <177798325040.568329.5475184475659729159.b4-ty@b4>
Date: Tue, 05 May 2026 21:14:10 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cefudk32snOl/nbbvFdfp5Vnw/EQCTWqq5PCVaxb3Qo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+e88pPymfwqltCc9XAr3YDRsUA7DBlqSCA6Is
 JH013PlTkaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafnvPAAKCRAk1otyXVSH
 0IFdB/wM8EiD0jprJ3GQuxIGKno9/xqIRj95icFwM4m1Ni+Xe9fgCyCV0qOqEv2oLeAfHUmypV2
 pB5UfRncjVuIpLh07vtuCI2wDBP91FZOLI31oSWi31Zt0nHoQ8AFOPpifk6jRY/eaPQjrd0PyqT
 8wz9pBYX+fxyPMXbi8emdbChfpZqtaGdd6L+4uwMH2bdFBTBGj15A/IA+QKf+3Tmx7he98vHZH0
 Czk3cuNpRDfyLgS4EgHv5pK2wiXMRpHBbpAn0Qwbh04h6gNQIfkvixhLUHkSX7VlheOOo1IWwjm
 QYXgcnoo6ACsHm4/+Oqz8fCEUxz1EHkBqH092FhhNUIjRpl5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 05 May 2026 12:28:04 +0200, Krzysztof Kozlowski wrote:
> ASoC: tegra: Move MODULE_DEVICE_TABLE next to the table itself

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: tegra: Move MODULE_DEVICE_TABLE next to the table itself
      https://git.kernel.org/broonie/sound/c/a28d17fdd3f7
[2/2] ASoC: rockchip: Move MODULE_DEVICE_TABLE next to the table itself
      https://git.kernel.org/broonie/sound/c/7ed0e11bea0e

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

