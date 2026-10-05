Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA38B3DDAF1;
	Tue,  6 Oct 2026 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274360; cv=none; b=L7HLvNiQm9lyNqaZQ8w+Llzyjq4JoLgeEPOfxaAvevlVmyFxoEHPbVv7/89a9Wkm7SN1iH2RqbZRguu6blK5PvQNU6Z/hpwvzB+p5MpruGYpmvn8ddUFQ4ZRV6+OVeBdKXe75DD1qRnr9Xp/Qz8Pcc3LrqsNsbGxG4xGzz6Hq9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274360; c=relaxed/simple;
	bh=6laCNducrlQIuUfTW1Pl5xGs20LrBYCb5yjwN3yH5zY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aTBjjXDM5+is0WvYlxemwJaOtPsTxRd7uXPWsKUxiptF/YwVSLYdqtFtX8P85hcftrfZXhV7we0zXThhdS5MnSrhOZNRW/CEHR1rcoJTmvW2oWV0pJUvQvCrRhOLAQAJdoDewIwvuCGuN5O4zcsrRkipb/CfFS/Eg7vPhd9Lc5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHUJjRoL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHUJjRoL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FB61F00893;
	Tue,  6 Oct 2026 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791274355;
	bh=1UKPZGVftnngik9wiYGUcB3T5U+eILqdgpzyMbQtImk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UHUJjRoL6U/yTaODr1EvX3znlXDilCNMeFcGCffOvwZEL7HCHryji0AeWwiEgrZkC
	 FvOqrMJ5eTYQUkA7h1VDEK25RrGAf1ISDn2tqbKl4ZtuTMLqx/K3MrToJkgMPWzHDj
	 yqaoIiyfr3LXplu0SyiC9h4IZA9fGJLWvMpu+X77n6tzqhb3oixFdPhi+ZZYYKFEu3
	 UqcxhDzjvymC3rE6omVd/AJlTQwbmKFYdFxr6QYizNXWUfWtU+jgM8oWQtgoB5X6h6
	 Qw7ttZsEMP0+AUWc6Jrt5xPdPv53ReMb0ObHQqSaqTexPSAKl+YVppvIBYiQS8iqY/
	 HcVWl3pqyo33g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Mohan Kumar <mkumard@nvidia.com>, linux-sound@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>
In-Reply-To: <20261005085559.2134401-1-sheetal@nvidia.com>
References: <20261005085559.2134401-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Fix ASRC Stream6 input threshold control
Message-Id: <179121384770.150114.15968526281019490375.b4-ty@b4>
Date: Mon, 05 Oct 2026 17:24:07 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6laCNducrlQIuUfTW1Pl5xGs20LrBYCb5yjwN3yH5zY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqxK1s8h6n6k56fELaE1JIK20r6NDepoZm6VH2Y
 p0jQm1WDK+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasStbAAKCRAk1otyXVSH
 0B30B/sEnWvCCgEclVEXQW0EKchUkJo3FaDNhGPwla/9uUfEJMW5iGgzZdwjOfnsEkNTTlPQF3V
 Xyw+assGoNXElEubIBplHQNgycxeMWryvx6B5iwDOeGmU1l/ihMmhtJHKSiTz8pvx3jERPctoVX
 rwy6cacZImxScU7fW5zNv2fk99EGlQfJ66rrpAm8kFEw+iAuUAH4oIkYs9L81wiiIymmnJTp69+
 2Vs6M4hf7iPo2B5H2mTh3nmZuMmnDVJGL9NSj+67fnOakKgOJT//ZKnh+ft9rnxB0jKs2PsDsK0
 V7QYGt8uLioO6unnKTu/ynBv7wSoLv379H0X0+aubDLcJgQu
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 05 Oct 2026 08:55:59 +0000, Sheetal wrote:
> ASoC: tegra: Fix ASRC Stream6 input threshold control

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tegra: Fix ASRC Stream6 input threshold control
      https://git.kernel.org/broonie/sound/c/0504e71cc7b8

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

