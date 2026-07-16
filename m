Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700E62D47E9;
	Thu, 16 Jul 2026 23:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784243104; cv=none; b=dK3DWoyR3oF+g3sgv+hO9n/L5R5TSutNrNBY6VU64xR7R5LHBfMtrNMIg/CCEhPdlmtCBUoZmZ5JD4hhDlJrCpW1Dc58psCTze/SU53vQGxxjD35+yNGV0/AogHmIxHCTo5SwOWxIX8PpOE7m1lFdh8SjWGArpx+QvZMLvCPdDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784243104; c=relaxed/simple;
	bh=22eFyfsKVuOczMh4rQhMNTBlNi1mtJQWAxDiECNCHhM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Hz7Iw0draLZFZvtH3sf3cyfDjIz/AWcz/IXPhI21q34iWe7h7W0g+7Pee4OKgCEj59LUnevRNrrR4lDJFrtTA3UWIWCgpfy3oJJA0ClkGYLT7VVV2L7/AkjxtNVtoOfvuz2F3ldY2qDEmE6LAMwRb7e8L1Ybr6rj//T14gPkSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxOtBgg6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxOtBgg6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7CE1F000E9;
	Thu, 16 Jul 2026 23:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784243103;
	bh=jjxdvZnxNRIZuY90hq5rNb3kTKwomR3NkMkEzKrnfpc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=TxOtBgg6SogqqB4FKif+ueqafbkxhYTm1TniBIh4Omns8xdvluABqnCfZqyg35gPS
	 0o5DW6r/SA9d5uXbCJ6nLID/lCViEtjrdhG82hUTISInex+bYEOnVowTHmtkcxN7ET
	 X3ijkp6Vhk6aA+yMbg6ilnD8UTevZpMIO38HO1oFa/Q15b8RvbOTNV5EbVZfMZP8+a
	 hJzbe7GLZyswWHu7foaPDqw2x3+h2S3YycezVkxg3DWnbEADYVmQsMFwwLKos5u/rb
	 vIuInHDL+bv3M18ebfuZaAV47RpYF0LRLnmbWtXZQHOSoCwZGyCKrA34zjERQ2fGRw
	 02+1ZoWc7GrqQ==
Date: Thu, 16 Jul 2026 18:05:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Conor Dooley <conor+dt@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
To: Thierry Reding <thierry.reding@kernel.org>
In-Reply-To: <20260716212001.989872-1-thierry.reding@kernel.org>
References: <20260716212001.989872-1-thierry.reding@kernel.org>
Message-Id: <178424310216.1896287.13018768594912086878.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: net: nvidia,tegra234-mgbe: Add missing
 properties


On Thu, 16 Jul 2026 23:20:01 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Being a DWMAC derivative, the Tegra234 MGBE supports AXI configuration
> nodes named stmmac-axi-config and phandle references to them using the
> snps,axi-config property.
> 
> While at it, add the 10gbase-r PHY mode.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> This gets rid of the remaining warnings on half of the Tegra234 boards.
> 
>  .../devicetree/bindings/net/nvidia,tegra234-mgbe.yaml    | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nvidia,tegra234-mgbe.yaml: properties:snps,axi-config: 'anyOf' conditional failed, one must be fixed:
	'description' is a dependency of '$ref'
	'snps,dwmac.yaml#/properties/snps,axi-config' does not match 'types.yaml#\\/definitions\\/'
		hint: A vendor property needs a $ref to types.yaml
	'snps,dwmac.yaml#/properties/snps,axi-config' does not match '^#\\/(definitions|\\$defs)\\/'
		hint: A vendor property can have a $ref to a a $defs schema
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260716212001.989872-1-thierry.reding@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

