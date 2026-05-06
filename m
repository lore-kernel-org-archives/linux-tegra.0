Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDD747798B;
	Wed,  6 May 2026 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076476; cv=none; b=B5ayhfvOSBcr5R77VpyeCGv4sTEzZXcdrFiteg/y1QpvY/ozuLea69645CT9QJR/3oqmTVZH30mzq3JT9bnwTyOcITf4hXSVWYaRaDo0RDqoJzFuhjC7e60/hjeX+sH+hfp4oxauGhZn1vqPG74K0+MDeLTK/xT1pDT+oC1d4gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076476; c=relaxed/simple;
	bh=cQlnEwAXRpnNanjvzfKUqX/rIx5TBMYTuUgvbOozgHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tMXoDyC9VrjY+5rX+BWVkKKRxe4CvJ9NvR/40sE9BlLXGAoKKbdXRMh7oicBqjdWzcw4kSo/TKA8dtylF0j5gmUgSFmWCe4Nl61x5tzUioz4InBTjRLJHVclTQNO1mWLcORRon33hj5u6hzgspBU8vq+vih5EwWfMb+cWKn4Kps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHgouN9g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHgouN9g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5412AC2BCB0;
	Wed,  6 May 2026 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778076475;
	bh=cQlnEwAXRpnNanjvzfKUqX/rIx5TBMYTuUgvbOozgHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nHgouN9gINhTwXFiYi2DxwBxXH2sgOZudmJHZbHv8Ev03GlvHmEQdrvrG+uB9WDKN
	 P0f+CDua+TnwG3Uahh9YVWG4qRa5US2U63Qa9vIEsfrvbTlpTUNHUPaHwMenMpAf9U
	 JjcktYlbOZksli9U7T9yEA66NRVUyKyFucoBsjRZDoRR8mcke6PBfGMLE8agdDtjMW
	 HfyQv14z0yg/rMI7aWUuMDTlEI2tMcog8CQfYJzw8lrG1Bh4v/Sev8T+yjlMi8wpM7
	 6tri/d5kNS3YDGPltBYKwi7K5ZZIVimYJH359RcXlEnknurcVe0SMcEpcNLPsp+pY3
	 QiXSKopOEXuiw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
 Mohan Kumar <mkumard@nvidia.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260506102032.1644851-1-sheetal@nvidia.com>
References: <20260506102032.1644851-1-sheetal@nvidia.com>
Subject: Re: [PATCH v4] ASoC: tegra: Add per-stream Mixer Fade controls
Message-Id: <177807013262.624351.14072023020143249146.b4-ty@b4>
Date: Wed, 06 May 2026 21:22:12 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cQlnEwAXRpnNanjvzfKUqX/rIx5TBMYTuUgvbOozgHw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+0s4C2Fkg9GPKPt2URXcGk6sVE2GzKwqUpfZt
 qQmTDYCk7WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaftLOAAKCRAk1otyXVSH
 0HSkB/wP2aiYrccXO6hDWncmKF7jG6ds84OhYrfdLEq/FH2k7rgU+cKvU07I+x425UcDmeZ9axX
 4fyn+nnSAoYpCrj+SOKoytOuUwxL6z/j0QdDn7th5VUeVP+CpakKAsm3xBCYf5aESf0zDToCmQc
 sMNTm3eG3e53Q7KWeyC1JPBlKcT1h5KkvuBrY1Dq7V7LuxKlcFDqTaeb/j4tjauwz7nCNrWXGBg
 Lj5VdDdr8kSkkE7CIaNsyLUyDTco1lhqLeEBElgNs1oHL2PctCc6mCqVBld8eTn0N4r/q0Hj74q
 tAJLcSiV19fJqPVrESgdV1KjBDvxMwozAx6jLjJLfTLbJ4zR
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 06 May 2026 10:20:32 +0000, Sheetal wrote:
> ASoC: tegra: Add per-stream Mixer Fade controls

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tegra: Add per-stream Mixer Fade controls
      https://git.kernel.org/broonie/sound/c/36645381b864

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

