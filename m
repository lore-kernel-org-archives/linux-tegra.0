Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AED4369229;
	Thu, 26 Mar 2026 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513841; cv=none; b=H/Ly9faqWt/9PY2qNdx6tFhb6IA/l9NQ3IGPeFtYOi0XuWyv0XZgck1InNyf2FZ3xlzpEoARkrFFMsfSVz41zHazGSpJRtORo2kU0/1vxXs+gdORmtBce3uzm7vw+Z53d3jc2ZJVg4jFqqxYuBUJCBxyfpPrhI1RuqDriLfgfNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513841; c=relaxed/simple;
	bh=8z7YTqI6mW5Gbbs9U4qAreBJfPpw3dpSNiy+3D8LbPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVcDmVUkFpIcbzW6NGy1iJy36FZBXzImfUG7bTKy8e/Y+hIcZQo723Iu+Hxeqf+l+QOVYA1MmoVWeNTmMwtm+YoihhPWQSGo2AOJSW/nd2hzXAJSekY9zd3gixyQFlS7LZUtNxN8jwFnURjhcNgJnQ6PY+Crnhb5VDq0n3F6yLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7qT1zK5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7qT1zK5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5447DC116C6;
	Thu, 26 Mar 2026 08:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774513840;
	bh=8z7YTqI6mW5Gbbs9U4qAreBJfPpw3dpSNiy+3D8LbPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7qT1zK5agOao8hgDPWVyNlfROU4BKh8X37YTBE7eAoNlApPt72yA2vqqdrBr+weg
	 RuLqX9MQF2v7fi1M25vBDKLR1dVuvkNPXVOARpb0HxxVKuF//2pVu/IT4F2ydbTFV2
	 WSH2/esQA3y9+EoRsCMSc5Dg9ycWpH2hkEzvQkd3ad8BdEOPYZWF8g6wmKR96EUduk
	 B6Op9IlJZTuxVVtWGVkRhOB7xe0+JugGLL3tdrpkIwTprfZKV3lurLcL78A0jOJ5mv
	 7+hLLVN8X44u3EZt3pMmQzFa3icSkVVCtPQ8ep2bBeyEw7qLMphwitiPLvb5xIcARi
	 DehcRfI4CHG1w==
Date: Thu, 26 Mar 2026 09:30:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH V3 2/3] dt-bindings: net: Fix Tegra234 MGBE PTP clock
Message-ID: <20260326-uncovered-manipulative-potoo-ec2445@quoll>
References: <20260325135811.148480-1-jonathanh@nvidia.com>
 <20260325135811.148480-3-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325135811.148480-3-jonathanh@nvidia.com>

On Wed, Mar 25, 2026 at 01:58:10PM +0000, Jon Hunter wrote:
> The PTP clock for the Tegra234 MGBE device is incorrectly named
> 'ptp-ref' and should be 'ptp_ref'. This is causing the following
> warning to be observed on Tegra234 platforms that use this device:
> 
>  ERR KERN tegra-mgbe 6800000.ethernet eth0: Invalid PTP clock rate
>  WARNING KERN tegra-mgbe 6800000.ethernet eth0: PTP init failed
> 
> Although this constitutes an ABI breakage in the binding for this
> device, PTP support has clearly never worked and so fix this now
> so we can correct the device-tree for this device. Note that the
> MGBE driver still supports the legacy 'ptp-ref' clock name and so
> older/existing device-trees will still work, but given that this
> is not the correct name, there is no point to advertise this in the
> binding.
> 
> Fixes: 189c2e5c7669 ("dt-bindings: net: Add Tegra234 MGBE")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../devicetree/bindings/net/nvidia,tegra234-mgbe.yaml         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

