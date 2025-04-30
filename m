Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827352DC78E;
	Wed, 30 Apr 2025 07:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998486; cv=none; b=uMKZOnl8brLoqvun4pQzS+joTemTN4LdT0vU3aef1TrH3LH6pBkmcVrczsV8rg55Ov0wTAk+01SZ9hksiUktIKoo790UewxZTNqWJLVPyS+EGGJ0G1b5gAJUIT+wDuenEdYwN7EAIUlYCpgkYE3K3OLL6l1jAZL94peX89RqeVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998486; c=relaxed/simple;
	bh=xuu2ccVFX5K1wKFwUc/YuoUfgvrmjbfO+/eyQt6lOqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glruE95o/DHH2ovE7+rApJ5/lxL45Vc+HncHObafGCPx9qsg+TEQlWU+624UDt3es/NW4L/dMi24FtYCmp93Bk748z2FU/FIDo9LfNHAmNpEdBLaP6oPqMSm/dzsN2ZZ25Y+7KynuyhWEckBogbNW++k7GnSKiNFJwk5N3SjS8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRdAqIW7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRdAqIW7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F70C4CEEA;
	Wed, 30 Apr 2025 07:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745998486;
	bh=xuu2ccVFX5K1wKFwUc/YuoUfgvrmjbfO+/eyQt6lOqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jRdAqIW750dK5t1iPLMKDpw5qw761V/SZDWMd7ChslMnaS0dLReHO0aOehYnY+VTi
	 9KzAfc+9turL4JtyhW0w6K7Ua4Tcp7w8PZij7+I2QXlIhymYKs41CDTVUhUXTOSmzV
	 EHOdybHQgYOMSyQl7o3Tlhv8BcNB3SiTGgmKCWtHZ8pOIZ//9hk3V/qb3dKVfmgvWV
	 GM+Gh50u/0NLr62CfpPToKxteHvS2ZNtMLAiWT7sLt8RYJOaWV1xmfWiFQQwwxzrQn
	 Kl09wxToFHdy4MiEiA0j/IKl3Em8orfcbqi4d5d8Zea455MU4AMcTMtcKKvSAhgxvk
	 BrzFwK22e4YRQ==
Date: Wed, 30 Apr 2025 09:34:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	spujar@nvidia.com, mkumard@nvidia.com
Subject: Re: [PATCH v2 02/11] dt-bindings: ASoC: Document Tegra264 APE support
Message-ID: <20250430-ancient-radiant-sheep-0e4738@kuoka>
References: <20250429055941.901511-1-sheetal@nvidia.com>
 <20250429055941.901511-3-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429055941.901511-3-sheetal@nvidia.com>

On Tue, Apr 29, 2025 at 05:59:32AM GMT, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
> 
> Add Tegra264 compatible strings to APE subsystem device bindings:
> - audio-graph-card: Due to different PLL clock rate.
> - admaif: Due to 32 channels supported and register offset changes.
> - i2s: Due to 32 channels supported and register offset changes.
> - amx/adx: Due to 32 channels supported and register offset changes.
> - asrc: Due to different ARAM address.
> - ahub: Due to AHUB IPs number of instances updates.
> - for future proofing the T264 compatibility is added for other device
>   nodes.
> 
> These bindings enable the enhanced audio features of Tegra264
> while maintaining compatibility with existing platforms.
> 
> Signed-off-by: Sheetal <sheetal@nvidia.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

