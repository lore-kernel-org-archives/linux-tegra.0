Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680065;
	b=JjBK+cbI+MQL7L1yMFskB+3oCpbQru2LZp5Aw2pymFYH+I6JGnYtMz6XuNoetfrzXpbS
	 VtjcK6QWOusUvsUslmz7sfpuw1eFFRLrLaQmLgK/mZtplSaBs8Ef/OG/qhpcmtYY3QkU0
	 H5NYW1TOCubBPZkLFO6YmopJJwVXGj6XnLlmwUbd6S4IwPc16T1rBT9RVjW10cmoyK/9A
	 6icAHf/eHvJIykNT1tjoo7/rdBGtRmsA33W/ik2Sb/wxijDgfB4rPvVENMLidQi59E/F8
	 bXflV97FN3E0y4sqCpQunMCCMGEIqg46D4dMcxy1cPR7MARtvRdGtwPjeyOWv2Z4bEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680065;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mIO7tYuaCdYufaoOHXbc+H6PeDLvreZv9tIQ08xrdsw=;
	b=x4eDiV5Swvwounk++JLLTecd2TYa9Vv76wxdcCmXXd7n27AMbUb+wiO40BiNgrd8gyW9
	 AUak94Yn+avkvZyNxTubUG/y8KmHsSsozQmE6pczxJTFh9/Yhciy9FYAcGYMKVvMUTpzo
	 rk+UjiIQUk5KxZs1TKeo/oIhT1wK7e1i29wMPcIFfVceXwGVTQ7VqHDkd51AyQHIPBvAf
	 eTfOKpsOGtH/lQejnA+DcExfqCHUH59NsFjCru6Q+zlVg6Q5fqoyDR8RcJiCDY5g18AkN
	 lb7w89RBGDFyufSg9XDMCsHk0sPH0crvsI2DUGG1QR8PQvuugtzWNxBQFFpkFtgGmYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j7BmjELR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179C8606A324;
	Thu, 22 Oct 2026 14:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j7BmjELR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EAD1F000C6;
	Thu, 22 Oct 2026 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792680064;
	bh=mIO7tYuaCdYufaoOHXbc+H6PeDLvreZv9tIQ08xrdsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j7BmjELRtXIj9wvsVVBnmZQwLyqhr7wmG4EW8jRE0cU4gmH1kakSAOnolTlrHmeRB
	 aCfBopDexV/R54rx6Y4l4Zy5kewqj07x7yY1snIqsBkhP/W8kjBkgON8SppPymw8R7
	 7vFgN6kU2tXwUZrykJ1RiKL3AJ3vAECA7OaLWgu6il58ZDArR2jne+OYvfX1H8uou7
	 DBD3lG74miZbNxdauSa11GmnSKCWf2VIAljninxQn6JcULSbZg579surYNo4QS8jCl
	 W+FWuxlycx40tLyJ2ZRNp5/UF+xN2NGdBeUOODMc/1khKBYnBYpd/T04IFNB/XTFCL
	 060jArYO+a9QA==
Date: Thu, 22 Oct 2026 09:41:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v1 1/1] ASoC: dt-bindings: nvidia,tegra-audio:
 Consolidate all codec support into a single schema
Message-ID: <179268003494.1337328.14450033060774201915.robh@kernel.org>
References: <20261015130628.184279-1-clamor95@gmail.com>
 <20261015130628.184279-2-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015130628.184279-2-clamor95@gmail.com>


On Thu, 15 Oct 2026 16:06:28 +0300, Svyatoslav Ryhel wrote:
> The number of codecs supported by the NVIDIA Tegra audio complex is
> increasing, which leads to an increasing number of bindings with minimal
> changes. The main differences between codecs are the compatible strings
> and possible pin configurations. With the introduction of auxiliary
> devices, a definitive description of possible pin configurations becomes
> nearly impossible.
> 
> Remove all existing per-codec schemas and consolidate everything into a
> single schema. Compatibles are grouped into common codecs followed by
> unique codecs, all sorted alphabetically. Added examples for each of the
> common codecs and for each Tegra generation except Tegra114.
> 
> Schema check passes for all in-kernel Tegra device trees.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../sound/nvidia,tegra-audio-alc5632.yaml     |  74 ------
>  .../sound/nvidia,tegra-audio-common.yaml      |  92 -------
>  .../sound/nvidia,tegra-audio-complex.yaml     | 235 ++++++++++++++++++
>  .../sound/nvidia,tegra-audio-cpcap.yaml       |  90 -------
>  .../sound/nvidia,tegra-audio-max9808x.yaml    |  95 -------
>  .../sound/nvidia,tegra-audio-max98090.yaml    |  97 --------
>  .../sound/nvidia,tegra-audio-rt5631.yaml      |  85 -------
>  .../sound/nvidia,tegra-audio-rt5640.yaml      |  84 -------
>  .../sound/nvidia,tegra-audio-rt5677.yaml      | 100 --------
>  .../sound/nvidia,tegra-audio-sgtl5000.yaml    |  67 -----
>  .../sound/nvidia,tegra-audio-trimslice.yaml   |  33 ---
>  .../sound/nvidia,tegra-audio-wm8753.yaml      |  79 ------
>  .../sound/nvidia,tegra-audio-wm8903.yaml      |  93 -------
>  .../sound/nvidia,tegra-audio-wm8962.yaml      |  88 -------
>  .../sound/nvidia,tegra-audio-wm8994.yaml      | 110 --------
>  .../sound/nvidia,tegra-audio-wm9712.yaml      |  76 ------
>  16 files changed, 235 insertions(+), 1263 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-complex.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml
> 

Nice cleanup!

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
