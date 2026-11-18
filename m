Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096148;
	b=Q1k/j/N6ZZGl745c0BadOQXpSxiFr6rUfuPVrHoscxzalpV4hOZlTNy4yB8kVEz8+Ev6
	 oYOxnDZaDPqct9/ufXhnL+8FmkJpztF8UumzlFAMgU6FdIvEHbYvGzndO/ZretqnxR3lf
	 TsBRDKJ/0ioq1wUpZ9m9+qkLvRo/nn9IQyPO16yEtF3nv345JqdRyRr49hqStBexLJmsk
	 ng26OGd3rP2j+dGHtqh9sEWh1RhpqLNax8vaH3xg0UuDwh0vru/iIfbX6V9bFbbiFaw/O
	 pDA98GDa7a294DYwl982l3urmi1H1aA3H2sF1AqWtR0PASq6I972Bt9C8ckrwPjKFhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096148;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=r5/BRB/bFSDMueqcvDqZaadifE2mjjPVo+s9CqRnY30=;
	b=szzHRmxOuEAm1+vKdGQyj0WyVhnUGY/YpdYftHrPzVaN197Vi143S6zBDNkO0bBkgtRZ
	 ZXsztgusNr9gTO+G5AQB0dfZCt0tA1yqDT5V5uh72RhF+pjoCANzvY7GFpHlWSIAby7IA
	 G9jA6SguYUa+RCAFXByFMKmwaijP+LiFQNMlmC/VPw7rchbg0FwfooZs2tgUvHpa/LlLl
	 W65zMsTznaE0jlsFxLg/y71fxwpOPEcTnoIeswEYOe7W2Iia30YHyKoSMxqeqDgHCMUnr
	 qsqZBmAe3v+x9V9DQq1zFFLOH2xRE9zxrZU+hsnKZ191H/3xkgqRnJcuviUSOqnOung==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WXrCb0/9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C2A606A320;
	Thu, 19 Nov 2026 13:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXrCb0/9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDCB61F000C6;
	Thu, 19 Nov 2026 13:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096148;
	bh=r5/BRB/bFSDMueqcvDqZaadifE2mjjPVo+s9CqRnY30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WXrCb0/9QmxbsN4dsV+ZQrplZHottKRegmpI+07GCidiKTzZXN6/4vR5WU2d0IWb5
	 m60G+g0lgFLc1Jt7JKTqAlSQIJhEXON7BrK5PG0xicAwWV+hqQRGva/mVJsGvWm4ap
	 Y25fbdNNymCU00ZqZpx/scTijVBbpTZp8xm+FN7ULscrRR3We0nHk3sAaDzpOf+z4e
	 YuI3k/CYPPSrnwSRAjc0sCThDhSlCfOOj8jGKZOfEl50RtZYtt4DDKs2xMKcj3JDbu
	 njoTl83PLU/UB/nn8kgQoHl43wmZi2T9LDCaoSTOMk1PDYgq01fVKq+LZ/7JOMknp6
	 CO8nmW0JGDP0w==
From: Mark Brown <broonie@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20261118043043.616702-1-nichen@iscas.ac.cn>
References: <20261118043043.616702-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: tegra: AHUB: Remove unneeded semicolon
Message-Id: <179501134161.349622.10832122035644095741.b4-ty@b4>
Date: Wed, 18 Nov 2026 14:15:41 +0000
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101; i=broonie@kernel.org;
 h=from:subject:message-id; bh=52Fm494a3Khpfk9ZWrOeNlMNmRZ6PlSN4utLtSQPMD0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/Qt87er8kuf+N//vwZvubGo1Oup21EnHhO+NheSzJ
 wcUbU+qdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiHQ6MDJ/nLhDeXFGzSFI7
 WOF3vIf/2+brdjLy1+eKTA0UM45+f4PhD2dW/rHXn/9yadlb7DhWxSsmZVMt+IRXrlevV157FdN
 0NgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Nov 2026 12:30:43 +0800, Chen Ni wrote:
> ASoC: tegra: AHUB: Remove unneeded semicolon

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: tegra: AHUB: Remove unneeded semicolon
      https://git.kernel.org/broonie/sound/c/d81aa3db0a43

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

