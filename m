Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26392356DD;
	Mon, 17 Mar 2025 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209423; cv=none; b=T2e5MXrn7pXlRD1P8W0ddVLRRe/NO68FtS6ngs5hwRUKd/REeJj5nvJ6J+KlgFsU8Nbg2HUbGW3u9RnX+mM7SnkhE+0KABE7sb+SikG8izKgd7HjslvsBb364UtYVFChR6fmEJQxTtPaBJNQKJfkhB84MpmVCo7HJsTkdwSifSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209423; c=relaxed/simple;
	bh=V41ZUwASBtDSG8LFz5a7NDTbRLOAcqGA3ehJtXNjFmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/nq4pkQHCvl1ztt2172X4YHlwuG6yugKFOOtJvG3IPq1d62UMH8aibzwL1FALx33hl+AzZRVWnpdyB5U7okfwRpGHfhu1ouThknYEzn2YLEgZgV2FjC6RXJi+dyyq6GVZsePYcwtxpH3uSXZJy0vJGqM5QTtD3w+XlwXqVLPEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqCaHkx0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqCaHkx0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A19C4CEE9;
	Mon, 17 Mar 2025 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742209422;
	bh=V41ZUwASBtDSG8LFz5a7NDTbRLOAcqGA3ehJtXNjFmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqCaHkx0JZWGpgHcQSb1BKAI4k58qmGuygwFri4LiTuNiYzWWwIYIn4e09WvXVsf3
	 q+RH+KCjQehnBEOXua/aV3P5chfdb8iu4SZinMm/vUaTDeSd53isBC71hrRL2uStU+
	 7gFSbcWO/+QXIXFm4dwDWKd0FtPQjzk+IFGObqUKhWPQZx1bcLwBrKKKO+Qkwvs183
	 LkMsxEYJVc9skrbIeFhkj1gs09jhzFw0WX94qS12O6WUTBzGMrHknxZvSemcEw5onv
	 6EjDH5hWQ6MY9IcGilMDds54oX9I4+xtF2w6oCiTYysb2R/ANTi0zAIeu3l5Rk6hND
	 zPDrifKDf8Mnw==
Date: Mon, 17 Mar 2025 12:03:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Maxim Schwalm <maxim.schwalm@gmail.com>, 
	Brad Griffis <bgriffis@nvidia.com>, Dara Stotland <dstotland@nvidia.com>, 
	David Heidelberg <david@ixit.cz>, Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: tegra: Add Asus Transformer Pad
 TF300TL
Message-ID: <20250317-stirring-elegant-sunfish-b2d44b@krzk-bin>
References: <20250315074416.8067-1-clamor95@gmail.com>
 <20250315074416.8067-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250315074416.8067-2-clamor95@gmail.com>

On Sat, Mar 15, 2025 at 09:44:15AM +0200, Svyatoslav Ryhel wrote:
> Add a compatible for the Asus Transformer Pad TF300TL.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
> index 65e0ff1fdf1e..3e106ff2a8be 100644
> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> @@ -61,6 +61,9 @@ properties:
>        - items:
>            - const: asus,tf300tg
>            - const: nvidia,tegra30
> +      - items:
> +          - const: asus,tf300tl

That's just enum of previous entry. This pattern of one list per board
is not making it readable, but opposite.

Best regards,
Krzysztof

