Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096386;
	b=GRlZAlfRRd8E1kzdT95UYO90OPZy5WCMofQckPyGgGc3PpOcRyWsgPNvWIpHfmGeOFot
	 jM6pxaAEy49XaxUWrhlhDDv962zvVloTD6RL5L/ZjB4WY9k7aaVuNb6gkANtz+p8GQOJX
	 IEwj7sGw9NPrBfdXzB54p8jjCnQcQSt1M4tnrN5ER1GyeCcfDqVtGrezf9obA6sQ49spm
	 tQb84OTu9/h/fpZiy8mMGcWr6HIm7nFg3PKLiRRZqys+SQsvkhURb54MZ3quDbOvRMlIl
	 dlIe6hKjhbBVkkF4AO1tNBN+iUEnpw7l85ppipbBmYhCzWXmsCcaFWyQMtaWz5jOa8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096386;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=BgPJ4JAT05hiMXemhHUkYrAVFx4ABDtlAbs3K+C/G8I=;
	b=jcxTGpInM68FJUN+vnQ7GXBHeQ+xYcKLvQ35PBLCvVqA6svhyyZG1WfN2Ofh7gV6ftMh
	 wwlyLMmKCd3n+aiU/NQBD7kW2tM7ypL6FyabXp4JPgtX8bTd/eZYA0bXxylmokak6i+Cn
	 FdlFyVTo+2EwYl6iFwjTF0hHjEJFrFBrQVhmr2AhRlAyJjQ9AU0v8VCyQiM1WxPD+QRzI
	 aBnwVqHe1YbA9OYQkQ0gPpOd+QtdWs9jDRJatydThnADgw0JTCRkFmJmsegZdNZ/esFnx
	 7kNw6nSv8I51BWn09hF85IkAwM0lyqFzpIOm3ASnd35Blaa4CHPA2ASn0j6MtMD+Msg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C7B+zUyT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C958606A320;
	Thu, 19 Nov 2026 13:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C7B+zUyT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AD21F000C6;
	Thu, 19 Nov 2026 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096386;
	bh=BgPJ4JAT05hiMXemhHUkYrAVFx4ABDtlAbs3K+C/G8I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=C7B+zUyTI23zMCF5XPDZKHWQltnSOCzUEoPBj494k3f/qVTPjdHgLgUV1Auuu4UP0
	 OP9sWZOVyE25PiHnlCaYumT9e98Zh8LKkG+dS9BVJXkRoF4xgQ5kciq+2v8vrLwIKX
	 s9MPwhNOf3kN4gKJrS1xWtK+ECKFly34WKtcceAB+FoIOCnr2XJa6XQHPIR5BsUPCr
	 QBeqlruK227sP0pTrIVgL5i0mKlEPdJkkYdoUMeTgjW6J3jTviDdWVg6yG4ODywSHK
	 MCr2PVvNjy2o8c4D8Enk3oYYbJeStcKpNdkHGhM9YNRLiBWsACJpyyEqwkKCmGMMZ/
	 Ut6efdruuDBjg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261110-9f141e6bc8-asoc-tegra@mail.sdu.edu.cn>
References: <20261110-9f141e6bc8-asoc-tegra@mail.sdu.edu.cn>
Subject: Re: [PATCH] ASoC: tegra: Fix potential NULL dereference on AHUB
 removal
Message-Id: <179502560848.810609.14658814498721333121.b4-ty@b4>
Date: Wed, 18 Nov 2026 18:13:28 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aKtCarVSUIFnvwgNx+xsDOkLUdkZWp05USNGdxGHGn8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+/bd7u2vT1byXSZ/33LlseWvb1DOz1Jrr1O6bp+gKT
 304TbNrS0cpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAm8kmR4X9amVZ/YN5+Pv+u
 59/cZl/bxtSvJnKGz2/dpdLVv7OfHIpk+MX8bfvv6x8lr5YqzsthbNg+v6flbfj55nZdG8OL18R
 n6nMDAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Nov 2026 22:32:32 +0800, Guangshuo Li wrote:
> ASoC: tegra: Fix potential NULL dereference on AHUB removal

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: tegra: Fix potential NULL dereference on AHUB removal
      https://git.kernel.org/broonie/sound/c/2ff99ddbb22a

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

