Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E33A30595B;
	Mon, 27 Apr 2026 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285238; cv=none; b=UoI8b6OwoI3ouB+5J5wD2xYb6KzezioypSxz+dXzButyJTGwbZlKRP5NuzB3LLFh1PFJcMdxVo6i5KiDmfcociMOz7q7uvXZ+B9U7LmNKb+VkOJ2dlRNgJa+YPjrepiogOW92ya2rtFesNi8WWoez7IYs6euw71d5DWZ5H7hyBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285238; c=relaxed/simple;
	bh=bszn0WeQ9Yk2g4C46bVnWicvOk5rkB4Pj2aSnUx0QiY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qHxL78/QGGkHAxCehOGX/6SUmP9RpPhzrtvJI91lcuMhh4GpIRtmtZLjPkzIvS5DkcDtORblNECYmM0vTwIJJpnKX9n7gddQ7mPvHn81Y8aZ/Ph4UdiPsQ6A6Nfz/LZJIsvGhNIYqpI46cD1kZ4RspewdnGvk3kAjcmMSj4Gjf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+YWrnid; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+YWrnid"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F1BC19425;
	Mon, 27 Apr 2026 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285238;
	bh=bszn0WeQ9Yk2g4C46bVnWicvOk5rkB4Pj2aSnUx0QiY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M+YWrnid2mkIMYkvVeV8OXmCNMS8NnnGepaB+aaQmcDJzcSsei3oi2rpCfYqewD/w
	 0mquFb/H0LQbNz5iR22z4Pm/g1J4eyyDZpCnmvJFs9xy2bsz09IiCzrIqoL+riOsP+
	 vVNwFunSDFmqCEeIcvzQXLDjlXWHK6rJP1MRjlrJLFsFBs+9Rg1ooncOLKrn6K9XHL
	 eOzZzcdGNIwy+KpR8IdmBarU5ObZ2u0bdeyzcj0F9krL9U76jTwkD5C49oNIBIgVUX
	 zxPJUOynl2wzuHizeJl3m9bvpGXpXlrwggiyv4CqMYZmgEA7PGJkYrbG1xpmVsgttY
	 YhrTXHCXNWcyg==
From: Mark Brown <broonie@kernel.org>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Sheetal <sheetal@nvidia.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260410200530.171323-1-piyushpatle228@gmail.com>
References: <20260410200530.171323-1-piyushpatle228@gmail.com>
Subject: Re: [PATCH v3 0/2] ASoC: tegra210: simplify ADX/AMX byte map
 get/put logic
Message-Id: <177724647857.266775.1668725665276519718.b4-ty@b4>
Date: Mon, 27 Apr 2026 08:34:38 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bszn0WeQ9Yk2g4C46bVnWicvOk5rkB4Pj2aSnUx0QiY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7zhymwhwKRDdC6cqGKiXWYoI6hxaJRW9VgsJQ
 egWTeSUNReJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae84cgAKCRAk1otyXVSH
 0OERB/44gx4h9RuumJb+lZj5/NBihobbn/lkfxZ46/rlX7Wa3wNrsSFJXt2sr34TsTxRM0+nLK0
 ue/uYU65m+4OBDJVp8HYrQanf0TlK0nKAFprbYvrhItB5q39atdJDxp2e01lKagFumGfhORlYNG
 Hjt78hu9eixcE6Yifh+exGBJlb4iZ7eDowSie1twqhzScRmtS/U6nRhU088UN+B/xI9dbirY3lk
 Cxby/ZgOHnEabtAY00dUIi99Jh8NAqwdkc7/PxtPPmgjO0atPg9PTbOC651gcLClEDcJaHys660
 nLshNiNqRxe4ynO4uKogdMeVf0+Sk+qIUi48lrGCvwibqADH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 11 Apr 2026 01:35:21 +0530, Piyush Patle wrote:
> ASoC: tegra210: simplify ADX/AMX byte map get/put logic
> 
> The Tegra210 ADX and AMX drivers both keep their "Byte Map N" ALSA
> control state as a byte-packed u32 map[] array along with a separate
> byte_mask[] bitmap. This is because the control range exposed to
> userspace is [0, 256], where 256 is the "disabled" sentinel and
> does not fit in a byte, so the two arrays have to be cross-checked
> on every get()/put().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: tegra210_adx: simplify byte map get/put logic
      https://git.kernel.org/broonie/sound/c/0c1f5e6e7b03
[2/2] ASoC: tegra210_amx: simplify byte map get/put logic
      https://git.kernel.org/broonie/sound/c/445af52d4caa

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

