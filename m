Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BB42D9EDC;
	Sat, 22 Aug 2026 00:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787359946; cv=none; b=Y5UBbiEEZqjXJV9fnUjWB0e2224hPjcwoC7OfvzSnKg5itfpgvXdT5bSxZlBCyT064MnX80vRbdrFZswr6i5w97QH7IM00XW5goliKRU9xCB3NAFl+hkA2CdD1x7/sMHxYhYK+bSiqhGnS12Uy9QTWkwWo97Cc5Gg8ftlx0uXRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787359946; c=relaxed/simple;
	bh=BAjnR5YW7z3rjWALqxK3PKDM9Ytuw+vsoBpyWrD8GT8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jmyNk7qgr013/My74youO+nc/9IVLUfM2PUY8GgvKn2yIQANNy12KqG7tO1F9oNpiRoWohCO0GjqV82ohXMMMn2g2a9DfDSyEv9scBtgq6XrbJamPGl7P25ITyiIK0jTvuEH2p3NjfqZ6ANU3wpi0u9/SSBPct25/OaHmLUF0FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jmXnpTbS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jmXnpTbS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9DD1F000E9;
	Sat, 22 Aug 2026 00:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787359944;
	bh=39Zg9ll1wL177p3JXwU8aJL3aecKp8eV7L/vztSn31I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jmXnpTbSjqAnrc0xCFXNOrQ0yNr8ZUDWFsnNKkuMI5TPFcltz59mzKWmREilaVCzL
	 Fgtm98HOx/LGJ37ddh3bxceJB06tCzlDLmCA11U3f/0saFit33M+ODCx+uDFYrXXge
	 hKyY/DonZBl5bwtZGdqfYGEBfUVAkm3QoMOxgCgebP6z1HTkPukbdmGjki4yyf9NhY
	 JwuVYNQlRhzH7Kt8mvcZQgk3fytuDUYE7ZlJBzjEKAFGsQMDOC8R2+AhGUL1N8IvTC
	 YNtYMkrsXSuLMV7XgttplWvAnSSivwPV3cT040sI6xg4XI5p0lyQo90e1ANcgsyTUu
	 L1GVO00kDiKHA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Sheetal <sheetal@nvidia.com>, peter.ujfalusi@linux.intel.com, 
 Jon Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20260821153734.158426-1-jonathanh@nvidia.com>
References: <20260821153734.158426-1-jonathanh@nvidia.com>
Subject: Re: [PATCH 0/4] ASoC: tegra: Fixes for issues exposed in Linux
 v7.2
Message-Id: <178733214505.89326.574710422511189396.b4-ty@b4>
Date: Fri, 21 Aug 2026 18:09:05 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1901; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BAjnR5YW7z3rjWALqxK3PKDM9Ytuw+vsoBpyWrD8GT8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqiPLEd6WvtK02/A6DyQ37spE4PIh60lvhLjiKN
 d0nAg+zMvaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaojyxAAKCRAk1otyXVSH
 0FUuB/96qzUoRH3OBYUdUm9P8erQbMRi7c93H5UXAywgbPn2NyK71FzGiKGTOBfI1+iRdOww8Kx
 nqjs0n6O30fAAWRtPSLbCCZAuvsyuAdGqEyGxfRctuFKAm0d84B6499C/CC5faAfo6A5vPbBTVx
 iuZjWvxz9IV22gD/k6cYdFeconEeb2B8QkmVk7k18UuBwrP7IurIf7r3L2Qzdy6OnrTFsWWr1rv
 sE9Ojb5onRL6NaSJFE4Xn/mYUDxOeS5CijfeCa7bvuieBX2O/ePQ5gqQMvQuTgv3tB/myBfJ7b1
 T4E6OirPOswGCjhap2YzWpdGYQZA8Cw2Jx7lKpFGT6xvWOWY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 21 Aug 2026 16:37:30 +0100, Jon Hunter wrote:
> ASoC: tegra: Fixes for issues exposed in Linux v7.2
> 
> Commit 4b05ccb17f92 ("regcache: Sort the local copy of an unsorted
> reg_defaults array") exposed an issue in the Tegra I2S and MIXER drivers
> and after this commit was added, this underlying issue now causes audio
> tests that exercise the I2S and MIXER drivers to fail. This series fixes
> the issue in the I2S and MIXER drivers and also fixes warning observed
> with the ADMAIF and MBDRC drivers that have unsorted reg_defaults.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: tegra: Fix the I2S enable default value
      https://git.kernel.org/broonie/sound/c/53dd1c1de851
[2/4] ASoC: tegra: Fix the MIXER enable default value
      https://git.kernel.org/broonie/sound/c/5442b8093a2f
[3/4] ASoC: tegra: Sort ADMAIF register defaults
      https://git.kernel.org/broonie/sound/c/18d48bfd1bc1
[4/4] ASoC: tegra: Sort MBDRC register defaults
      https://git.kernel.org/broonie/sound/c/abb5bed6f48d

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

