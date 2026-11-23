Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430658;
	b=AtWcRQwMilChv8E83ZdX+l/oUPLhSmR5mobBlIbVF6Gl6Gfixo8ahI0bU000TBytdxvu
	 nKfz529+q4KMdmnlfwiytmo6mXa7RLAvz/f2EpSTncNQdZ9aeA4ui0oVlNTVsjdP46mkJ
	 oY/w3ai6XqXl/7YMqAWSp0C4ev42kOZj+Da21wgxxs42Jg4rxG++/gBzEV3ixTdQBUxC6
	 qkMsP2avzYD/keO1JNz9ia70lvrysWdxg7rboolduCYlUg7QZOBcJgJntDCn6UafIDerE
	 9cOhbt/DTVR0Sr6zEUv5AE1jJ0Vul8gtiM8EaG5SYrDzTgI9hpynCa1JHgzqmXydaKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430658;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IEvSzgaTb0EsAPJo4txWV1vZ42VPFNhu9tHaCps/Jl8=;
	b=f9mF/Yaczy9HyLJ9tfDYvmfTKiD7i4xJGj2uM77qGPJxgeBGMrrN48kbsIrCPbWDxjKn
	 WQ+0PhcxcXTDPQzwc26khY1POShZkuSt+anTo91ntgsA4dW0/IMoNSyFZMNk1D4nsy+O8
	 5Q41fLK4nN3ySm0XGXf57XEdgxQvfMi2n+PAsNqlmPCvTsAeozvGk+qZ7+BJnPcZ0awtd
	 xbFW/pfZGS3lebNJ0FyGFChbY48EzDa4TvANohyDtSEvYZS6gCjjpj1fvJwpL/gZjpFJZ
	 S3TtmYGxoil/y8dG+M1g9nem2njf6+EXrYGdh/RjBOEnv9k+nl51xnCgtpa9rmlcaIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GtMCcIyS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC55606A31A;
	Mon, 23 Nov 2026 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GtMCcIyS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D04D1F000C0;
	Mon, 23 Nov 2026 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430657;
	bh=IEvSzgaTb0EsAPJo4txWV1vZ42VPFNhu9tHaCps/Jl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GtMCcIySEuVpz5Gj0Ej8deYIbGF9iuC3ljoq7aAbZw4wFKT4y9PZZWJONrli8F8oj
	 zBiByiQWgiq7x6Nea0FrDylYJeQwQYwgw2Szb3wpdfiC7IB2zXk7EfOhmDKrQo+fjM
	 9CKsIhHGkWxgFaRgTaDIzJgZ74/PMm5MjWYJX4HPT00Nun1DupiVbIoRjy8Ty7/Ao3
	 zotBxHfA7qc/J+IoGR0eORqh0228COO97Crv5jLMgr+ikR3nXX5IBurNBeeTX1BEfM
	 BZC+kTLBr9td9e4wzzwL5dHn/WTY41c+tCqRBL9TK5fE0ESrustrRVIBewimV+lvbT
	 vpim7Oa5WtO0A==
Date: Mon, 23 Nov 2026 11:44:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add Tegra20 I2C target
 controller
Message-ID: <20261123-normal-resourceful-cockatoo-acdd68@quoll>
References: <20261115204522.360063-1-marvin24@gmx.de>
 <20261115204522.360063-2-marvin24@gmx.de>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261115204522.360063-2-marvin24@gmx.de>

On Sun, Nov 15, 2026 at 09:45:21PM +0100, Marc Dietrich wrote:
> +      - description: Tegra20 has 3 instances of a generic I2C controller.
> +          It supports controller and target mode of I2C communication.
> +          The i2c-tegra driver only supports master mode of I2C communication.
> +          Driver of I2C controller is only compatible with "nvidia,tegra20-i2c".
>          const: nvidia,tegra20-i2c
> +      - description: The i2c-tegra-target driver supports the target mode of
> +          the generic Tegra20 I2C controller. Driver of the I2C target
> +          controller is only compatible with "nvidia,tegra20-i2c-target".
> +        const: nvidia,tegra20-i2c-target

This looks like the same device as nvidia,tegra20-i2c. Plaese document
hardware differences on the SoC. I see no DTS in the patchset, so not
sure if you are duplicating hardware or adding new instances.

Best regards,
Krzysztof

