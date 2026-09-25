Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BD449D5A3;
	Fri, 25 Sep 2026 13:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342934; cv=none; b=Dd+lG+mroYBtNPYmzy+J8zOt4LmYzLnvyl6TzxyHWK7q4Gnfr2TXTcTjznXVN5ypvR5avde6zPvszKzej8bOG1VRX0D1+PX8m0bAapheARVYeLhu1XkLo9HYa9ArsfRdBx3p1u8T+pKEG9hu6LNKaRQarJ5n+xyfmVZjHa5ROKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342934; c=relaxed/simple;
	bh=F1xH5C7a95d/cOv6Yb7E2RCqCUtWMt+Q+AomaKwJTFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQlpJZe3NQ2Ftkl8gpZ32L4XzX7IvxNqCBte51QHrHZGMyO79Iz8zLC6uKZYRHnFgvsKC9nI4ukc+yt5wbMp3b8SDACE4YeXa9YCPMs7PaOFCI2gXdwJ++fe7vs28eHmDI/WY3OaY4i5TTKC51gvjmhwkvOgwbGmer0D2c7vAbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWRXF7ga; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWRXF7ga"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEDBD1F000FF;
	Fri, 25 Sep 2026 13:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790342932;
	bh=bSLrZfxBm+sJpcjDObl+vNI6lHL2udNZOnB/INObF+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oWRXF7gasE8nIAyLPF3Ida/IZ7rkCihuOoRDQ68KUmTwAzMxYHLZsZJHgmrceq07D
	 S/1ZYYYXBFSrLBBjb4cbUY+rDRaH0ijt4YG8weCG2fzQjl8zIl/8ePHvy7OY6cmb+l
	 UFEGP1nvv8cgSAy23uWtcUwKuyzxawD3u7plp0LPQKVhpiB6vGU37DGX5NFBaE3Z/n
	 t5LNgrv9ze1WqQndcrJyp3qUe4unVB/a1VAIVZzFY0joqO2RBjKezSQPlOrYD/8WZL
	 6yQKE7XqyFgZfm+bFe1AZ6ZeZ0pW4ezprLJSwowstYLJqYR1bgkD46yObJkwBZIeaJ
	 SKvbTSUqZDptg==
Date: Fri, 25 Sep 2026 15:28:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH 3/9] dt-bindings: usb: tegra-xudc: Add Tegra264 XUDC
 support
Message-ID: <20260925-singing-angelic-frigatebird-f894be@quoll>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
 <20260921-tegra-usb-v1-3-74a925a35d82@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-tegra-usb-v1-3-74a925a35d82@nvidia.com>

On Mon, Sep 21, 2026 at 01:19:03PM +0100, Jon Hunter wrote:
> Add a compatible string for the Tegra264 XUDC device. The Tegra264 XUDC
> is similar to that found on the Tegra234 device supporting 4 PHYs,
> however, the register offsets for the Tegra264 device are different to
> previous Tegra devices.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

