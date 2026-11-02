Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627485;
	b=G7tZj/CkR9abP+mQA2btWz+ZVIDGWD9nw0dQNyzMYhm6ah3203ro5T0MmcxTswPHC0UJ
	 pBSuzRRPv25q54IMdLOTl1oGm0vEeTS4hXza5VLjedzNIgzorlfr0v2Qz/vJX6P2UXxS8
	 0Zk3NM/lroP0pQ7Smjc+K6kiDnvDipj898c60mR+ejT9kWO5A9vwP9xNCQH07gbO3Pacy
	 nppWgLR/grc/4tdgrUMge3dJ6kr81k4u28cwUOBJgd50oQo3EUxH3J8c8YM7IAMn/XVJO
	 vCllKEenqjKpOD44tZyBMbQeYsMt3imVIlPmUk+FhNkkiSUNHzz+AC85QHn0CWvRtLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627485;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Rsp2/I6oLUqSfepRJrtJH9nvp1cEQExeI9GR+XaSi4s=;
	b=ydLowllyx1ny9zAmCzyLyemJqnilnpGWY6SGtZP//KZl/IMzZjhWE925qm+ncJdAH3lQ
	 H2MFWiAUNQ7urAnsldk1T3qKkDQ/waKGjhB7VztVebNRuuspOcdc9uvADX9Ke7YnphAxm
	 wxHadH2O3xxn3x7ge11ERhWqBqf0j9SiXDsfZjixRHcWFohCwpaQ/wjc8RuW9rgXMr5fx
	 ghiXB+V7Mg3Rj9/EjqqDnYmI214QmtEbxXxBGil9CoI3KrkEpj7JwHISbmVjjxcoQ3YXX
	 6KY4FKCwCWdoq3ER8v+qLox4xhcxuitlH4WjcXt5E724a2hmDxYjFpV48sxrNJcIaCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DfdTJX57;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1327F60A2631;
	Mon,  2 Nov 2026 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DfdTJX57
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CC81F00A21;
	Mon,  2 Nov 2026 13:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793627484;
	bh=Rsp2/I6oLUqSfepRJrtJH9nvp1cEQExeI9GR+XaSi4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DfdTJX57wDmtvXDJyZpVVyMHR5jXy0Stk2HFq8PFJIK2VZXyr38ts8E6fDu6bfNJN
	 0i0Pt0h6ZV1SPNRevT8ssH8J7x+iqkzDpeSlrdtiFqXvNc71LdcKgGhTHpNTdLc8ie
	 ny4vMdTqI2ZNFEMQeRANkCMNA43nQzc0LNVWiwMpdFFo79Awc54f3pTSEM5KPIAyYl
	 LtizRuQzBxPK1aLkVk0zwICmp4pPH8Y/dVWEGNBUPmdxSrw9/3j7aayQabqYf4QJcN
	 E2kJxV0JrO4N4v3u6ugXqvcAIPNIsKsLEG3C3TcARjmAlemSdWyJKd3pmG4SviE09i
	 IG0ZKWY9Nj2aw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id D0AA42344CDC;
	Mon, 02 Nov 2026 13:51:22 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, 
 =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
In-Reply-To: <20261026201915.57184-1-amade@asmblr.net>
References: <20261026201915.57184-1-amade@asmblr.net>
Subject: Re: [PATCH 00/12] ASoC: Convert last few codecs to set_jack
Message-Id: <179357918593.1716893.16516926100444467819.b4-ty@b4>
Date: Mon, 02 Nov 2026 00:26:25 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3034; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3hHRH624UxTH7M49+vF+kk34nNtOnc/54I3MI0Yj3Wc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTI1qrm3OU9RiXyjGy3hHTnvr8u6MJTkPFJe1vjkdK
 f/0xpIDHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZhIki/DX9msjvvbloqxSHjc
 fNS6JvdQybyEdWrz0lL/lm1ukfi1uJLhf2r7gvnTlpxLzeBraG3fHtcZ3dC6vFf88QKtRO20O4e
 TGQE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 26 Oct 2026 21:19:03 +0100, Amadeusz Sławiński wrote:
> ASoC: Convert last few codecs to set_jack
> 
> There were still few codecs left using old method of jack detection by
> exporting public *_mic_detect() function. Convert them to .set_jack
> callback.
> 
> First implement the wrapper around *_mic_detect, currently either none
> or just one of the arguments is used, so even if function exposes more,
> wrap it, by accepting only one. (If in the future there is usecase for
> more arguments, it can be easily added, by exposing jack setting struct,
> and passing it by data pointer.)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[01/12] ASoC: codecs: wm8903: Implement set_jack callback
        https://git.kernel.org/broonie/sound/c/a4caab7d56de
[02/12] ASoC: codecs: wm8962: Implement set_jack callback
        https://git.kernel.org/broonie/sound/c/800168760d8c
[03/12] ASoC: codecs: wm8994: Implement set_jack callback
        https://git.kernel.org/broonie/sound/c/4a6580462040
[04/12] ASoC: tegra: tegra_wm8903: Use standard callback to set jack
        https://git.kernel.org/broonie/sound/c/a0fd49280f20
[05/12] ASoC: tegra: tegra_wm8962: Use standard callback to set jack
        https://git.kernel.org/broonie/sound/c/ef64cd77d560
[06/12] ASoC: tegra: tegra_wm8994: Use standard callback to set jack
        https://git.kernel.org/broonie/sound/c/d62ba82ac0c4
[07/12] ASoC: samsung: littlemill: Use standard callback to set jack
        https://git.kernel.org/broonie/sound/c/e239f7051461
[08/12] ASoC: samsung: midas_wm1811: Use standard callback to set jack
        https://git.kernel.org/broonie/sound/c/acaf89519907
[09/12] ASoC: samsung: tobermory: Use standard callback to set jack
        https://git.kernel.org/broonie/sound/c/8d1075ae5a3e
[10/12] ASoC: codecs: wm8903: Make wm8903_mic_detect() static
        https://git.kernel.org/broonie/sound/c/677bd4322e5b
[11/12] ASoC: codecs: wm8962: Make wm8962_mic_detect() static
        https://git.kernel.org/broonie/sound/c/cc0b45ca04c5
[12/12] ASoC: codecs: wm8994: Make mic detect functions static
        https://git.kernel.org/broonie/sound/c/36b7514ec139

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

