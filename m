Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B21516A95B;
	Tue, 25 Feb 2025 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740505315; cv=none; b=NwSD1qVIXW8yIsilTm3ft6/OwZK3Lk+FoZPTmffuQHFJ+2g4HbjxUQtXQKu3Vc92nR/TqKohAMGLtYTjRuERvwyG+nUq/nq9P10rSbgyP8RI3+UG5Byzn1w4lAX5BFVZiWr7IVIlYxsxEEtWiT+cHhnsy84HpkdAyeRZFakclxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740505315; c=relaxed/simple;
	bh=nqyQyTAbYndnzQJ+HYlkTqXiothFTkm6xScY3NPcIJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBugVNc3EswKpOVrPQ+rRxQhQ2F6bi14Ygs3OgL10M/tTh2WaQII3eT0CvUDF0vNN++PL8ElMAEJcoaSqx+dHHsr+2+jjl6HFz7PqnJbR6Nuuw9U6gKosEsh+oEu0qpB2O76ckzdS3rv9JNngaTFu/JDnbUc8/+e+3+OCa6J7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJVbb/3F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJVbb/3F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354B0C4CEDD;
	Tue, 25 Feb 2025 17:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740505313;
	bh=nqyQyTAbYndnzQJ+HYlkTqXiothFTkm6xScY3NPcIJ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iJVbb/3FvArjT8/eqR7UURPb4vTE/qvD8VBfPQne8uOxYe/DW2Cw9VKv4qd8qOVL3
	 hZtazKHPHh3W/sIKR1BiW+yR+4WzGy4vYXWFYaUSvbKnkc4F5/a7THoxWntaneWoXX
	 laeJ1PgmnNO1NvUaik3UBcYaaPJYenouBzxz0ZZrWopxBMnbYom6V+jACRB+/yTJQm
	 B9S72t7JaH7zL1B8qShw/BzXOYCWLvWaOiYHDXwG6+62CSYQRqBmeoVRXJnTBi/ciF
	 NRDnQ36NHtLEB/H30ByXr4lbYmGsrdams0WhjWJtlw9Vfw5wrwBBIx/9Tq2Zp6tDIQ
	 ebdXw5f/ZhfKg==
Message-ID: <b687b44b-013e-44b0-b97f-9f7ee2c2a62f@kernel.org>
Date: Tue, 25 Feb 2025 18:41:47 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/9] dt-bindings: memory: Document Tegra114 External
 Memory Controller
To: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Georgi Djakov <djakov@kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250225143501.68966-1-clamor95@gmail.com>
 <20250225143501.68966-7-clamor95@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250225143501.68966-7-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 15:34, Svyatoslav Ryhel wrote:
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra114-emc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: emc

Drop clock-names

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#interconnect-cells":
> +    const: 0
> +
> +  nvidia,memory-controller:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle of the memory controller node

For what? Your description copies property name and schema, which makes
it useless. Say something not obvious - why this is needed here, what
its purpose is. Do not repeat schema nor property name.

> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      Phandle of the SoC "core" power domain.

Drop description, redundant.

> +
> +  operating-points-v2:
> +    description:
> +      Should contain freqs and voltages and opp-supported-hw property, which is
> +      a bitfield indicating SoC speedo ID mask.
> +
> +patternProperties:
> +  "^emc-timings-[0-9]+$":
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      nvidia,ram-code:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          value of the RAM_CODE field in the PMC_STRAPPING_OPT_A register that
> +          this timing set is used for
> +
> +    patternProperties:
> +      "^timing-[0-9]+$":
> +        type: object
> +        properties:
> +          clock-frequency:
> +            description:
> +              external memory clock rate in Hz
> +            minimum: 1000000
> +            maximum: 1000000000
> +
> +          nvidia,emc-auto-cal-config:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description:
> +              value of the EMC_AUTO_CAL_CONFIG register for this set of timings
> +
> +          nvidia,emc-auto-cal-config2:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description:
> +              value of the EMC_AUTO_CAL_CONFIG2 register for this set of timings
> +
> +          nvidia,emc-auto-cal-config3:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description:
> +              value of the EMC_AUTO_CAL_CONFIG3 register for this set of timings
> +
> +          nvidia,emc-auto-cal-interval:
> +            description:
> +              pad calibration interval in microseconds

User proper unit suffix

> +            $ref: /schemas/types.yaml#/definitions/uint32

Drop

> +            minimum: 0
> +            maximum: 2097151
> +
Best regards,
Krzysztof
