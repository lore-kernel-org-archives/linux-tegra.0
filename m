Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3EF24B47;
	Tue, 30 Jan 2024 17:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706637188; cv=none; b=Xuzn4KkPxIj6aWBbf5iLx2FnMeHChE0JzJX5sfPoC4a9bCpiwR+WHoVNZOLNVoMoyt+wQz83vExa1rTbliBT1rrTQm1CXiyaHZomSKV80xk8Mwhdfdg2ivlr7pmGehPgDmQU0UAuYEtQjvyGcmScuCyeIwRkdTTL3Gw7kbRzck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706637188; c=relaxed/simple;
	bh=kzOJE9stfeSCiAHvR3aeZE6VgovpgPYHm7MEosgUntQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qVQg4k8iilVYPKVSBnyAZEQzuTon0vNm3OkYySZUwtpOPMhGC0jTVe2qOaiioosLkwVAmVDwjEXP14GshhJfeG+YzTTxTOsuqSnTOdQNnDNXxteQsNRwLmnR2ZjabOJCww7Gz0PtHWEc3lbD555pa9WXBQQSIk2UG7vFPjn5CGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daxL/qGX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daxL/qGX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F62FC433C7;
	Tue, 30 Jan 2024 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706637187;
	bh=kzOJE9stfeSCiAHvR3aeZE6VgovpgPYHm7MEosgUntQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=daxL/qGXw4MGXpKPBnxkeG3KYx0NQIotRUglHuNdgdawtQrYyzswougolY6oaYpZw
	 sVrPMdeSRUzw0otUkl/o3hWY4JbfsMk0U7wJtMO8DC0cOlFlpL6OlZ9uQdj80jY8TE
	 /jC4Lyud8n1w8Q0wZeydB09rQbBL5eLKpe3I3P8D9lVYaQHXcVPj35apHxRUNdExhs
	 UZKcLBDgnnQJpMWeujgYA/yP9Vo13p63XZ7DTTW2ALVOANKOVA7aIWabfyxz+TxNh1
	 YyuLwhIs7vQMXL09z98kWFeSaGxgK4hxvOUdRll/vj3IJuqAeMSZBeDLobHjUefGw8
	 kATD1XePFW1HA==
Date: Tue, 30 Jan 2024 11:53:05 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: tegra: Document iommus and
 interconnects for ADMAIF
Message-ID: <20240130175305.GA2051939-robh@kernel.org>
References: <20240118142706.4179146-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118142706.4179146-1-thierry.reding@gmail.com>

On Thu, Jan 18, 2024 at 03:27:05PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The ADMAIF is responsible for accessing system memory on behalf of other
> components of the APE, so make sure it can be hooked up to an IOMMU and
> memory controller.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra210-admaif.yaml       | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> index 15ab40aeab1e..59304f02d063 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> @@ -39,6 +39,18 @@ properties:
>  
>    dma-names: true
>  
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    description: Description of the interconnect paths for the ADMA interface; see
> +      ../interconnect/interconnect.txt for details.

Don't need generic descriptions of common properties. What you need is 
defining how many entries and a description for each entry.

Rob
