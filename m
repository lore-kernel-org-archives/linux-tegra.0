Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9A214D2B9;
	Mon, 16 Sep 2024 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498148; cv=none; b=YaEDjtgLUjBEUKiOTeJ4YMoo6K1E/fwVn14JsS75hmIE7VAjL/FvEPmnixX/27Ry6YxoOJdokkx4OmdDJKY+n4AzFZ74YC7tzxK1VewKVrShy44Q1b6iO8DDWm2WouDkLtPIzsO7UhH7qh6m3KYecOevPPZ8pBxfakog3LIN5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498148; c=relaxed/simple;
	bh=Ft9XPpCikBwGj5TUPeJRbaIg632pLeJodDlgYP+TPCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTFdUqjZU2nwyC56FXAVOj/z2xCqE0AN4lNnVowNiiUrxVOfLtTe5YZFZ6hL00WKHC/XZug5IgTk0FJ+El91Esbfd8xJRDfdShzZlcrJyr4RgHUUIBd7/HZirxv7uUATmT9gqCyWQTVJJus5V/tjCftcrbeC0/WhdcwBTnRBHiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ly9IXIVm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ly9IXIVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE07C4CEC4;
	Mon, 16 Sep 2024 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726498148;
	bh=Ft9XPpCikBwGj5TUPeJRbaIg632pLeJodDlgYP+TPCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ly9IXIVmNWqc6TnbKponYlhlpicsk5jrS9wNGpZyyN/k+ls+kz0NTdAIG1TlPE8Hf
	 wxRjq/FAPKRQ8jBq14pwX3He+dDF/C6bv+xuJSXV6sYMohCNotOavvkYQe2GwPNjTQ
	 fFAutYUxMRy61WxiFvIF/YTYaf16JBhkL/R3k7rigETabmTJyERL9Whxg77xFjQJaA
	 9WIKJCroGFGn3d34CxBN/TT11bDQy2FV5/Vb+RdTDhOZrcqB4FPBLTWlQnuozSsG7H
	 jZJw3iqDKIurRCPAduK3B4osU3XBQ2gQgjrsnGf1W/OhnzEfmvUc20drB5Kf8yl6wo
	 cf4jvjo1i8mdA==
Date: Mon, 16 Sep 2024 09:49:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dara Stotland <dstotland@nvidia.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	Brad Griffis <bgriffis@nvidia.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: Tegra234 Industrial Module
Message-ID: <172649814579.393787.14019711850278168822.robh@kernel.org>
References: <20240910190457.2154367-1-dstotland@nvidia.com>
 <20240910190457.2154367-2-dstotland@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910190457.2154367-2-dstotland@nvidia.com>


On Tue, 10 Sep 2024 19:04:56 +0000, Dara Stotland wrote:
> Add support for AGX Orin Industrial Module with AGX Orin Developer Kit.
> 
> Signed-off-by: Dara Stotland <dstotland@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

