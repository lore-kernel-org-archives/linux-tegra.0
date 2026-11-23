Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430404;
	b=5ZR27iHx/VDO6W65CUt3torpdgRJqaEwPL+Vjtci8KUj37VmomdiPhJuDm861h/dBO98
	 WZfpYazS3wNnSRygQP28a+g+Kz+Q75J5J+n0Jv0Cj8WPm5+zCtUecpAnmKGOVcGfGh7DD
	 V86k0S0S7H8VURpp3rDS94AcMAFB2PrkwusLLu/+cpGFuAMuRuUWRLW1swhBEiAtmn+Ne
	 S7pHZnuKFo+OAs0mWg9lIvwzH4r80TBjmDiTyYg2RsWs+4+6lTpb8crrs1HGieMzuU3V1
	 dZiPprG5EXOtZydPtldPLT2hbnDplKuA+WxMrma7n1cy5IsirOWz22+PAEDeaQepQ/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430404;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=viwVBf00X4U5FgB3Yw2Bt5ekXnuxGzUfcAdhyCqxIos=;
	b=spEd7D3r8EgZbFe2GVtMRk1DCshsswm4FlFB8Fn2U8IozYqo+B3nTX0UzTtFY3oH22q7
	 3PapZL8islD5xrOnUJQcWjkwoZSpOUO8JEk9m+nhD6p8oe00dgf/t1yZ2vS8x9hT73yiR
	 N8MwNx1Twii3RBYNVstFfBQVexY4CdPwNU7VmVdGflMkVBZkZGHjti0n7ELKNvjMcZBVr
	 PhFXStAzgNtDRBVENXjTBy25RE7okILs/B4sVbku3LYatg3ZBrqwxPpITV7ha3sdz35/I
	 9G5tu9NMV7gewFkQkHd+3jooYE98gjIhePFodgdFck22RqsoZW3/voVJAr7ONcfxhEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pt3tcXli;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52787606A31E;
	Mon, 23 Nov 2026 10:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pt3tcXli
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF70C1F000D0;
	Mon, 23 Nov 2026 10:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795430403;
	bh=viwVBf00X4U5FgB3Yw2Bt5ekXnuxGzUfcAdhyCqxIos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pt3tcXliv21SvsforhjkLmX8Htr4HaB3+JVkSFPjfx9ZeOGcQ4rCGI+AGsCCgrSLk
	 STPG8OByfX4VLmNOfWHCw52vz1p+W/fjP9ZaZ8kTsdao2upj2kly+fYzjErE9yOycL
	 cIIN+uoExAM4/tmoVWrUkSC+53Q6tgxqtmPIsr+v9u3JVbUqYLbB160PbhrcCDvWfF
	 iQ8E810gf2HlJaUft8aIcgEHkvK72IImeX/NY20/0ltHrrlOZDqMoqdbV1hoA/R35Q
	 5PBWS+2zCD3NsgQgRSHr0B5JjijDqwpO46MwItTqYjSA0ZcUKPmmtA+qbV0cnQDswR
	 B1s3OhS/ANVJg==
Date: Mon, 23 Nov 2026 11:40:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Dietrich <marvin24@gmx.de>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add Tegra20 I2C target
 controller
Message-ID: <20261123-enormous-vague-uakari-fd785a@quoll>
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
> Tegra20 SoCs supports 3 instances of an I2C target controller. They share
> ressouces with the I2C controller instances and are introduced here via an
> additional compatible.
> 
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>  .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 27 ++++++++++++++++---
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> index 51241c1293e3..2d7ee8e8750d 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> @@ -13,11 +13,15 @@ title: NVIDIA Tegra I2C controller driver
>  properties:
>    compatible:
>      oneOf:
> -      - description: Tegra20 has 4 generic I2C controller. This can support
> -          master and slave mode of I2C communication. The i2c-tegra driver
> -          only support master mode of I2C communication. Driver of I2C
> -          controller is only compatible with "nvidia,tegra20-i2c".
> +      - description: Tegra20 has 3 instances of a generic I2C controller.
> +          It supports controller and target mode of I2C communication.
> +          The i2c-tegra driver only supports master mode of I2C communication.
> +          Driver of I2C controller is only compatible with "nvidia,tegra20-i2c".
>          const: nvidia,tegra20-i2c
> +      - description: The i2c-tegra-target driver supports the target mode of
> +          the generic Tegra20 I2C controller. Driver of the I2C target
> +          controller is only compatible with "nvidia,tegra20-i2c-target".

Drop all driver references.

> +        const: nvidia,tegra20-i2c-target
>        - description: Tegra20 has specific I2C controller called as DVC I2C
>            controller. This only support master mode of I2C communication.
>            Register interface/offset and interrupts handling are different than
> @@ -222,3 +226,18 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>      };
> +
> +  - |
> +    i2c@7000c500 {
> +        compatible = "nvidia,tegra20-i2c-target";

So no differences against existing example except compatible? Then no
need for the new example.

Best regards,
Krzysztof

