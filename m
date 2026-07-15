Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4563537106A;
	Wed, 15 Jul 2026 15:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129428; cv=none; b=Hy6+n/ZFaQQDNopw2wBKE9S4oKf/DUrq0pXJeobldtr0Exbq7hEbLR7Tp/9IdUh1/zwVPmLJT3WhjxgY86P6LI6Sw23BAIoLemmFwnhbBMZw+UJLirgtJGv+btwfxYRs/mzNDTglNR5z2ufWwhynh97knwJIKvQhPaLZNuPsWys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129428; c=relaxed/simple;
	bh=W+gadKUpvWfblgjIo0xlIOriKuf64FoovKCKpslgstA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qKYh5pU8aOV/B0Bj7SC8wC5jRU9bg0PFO6KG9sFuhlCJIkcgnqB5eED/EyaXMuvEMxEPd72WU+U5GDLgEidHgqCVYcx/51bA+cvcUn9fzkyay9Usg7t6W8IH/xeepEEHfP49xR49VrD3VES2ftlmwMxCuywsXtKwpQ05zcyThGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daxH6pfU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daxH6pfU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1108C1F000E9;
	Wed, 15 Jul 2026 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784129426;
	bh=T5WH7Pw6YoIN8oCloeuDQmzMiROiRI8mCaLxxBVXboE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=daxH6pfU1UJ69OFOvGfbHTrd7SRj4uGkf/rsERe5FMcvFFpbJ6pOc7uuRF9dFhYm4
	 IuqHaOqvDX9LgtYZqjyck6EVswxBi6meip0o/U9B2oRStqvlFybI24ECq/y5cQga3e
	 v8lSZD3+NqhAZTOi9flWSwelYMQNPpmY9XoLQz4RjYShqha/xYnlDB4/K1rP/kmCOu
	 T+C7xNVaGyGx3c4Ht+bSsapuUU3SUqVfgZFWIEWB6ZVk5XCVvMYMpOwdPtubGYEArP
	 mU9IGq9P7pG7f8v7/9+M0zAqWRyIF15w8FLe3emys2bmSAWtPqJDvZ++MmDQfYYYfa
	 JW9Rb6k6TSbeg==
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 phucduc.bui@gmail.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Sheetal <sheetal@nvidia.com>, u.kleine-koenig@baylibre.com, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Rosen Penev <rosenp@gmail.com>, Piyush Patle <piyushpatle228@gmail.com>, 
 Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20260715051115.17385-1-phucduc.bui@gmail.com>
References: <20260715051115.17385-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: tegra: Simplify error handling
Message-Id: <178411975353.5968.4165896652354439644.b4-ty@b4>
Date: Wed, 15 Jul 2026 13:49:13 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W+gadKUpvWfblgjIo0xlIOriKuf64FoovKCKpslgstA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqV6ePZuZH9/LCvzO/p4E8Hu//jrjBmtjb6CjJ8
 3ezlwJImFuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalenjwAKCRAk1otyXVSH
 0Gx+B/48OPGtYwcvC9R0d+Jon58ouiz68MkNLxqGzzUBcKJ1oLsLV2nFXb5i80vpWkxcKnu9GZc
 Dmpt7d4mdiRy4N1/lFvR1bWWGUAE9gESFpjrLZC1ENmuCMVAt8f6TR8DjVuXycDuUVRSy6CzhCy
 2jEEDenMYVQbPSGwsir8B7zZapSTbLszmTBQJsHaApjfnbVS/sfrEAWv/QJH0GwTJ23QgQLKSKV
 0/wZdrpaYNyzihGC+NTTNWLE+pOO+vF9zyHIY6bg3pJT73Z11P7NrDz2DkmTvTl5FRIvG86eE3g
 2y8SX5iEyu7UIo9BHvNpYYnTkRvEzpF2NvVyJxU0thQqdZh6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 15 Jul 2026 12:11:11 +0700, phucduc.bui@gmail.com wrote:
> ASoC: tegra: Simplify error handling
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series contains a few small cleanups for the Tegra ASoC drivers.
>  - Use dev_err_probe() for regmap initialization failures.
>  - Return the original error from snd_soc_add_component_controls().
>  - Use devm_clk_get_optional() for the optional sync_input clock.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/4] ASoC: tegra: tegra20_das: Use dev_err_probe() for error handling
      https://git.kernel.org/broonie/sound/c/70d0d7b24d86
[2/4] ASoC: tegra: tegra210_adx: Return the original error directly
      https://git.kernel.org/broonie/sound/c/b82384bffb27
[3/4] ASoC: tegra: tegra210_amx: Return the original error directly
      https://git.kernel.org/broonie/sound/c/f7cbc51424cd
[4/4] ASoC: tegra: tegra210: Use devm_clk_get_optional() for sync_input clock
      https://git.kernel.org/broonie/sound/c/226791fa6dbb

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

