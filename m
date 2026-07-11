Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5EA2EC0B0;
	Sat, 11 Jul 2026 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783784262; cv=none; b=IPdJ6rM+94E1SP9fvbxITC6vzjvAAzAMaTljl3OnuzRKZBjJXQXPdxs/J+ncBjtzrsTrG/BTvHJiC6jBhfr6TUqMZmvvPUxp0ygHkO8iF+jb2G3D1CYies8dpNEuHoKphZ66TRZess9CqGDXO2rnsvB2VjhcIeiC3jrrnBJ8RH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783784262; c=relaxed/simple;
	bh=Gwk4MqOiZuno8RVKDGCnAiwzmgO4alI+1vadXh3OQ9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRnOctQvvkdh+PT55Ct2mJTfZmmUpbw4fWx1mHoO03OzScpCq7V6xTK3S4xl1gkxCnYafhOK20oHkSgaHiCN1vpH03p1pPAMeBzHj/wIORsMldPW0z+6tzd/AzQW/db3tDi4O4EoRRxoLtYNhanUDsPXbTsOYqtS7jUBL4BVZwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klt0HVcv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klt0HVcv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D483B1F00A3A;
	Sat, 11 Jul 2026 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783784261;
	bh=GezeGbZCPMTOh06fDLpr9vil2pYkSBZnWAH/WAcU7HU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=klt0HVcvdBp7QMBY+ohSExuKjhTiBL52q9OJNLgOmkikXYbhPI7JlPwf97sb4S8Za
	 1Y9S97cSYX3swhEf0GwmtHWbvdzuEIJtIv3H2zj4e0oy0Ee4Vkd93mHwd1h4r6kBkN
	 oqk8BhwmK6NoV8wOHktOv18xNGOmgJuvQ+zxnUtWp2JBLcr9X+FvcYffjn7cfmBcGo
	 IrvH+o/PUm2CNreHTU9RPQb0gpN9N0vmotQ4sr+I1bh+KMY+QXliZUIyx2PtO3VUW1
	 8Ecs1qjnQBcKhwq4JDVzM+8pOZRsv5JRntHPZ9n/9cKRQ7gDU5I0sCQhT3+GysW5mf
	 acZMqJZPna9ew==
Date: Sat, 11 Jul 2026 17:37:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ASoC: dt-bindings: sound: nvidia,tegra30-ahub:
 Convert to DT schema
Message-ID: <20260711-ecstatic-industrious-manticore-f35bb4@quoll>
References: <20260705-nvidia-ahub-v3-1-bacb7e05bf68@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260705-nvidia-ahub-v3-1-bacb7e05bf68@gmail.com>

On Sun, Jul 05, 2026 at 06:32:32AM +0000, Charan Pedumuru wrote:
> +  resets:
> +    minItems: 11
> +    maxItems: 21
> +
> +  reset-names:
> +    minItems: 11
> +    maxItems: 21
> +
> +  dmas:
> +    minItems: 8
> +    maxItems: 20
> +
> +  dma-names:
> +    minItems: 8
> +    items:
> +      - const: rx0
> +      - const: tx0
> +      - const: rx1
> +      - const: tx1
> +      - const: rx2
> +      - const: tx2
> +      - const: rx3
> +      - const: tx3
> +      - const: rx4
> +      - const: tx4
> +      - const: rx5
> +      - const: tx5
> +      - const: rx6
> +      - const: tx6
> +      - const: rx7
> +      - const: tx7
> +      - const: rx8
> +      - const: tx8
> +      - const: rx9
> +      - const: tx9
> +
> +  "#address-cells":
> +    enum: [1, 2]

That's a change - old binding was specific and set 1. You need to
explain that in commit msg with reason why.

Value of 2 suggests children need or want 64-bit addressing, which feels
wrong. DTS might not be accurate here.

Best regards,
Krzysztof

