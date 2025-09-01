Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A35EEAC7;
	Mon,  1 Sep 2025 03:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756699045; cv=none; b=FhRH7nb35WYk2GwelehyoJcmL+QGBXZ+LGAXGpujLu+5HYAWkCHzQr3xFtUnsO7g8GTL7Y7AYzXllZ633/82f+U/JfL3u7qUnsxFrUZpljnfjgVfHmYuxaaGyjlzQZtOrkYFc5LV1aLcv2R+xMJeb5Kdz5mK2M9LSfGKBgCGwCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756699045; c=relaxed/simple;
	bh=3u1ZGDHFVAp81DLGLMD5zJXdw46pPftZHCXf2KWdjCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raf45rnB1LLk6iiVVPH+quctkF6CYSbgsUY141p1UT4uBH2karEMmSc2cTXe6fL7Vq0viIKoe3c6d5EHs77ZklJhRnYpzDXDZsQQtYFH5O1EcWqPuLi0Mt4BAgpw9HKKSkiJ5NoQ2PzQA7ynTM8SS2BlPg7AqHLiwmsYEZUD/j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYh8bAqh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYh8bAqh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37969C4CEF0;
	Mon,  1 Sep 2025 03:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756699044;
	bh=3u1ZGDHFVAp81DLGLMD5zJXdw46pPftZHCXf2KWdjCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GYh8bAqhE98U6NWFv5j2OMIo4Ax6n5Mda5q/e1MmfRb479zy1yylPWPlSHvdVFcdT
	 IzuQCL6O5XPXjotIsU6MDAIlwVPzejehfUmTQST+5kOC40kUrowxd30Lj5TQk9BrlK
	 U0BtAbgaWEg4icjNB8pKDiBowLaPXt3akV2YzmXg4Ntt14YcP83rPmuv2+VIz21wtK
	 BMOUTPghwfBVA/s6jron8Kblw1V3TEDKmMZGJEXD/IRFTJ3qJdFdalohbg6bHfKtBM
	 PWNbWh9J36Kc4jl0nWid0LmBqWb1+g+gfSU2K0gkfAQ7rQCUuKo9/asmB7fKtizJaY
	 KzPSTVCvVfAOA==
Date: Mon, 1 Sep 2025 05:57:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Thierry Reding <treding@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: reset: add Tegra114 car header
Message-ID: <20250901-juicy-straight-kestrel-a265dc@kuoka>
References: <20250829122235.119745-1-clamor95@gmail.com>
 <20250829122235.119745-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829122235.119745-2-clamor95@gmail.com>

On Fri, Aug 29, 2025 at 03:22:31PM +0300, Svyatoslav Ryhel wrote:
> The way that resets are handled on these Tegra devices is that there is a
> set of peripheral clocks & resets which are paired up. This is because they
> are laid out in banks within the CAR (clock and reset) controller. In most
> cases we're referring to those resets, so you'll often see a clock ID used
> in conjection with the same reset ID for a given IP block.
> 
> In addition to those peripheral resets, there are a number of extra resets
> that don't have a corresponding clock and which are exposed in registers
> outside of the peripheral banks, but still part of the CAR. To support
> those "special" registers, the TEGRA*_RESET() is used to denote resets
> outside of the regular peripheral resets. Essentially it defines the offset
> within the CAR at which special resets start. In the above case, Tegra114
> has 5 banks with 32 peripheral resets each. The first special reset,
> TEGRA114_RESET(0), therefore gets ID 5 * 32 + 0 = 160.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  include/dt-bindings/reset/nvidia,tegra114-car.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 include/dt-bindings/reset/nvidia,tegra114-car.h

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

