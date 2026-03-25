Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20C0239E6C;
	Wed, 25 Mar 2026 01:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774401925; cv=none; b=atWQgKFpQXhk0lp4EoVBsQ9mvNjY+efLsEjzm3gYc1XSt/12JtQ53iFiUEX8O9Qm2y8NjjqS8yC4RQTvyDXiAtncz9/FBSVEX42tIa3kS4YkXyhd0vQIHR33PCw3C3qNxKOaepSHTyDWv2jcihUoG2xiqFYe0FboRCvfomCXQpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774401925; c=relaxed/simple;
	bh=46xsdl5llitco7Dnq8/vnEkCGKExG8cvma6j29oOSHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTeB54SMXejT5nP39prcH6Q+4fatVpmH5SHw8NkyqR25SmLiXEtNzp8nGdytvovBMsxRKTZqEgL94KEdLxGhJVdJ6qvI2sjGC1VQrLcAeuri1AhAjgi+qAtjn4fBA4IzENH4aVWJK1L55NRj+XO/OjVUw3OTdTprz+x7b+hyGtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sy+TCBH0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sy+TCBH0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3F7C19424;
	Wed, 25 Mar 2026 01:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774401924;
	bh=46xsdl5llitco7Dnq8/vnEkCGKExG8cvma6j29oOSHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sy+TCBH0e+9+A9SoiAQBZKKAfRmT9NiC798KNXvpsDDqfBVZby91tzpjDb8w5rYGJ
	 PwjtJxQvR7BXRVxhe6PQZo5fgOtmHDm9VhqcWqt0uaiHMMD4zHL+fFx+ja3BGv6PRQ
	 M5tBS8LFCybPVyCecUcTkcjBY5x201KLagbyCtxPuCK1nmbfL8XfUzrFAjUlXXLUDC
	 Q/eribredXrpGMnRvXcuiV4iVibnzkZPBSCRR/fYtDNVehB2BOv0xCSeNKpkHbGLMj
	 uVkeqofc8VO2k406M3BuM6MCM3jVhYs7uzH0HOfClReNSZvEFmi4twZukumIW3K9lS
	 O0m37mt23WnJg==
Date: Tue, 24 Mar 2026 20:25:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: tegra: Document Jetson AGX Thor
 DevKit
Message-ID: <177440192305.2452180.1530293183472232676.robh@kernel.org>
References: <20260320234329.2579213-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320234329.2579213-1-thierry.reding@kernel.org>


On Sat, 21 Mar 2026 00:43:28 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Jetson AGX Thor Developer Kit uses the same module (P3834) as the
> P3971 reference platform but a slightly different carrier board (P4071).
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

