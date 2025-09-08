Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAC31D63EF;
	Mon,  8 Sep 2025 08:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757318777; cv=none; b=X9Tpu0sfQkQUTI7iClBBaxnYQk+PNB2MwqYsetQY1r6oCig4KxkR06i7qc2wUB4MEwCPgFCDsXJdF7E9XlDtVsexDC7OhEYK4dY00U7Ys16xaPEEYSmBB9v+7FOcjEy87K2k/Mnw7aL9vhtnrSfu247v2m68ONqMJ0OclB+kqhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757318777; c=relaxed/simple;
	bh=/MaZlf3qg6WSWsFQF3K2Tns/uJau6BjYKOS9OyvSwkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6jwu2baDBC288PTN4tJ3q3Oc45V4xDGf/k9onpsr+e4Fkw77LOP12/8B9DfypVJl2+54fdO1pYymii9hS/CHNoKMZkPyjhVVslPxOa1IWcf9dNgemCCcoz6llmleRPtY1xlVH2JJf87CHaRQbxtr7TlmSBJgXZxkq2DJ0rSdNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWL9z/U1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWL9z/U1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD47CC4CEF5;
	Mon,  8 Sep 2025 08:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757318777;
	bh=/MaZlf3qg6WSWsFQF3K2Tns/uJau6BjYKOS9OyvSwkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oWL9z/U15ehLSAxaBmNWnVzk1OPQD4IhVdOEhak+TyojgLqt4fwot4rWTkF1NbUoE
	 P9f8tK1PaQeBFCQJPwBNn2maOUV3ya90m7RgDvuFF6lcNRlNZ9a8/wydUFTLzxM/lv
	 z5cpoclsJdwiL951G6dSnwjrzZP4iscpoVWB74qW/h3VfEny1DtGI/Y7Z+U6WCAm8e
	 4O2iozIl1cQUwhvQmmXLSFm5c7fDIQ94iGYxAJp77NjhruKM5NdHKmtCxD2xGvUerk
	 KDPMjacrcolEFBd3USMsl2eQvm7XiI9dnrGvyH9b5s09TJ0ZhXB0Ucoo5HtwwRkM0w
	 0wxiQ+iB/o2IQ==
Date: Mon, 8 Sep 2025 10:06:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Maxim Schwalm <maxim.schwalm@gmail.com>, 
	Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] dt-bindings: arm: tegra: Add ASUS TF101G and SL101
Message-ID: <20250908-clever-fierce-ibex-ebf0bd@kuoka>
References: <20250906062934.6637-1-clamor95@gmail.com>
 <20250906062934.6637-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250906062934.6637-4-clamor95@gmail.com>

On Sat, Sep 06, 2025 at 09:29:33AM +0300, Svyatoslav Ryhel wrote:
> Add a compatible for ASUS Eee Pad Transformer TF101G and ASUS Eee Pad
> Slider SL101.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

