Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4068340FD9B;
	Wed,  7 Oct 2026 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407422; cv=none; b=AtpGKgl8Jy6UQEQxMwrMkxm6dWe/N/shMf04RBK7qhoMy2vQ0aJ+nzt5ySyTjZ72LVsCSH8oDBEWDXcZ/LrObGelUX3cERXgdhzDHgPseeNih1TK621+ZH/7u+1iSZxr9QEXThwIbaczYTjpr8G+7Hc1XUcdKWJtUuVF5RneqY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407422; c=relaxed/simple;
	bh=e9i0NTcmlKksrbmxFuA6i7WH8BRzHCAEn/L8VdBVfTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hu30U/VwZP3o+RCQ2yQDiXMYKz5DdBmiMEn9Z+xPK3nnW+c2MoKQl0sEvSntEkvs5rE617rL5UR/r/zqcVT6MVujCzbR+5e5LcQtWl9iCq0Th9P8kdhJez8vNYIJ6HmuJbAPhPw7rZ+boxFJ1Er5DBsewzxgyFVljE+gp8jxdww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KdNimEPg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdNimEPg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BDD1F000FF;
	Wed,  7 Oct 2026 21:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407420;
	bh=iSm9xSqenH37k1lT5vORJ8VJKqeZg11LvMr+P5G9deY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KdNimEPg2UYzxBlR154BKyZKOxeWdamuJA4q1eWKkxpB8aq6+9RUr161OV2PpYmnk
	 7TjNIo6lRFDwF6WTXuw/MjgpTT5HLhT1RijRh7x6WAi6tXr4QQ3QZBTS6/PfLe/cBd
	 Jl5/9GnEPjCQoY/S/Eu50IiaDUuIl/WNxZygcCmlLZlUeSbweJjZEz2JE2rwGLF6Xm
	 EUugdv4zH0NacwJDlkABOODkI6iGW0TsWVpgHu0eQLPxTaoPIPq1f1he95iIQt3J9V
	 a+CsrWhzG0LfQcoPwZgUJAXbSr/QM+Dqx6xS9MEHiDKebrPmakij1AmS0Oln1qdA9c
	 7xJfLglME0EYw==
Date: Wed, 7 Oct 2026 16:10:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, mfd@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: ASoC: nvidia,tegra30-ahub: Convert
 to json-schema
Message-ID: <179140741967.308851.2213726438085073892.robh@kernel.org>
References: <20261002-as3722-bindings-v3-0-21c179b72a95@nvidia.com>
 <20261002-as3722-bindings-v3-2-21c179b72a95@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-as3722-bindings-v3-2-21c179b72a95@nvidia.com>


On Fri, 02 Oct 2026 09:38:59 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert Tegra AHUB bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Rob, you gave a reviewed-by on v2, but Sashiko flagged that the per-SoC
> constraints don't properly match on Tegra132. The only change (well, in
> addition to the subject prefix fixup) compared to v2 is changing the
> 
>     const: nvidia,tegra124-ahub
> 
> match to:
> 
>     contains:
>       const: nvidia,tegra124-ahub
> 
> It's a really minor change and I suspect your Reviewed-by would stand
> regardless, but I thought it best to resend this to make sure.
> 
> Changes in v3:
> - use correct matching for per-SoC property constraints
> - fix subject prefix
> 
> Changes in v2:
> - add compatible to the list of required properties for i2s child nodes
> - use consistent style for description properties
> - add correct set of possible compatible strings
> - add per-SoC constraints for resets and dmas
> - wrap overly long lines
> - fix yamllint warnings
> ---
>  .../bindings/sound/nvidia,tegra30-ahub.txt         |  88 -------
>  .../bindings/sound/nvidia,tegra30-ahub.yaml        | 289 +++++++++++++++++++++
>  2 files changed, 289 insertions(+), 88 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

