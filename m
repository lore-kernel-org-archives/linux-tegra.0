Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D302438A734;
	Fri,  3 Jul 2026 07:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783062551; cv=none; b=Fwp7OQtZCzhomQK9ssO4dgC35YzKe3hMuxIXs9GHxTn+gpyqDgO3epIhto2xBugnC586i8A0QiKxfZ713KgBYpS1bFLCYLGRPxgFmgFRidULWejwNdeRDp8USvXxq78xunyuBnNaakhVnx7eNwtQesNjuse/PPjr0d6p9bDFTbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783062551; c=relaxed/simple;
	bh=sg9HoM/2L58ICtp+lkBZh9mue5vlXba1B/F2YQ4PhgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYaWEFfQrTmEbCIp5kS2E8bwp7vEzOtpiIGhR3ulPUZ+f3ZF4OIcc/kCM42XuxqrxBhtf6rjojhzEJowPUOmkJ1Yv5NKqNg85xQMt/Cb1fgxGezgR9Fne6xY2UcrMQkm+D857bv120XOH/lwtrRqKLYy1bty9y/1vPOY3skf/vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeP4x5xk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeP4x5xk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E661F000E9;
	Fri,  3 Jul 2026 07:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783062549;
	bh=xA4tp0AYCPRAwSPcdD763FW0RlPsGKuoE+okmKkXUHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CeP4x5xkzXbGC++vIZQtQ21RqEDAAgQ/VnnJOyOvs7Qk9dT276p/aQ7YkVa5xtxF5
	 +rPSB5Jb3GqjoASBp4Dcnp04Qk8lrBFoOAQw1T8Wvx7s4c2420a3hMrpVJ4hXddTMx
	 8M6m3ea62qFVFH87ev8/hPvA123M+ccxiUhaBSycbFMaDSIjvekjlSqL6BEEVWLprn
	 qRq5RrKW58b98uQt5wkEP84UXbXUqgLWcqbgMv/1UIKEWfGbtFWn9Ga0bPfwkjImyR
	 KOUzJiGsSxmLX4BR2u4cwqCvieTpLOe5/N7fuoEQHiCU+eMkhxhTd+iAGzHyKatzpt
	 v+2p2YiLeAo4A==
Date: Fri, 3 Jul 2026 09:09:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: display: tegra: Add
 channel/syncpoint range properties
Message-ID: <20260703-traditional-beige-flamingo-d5003c@quoll>
References: <20260702-host1x-nohv-v2-0-e6d88bac0af6@nvidia.com>
 <20260702-host1x-nohv-v2-2-e6d88bac0af6@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-host1x-nohv-v2-2-e6d88bac0af6@nvidia.com>

On Thu, Jul 02, 2026 at 01:10:27PM +0900, Mikko Perttunen wrote:
> All of the resources implemented by Host1x hardware may not be available
> to the software in cases where those resources are assigned to other vm
> partitions through the hypervisor register region.
> 
> Add properties nvidia,channels and nvidia,syncpoints to specify the
> range of resources that are accessible by this partition / virtual
> machine.
> 
> The hypervisor or bootloader that configures the partitioning in the
> hypervisor register region is responsible for updating the values of
> these properties in accordance to the configuration.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-host1x.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> index ffd0ed857d28..a6bef28e8559 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> @@ -96,6 +96,18 @@ properties:
>      items:
>        - description: phandle to the HEG or core power domain
>  
> +  nvidia,channels:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +    description: Describes range of usable Host1x channels as a <base count> tuple.

Pasting my reply just now from v1:

Property has only one meaning in DT schema, so basically you are now
fixing nvidia,channels to uint32-array for all possible use cases and
nvidia devices. Well, you have been warned.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

