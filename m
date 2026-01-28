Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA35C19E97F;
	Wed, 28 Jan 2026 04:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769574713; cv=none; b=S00NvddaN9AHP0kjZknYuEbzmfL94jgeedHRhcmGBArpOKs81Zq2fss76AqtFMsdaOlnCihrq3oQsuhUxlorUjWKYLdDZ45fDrx8vJXPw/Y2OrnXXGoSfKKkcG4RevzcVJivbydnhHaQxEoPkhDVnJ5Y8UP64NwmuB1z0s6RYNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769574713; c=relaxed/simple;
	bh=tUmv+gY8IFhGFZPttpC1uaI2U2wdccs7kcY03afdQv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LHhid6iOgHCzWIstpf03G7CQjQpXHkK86IU9FCc8/fXI0yuO//g7VK2SeyP6zyBV7zP/2kzJCZAKyhgMb/kuXwdmqS6OUJ6TKoGEgi2GYvNo7gnfGjTIUZ0xeaRQoIt+dseoiTE7uelcYb0AG75OsBNWwim0GoC7h24rM1L44vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6k3+oqc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6k3+oqc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC402C116C6;
	Wed, 28 Jan 2026 04:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769574713;
	bh=tUmv+gY8IFhGFZPttpC1uaI2U2wdccs7kcY03afdQv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l6k3+oqcUayrW1v2OjihDd/m9XumQYuLqDWxY5PXHO54Q91PelS336MQCjG8/Ry9u
	 op3vgYxMHsEsty8Ei471c3jp34lo+fdoPDMHrgu43wmgJiQUKd6fFVS84SEpzIgG/8
	 wvtVitfJhZlYzRtwoRcEEWhEfxSAwMW6/CFXFXZH0R9pHyRSL74XSX1jbjelJ6Vork
	 sV87qcJrdDhCSCrpf8X2dRlnHbaWOjcqKgQqnW6uGR6PLAaeJhTK92i8d5UAdaBIit
	 6nwGmXL5U6IGFWF08M5uHmGUDLyivuNa6OIOvh1Le4mK027KoTYyU9hHeVEozIo6kM
	 wYBvWvmNsmorQ==
From: Mark Brown <broonie@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Sander Vanheule <sander@svanheule.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mohan kumar <mkumard@nvidia.com>, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20260123095346.1258556-1-sheetal@nvidia.com>
References: <20260123095346.1258556-1-sheetal@nvidia.com>
Subject: Re: (subset) [RFC PATCH v3 0/4] regmap: reg_default_cb for flat
 cache defaults
Message-Id: <176957471053.1535801.12900353866076753218.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 04:31:50 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 23 Jan 2026 15:23:42 +0530, Sheetal . wrote:
> This series adds a reg_default_cb callback for REGCACHE_FLAT to provide
> defaults for registers not listed in reg_defaults. Defaults are loaded
> eagerly during regcache init and the callback can use writeable_reg to
> filter valid addresses and avoid holes.
> 
> Tegra ASoC drivers set reg_default_cb and add writeable_reg filtering for
> AHUB RX holes to prevent invalid addresses from being marked valid.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[2/4] regmap: Add reg_default_cb callback for flat cache defaults
      commit: dc65b1ed4bb34ab6235ff2cc6a917b9295c04c2c
[4/4] regmap: add KUnit coverage for reg_default_cb callback
      commit: 70a65c53d228562cf0c8ae0f38c847d2a5dd59e6

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

