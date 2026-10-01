Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3204E48595F;
	Thu,  1 Oct 2026 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884588; cv=none; b=FI7PUrskeVe/0rBtm5OgcscTeUBtDlMj+vKsoGXqtoIvB75dyZjifj6GQKzHB66N5XAkjqgRmnEfOkbOBl9t151stdPmAqC7ZOs4PG3AmpIXPX2X9DQq0ya8yJJ1v3cNpKJmL/mWXvuZx6fSK8UfkMqg6r1jONIcP0dKwUe8EOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884588; c=relaxed/simple;
	bh=96SR5j2AyAd6GLJx99EmZKC848MIXPiG9LioUTpt2JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeVlQRYOOuZ9jsqCpuuDiAy4Uf3UEXeB4vCKKBH1u8tFZcm31YpKRNkfI45PSZugA/RpuQBtaWkgC8e6YOg7M76btMn1ylOH21qaqI1v7AM2W+KxRQeRjCeJPWYCPlzjwL81fElyt3HslSPtnF99Bmqrc7KNutUXW91Gn/YKIwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9Lu+1dY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9Lu+1dY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6D11F00893;
	Thu,  1 Oct 2026 19:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790884583;
	bh=92ga4Iz3j8x7GlpylAlfsxH7cPY4XKVXE2sDHBbEkeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F9Lu+1dYrWw6ZDDOSjuVgBj4L7eUefm2oBDtd3KVydFK4O/mfXPyC8i1NQQstPGyn
	 AZevgLvTVtFwaLDpEZwAETcjmo9BVNiBKRo7MxioliSz9AJ/tQvg7vDaT8Efh+jWL+
	 UQyYKlb8xvncceC1wXINP6CXZJfcij57Nz8Ak4H/czofGPyAn7K1Dy+B4tQ556WMB2
	 XXeP0UURYpTY132xMEuPX/xusEP5XeUSQDjvdMgaRHI+70/V1hteTm8C3s/kCRQx1t
	 ErhUL4fDJpGDj1GOlg/Lf0oeUczDYZunExdGQa0ZGa0gaEl6x1wJ8ZWaYhRrLF6S6Y
	 4pf0L543UcPzg==
Date: Thu, 1 Oct 2026 14:56:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	linux-tegra@vger.kernel.org, mfd@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <treding@nvidia.com>, linux-sound@vger.kernel.org,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: sound: tegra-ahub: Convert to
 json-schema
Message-ID: <179088458131.1733966.5515900378497319415.robh@kernel.org>
References: <20260930-as3722-bindings-v2-0-a3bba649ebf9@nvidia.com>
 <20260930-as3722-bindings-v2-2-a3bba649ebf9@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-as3722-bindings-v2-2-a3bba649ebf9@nvidia.com>


On Wed, 30 Sep 2026 16:01:24 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert Tegra AHUB bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add compatible to the list of required properties for i2s child nodes
> - use consistent style for description properties
> - add correct set of possible compatible strings
> - add per-SoC constraints for resets and dmas
> - wrap overly long lines
> - fix yamllint warnings
> ---
>  .../bindings/sound/nvidia,tegra30-ahub.txt         |  88 -------
>  .../bindings/sound/nvidia,tegra30-ahub.yaml        | 288 +++++++++++++++++++++
>  2 files changed, 288 insertions(+), 88 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

