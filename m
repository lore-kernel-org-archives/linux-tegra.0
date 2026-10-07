Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7515330C359;
	Wed,  7 Oct 2026 21:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407417; cv=none; b=OjIlGsKnl3/RCmfrhwRaRwL0yJJ3XYua1K+f6SVWS3gh//4jI1JmDYau1FvFsPPywbDfsDOMY/ESuUk+wOs50pwPsAhWW9yHnGus6BKCmUnwdoK7/ifwOXxODxHunHV3p0NfTcW9sJo4dEfRBpFyOhMmEjXE0DL9P0DXa+FVSGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407417; c=relaxed/simple;
	bh=+yaU/KmGQxjIaXY7tta3bbUaKbA0dW5lkqn8+Dydm+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZ8yy2PuRdqla0kwdpuzZrxo/BnZ6vBU6kak5gzZckgNno1A2vhnM2dCPPY5KEVHWZP5aMRZK4eN/olZh6H2+Df+1T3VqnQVg5Rgfd7DE1br6Rpt4Hb7C0R1BpJaEDM+3jQusdA66jB2Xdgebjc3QhT4hWauWD9llUMhUyJXpGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9wE6RaC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9wE6RaC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22DD1F000FF;
	Wed,  7 Oct 2026 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407416;
	bh=kQZrJoj8R2X2UlcGOjYwNnil9Dl4ymdaDmJibmPEMx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J9wE6RaCZ9e88//hUxabkUZGTM+o28DuJgnsmumTZVQHpr/yTL5FjZq0+K7avJFlT
	 W43iK2rxkYcDwYgEx/SRaBgQnSpu2GjeRCi78IvTUcR1bdfR2HAxs5WssALSpbZ1+7
	 e2ZxSdCevdtLoG7stQpo7yKl3iJYYs9GjwkeXlcvk0paqdZJfT1KtQjxMa3k0wQ+bN
	 mCaVPASTUTKJiFf4K4SXxTIN8SPLKxJp8qoo4EwnuPVq0CmBFotFejhBlW3Lrbogm9
	 1x2K1vTkufitZvK7n02b2oKmeWdfnO0cqP71Zxv4ZtT423v31Hpniju4SStb0mzTtJ
	 qAj4N5sPwIpMA==
Date: Wed, 7 Oct 2026 16:10:15 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: ASoC: nvidia,tegra30-ahub: Convert
 to json-schema
Message-ID: <20261007211015.GA305857-robh@kernel.org>
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

On Fri, Oct 02, 2026 at 09:38:59AM +0200, Thierry Reding wrote:
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

BTW, It's 'ASoC: dt-bindings: ...' that Mark is looking for.

Rob
