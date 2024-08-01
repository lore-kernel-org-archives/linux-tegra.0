Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC3013D607;
	Thu,  1 Aug 2024 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722527372; cv=none; b=jDQQxs0SLO8oZZlWhzM8oo3xknLfYOzq6r8rKXzuU8LWVxeHK6p/mRK+7pHWKdRPB1XHpxN052IerZA1dS2Zmh/eTWB6BP0753dOJJjJO0vI9K1mRh/Ea/Tvui4C4BWfyEJZN+9pUCt2kheAp6n9DDajBVdgegdS3CU8T7pKPFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722527372; c=relaxed/simple;
	bh=j72P45FMQwBZCanamKLRul+pFSrort7ZdTabz4P2blw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hK0dU9vBcEWGM3GA7FCLVj23YMxGs5+zgiG25a94vRrJqqTGfiU4AFKivGOG8vEVM2g3tiSp7nUXAYXR2XwokzuVdlSNTF3gy+R24ujPsJJ3fkyeR/dKUvGfp7yB5PnuIRCv7U8XQpaKxVr1is51C4kl0b9ftcNXLHeLmvPkSmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIefwQa0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIefwQa0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A415C4AF09;
	Thu,  1 Aug 2024 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722527371;
	bh=j72P45FMQwBZCanamKLRul+pFSrort7ZdTabz4P2blw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gIefwQa0Ju8bA7Bx8mNOPnuW7mY2yBkGFeKrZtadNvCGmD1O9lnCSX32qRMAQVU3b
	 Qn9ZJfmBI5CLq333pEDsxXk0YZodjbX9nhocueSZHTjfQWwmFBA4EQORjOu4AU8+TR
	 c4lRxJGAebisvkf7Dyq/AZ4E2VjkL0jfujyE+CED0iaa82b2MkF9ZQlSzUqGiAbkY7
	 JtsiA7j5VSENM4HF0go7VEqiDF3qvptrga1a0glQO6nr9RzklcqauWLwrtIDGr4orf
	 ZWd37fbBimv6GdW6O9OFqd/xHMMGKl6kP2mvX2lqYHiKzhceYOHhP2679LX+qJUo86
	 k7fIojPQ868MQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20240731191312.1710417-19-robh@kernel.org>
References: <20240731191312.1710417-19-robh@kernel.org>
Subject: Re: [PATCH] ASoC: Use of_property_present()
Message-Id: <172252736983.96807.12892152018660162294.b4-ty@kernel.org>
Date: Thu, 01 Aug 2024 16:49:29 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Wed, 31 Jul 2024 13:12:57 -0600, Rob Herring (Arm) wrote:
> Use of_property_present() to test for property presence rather than
> of_get_property(). This is part of a larger effort to remove callers
> of of_get_property() and similar functions. of_get_property() leaks
> the DT property data pointer which is a problem for dynamically
> allocated nodes which may be freed.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Use of_property_present()
      commit: a1c8929b0ebbfd7598f038ac74fb0a28f94ade8c

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

