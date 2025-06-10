Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE791442E8;
	Tue, 10 Jun 2025 04:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749531569; cv=none; b=uDSn81mh1b3JSlX2v2Iq9K4XiQiij3UbTSady+3fpx3ckAu6LRyo996MY7uAAvXofCmXtSQukIE3i4gLXPEVNxEJWG9kZux0Eb8M+UTNT7BRfHNwy9nvL55mkQ+V1OYJpdlpTEcNNZyJucEu2uwq9u271wLziLJtMzVDg+rj994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749531569; c=relaxed/simple;
	bh=PnT1KkMnyHrbEdTQfddxq3SyGyT8uYt0TnxWRU0VLr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JsScmMjo2P+e5re9msiLkb5s639nYuLaQlmtc3vNwk2X4+D2JWCv5rFsTvACya6GRK7OEHqcYsEPgqNED0KZppgrK0FEGiQlkASB3ioiRjgYdgYS3YNRQd9OxPsx7i2yDkQR1R+ZoQ2ODMGgUcobrLOw9mgbd/5TeviAw5oAmac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=R9EUnTAx; arc=none smtp.client-ip=91.232.154.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="R9EUnTAx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dlck4n7ZL89xi43vZeatFJhr6XAnqZ+D1K3Jv5D9+FU=; b=R9EUnTAxCx9H7ng7I0b/OXniOl
	L0Zy/k3Js1X0kyoP8gItled4L6izykivME1BBpabcQquidAEnYS8zJ9pVPJvBGIcL0ZJdD+LPo0Jy
	As+LFrVnk/SdzolrmWhvPyBQvkFNBjZbp6At5VvHTzB0JfsUKP977pNQ4xo2uVywizI3hjtY+C4SY
	X/pzFUFCm9wetY/mk6IOrUamRcclow4fognVL6vHXfcbe1dee9FseZOxayPta0WIm7DV5GmXCgGDy
	gy1TB0SMaB88mQDP0OlTGo+b9Mv2t5JdOeJxRXEptFi8Y8VxPG6pOH6uJyG62vHvUAZxGaDw0Bv4y
	/r47xVvg==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1uOr4m-007RYE-0x;
	Tue, 10 Jun 2025 07:59:08 +0300
Message-ID: <140a1f16-3baa-46a1-9cb3-a02381cbb3e4@kapsi.fi>
Date: Tue, 10 Jun 2025 13:57:48 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: tegra: Add NVJPG power-domain node
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-2-5f2c36feeb39@tecnico.ulisboa.pt>
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20250606-diogo-nvjpg-v1-2-5f2c36feeb39@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

On 6/6/25 7:45 PM, Diogo Ivo wrote:
> Add the NVJPG power-domain node in order to support the NVJPG
> accelerator.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index 402b0ede1472af625d9d9e811f5af306d436cc98..6f8cdf012f0f12a16716e9d479c46b330bbb7dda 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -947,6 +947,12 @@ pd_xusbhost: xusbc {
>   				resets = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
>   				#power-domain-cells = <0>;
>   			};
> +
> +			pd_nvjpg: nvjpg {
> +				clocks = <&tegra_car TEGRA210_CLK_NVJPG>;
> +				resets = <&tegra_car 195>;
> +				#power-domain-cells = <0>;
> +			};
>   		};
>   	};
>   
> 

Please mention Tegra210 in the commit subject. Otherwise,

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

