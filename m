Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503604;
	b=rLJHWNjqq1Vzl4R6uGL72hb7fhky2zYEPepHZmW0yBg8jE0UzAVmg3eOG/51Poni0sM1
	 xaDPVKGbwtN0TQn3Q0gPT564i9RkNMX1CfyTHFFnniuzO1j68zn7pDkmj/WBmkTwlCnb4
	 B1Rlc/tTyKlE9k/5t2N9zdSxoDnxOrz4no3invQYzWeXQ09k/3SanleuT/rxtNxKWLoX3
	 dLu2hqUznDYvlDt8dsMfahJq/HokiY029CkB8TTpftDsZCcHYd6HaqmPRrTq2Qkaw+4WX
	 Hnq0RGSUlN7ZItFPGhP7kJB/2M/K5sBryrFyFWohebshMgGt+8fh3n8u4ZdSzOC7scg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503604;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VoHveLWNPeBOCpzoJQa7hKH+0T1iDM3QuPlPNaPBhoA=;
	b=dOLjlrpEvehFAI3LmRMex+2iUCyHF3sdUTiBSHcL2p45h8MOUQJd4yGt4WML6PKv+/HW
	 vv190iSbF/5+bdJ39Xnom8FTbBOgLIuWGGuSafu7/6xHaXG7F4ynmcPFlLIxnv4QTXDue
	 CU6LIGEVpu8JWwlTTky+lGME0kF2LJnF4ycf02MX83thiw2qm9M6aj5Ll83sHY81focmc
	 nWz6YHCThuZVZ8mo5ZeEnPtBxn4AyW+gX5U5Pw4aOyU5xu6nZohy6JGCpjQZ8mCrxJj+z
	 SRNN9ssab6W+ujFO1MN7ORiK4TBM0wlRy6KJVEN/OtmDBgCtrp7R3pEkRSxYuih8SnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGegiZv5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53477606A321;
	Tue, 24 Nov 2026 07:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NGegiZv5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED60E1F000C4;
	Tue, 24 Nov 2026 07:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795503603;
	bh=VoHveLWNPeBOCpzoJQa7hKH+0T1iDM3QuPlPNaPBhoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NGegiZv5LDFoZMqOGefFW/AkVByod02tKCRhbKz8ds0jAyRYhZIMIOnJjih5ji0Zr
	 CDQ7PaEnx1yCJQUHzqXCXDtp7XtrsMtCbHTNTINWVt8kF0RQFTPoEJa31jWW4DzKbv
	 WPq+gIjFiArH9AtccPahpezRqGds1VfHLGlXz6aTCiOjcQkdqaNl4r5s0oJPGULIUO
	 d6cEimywuPEPduSwvdOY/f3Mj6079QisY/av+bwOG0ASbZ6Oyj2XbvzqgaRgWhAVNc
	 G4ahCezPnSJ6uiBz5Xt71fgqjXl/XfPmPvxtGoewNFwTzx1Fo5RY/jYrv9LnrLcTpv
	 1zFY4M1qS27xw==
Date: Tue, 24 Nov 2026 08:00:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: nvidia,tegra20-dc: Move 'rgb' node
 properties
Message-ID: <20261124-steel-eagle-of-focus-b8c4b1@quoll>
References: <20261102142802.2742565-1-robh@kernel.org>
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
In-Reply-To: <20261102142802.2742565-1-robh@kernel.org>

On Mon, Nov 02, 2026 at 08:28:01AM -0600, Rob Herring (Arm) wrote:
> Properties are supposed to be defined in the main schema and not in
> conditional schemas. Move the properties for the 'rgb' node to the main
> schema.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../display/tegra/nvidia,tegra20-dc.yaml      | 43 ++++++++++---------
>  1 file changed, 22 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
> index 69be95afd562..a42bf7ed37a2 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
> @@ -77,8 +77,27 @@ properties:
>      description: A list of phandles of outputs that this display controller can drive.
>  
>    rgb:
> +    description: Each display controller node has a child node that represents the
> +      RGB output associated with the controller.
>      type: object

This needs proper fix in general:
1. "port" child (e.g. arch/arm/boot/dts/nvidia/tegra30-asus-lvds-display.dtsi)
2. additionalProperties: false

The change is correct though as it does only one thing, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

