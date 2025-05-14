Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA4F14900B;
	Wed, 14 May 2025 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239218; cv=none; b=l58sDbT+MeiW5TWb667bi+4wZKoisX6Ga7z1CEDTrIe1fDW4lEGKjTsJbxR/RnA7o81qM53W+dHq2AdAbbP5Ae/GhDjgrKbJCav2KmatSrK3lv1LsvyXILf/HZ+iaTVIZO12gMv7UbdJK4vOoMF0cUZ5QUnreO1a5V2ilmYcyjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239218; c=relaxed/simple;
	bh=Phg8+ypjVqBp7Sk/MuFz+VsF0MAkDYbthSArEEDQB9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYRzMXcXeHF1SqTGVMfwzuoU4oM0KliVUQrzF/izhpMadmNtCdXBwvnVwNVgNlHyUfpm8BXVlLdCdmEhjlFHnqDR7Q9/tKeSsI4zM/uRd7lgGR/NQ3KLUcZzkIxfnsWMEC8d0DJd5e1rTqfZE5nqELua9XvjmSEc4WMZQccX6Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDCZOFY9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDCZOFY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD5BC4CEED;
	Wed, 14 May 2025 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747239217;
	bh=Phg8+ypjVqBp7Sk/MuFz+VsF0MAkDYbthSArEEDQB9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDCZOFY9FgzewU3rnwJkCExFndVN4XW5nLv1ALwzbNn1W4kuDa9XhScwfub6JkOF/
	 qRiv9t3uRmy3NmCFP3CmfnJlk8CTfF6lB1/diZOWwKn/gkOI2GJ9oWnOKmp6aN6IXE
	 MGc14EsV9wBQ4S7sET8xEInr10adLCyHIEjWopQILKNmwn8IEp/lYbpZt4rrbyxoed
	 8Uoh21ZJjgkWnIJg3l56jwEsScTp4aBuOPlusisiBya6nHman7K4PDJApJO8mpj252
	 HmEDOeoqfSq5lvrQpcNulBaCAUvIh/5yO9Q5e4i8MsoHzdt+1tsLw8RBlf4QTLRCvO
	 TWrNSLy3u3aRw==
Date: Wed, 14 May 2025 11:13:35 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/11] dt-bindings: mailbox: tegra-hsp: Bump number of
 shared interrupts
Message-ID: <20250514161335.GA2456913-robh@kernel.org>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-3-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506133118.1011777-3-thierry.reding@gmail.com>

On Tue, May 06, 2025 at 03:31:09PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> It turns out that some instances of the HSP block on Tegra264 can have
> up to 16 shared interrupts, so bump the maximum number of allowed
> interrupts.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/mailbox/nvidia,tegra186-hsp.yaml | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> index 2d14fc948999..df6784a7c96a 100644
> --- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> @@ -76,7 +76,7 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 9
> +    maxItems: 17
>  
>    interrupt-names:
>      oneOf:
> @@ -84,6 +84,25 @@ properties:
>        - items:
>            - const: doorbell
>  
> +      - items:
> +          - const: doorbell
> +          - pattern: "^shared[1]?[0-9]$"

shared1?[0-9] works

Though really it should be: "^shared([0-9]|1[0-5])$"

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +          - pattern: "^shared[1]?[0-9]$"
> +
>        - items:
>            - const: doorbell
>            - pattern: "^shared[0-7]$"
> -- 
> 2.49.0
> 
