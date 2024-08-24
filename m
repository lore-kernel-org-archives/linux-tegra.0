Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3E717C64;
	Sat, 24 Aug 2024 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724486586; cv=none; b=Q4dqV/Vj6C83qM7Uj1mASt1NcQNqPDs55SRdVE+wokUu87jshVYxF/UpQW3PiOsXHhPGcsr63lAtvjpaz/Za4R7gXGMJ734JOIJjL8cYQwinCTlkIpBGO7EkdL7QLvPE6OeXBWXhI6Qakip1OY/0caM54gydkydFBGD2hXNEUVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724486586; c=relaxed/simple;
	bh=7zu9SmcmMq/i+l6WScJ25GTWxNVIGvcrEh3YMx1bPiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBMlMXSRhOQXQ8/N3PflhcDd8ZrfnnvhY3EdY5o50AM6oAqPIoOLVv3svJEAWN4avcbZpe9p3Lq7KIMDDnrsyE122WDY+55JMp0zkWMTR5IM3a1UPJtTYV6hqXidoJSpNTdpzInrFrtALNqI5S9e1zrW8oeow7Xeosirkuuc6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFrixdwI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFrixdwI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D48C32781;
	Sat, 24 Aug 2024 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724486585;
	bh=7zu9SmcmMq/i+l6WScJ25GTWxNVIGvcrEh3YMx1bPiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFrixdwItf8zEC1hP/hFh6eY84FVuAIYQQz0pg2O5y8HGCccpyqqXS7g6tdM9Th2D
	 4g7NHlpfvzNBJZePlD4kCgFeLtONISncxfBK3xzGmPerE6AqDUHcUd8/n/LYKofpaf
	 hIAr1QShPxrOFluP315TN9/cxwa4SG4a1ZDFf9thTQWfrlY7SarUnbc7bxpxYhG1Kt
	 NgwoEoV0agAzBgONSwKyKz1XvaXHUcj6psiHVWeUB6aqccV40pvE1U5aWNGAWqre62
	 HIo8pT37qOMdc2ixZX30lOBC8fNktOJB/I/pFjiKKhrDhvYHTecCKsBrDbEnuHJEqn
	 JlwLOEeu7azWw==
Date: Sat, 24 Aug 2024 10:02:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dara Stotland <dstotland@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Brad Griffis <bgriffis@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: tegra: Create SKU8 AGX Orin board file
Message-ID: <t6dccgrwco2ww4b4e3gwk2tfcwf36kunejm4lamqpk6chz4sde@jic6ou6zu57l>
References: <20240823214957.771297-1-dstotland@nvidia.com>
 <20240823214957.771297-8-dstotland@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240823214957.771297-8-dstotland@nvidia.com>

On Fri, Aug 23, 2024 at 09:49:57PM +0000, Dara Stotland wrote:
> The existing tegra234-p3737-0000+p3701-0000.dtb is compatible
> with the following modules:
> 
> p3701-0000
> p3701-0004
> p3701-0005
> 
> Add support for p3701-0008. Move data that is common to all SKUs
> to a new file called tegra234-p3737-0000+p3701.dtsi. Update
> Makefile and yaml files.
> 
> Signed-off-by: Dara Stotland <dstotland@nvidia.com>
> ---
>  .../devicetree/bindings/arm/tegra.yaml        |   5 +
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 544 +----------------
>  .../nvidia/tegra234-p3737-0000+p3701-0008.dts |  11 +
>  .../dts/nvidia/tegra234-p3737-0000+p3701.dtsi | 547 ++++++++++++++++++
>  5 files changed, 566 insertions(+), 542 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
> index 8fb4923517d0..e108ef0cde86 100644
> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> @@ -175,6 +175,11 @@ properties:
>            - const: nvidia,p3737-0000+p3701-0000
>            - const: nvidia,p3701-0000
>            - const: nvidia,tegra234
> +      - description: Jetson AGX Orin Developer Kit with Industrial Module
> +        items:
> +          - const: nvidia,p3737-0000+p3701-0008
> +          - const: nvidia,p3701-0008
> +          - const: nvidia,tegra234
>        - description: NVIDIA IGX Orin Development Kit
>          items:
>            - const: nvidia,p3740-0002+p3701-0008

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run  and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

Best regards,
Krzysztof

