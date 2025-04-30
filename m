Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D72B19F135;
	Wed, 30 Apr 2025 07:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998385; cv=none; b=pQhqng9E3bhcLGiLsKFyVSuyQMIlCeYS6B/Lj/rt+k0d4kxHpHO6g12NSabex/hfzvIQ9kBa0CVDdlPK0CpVUSF6BnhHHLUQfuFfDt1qE9NjGMqv3FFBwxLr8crjVF4yo3e6WDWGz42c6NKBGmF/Kz+hPQXScmfm/5ZCfp0CPVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998385; c=relaxed/simple;
	bh=BIxcCkBr/w9SpdPpQMAcTfRBKdWlR9GMj3+4jbM6mzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6DVsFiaBw3RC8lzbaXtYrkeieyKS40U+I26almfSV2yYPq4zBYL67tDFqkkeY6kMz/mV2KYgab/+usV4+sm71fSg0KZEuOA/fRZatdyNBT70w+Sy1ch3ugT27NS4YMN7gCuHAJUUCQu16nUUXKQwjWERa6mKNSK3AN/okIiN8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQE1pX6O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQE1pX6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCEEC4CEEA;
	Wed, 30 Apr 2025 07:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745998384;
	bh=BIxcCkBr/w9SpdPpQMAcTfRBKdWlR9GMj3+4jbM6mzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQE1pX6OMos8PlR797QTilHml6D3iEOcYyN8PKU7vxCOAxQ5Zp067rA4QSPmRhoqY
	 YET3CgS+kB0Lu9GSAT5eEKdSp8xVp9u9rHYB/Xu1uMlixTo4YbC7fgpsvJwsELZr9U
	 UAU5xoI0lC9YiS+fiXhpDIrXMPsuQ6lorWJvpdhkehbwvy2W/qneMViM7mjhDhgGOC
	 bHRSTvU0oKTsPbyTRXME1aq7H9c67774TXq/wajb21e6VA/v6cFIxZprO9xeP0nMff
	 NuAlP/OKAHkbgh8p1V7Ypb/etXRQUNQ/jYndeHqKck0j/LzzSDiPlapD8Eyi2+hQxr
	 e7f2yKBXQFIUg==
Date: Wed, 30 Apr 2025 09:33:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	spujar@nvidia.com, mkumard@nvidia.com
Subject: Re: [PATCH v2 01/11] dt-bindings: ASoC: admaif: Add missing
 properties
Message-ID: <20250430-little-dragon-of-drama-ce5dce@kuoka>
References: <20250429055941.901511-1-sheetal@nvidia.com>
 <20250429055941.901511-2-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429055941.901511-2-sheetal@nvidia.com>

On Tue, Apr 29, 2025 at 05:59:31AM GMT, Sheetal . wrote:
> From: Sheetal <sheetal@nvidia.com>
> 
> Add interconnect and iommus properties in admaif yaml.
> 
> This fixes dtbs_check error:
>  'interconnect-names', 'interconnects', 'iommus' do not match
>  any of the regexes: 'pinctrl-[0-9]+'

Don't wrap error message, unless it is very long.

Would be nice to say whether these are valid for hardware or at least
with boards/SoCs have them.

Otherwise, considering that I cannot reproduce above issue (and the
firsr random DTS I looked at does not have these properties), I have
doubts this is a correct approach.

Best regards,
Krzysztof

