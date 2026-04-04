Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7F01E5207
	for <linux-tegra@vger.kernel.org>; Sat,  4 Apr 2026 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775311490; cv=none; b=blq+vMkTxjEBiXd5vDFpTBe5psxIFQI3X7QE1RlhaOXYSSIUUly8lGxMr8qAoTiPl33LOa9nsyUvUgeTCi1fFVwf9YKa9W4VuLqBnCT/3bMxRqpYAnDeV1J2O41EsnUwo3/OCYaImxmL6io+3t44ZHu01/VLshlk1YfsnEAQMV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775311490; c=relaxed/simple;
	bh=xSSi5iDK6MGLdEKxP7Zro1E9EL+1Wdut6RHhjODWhro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raXarWlAYKRzj1FuhC6AwzTJdF+EB5NGbElFv960pvtRgT5PwKIDD/LGhrzFkknrqGEjmeftPZ0KTV0NAxI2HQFvDEB169ByzBggCdPguk2uae/4+VQFXqQcRdkgD1A8woU5IJ7F90ZcEYkgNDpW5XUV4GZTXL21etVkv3RKPBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHvpKitY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHvpKitY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201F8C19421;
	Sat,  4 Apr 2026 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775311489;
	bh=xSSi5iDK6MGLdEKxP7Zro1E9EL+1Wdut6RHhjODWhro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHvpKitYNgn4WqU/hPey29AVvIOK0oV70Ldssw75PHRGFtnvtKLjSsstATMjv+VlL
	 vG1zkKyLvdVIQHyfSxPYEPSVLg4Ys6wPBKGrUuW9ysa64Rv5MwjIGSBYXwvkO5ZcEC
	 T7/OkFmivCWrIUxMp60lAiWDtblPwY+nNF/Sd7oAIo9XZjcK+ZIECei238RIuXP8BG
	 nbwjJ6AGUU9lB6X8WUbjaidSGnr235pN6aJzKliUFxkmFP2Px+CJ/KIgmFudRK77G2
	 ywAySQTyPfwTjKQFrmjfWiFjLJ038KZfD+o7bTpxNCVAhwCrkyYPD/gySDe9JwEMM+
	 MYxV3JDejbUbQ==
Date: Sat, 4 Apr 2026 16:04:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/7] ARM: tegra: Device tree changes for v7.1-rc1
Message-ID: <20260404-hospitable-colorful-swine-f5d6a7@quoll>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-4-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329151045.1443133-4-thierry.reding@kernel.org>

On Sun, Mar 29, 2026 at 05:10:41PM +0200, Thierry Reding wrote:
> From: Thierry Reding <thierry.reding@gmail.com>
> 
> Hi ARM SoC maintainers,
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.1-arm-dt
> 
> for you to fetch changes up to ce74a6c6d88ba9ee29a6b99ac97ffcded577c85d:
> 
>   ARM: tegra: paz00: Configure WiFi rfkill switch through device tree (2026-03-28 00:56:36 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> ARM: tegra: Device tree changes for v7.1-rc1
> 
> Various improvements for Tegra114 boards, as well as some legacy cleanup
> for PAZ00 and Transformers devices.
> 

Thanks, applied

Best regards,
Krzysztof

