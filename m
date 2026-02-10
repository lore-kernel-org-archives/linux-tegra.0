Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6956B2E62AC;
	Tue, 10 Feb 2026 02:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691727; cv=none; b=nrXD3+XraHGFQ8OQkUcE2yHiRlBpnoBpn8mFQdqIL6dWbXi1GQm4jcBumNak7yQH1w80x+XEUbq5BdrywgtxMGKtKa4AzinD1AXpSWxKZas28NzkutOblRorL6vOApGEbH9Usr1ObiyNYzpgGqzwBjJxPNB2/2SyV1r3gMnF3zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691727; c=relaxed/simple;
	bh=6NxCKVaA7xc8vNbgeX/09jYUtLOFu2k/grPFrJ0Gyoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N90k7wHEyT9KN7KRilGv/ND4KCx/z9bqr0sAozJx84q/Js07cor0yi+hHVKVmq1QMTrzLgMFNjPT7Knfl+OHnHh9j6JuifapllKgB5mgU+SIuAemm2N3e5ADoqPzMEk2qoPL5n8MTwJJY/1mnQ+p43n8F23Etw8jPtXCkdyhzYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMkNfiEl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMkNfiEl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0FDC116C6;
	Tue, 10 Feb 2026 02:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770691727;
	bh=6NxCKVaA7xc8vNbgeX/09jYUtLOFu2k/grPFrJ0Gyoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMkNfiElnd0c/wAh6KncBzPBH7BJQ61kpZInwUf1g7X27t4AwqIznNa995E8hqTcV
	 NYGssJTc2kEBM0zZk0p90W7+WYpcubxQVvqo/ocx7XQ9bLKdzvgGYZFoQ6Mo1HO4Pf
	 1yh0s6GfE0Z5AOLW7xtnX2sxJtjEO9lWGcvNQD8iovLJ1a0zd4J5+sIs5huUrLId2c
	 DqmgPiyL6A1yjF7Wd0lO3wxVnUxkC/4MtToJAW9Uk7iM10tnMVau+p/GYP/cJaFdiY
	 L2h8aGOnrSAGnXTKVlTQKosYHhjiw15NVCsaQ2aHj0evLMrJgelR918MxTNljdzGVJ
	 RdYBPb4/nL1+A==
Date: Mon, 9 Feb 2026 20:48:46 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] ASoC: dt-bindings: nvidia,tegra-audio-max9808x:
 document additional board pins
Message-ID: <20260210024846.GA2385273-robh@kernel.org>
References: <20260206173423.145954-1-clamor95@gmail.com>
 <20260206173423.145954-6-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206173423.145954-6-clamor95@gmail.com>

On Fri, Feb 06, 2026 at 07:34:22PM +0200, Svyatoslav Ryhel wrote:
> Document additional board pins that may be used in routing.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra-audio-max9808x.yaml          | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
> index 241d20f3aad0..4957645a8e03 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
> @@ -35,10 +35,15 @@ properties:
>      items:
>        enum:
>          # Board Connectors
> +        - Speakers
>          - Int Spk
> +        - Headphone
> +        - Headphones
>          - Headphone Jack

Aren't all 3 of these the same thing?

>          - Earpiece
>          - Headset Mic
> +        - Mic Jack
> +        - Int Mic
>          - Internal Mic 1
>          - Internal Mic 2
>  
> -- 
> 2.51.0
> 
