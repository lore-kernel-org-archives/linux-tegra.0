Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1A81C9ED7;
	Tue, 22 Oct 2024 19:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729625872; cv=none; b=fbak2YOfT0UsrjsUGNUBfT+HBhX4QJZKxdUu4gfTlzknGC6uBjpZsxlxXq4jGXkS6LOMIcS8l7RrPgJAr8cciFNw/2ZxxBxyynUxRDLxYGPGRcW3xQMZ8rBucriO9wX/K0C8YBLWlWuAtYiCvsCzI6X5PTvaYy1Ebl3eU5R0USg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729625872; c=relaxed/simple;
	bh=Mua+uCTs9IpZCqc3C4s74yPvYea1rH31VK32wym1GLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cBM2uiwvxkLFVCL4d/EEseM4o5w7ABE+41RiSzGnE/E6uZTvJFNJPWI5blqOmZ0xG9UqrcPltrJzUaM4b9YVpOOZSeHyjlLGDTfxZrHx339ffHde+Bo9Eh5TV5YKAqDKhroHIwUc5vjsiXcnM/JcwpmXKsg/NOGDGA2YkYaQmpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLk/zkYr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLk/zkYr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B5FC4CEC3;
	Tue, 22 Oct 2024 19:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729625872;
	bh=Mua+uCTs9IpZCqc3C4s74yPvYea1rH31VK32wym1GLA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QLk/zkYrY95HHOzoo8pCoUNsjSh4xO6Dqr8rrYEd2ud2uJneV9wCcLwhefEyA2Xdd
	 L+S9pOo6BY2l5j1bWgHlf07ftVzQarWBjTHJQh4WFmT4cQWLUNFTrOdjXmmTDPTkgW
	 nzz9CtKU80VZgiQimRZKSzolPhIzU/dAmaW8fO66o94Gx1D9auOFqQ+kHa17PffxoH
	 mQkUtWp7JtRGZxkVJHwgZ8cqLw2hNbYKD4pHNvsGEklXDN1mcz2p4bXiQC3m7NqOhD
	 jd7gx9NgJMTGV84sHhNWfrzhcCAcq0S9y6QDGlYoDgcqS+kDoWxp4Mgyb/RikZCbWF
	 saoxb1Kh2w8Qw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
 "Sheetal ." <sheetal@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 lgirdwood@gmail.com, jonathanh@nvidia.com, thierry.reding@gmail.com, 
 mkumard@nvidia.com, spujar@nvidia.com, Ritu Chaudhary <rituc@nvidia.com>
In-Reply-To: <20241022041330.3421765-1-sheetal@nvidia.com>
References: <20241022041330.3421765-1-sheetal@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Add support for S24_LE audio format
Message-Id: <172962586959.134224.13443393819264797768.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 20:37:49 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Tue, 22 Oct 2024 04:13:30 +0000, Sheetal . wrote:
> Add support for S24_LE format for all internal and IO AHUB
> modules, except for ASRC (which is already supported).
> 
> The data flow happens as mentioned below:
> 
> - ADMAIF picks 24-bit valid data and converts it to 32-bit before
>   sending to internal AHUB modules. This makes the driver change
>   simpler for internal AHUB modules.
> - IO modules CIF converts the 32-bit data to 24-bit before sending it
>   to the external world.
> - To maintain consistency across modules, conversions between 24-bit
>   and 32-bit occur either at ADMAIF or at the IO modules CIF.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Add support for S24_LE audio format
      commit: 4204eccc7b2a4fb372ea6bafc80a765c98657a99

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

