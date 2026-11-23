Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434112;
	b=Ry9i4sdhIEnYniUwdTSIawfcACeOH0SKXCHlPRnowMG0AM+9ywOdzVhmqR+WjfZhEKqR
	 IJ05NWE8R5Nejlul6Bu7orvHou6lqTF8wtRYGnFmFFG/28UNsCmkSkJIanIhH6Dcs94zc
	 2wgo2RwmTB1WLGJfWvTrusk96oGQfuKhULAIe6FQHr2d94CUrjhLnl50cGmnWqCbbQZAm
	 SE6jJwMcuwYyJf25TgNHN3wnJo85ILZUGYgdCVbQmJsXpE9oCcSWxlpH19UTdGi2sjDEO
	 AwUUhGqW06zdcxED7bR3A2c8+tULLyb44wc4jMpIu6iHTZj0Q4WHfLhD9W9L3zCgMIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434112;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Fso6q+b21aJTsaUC5ezM2VGzAQ/UhrVbM+Mobeho73E=;
	b=VZxNRv6CQuB3wVXjmF8HXUc+MSASTaRbI/vmDNmCqovwVJ19StJ2QpQ1JkaczM/kepgI
	 oPtBEJ7SJVtbPkgyOHmTEKAvDL5mny4Y5Xh7ZZG2aAxASY+cMILEHPsdbNGyPwXLMY0jY
	 5PbKHHjN8teo9mz4HJthgQmsw2jdYzgJZaCtnJJ1PNMjvKDEiusi6K6MISNwLL1ZHwpys
	 6Lbt1fwWMRwgN8NknkHEdIsu1MlLEO5x62RCfQzi/sKyiWzxIR4j+o+ZWIE2gs4CayOiD
	 2Fi9nEUaN/gnEWYbd72+RFuczeeJEiyCnc5YWa//Uwx7rmkn4ajnYUbgYRIw/xi7zkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XjnSiy8D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80173606A321;
	Mon, 23 Nov 2026 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XjnSiy8D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1AD1F000CF;
	Mon, 23 Nov 2026 11:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795434111;
	bh=Fso6q+b21aJTsaUC5ezM2VGzAQ/UhrVbM+Mobeho73E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XjnSiy8DeIcpItdaI7x+pn4YPE63DMt35QdLHbJrOfo4OzsEiqQdPspSN/SWXoWut
	 bizvACZe9GXOARCdH14R9b1dapVdhwrBiOkyW0oyabt+SyBtxGQPz/EdUWlIHD8Omx
	 jxdU5LtcExrD9zQgORR3AUO/YEWX1HpEfyXMasufKhoT0Sd1itNKKvDPGsPhVWBbTe
	 10pAGsqrgJpBIXG7DO5aDxEwAqYGv5wisYWZxJo1P3nUqvoJeTTNI9WfKZRJo7cymq
	 LQAnFmxOrHgG7EblmIgFIJftGb4lf/nM8HFUVZgkcHoSDlVSS0ZF7q6EtvVuD+2GuF
	 PKRefM7h6CnjA==
Date: Mon, 23 Nov 2026 12:41:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: usb: tegra234-xusb: Add required
 properties
Message-ID: <20261123-urban-belligerent-vole-6c7ac2@quoll>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-1-42efc03a9700@nvidia.com>
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
In-Reply-To: <20261116-tegra-usb-v2-1-42efc03a9700@nvidia.com>

On Mon, Nov 16, 2026 at 03:23:58PM +0000, Jon Hunter wrote:
> The Tegra234 XUSB binding does not specify any required properties, so
> nodes missing the resources needed by the controller can pass validation.
> 
> Add a required list for the registers, interrupts, clocks, pad
> controller, PHYs and power domains described by the Tegra234 device
> tree.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra234-xusb.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

