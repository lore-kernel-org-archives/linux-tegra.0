Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14BF30AD05;
	Mon, 27 Apr 2026 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285282; cv=none; b=DSSX5CcwmE3EszFKZJ9abQBslk6+DUkVDV5IEPbACAsXKTrzSQqyW5xhtkJcUl6IJOl1OPKXCmk4u3M8R/JjXjHvqdLTO7vWYc1o6PtGG7aMZijz9ffjIUzatmKRSbFfi8+FyO+BGzlbLT4Gaum6FPyuCt8/u4+WN7MJApVGNps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285282; c=relaxed/simple;
	bh=1x2ug0f/EJYc9A6t4ILJ/dTuDb/McXn/ci0WuDylM5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RyCPcxWsFhvThITQvoCnqS0bcBXe9HJbaWl4RqCdvaLKNzBikyAnQ2xKavU4kzpBsIlKp5/XEN3+6Endnpil9VN1FRBGKtcnksSFIuZbQ8fxoGgEaEpJ6fPl60eTJA6Tun6V6iH6DqpFSMSsosfWqZSCd7EQwzl2eOgwTmFzKno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jYYb/LwI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jYYb/LwI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E09C2BCB4;
	Mon, 27 Apr 2026 10:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285282;
	bh=1x2ug0f/EJYc9A6t4ILJ/dTuDb/McXn/ci0WuDylM5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jYYb/LwIrHiUCZpi32Y/LxCDDcbonCUPYVPSwA33Vh5pbPy/lsw/ST4I+GNpDl7OP
	 SaY33+eH5hkVy5LX7nNAwOwf+Qq9tuiEeDAWDiZfDKuw4R7UT+5wi1n7du0xYCYDBg
	 MoVZakL0PUJbT+W0vmGpNMzKs+1ccZWHk2WewFjejHNTzRSdLDIfErTOeODl51FUCG
	 0qPn3bEgYWauc+ayG4+QzMHt3aYfaK9Uka60O8XeBITeujOlhYo6n1bW1FEjKDRtbH
	 XYd+wMtUaMI83cC5WEiLt7rPxnnVTk2DckKLhlfNENFn6/a4tKfz1xm5EyLfRZfi+l
	 VAtCDGbMFb0ww==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Sasha Levin <sashal@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 =?utf-8?q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260426000249.54799-1-sashal@kernel.org>
References: <20260426000249.54799-1-sashal@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: Remove stale snd-soc-tegra-utils
 composite module definition
Message-Id: <177724580444.266775.11334935850320228755.b4-ty@b4>
Date: Mon, 27 Apr 2026 08:23:24 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1x2ug0f/EJYc9A6t4ILJ/dTuDb/McXn/ci0WuDylM5c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7zifr34p931kUBCnIMRINKPgT0TqbD5kV/ach
 ZCr4yEKRRyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae84nwAKCRAk1otyXVSH
 0PCVB/4vntDSlpApCCkVSkDOcYiCVwD5YRJn1vtBYiq99IV50QC3LyHczq0iHKMSp51H/bbi7UC
 /wY/qBhCVIF75rtbmIFtEPcs6F8dbavzPzwQHpYiG8wkgmA+EHNbnbuwE7IRuzIYY+MFn0r8fWV
 KQdikFg+zrtvYaU47DEOUOslpNpCohhIa8sW+F2VfCXl+KPy3PES+c1dH+zxaPphwf02QOHZ51L
 2Cy1pK07h5COkVKVxdfXHaCyu3g5a9nv65UVP8nA+4giY1+qvIRhwvvxuHqw3kmPTikDORrDrp5
 43NlMOkF9jaNDAfVbceC34kxu4LDhlOkbNKbB3ZnmTePw2rQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 25 Apr 2026 20:02:49 -0400, Sasha Levin wrote:
> ASoC: tegra: Remove stale snd-soc-tegra-utils composite module definition

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: tegra: Remove stale snd-soc-tegra-utils composite module definition
      https://git.kernel.org/broonie/sound/c/dad701bdb743

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

