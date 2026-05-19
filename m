Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0A63C988F;
	Fri, 22 May 2026 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445361; cv=none; b=oeR4SJ21W6cChxmiPstDbuHNGnMevzLOuPhjKV12MLVYRpXV50UvG7NmEhdoTPOln94eWuTdEJDrCpxdU9UdZ93mOyMlFlF+RTlM7+hmZTT6m280v/P7eSJCsePYR1rP64o4W9xFfqUEm8oq5EzgzXxO17LKhCuqyBX02cOkDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445361; c=relaxed/simple;
	bh=hIeZXSIZZkfKc9rj4LZ2qsEcjRiO4rkLrvgGPaY2XBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eijlRnNOtmFZA1AGHo0eZ/uTrEkqgXTiUhs5OTPOTMJzYEJdOhmnnKiuMFmdM62uMpSwN5WcHu+4tI6n/2EznmTEWOB3XFDNgbRKP9qIrTgg8UC0fqGQr2rcBpmn0adhp+hkGqupdCuB/s5z/v557inJTtoF7rQkk9gU7PR/A9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c4Uz54eZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c4Uz54eZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF9D1F000E9;
	Fri, 22 May 2026 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445359;
	bh=mdr+eJJQ1xD5Izla6bNFp0COZv5KOnGXBfoNjI7GR/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=c4Uz54eZyiQNUWMLB9yzZH1lEq/FZnEqu75WE9ppNPYLsddfeIREPgy+NHzS85jIl
	 hVmPZ7Kwh2BQmN6drwidB1SsJAgdZbDp3+0oP9pMo1bmJZPbi5Jnzk4o+ua3uWMe7+
	 nmXXEkSy4dzCiL0YS3ssBIquFpVKMz6BZO/0LDeT66Wp2RzfeWWx4Y7dsJFD7MwemG
	 vVpu6u/sMLcC3WtBvsoyFIZTmXLrojNNF2ipE5kZJ3cheEuJvedhq6uFpzchXYm4EE
	 oaqczBJLdwlqSt9J8FpYscx3j98asBR9PD1u+DIfKr7MydonZxY8SrcFtssltoor98
	 +IJ6K4IgHwNdg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>, 
 Sameer Pujar <spujar@nvidia.com>, Rosen Penev <rosenp@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260519094858.1426057-1-sheetal@nvidia.com>
References: <20260519094858.1426057-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: tegra210-mixer: Reject too-short fade
 durations
Message-Id: <177919749589.6167.8613168760190955242.b4-ty@b4>
Date: Tue, 19 May 2026 14:31:35 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hIeZXSIZZkfKc9rj4LZ2qsEcjRiO4rkLrvgGPaY2XBY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC5sTvXol5wenjsFqTk2dhQUNhtejZ1XxPNiP
 IsK8lQZOTOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAubAAKCRAk1otyXVSH
 0K+XB/42TO3yjZd2AWawsjb5aKzQo76+6opnAVcXUNZNvwaZCSF11p2DZ4Kx/z5REgXQD39XGmf
 TPLZOUDltDiZSxVXcoNUvpo7scoTYvqy9NW0BxqOGlgpzddNURVgicjziPwpXagXlZaAW201d92
 q3FTkF8ttVtyJKiHv5wdfrN8Eh76MCZzWDVwxSkA3v/uLUzv9vc+glRAovyt2HdbXEtwLC3vPsF
 COsrNXr/jb4enFveXoUqjeATNaaSQjeE0DUnbD1/b2HwJVbNQuCUAcppw/yqiu30kfvZxTEqX0p
 opvVWaezKU3NVdIIpxFtEQFGQnhL1qhtpNHI8niJNnhoSCBP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 19 May 2026 09:48:58 +0000, Sheetal wrote:
> ASoC: tegra: tegra210-mixer: Reject too-short fade durations

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: tegra: tegra210-mixer: Reject too-short fade durations
      https://git.kernel.org/broonie/sound/c/75a3e43339a2

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

