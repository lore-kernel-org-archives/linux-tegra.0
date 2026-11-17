Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003124;
	b=OpOQ9IOUfiK4JyUi/gV2oWyFdmYxt2pg9u3uKqGu5zUziDyiA1Natf8dc5VEP/NxEXgU
	 SKtopqLODcFjqBwsJpyw9WpntdnNFC0Y2RdGj9qp/ZZI92RxGOAR2MVmVp7HlD10S/hua
	 aElX5XL9F9yHgOLZaHFZs/Ikbsiu/0q6NSRflucPZvaQ6eZ7X3tndZGXmQgj912a//nfm
	 shhFDfNPs8MmlPLHVNlleNzo6ZSX1hJibRBDfvDKIYsV4voWnws71c2qOKb2NNInHhDN5
	 q9kqeiGvC5jvhRqAsuFpZgS1LYhcJm3y81y3dsc4jixHbYKDW5hMgw5KXQ0/E/tWTrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003124;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZS094Aze2SY8BPWZxJE8SSjGDGnb/lT/lOgBCiVtjr4=;
	b=l2H9zp8dq7OzrTT12UZLy2xALYYdi0mvlWSRixzh3ie5+H7PDlf2044JZKD8k1CBHEXx
	 J36XJfskhWgvZrgy+uMkzlvN46GfEqlb7qDUqgTKdy6DUoKfHxykruDRUDp2k6wVvQrt5
	 zvO8DtTOrDYjI+S6HW00yCwwjdlNZZhxTtXPuHdzoH5kEs+RFO3DapNw4o8xp4hNlQ7Zm
	 uUgEtFsE7VELSMCol22BFeF54the/TjPMzeb3bvE+Cs8cm73606tFgYHRjHlfRARdYOxR
	 IF3omtRzw9t7civzSNN95AjPPnxODYKtZZ0hZGOMCpkqfewAMZf9rbDiUhraruzXH3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WCbjk3yc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E63606A31C;
	Wed, 18 Nov 2026 11:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WCbjk3yc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF33C1F000C5;
	Wed, 18 Nov 2026 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795003124;
	bh=ZS094Aze2SY8BPWZxJE8SSjGDGnb/lT/lOgBCiVtjr4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WCbjk3yc+VntoZeHFJFmIF7XJ3nLsNPJTRzPJMyiamUEekvELRAxvMoT71gbcVzG3
	 NK+NWCvmpFK3czDwJsNiP+k/iMN+oHpv+D+U7kkuDppIfcT7ZWFDq31LryK/dCMqsx
	 SEhW7hjxELmSBSfRob1H5LYY7c9natTHUrMvJE977TuiCk3wUUsSE/lFKEoVwIK/QI
	 sEzVN1YN+feHEOkBFUmKhG5r1syPoBakrnvJn2ICroYx+JyQcVbNS0AIrlRPR8EyEp
	 rFqTxHlcQYohU4bQdsdvVLvP35MSafWPPP5fOKrTs34PqbmRRPXVvrjngV8fjg97wr
	 022XDjYw8sKmQ==
From: Mark Brown <broonie@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20261110-wm8962-v6-c78c17edd171@gmail.com>
References: <20261110-wm8962-v6-c78c17edd171@gmail.com>
Subject: Re: [PATCH v6] ASoC: wm8962: stop microphone work before component
 removal
Message-Id: <179495900787.2707353.14778352502760821795.b4-ty@b4>
Date: Tue, 17 Nov 2026 23:43:27 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QO3ykEMS97e1gAbjEKhDerBcaa16hnTgcn97raqufFc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+Tvpw0ufI74rT1Sof38+2C1slcf32SqekSM9/Lw99C
 azxuhne3FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJGAQz/Pf+Gfsk1PbLy0y5
 a5fU1ywu5to6/9oqi6P3+kwP9BgtVOBgZFhyP0Kg15jlXEZM6/xZvmsrdooEZk8KX7PTrFryzE4
 RRVYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Nov 2026 00:08:12 -0500, Myeonghun Pak wrote:
> ASoC: wm8962: stop microphone work before component removal

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: wm8962: stop microphone work before component removal
      https://git.kernel.org/broonie/sound/c/0e2ad29bacf3

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

