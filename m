Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AB847F2ED;
	Fri, 25 Sep 2026 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342909; cv=none; b=SeH6k6NGb/G6W5z6cMr+VB29SRNC5u78sf0l/y3uhcB6IMGYDhcbK0RfhwZwfOietuHwxzN2rRHKrevBltJ6V48qoWRjoUw43GL/R5gZBMdVBBLPVarlIVOHLFom72KVMQLBwjjnfr/RW71B2n2PtvwxgcnbLhCENSxjgXzjF4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342909; c=relaxed/simple;
	bh=OllZMIxXnvomEfjURimDAuoRIrFYtlNR8euMU7Jxark=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4XJtinA+x41wQexVxGA/YZ4Xh0QHAT3we2NhOcNGOddAbfzgobSwFy38BFjkUziblCU/N3pzoDvPKez/pKHzVeOE6S54pjZ4BsHHeM2CK/dQG7FW5HeGYit7UgKh4PPdVeIKS281rzYZZG4/Z6hPzWgyN55l920L5hI8dF+gSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnLTbuh2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnLTbuh2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B3281F00898;
	Fri, 25 Sep 2026 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790342907;
	bh=igRZSuKdWRa6SLEpVIqru5r9A4TGRbofsMfOGQQjYz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cnLTbuh2c/dXzpAr6JtRYJMJFfO72Rtbtrn7JNwEVAwxDNACeIIQWGkETtVeL8nP5
	 ZQ89mA02T2ACS9yDUuSRNZ+xInQ0xppRoUC5hJjOFa9Ikh5S9abZP128SfunsTeYBJ
	 cGKe4zq2XqYStAXZAMxDCbatwLCQHZ7F0pzQIoEQ/W75+NYHOONWHpuhK+kUTXcIt3
	 ZG52SDvohl7shCQmY2a3VH3ips1ZbqvIebOrhYpoIKFXV+NnLVNxnbiC12fSc3Pdwl
	 Eujg8uFeMhCdQ8lzdqJ4eq1i0hsVPfktja+ib2n7LazuK2svrMpvgGPFFPHEXPowxP
	 Xr5kgewcosIPA==
Date: Fri, 25 Sep 2026 15:28:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH 2/9] dt-bindings: usb: tegra-xudc: Add Tegra238 XUDC
 support
Message-ID: <20260925-obedient-proficient-nyala-31f81b@quoll>
References: <20260921-tegra-usb-v1-0-74a925a35d82@nvidia.com>
 <20260921-tegra-usb-v1-2-74a925a35d82@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260921-tegra-usb-v1-2-74a925a35d82@nvidia.com>

On Mon, Sep 21, 2026 at 01:19:02PM +0100, Jon Hunter wrote:
> Add a compatible string for the Tegra238 XUDC device. The Tegra238 XUDC
> is similar to that found on the Tegra234 device but only support 3 PHYs
> compared to the 4 PHYs on the Tegra234. The XUDC binding only defines
> which of the available PHYs is used by the XUDC controller and the Tegra
> XUSB pad controller binding [0] defines the PHYs that are available.
> 
> [0] Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

