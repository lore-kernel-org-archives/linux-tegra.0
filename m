Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA30C37DE99;
	Thu, 12 Mar 2026 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327464; cv=none; b=dH8pmlvWEU9X2VSsQVu1PpboaPEVxWj8wi6idyhBH+D4/iPFRP0IQBgZI/mPUP/7e/e4WfmYzApZ5eIZts3C/fzCdB0jTbmPgPClM9MBHzxNVk+Bm79jtFwzWHpY8GXc1iM5Z543fefazs8fP867V4riekxJMotZ2ZJANan7np8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327464; c=relaxed/simple;
	bh=QALLdQg9eUjQDZA8nZM1V+oZE/jCdmyry7mAYp9kcaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RveV71eXL+sxaWUErbQ1R5Mt/nczDtP078WMf/JQmwZGjh8RmjdidSqNymPMT1S+3AvpPJkSX2JFOSv5bzAhuyf2qPWElVoFpAX6/Z1VF/7ldOGkxSYLgryc3SUZ6IvEfxTDyjXcx+XN3LYmGJRAmrn2NFhpw9UEevMVP0iqx3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehRf2d22; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehRf2d22"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A387C4CEF7;
	Thu, 12 Mar 2026 14:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773327464;
	bh=QALLdQg9eUjQDZA8nZM1V+oZE/jCdmyry7mAYp9kcaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ehRf2d22FIda03x/m0tsjscDPBeJPUBbiHBxpBqncS54vg4CTUcr3WIbJjawxTG4E
	 YGQFUwcuSoJmpBYAki+TYtzToZMCG9G0OEBIZH48ESTZcrriP6CZAKunISYFy1zW03
	 rViUJsIqd8rqVbsSlsIOrRl2JDQdIGx9jsN3lzAg6buZm71QnyFKPQaN8KiKJvQORe
	 MhIBYX07K8+IJ+73XcjyUoRAOjjt7V0Blb5yCtrfUfvAywsE73OL5rts9ji1IOp0IT
	 ERXQzGNJQl+njj3tQyJEHcXVE8OY64UkojULaCD77004Ljt+cEEYATKv0fD0od44a+
	 LlI2fSyuqXQOQ==
Date: Thu, 12 Mar 2026 09:57:43 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: display: tegra: document Tegra20 DSI
 port
Message-ID: <20260312145743.GA3116703-robh@kernel.org>
References: <20260305161035.64548-1-clamor95@gmail.com>
 <20260305161035.64548-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305161035.64548-2-clamor95@gmail.com>

On Thu, Mar 05, 2026 at 06:10:34PM +0200, Svyatoslav Ryhel wrote:
> Document the optional port node, which is required for correctly modeling
> a dual-mode panel.

Dual mode as in command mode and sync mode? Or do you mean dual link 
like panel-common-dual.yaml defines?

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
> index 59e1dc0813e7..0f4837648d17 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
> @@ -83,6 +83,12 @@ properties:
>        gang up with in order to support up to 8 data lanes
>      $ref: /schemas/types.yaml#/definitions/phandle
>  
> +  port:
> +    description: specifies the connection port for the dual-mode panel
> +      and is required only when the panel is operating in dual-mode
> +      configuration.
> +    $ref: /schemas/graph.yaml#/properties/port
> +
>  allOf:
>    - $ref: ../dsi-controller.yaml#
>    - if:
> -- 
> 2.51.0
> 
