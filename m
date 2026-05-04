Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D193E282F13;
	Tue,  5 May 2026 01:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777943389; cv=none; b=RxpTxaBo2UNjSS6GOUHjre9yYPmrxIWbJ0PgrJfd2e/LgtrT9s2zq8Rh/NtQFKbvFRvgeOEX+CPJljwQZjqITEIJY2D1W43S7iotIzxSiZb5EHTCcKrJuvMmhlcGE2fLEe9sAzp4iJ7hcqD3811hvTHj214UQqvCVJ3vlqwwfGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777943389; c=relaxed/simple;
	bh=uA0zD1vMpc24aJEhxRcc5ooTVhI0mhN+ZJ8MCcePrlE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KSNziLXn1WeXwovTPgnp3myhBEo3ToHGUNblvxU1a1OwyYkCtrWA3C7IUdwhK1kUPdZ7JD5ay8sTCmgoDTk+ZElPZRnCAY0RkYU8Ztl1qaMj0wMLkwbv1feVoz7W5DBeZf7y/7mNaRdchddZq7crPEaQHTTh2L+OmGdN75q8yrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xx8kGxiy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xx8kGxiy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACBBC2BCB8;
	Tue,  5 May 2026 01:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777943389;
	bh=uA0zD1vMpc24aJEhxRcc5ooTVhI0mhN+ZJ8MCcePrlE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Xx8kGxiy6QsfCyJcJPeUbryYPzcdq7rHqAfCRHqxa3BkpL7dD9imQv3adkFaKD4CK
	 m6T6SPFtfQytBFNzT215/s7T2d/s5IZJJnw1vOMw1THI0ex8UlPk/lMlqFDz6OJ1ej
	 qtXu11tVBw5Hebybbh6OgfHdABOzSGlPjIVJR1y8+oloGDa3uEnopC77khK0b7vOr/
	 qAWK7l/mKVDcHVpgc6tb7s63Xf6+n+19WCcrpsAGKWwVwAVfvIrpyAeNMryry9dcP0
	 4GVcXccCtMaHwbUfBjoPO0YagDVjTEXXGR+nZl3raC46dDPEgXo9c3qndEV5Ge3ilP
	 4Zt50no8VNkZQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260503003037.11942-1-rosenp@gmail.com>
References: <20260503003037.11942-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] ASoC: tegra: ADMAIF: allocate with a single kzalloc
Message-Id: <177789971653.458539.7304051237550317105.b4-ty@b4>
Date: Mon, 04 May 2026 22:01:56 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uA0zD1vMpc24aJEhxRcc5ooTVhI0mhN+ZJ8MCcePrlE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+UNbwEBE6yb8jJ9qJRXuJXP1+MncX7PC53pys
 8qZ1zIZqjKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaflDWwAKCRAk1otyXVSH
 0ANpB/41GOe+dCeLeSLpTUfO9j7cYX9viLeQ6Ipi8HHXX7T4iGH3Pl/u2mFxZR5nhNeX+Znsx74
 RGWFPIrbyc00OxyoJF6f9CQziR91H61F+UIoyj4MawRJAHfgLYCE1j+zuwVNFinrKH17/51CzsT
 H9xFAsFK8Hg1jvR40pChWtoav/smGBmoJJjMNB3d2JKSF97bnJX7J6Q09umnXfe2VZ6ewXiu7lw
 6CL12pDVK7b8srx978SLRQrU9pXUCejGafnlKklTF/1zJXzDULH2TUTCJBDYfDlFO8DvLz9aObJ
 XAaOQryvlpgbmf7o4ffUtT++zuaAJnMpUStkYYM5k9KDgj64
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 02 May 2026 17:30:37 -0700, Rosen Penev wrote:
> ASoC: tegra: ADMAIF: allocate with a single kzalloc

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tegra: ADMAIF: allocate with a single kzalloc
      https://git.kernel.org/broonie/sound/c/7ff50c1f3183

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

