Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447116;
	b=VRBeqvjtm85Cc+q/kZIgm0l+UQH2sWW9+vYzAbDn+DnrOow7tlraVc7JzbYGa8fnHSDt
	 Y/s3xy4TsFEkeTWTg8TpVps6w0l/o9cvubQtwSce9YAiF7f6aLJFnnNoAt6SSbDkhcJE0
	 KOkjsg04ksoeTwzPmrrjUgkt0pwCD/AFq49OOODN90/XaATI76W0NdNcp4SvPa7K9DZK8
	 cKS3YAVgmMw7RSNk9lJIboaGYsa2B/+G0Xp8Cgk5YY2olh88JPDpmcJWyVZsjhEjQLk53
	 rpsHZSnrl659uqqj0neiGPtJyOT521cdh6GQiI2kzVvYXyO/VGJ1791/H4ARhz8uUPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447116;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SlJbtR4vJabviPLrcICMzQ7Np+ApSFSu5x7wBVNovDo=;
	b=kSP7qH/20xa4mqpXA6fBcdN0cP76RqVFy6R89/gwuM4Guet8NdjVKmNiBBHOTghr7YC9
	 2q0wnMRMkzGI5zEYa8jztX7ts+ZaQSudS3Lmx/aOk0gzmXQ4l41Ik4CXy8A8J85uGKn30
	 et6rLQWYd22fQiBakwWKGMAahu3y2wCPJ4xEN91GLoNCvTDVq8hTrYPtZJ/F9i/+oRYO9
	 XndQJz1oKu3wz1YkfJAA/uIbiKWvOnAPSU4SEkHeEWZtJmZdpgW+UZrwDxFo/hDrlN24f
	 ZUNdGlAXjAYMsboF+shuOYjgkUSGBGjgYDL9S8UU3akbIu9sz6PLXb/UHHwSk8wTBVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUERhlEn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D8F606A31F;
	Mon, 23 Nov 2026 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KUERhlEn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA5A1F000EE;
	Mon, 23 Nov 2026 15:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795447115;
	bh=SlJbtR4vJabviPLrcICMzQ7Np+ApSFSu5x7wBVNovDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=KUERhlEnPCPz3strsxoaEp6PhQhFo8TuHgCTD3X74mtjWy5EqqowdpLGR+cYsD1lE
	 DaHc7LU4xVSbtEIOKmNiQbCiUeSjIoFJf2ZpxsTbawCaWgt0Ng/9yDIk2q1l+rVY0d
	 xPv811xx8EvwyqWs85sF5xTCKaudrS5js4dOTq1Y3muvOG+0+cxtmCsKwHC8Oh7b7G
	 lgJDdL9wPH7zxyerxpuJJqp30CMBYD3OCOQPFtD5ZecYLSMGEA2bkz5AvR6+ouTxSp
	 fylBQ50avgIwZwpH9BefnxUDcjS0xctsmd4wP3/ZoZFDHt2DRh7vB05tzUYR2qGu+H
	 3dw/TuKdENBoA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jon Hunter <jonathanh@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>, 
 Sameer Pujar <spujar@nvidia.com>, 
 Anupama Kunkulagunta <akunkulagunt@nvidia.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261119122511.1324643-1-sheetal@nvidia.com>
References: <20261119122511.1324643-1-sheetal@nvidia.com>
Subject: Re: [PATCH v2 0/2] ASoC: tegra: Add Tegra268 ADMAIF support
Message-Id: <179544425406.25092.1108502330837285599.b4-ty@b4>
Date: Mon, 23 Nov 2026 14:30:54 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1662; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IWzyjEDHLM3EDgqfNblK8eJJ+St2aBsMzlyxnO+PUuo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZIt3EKlPsp17TVn9t+LCh6dWP/gYLh4y+0A9R0xpnJ
 0eZ1LN0lLIwiHExyIopssRlcb+sL3m9hu/gwjaYOaxMIEMYuDgFYCK1bYwMU587mDz08t9xfP/D
 zc1r+qfr/PA79jbF/9rx/4/s1q419GZkaBH9N1PM/l7MJq8UjmlRh7uzQl55T7YWUg27vqmpQmo
 dJwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 19 Nov 2026 12:25:09 +0000, Sheetal wrote:
> ASoC: tegra: Add Tegra268 ADMAIF support
> 
> Tegra268 reuses the Tegra264 ADMAIF register layout but provides only
> five RX and five TX interfaces. Add its binding, SoC data, DAI and
> control tables, and FIFO defaults to match this configuration.
> 
> Changes in v2:
> - Reuse the Tegra264 register limit (0x205f), as Tegra268 has the same
>   register layout, and remove the separate Tegra268 limit.
> - Use the ASoC DT-binding subject prefix; no schema changes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/2] ASoC: dt-bindings: tegra: Add Tegra268 ADMAIF support
      https://git.kernel.org/broonie/sound/c/18dd7729be06
[2/2] ASoC: tegra: ADMAIF: Add Tegra268 support
      https://git.kernel.org/broonie/sound/c/e30058ddec99

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

