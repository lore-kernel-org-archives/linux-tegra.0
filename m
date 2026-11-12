Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500877;
	b=WU+aqz8FQp6wMwZS0g+QeHaOAL9mPxeN10I1Rro7WE3P/vUbBFyiue4wJ/WHWBFt6kvm
	 wJNywEvm4BsjuMXMWwRIhVWX8yZxZRrvDkyfKoynV5vmr9eWLAYouusyGWV/mueQeDCUE
	 1sq8Uv7nN3Oj8rDEVeFZ3FqyN17BO+upwrcjKKrCG2w6wU66pifl+v02Fe59VbhmyFUqY
	 IWZ3MgQffHGl5c7afuPTGVp0df497++GKB1tatvzJ0fu/kjSnvtqyPBYHPuwtebM3yTUT
	 FFenqMKRe1wHVnXbvg0EYXJL0g6xvtWiQKAhH+gOJUg70doA5jRw/KMYtY8jBOS2hdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500877;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9rS5+m6C+TeApzuk+M1sIajivZD5dZU1iOAPQkbHwaE=;
	b=dKt2q88/iC/C12Fb+p/tGV7ID6cLXX8fnGwGu2DLzkRrBFU+5CvyGammvwB1xbm/hfab
	 icrqNlfUBi4jUnGs/5MWoC3RrmgHHdzVqlNZZNuoQC6pcgPd7Q+q0qKAWNbOKEeAe0cpp
	 nqSzxnvHfBahG+/TWx7TcDBHxtUdVgVulcc3Hyv8rgrVwLVboeyDL/bPJm/9Vslgi59lq
	 QWhBYPXf927LTsskxj/nF34cguc8LqyoRnrEko57pw8UKaQd7V8aGR3c5J/ArYUE2Kf4O
	 O1DcmdvgfHZ62iOmtRegSuvVTt5wnyAyLlbT+7mW4q9lALgP4f0q5e7yOe5Hbeg2v1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz36fHv0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A4D606A33B;
	Thu, 12 Nov 2026 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hz36fHv0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DAD1F000C4;
	Thu, 12 Nov 2026 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794500876;
	bh=9rS5+m6C+TeApzuk+M1sIajivZD5dZU1iOAPQkbHwaE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hz36fHv0utvgdYiLJqrUezgfP6OdrDNmJR2G6ITxe/hFWB9qWDhkalxx50vzg3cJ+
	 HwFxmYaLmG1M4FKF9g5R4HTpFOG0WYd+Szz/hnLZU++2BhtKJcvGOWyhxs8IEgLMzY
	 yRnVVjhzyzV+zwrgTQkn9uxDDB4AZBhW4HHb1F2mAXdcE6hCIH5aOwiJWPuwdqOlKY
	 +FC+6CjpcFhCZmW7wG9sEjt7NmPLdPuUShlUx4+sbIfTCF9KqjfIgZfGm2Jz/9avMf
	 m232Y7PVb7lxCtG5IslsFIAWHFvQ16Bgdj+L7psky1AwSmO1xzlnf1IEeuNO7ny5Ut
	 haK/b9dqcL5CA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>, 
 Sameer Pujar <spujar@nvidia.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104112055.1101243-1-sheetal@nvidia.com>
References: <20261104112055.1101243-1-sheetal@nvidia.com>
Subject: Re: [PATCH 0/2] ASoC: tegra: Add Tegra268 AHUB support
Message-Id: <179449098998.66517.7468449297091354263.b4-ty@b4>
Date: Thu, 12 Nov 2026 13:43:09 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1607; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XFDmM2Nqh88W2fbIJryW0+QnQhHbeITBFmfjBhlgxL0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+vmTXuluR+0W3tVozKPK7uEFFbM6NC2sqHX6+XLjms
 6SXwrnlHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIslWMDDuf7nrBt/eD4Jez
 klM3VQrVGdbx7mnMUrxYvFsielZ+wTZGhvMy+XYlE71/a77Ir9RQWJoSv3TSge6djo5H9L5tu3F
 XiQkA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 11:20:53 +0000, Sheetal wrote:
> ASoC: tegra: Add Tegra268 AHUB support
> 
> Tegra268 has fewer AHUB interfaces than Tegra264: five RX and five TX
> ADMAIF interfaces, five I2S instances, two MVC instances, and one each
> of AMX, ADX, MIXER and ASRC.
> 
> Add the binding and SoC data with DAI, widget, route and mux tables
> matching this topology, so the driver exposes the supported audio paths
> and uses the Tegra268 register ranges and source masks.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] dt-bindings: sound: Add Tegra268 AHUB support
      https://git.kernel.org/broonie/sound/c/14b58324fe16
[2/2] ASoC: tegra: AHUB: Add Tegra268 support
      https://git.kernel.org/broonie/sound/c/d796155972bb

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

