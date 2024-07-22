Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63563171090;
	Mon, 22 Jul 2024 19:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721675549; cv=none; b=kZgWGJIFriBUO1BCbGSAxajlRN5CpaeCTrOuNsp5Uh728kNycVRo0NraBAi63ct3zBFGNMh9nk2+pqqZm+8qfscMp08N2znMWcCMQvgOtKIIgh1cbGypyvSjTydqHZbg1w7bBtQosF7SDg0MqRfNFSh5EjRa/FCfGbjdt9166SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721675549; c=relaxed/simple;
	bh=tt7nBCTkE08woPcGBlj1kAwJ+cvv//ghyZPhMNwcEfU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JbhnIjy937f3CoDHoIjC2wUZqO9LAQNBTHijS8i5V9Crp0fvWCeY45dJpAZ9X1j/dYRs3v6FnWdE0sAgltSYKOvQUeyqzfcRMogw0QCf/Ivge2sweRnaf9AQJ8X/z3+prZnOVZV9AT4uNFZIiC+Pq7uRGoQC7ezrrckk3U2OsUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGzII5Cg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGzII5Cg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78164C116B1;
	Mon, 22 Jul 2024 19:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721675549;
	bh=tt7nBCTkE08woPcGBlj1kAwJ+cvv//ghyZPhMNwcEfU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HGzII5CgcYvIgbwkJMWOQ0TiW3NE6s9srOT1idXfehlpzwwssns4xBuxOE3MgAuPN
	 rxXGJA42q9jiiJ6mDhv1KuKgKRrrMiFBLQ7hr+Exr0tUdKzQdIH2/fYR6qvNdMCrwc
	 oAbSsIeOm+bYaLzuGP8JSCDggt1sZ9mPOWZ/uuu3gS4UKDgcj6RYfMlkQK04qFVTRv
	 o0wiB8Ao0nvJHTq5Nc5ByY7gR/VCoBvF2ecRaXvxvmjcjhA5oRi+GX7eJE1W8oSH6h
	 iDQoOA5DCd28x/CxhyukicKypcGrCe7GWurx4Iw23iZu8ntd4gEUmUvvwp/koaI+u1
	 8vvPibwzOA68Q==
From: Mark Brown <broonie@kernel.org>
To: Mohan Kumar <mkumard@nvidia.com>, Sameer Pujar <spujar@nvidia.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240719074831.3253995-1-arnd@kernel.org>
References: <20240719074831.3253995-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: select CONFIG_SND_SIMPLE_CARD_UTILS
Message-Id: <172167554618.83479.16434509879831157082.b4-ty@kernel.org>
Date: Mon, 22 Jul 2024 20:12:26 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Fri, 19 Jul 2024 09:48:03 +0200, Arnd Bergmann wrote:
> This I2S client driver now uses functions exported from a helper module
> but fails to link when the helper is disabled:
> 
> ERROR: modpost: "simple_util_parse_convert" [sound/soc/tegra/snd-soc-tegra210-i2s.ko] undefined!
> ERROR: modpost: "simple_util_get_sample_fmt" [sound/soc/tegra/snd-soc-tegra210-i2s.ko] undefined!
> 
> Add a Kconfig select line to ensure it's always turned on here.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: select CONFIG_SND_SIMPLE_CARD_UTILS
      commit: 83340b855d222f257354afd272dc8d315fecc3ee

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

