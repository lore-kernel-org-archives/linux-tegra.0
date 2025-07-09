Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC9D1CD1E4;
	Wed,  9 Jul 2025 18:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752085195; cv=none; b=U4jzQigZ3uocl9ekCS9o6P+Bk+eJJmPSZxtyzQGUa/qOjQ7Ra2P2/Ba5CHuIyVGi7LuZ6FBSxQn5Uvx2rsHNgxXU7K8Y8s2BicZr8xDwil9m2St2Kj+RagOt8IiRUlyWFvKJ62T/1fwgd8WYxKNqe426Qu9xf1EtFDh13dlhpFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752085195; c=relaxed/simple;
	bh=owaHyy4rlyoW7dGQHzYKf39H7GnNGRv0PmQBon9CO+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=avV1h+9SMvvEK1Ry0uEjsZJgXZZs1rBM8as+qK2JSQl747YCw5Omu2f+LJ8ItVBbI7sf0sQZ2dZ3Nc84KQvO3SsaF1uMlRRLCytvHd85fnNhiaW5IOMark1BVpjQOnOhhEaHPoRN0+8EYylvsnEgH+jz1sxTM666iNyTy4NLsxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiYQR0k4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiYQR0k4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A186C4CEEF;
	Wed,  9 Jul 2025 18:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752085195;
	bh=owaHyy4rlyoW7dGQHzYKf39H7GnNGRv0PmQBon9CO+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fiYQR0k4Ce5sGepy9U4Ufckw3gM7jexgSstL0oYtAeyFGXd3sI6LGbBHjbpAC6fSY
	 O7OxAqKr7CSopXsgC0wWnRQNJSYsoV+u5K4bsbJ9JXxdNBhAPEW0Fu5fB6/Y5Vww/z
	 lT5on/2wBn5t2Fg0ex3jmje9yxwzo2MP/rAanX+5gfCeo5HozVF/7kHqE8HC8ZEB31
	 +JpnPpzM7fHYPhoMJutHDvOYn1FdeOvLYHF/PEkcRMEmddrJ0DZ73Zr/7DjNv0dBL5
	 3L7Y/cz/ra4Z8gC9p6SqnMeB0domlcEwfiduAc/NDRy/PmkGEZkmbKIEN4MxNV8+hI
	 dM+ip0p8A7DzQ==
Message-ID: <abbfc54d-96af-4e9d-8c2c-8965aa99076b@kernel.org>
Date: Wed, 9 Jul 2025 20:19:51 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: memory: tegra: Add Tegra264 support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250708105245.1516143-1-thierry.reding@gmail.com>
 <20250708105245.1516143-2-thierry.reding@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250708105245.1516143-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/07/2025 12:52, Thierry Reding wrote:
>    interrupts:
> -    items:
> -      - description: MC general interrupt
> +    minItems: 1
> +    maxItems: 8
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 8
>  
>    "#address-cells":
>      const: 2
> @@ -74,6 +79,7 @@ patternProperties:
>                - nvidia,tegra186-emc
>                - nvidia,tegra194-emc
>                - nvidia,tegra234-emc
> +              - nvidia,tegra264-emc
>  
>        reg:
>          minItems: 1
> @@ -127,6 +133,15 @@ patternProperties:
>              reg:
>                minItems: 2
>  
> +      - if:
> +          properties:
> +            compatible:
> +              const: nvidia,tegra264-emc
> +        then:
> +          properties:
> +            reg:
> +              minItems: 2
> +
>      additionalProperties: false
>  
>      required:
> @@ -220,6 +235,52 @@ allOf:
>              - const: ch14
>              - const: ch15
>  
> +  - if:
> +      properties:
> +        compatible:
> +          const: nvidia,tegra264-mc
> +    then:
> +      properties:
> +        reg:
> +          minItems: 17

Missing maxItems

> +          description: 17 memory controller channels
> +
> +        reg-names:
> +          items:
> +            - const: broadcast
> +            - const: ch0
> +            - const: ch1
> +            - const: ch2
> +            - const: ch3
> +            - const: ch4
> +            - const: ch5
> +            - const: ch6
> +            - const: ch7
> +            - const: ch8
> +            - const: ch9
> +            - const: ch10
> +            - const: ch11
> +            - const: ch12
> +            - const: ch13
> +            - const: ch14
> +            - const: ch15
> +
> +        interrupts:
> +          minItems: 8
> +          maxItems: 8
> +          description: One interrupt line for each MC component
> +
> +        interrupt-names:
> +          items:
> +            - const: mcf
> +            - const: hub1
> +            - const: hub2
> +            - const: hub3
> +            - const: hub4
> +            - const: hub5
> +            - const: sbs
> +            - const: channel


Missing constraints for interrupts and interrupt-names for all other
variants. Now this patch claims they all have 8 interrupts with any name.



Best regards,
Krzysztof
