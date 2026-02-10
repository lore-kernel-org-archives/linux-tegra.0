Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAED536D507;
	Tue, 10 Feb 2026 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770733158; cv=none; b=lNoarg5CGqCes7DpHTzhp5Jxr7XUGBLO1Uv+AJcD9P9q9TY6FYz+JODb9qdptDZCgoQap05t34RrQdQl/YZY5Ighu4J7O1uAGa8TTLyTkWT1JlOiDgKNkFP8y07ESGgl40neXKqwho50QFdJIhi132TBy5pxeP2dUfKzA6xoed4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770733158; c=relaxed/simple;
	bh=//7KljrC/IVY3euefeUO1Zpi7jEZ7Npdc2eJ84WefRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XF9XUBE2JIikMMyttlIDRM1GZ451iL2PhnhzSko/h+0AAchiaPWPW3dTfWa4bzSDiMRkRmpP5DxWVzXY9KrGNzjhS9+im7yUHnelIJ7afU7uDUGzOwIM3shi3zegrU0De/w+g8Mvk/jppgh3tobo0DdhYYdZJiqbhtN4YPrZsG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GL3LryEu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GL3LryEu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27D0C16AAE;
	Tue, 10 Feb 2026 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770733158;
	bh=//7KljrC/IVY3euefeUO1Zpi7jEZ7Npdc2eJ84WefRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GL3LryEu5LmWDAMX9Q+4nK8Jv7LyWfzBW3qz2XJrc+PLTViCnXFX+PAihvwdUo/KY
	 bQFAvpwrQVFr/XYHK7I9y8gqCDxEh+g9qMbnU9aG3DghisNORGMhttIyluYq6nqAMN
	 hAsU5s0vGTImbJZBYV0DeAwI9h8Ls0qdsTR/Ww32e+nzMGU3ueoK2xcguOm0Amx5P9
	 5zLmAUE0I8GC0zXbdF1uCaQLKleR7lloLKJ6caBMR+cvKrvDewWPnKDbeyBzf/l7Ad
	 Uz6t5aiUv7BMQSuRktLoyoV6wcPJioT8ZVoHAPqAfYUXhSKyDqDTaMepVmKrBiHQTy
	 MKA/yk90VP32g==
Date: Tue, 10 Feb 2026 08:19:17 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: display: tegra: document Tegra20
 HDMI port
Message-ID: <20260210141917.GA2659856-robh@kernel.org>
References: <20260210094908.14276-1-clamor95@gmail.com>
 <20260210094908.14276-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210094908.14276-2-clamor95@gmail.com>

On Tue, Feb 10, 2026 at 11:49:07AM +0200, Svyatoslav Ryhel wrote:
> Tegra HDMI can be modeled using an OF graph. Reflect this in the bindings.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-hdmi.yaml | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
> index f77197e4869f..f33b700bf0ee 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
> @@ -82,6 +82,10 @@ properties:
>      description: phandle of a display panel
>      $ref: /schemas/types.yaml#/definitions/phandle
>  
> +  port:
> +    description: connection to controller receiving HDMI signals

Describe this in terms of this block, not what it is connected to. It 
could be an hdmi-connector node or a bridge.

> +    $ref: /schemas/graph.yaml#/properties/port
> +
>    "#sound-dai-cells":
>      const: 0
>  
> @@ -97,8 +101,13 @@ required:
>    - reset-names
>    - pll-supply
>    - vdd-supply
> -  - nvidia,ddc-i2c-bus
> -  - nvidia,hpd-gpio
> +
> +anyOf:
> +  - required:
> +    - nvidia,ddc-i2c-bus
> +    - nvidia,hpd-gpio
> +  - required:
> +    - port
>  
>  examples:
>    - |
> -- 
> 2.51.0
> 
