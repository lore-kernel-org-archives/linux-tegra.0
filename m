Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264205;
	b=QuZpWFSjdBhEsHPgPZ89Ko7yapVN991GPObr0maXlM5knGUi9aWa3L0qMUxxM/U31enX
	 Edmo+VbiotthgbTwYoYrNAXGFeNMmMAbeasOMRnexWVoJGIQ42jKIBAC170CInH8wQRhP
	 aspymcweauQHw3so/BFuiaGfTbOVDg+6T1nKlSCLxQ+YnxFO7h7NiQsVgXrjGxLwRfENo
	 iS5aE7LRFe91wBEWFSQdBazpc+CA8Sgzy80P1KEWXChOMdv7biI+T/7sAV0tq2C6Rzr7n
	 MXYeVygTxlavepyeAa8BJGsrvE36KQNPIY6ll0oT9eKYVRkKqU+8DuXS+mYuDt7Re1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264205;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=f33n0TKV6Gl6OltgqwE+NfftpSuDKX7bv0O11aGFdNY=;
	b=H2fIV/uRXGzaux4ZM20RriHzpOrSC+rxQqE275HE/s0rreymfrYr8tcsPaHhIzTB+Wcz
	 m1xULxf2q94ldV+HFFpqmtsYGM4KFnhRVUJ9kR9oer23FVyiHqnBemY5nJHpEiEiiZiX2
	 K5cpDxmC8oXGAi2mh2zgaLyEBvW15C9roUnwGRULB2QhQfVF6KbL/6cq0MfML3ZURtii6
	 xtLD3uU8k8pqoK8HDtG0w2HzWisNtfqR10H73EBj/S7EtNnxRj7TizTqRtA83Sr6qAuNW
	 jblXduzrWDTeVS/3gZGqrE3vw5a5y6TVevMWdshqYv1wCRqsGxIvMeI9CJvw6NTX1og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9oE84ui;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF28606A321;
	Mon,  9 Nov 2026 22:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9oE84ui
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B97F1F008A1;
	Mon,  9 Nov 2026 22:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794264204;
	bh=f33n0TKV6Gl6OltgqwE+NfftpSuDKX7bv0O11aGFdNY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=F9oE84uiJ3ulyffmPfjpC5JbiiRkrhp6GQKYbuFfEF44M/I6h3pm2W3EofGdyLL8n
	 DQVGyFAzMUadSX9PFO1Xus72lPTMYonUSeAQ9s9BjaW0IkjpITtdhmHQMeFijxUzlr
	 y/kGgILD5hSTZpBTNaLF9deTDVYZbAbSHlz+f2TiujeA/TWjDORAWIRtf9K3HXHuOn
	 00mZYA3I7qB86tcBhil/ihsEl4CasbLxhWJnk47l2VaKthIePHdFp2f9URoI42vdkh
	 hBq/FIJZfIGP4hqjUEvaajrxSvAq8J7CSlvbABTppFBQB8GA81iTqBZl7ufBYRli+R
	 miStDme8ygOEQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 2F211303EFD1;
	Mon, 09 Nov 2026 22:43:21 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Mohan Kumar <mkumard@nvidia.com>, linux-sound@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261005085227.2133834-1-sheetal@nvidia.com>
References: <20261005085227.2133834-1-sheetal@nvidia.com>
Subject: Re: [RFC PATCH v2 0/2] ASoC: tegra: ASRC ratio control updates
Message-Id: <179425146879.3711751.16122870776630483225.b4-ty@b4>
Date: Mon, 09 Nov 2026 19:11:08 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=broonie@kernel.org;
 h=from:subject:message-id; bh=r1Sk9HBUffEJCcd5ARTPXxYQ3SAA+Dbt8K4M96lYBxc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI++XSuLW7Q4erlqJ7f5Z9+UiVJVPclY0qeddyUVw9j/
 //aFyjUUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIk802FkmDDFwt1ycW7h0kun
 3r/JnaLZKf01JfOK9+boBbIBQdushBj+xykKtjPrqDHOPii9J3bPbq4bMrM+7vyq8YIxZFnZkyM
 rmQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 05 Oct 2026 08:52:25 +0000, Sheetal wrote:
> ASoC: tegra: ASRC ratio control updates
> 
> This RFC updates the Tegra ASRC software ratio controls so userspace
> programs the integer and fractional ratio parts through one paired ALSA
> mixer control.
> 
> This is a userspace-visible ALSA mixer control ABI change. Existing
> userspace that programs the ratio with separate controls must switch from
> the legacy commands:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: tegra: Update ASRC ratio controls
      https://git.kernel.org/broonie/sound/c/318362fc175e
[2/2] ASoC: tegra: Cache ASRC ratios until streams are active
      https://git.kernel.org/broonie/sound/c/ee15f439e255

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

