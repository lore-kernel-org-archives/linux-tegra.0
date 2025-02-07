Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5923F296;
	Fri,  7 Feb 2025 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941696; cv=none; b=fZaFwRAcvp0EQJ5/pJKEIXLkVz+EJ0No+AjW+u0fL54MY/nxX4q3i/qEhlYW0UghFGZbPf4WWjSnCz1C7z8OyatAz6FhXuO+MPwCS84DZMllfTCAPe56BU5+GzxglXW6HBOw09ziGp/1B51t8VXhWBhGt6WtplhYgVLUVNzQKF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941696; c=relaxed/simple;
	bh=EkW+pm0yGNLA/SI9agjihBUdPSsVY6nJsC8yARN0ltI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HDFKSuqbOTQ+BIckCyX3+9VwD4hyELLvN9/hPStyZFUC+XZJS0oP6pD078i/owUBHaqCLSbkpsXGQCkmH2F4/jq+grE2/BJUlt1HgV06k9R39iwjpZp0y+GNCAZEKo1edcPe01Q3y6mYJX3Zu9+crLrKjVkbrk/L4rjvovTvsro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0deVuJR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0deVuJR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA95C4CEDF;
	Fri,  7 Feb 2025 15:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738941695;
	bh=EkW+pm0yGNLA/SI9agjihBUdPSsVY6nJsC8yARN0ltI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Z0deVuJRxZUm706INmy8eEh3v7EkNd2suaI6hUy7/aXTkHUpT1akjkughAFDytr8Y
	 ZYo4tXxUIFJOXoqmBHuCvMVXu732RmhM4He7igTyiZ9VfxqgYkNxztOKs9MnoTDgxa
	 f/qdfShYoLqTEwybR289x5mCTrm51H6P+pMLuD8BNbaHvtunR5Mb7KrKOxb6Vdfd7k
	 F8Q8N+RIQBSDRVthmClR1KM2dFrj/97xaCxb/28aU1hrNRsuUvJNQzP4w8ZlGxkYZr
	 V8Bo9a+Hr5YuH3kfjaa8Dxnph4SYrzgg1sHjT45cfl0TC2vcuSZq/TajELlTj0PM06
	 CURtMOaZ1k1KA==
Date: Fri, 07 Feb 2025 09:21:34 -0600
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Haotien Hsu <haotienh@nvidia.com>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, 
 Henry Lin <henryl@nvidia.com>, Wayne Chang <waynec@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Brad Griffis <bgriffis@nvidia.com>
To: Ivy Huang <yijuh@nvidia.com>
In-Reply-To: <20250206222731.3691073-1-yijuh@nvidia.com>
References: <20250206222731.3691073-1-yijuh@nvidia.com>
Message-Id: <173894150768.331065.3745668687012224338.robh@kernel.org>
Subject: Re: [PATCH] arm64: tegra: Enable Tegra234 USB remote wakeup


On Thu, 06 Feb 2025 22:27:31 +0000, Ivy Huang wrote:
> From: Haotien Hsu <haotienh@nvidia.com>
> 
> Populate the USB wake-up interrupts for Tegra234 to enable
> the USB device to wake the system up from low power modes.
> 
> Signed-off-by: Henry Lin <henryl@nvidia.com>
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
> Signed-off-by: Ivy Huang <yijuh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20250206222731.3691073-1-yijuh@nvidia.com:

arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: usb@3610000: interrupts-extended: [[1, 0, 163, 4], [1, 0, 164, 4], [242, 76, 4], [242, 77, 4], [242, 78, 4], [242, 79, 4], [242, 80, 4], [242, 81, 4], [242, 82, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: usb@3610000: interrupts-extended: [[1, 0, 163, 4], [1, 0, 164, 4], [256, 76, 4], [256, 77, 4], [256, 78, 4], [256, 79, 4], [256, 80, 4], [256, 81, 4], [256, 82, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dtb: usb@3610000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: usb@3610000: interrupts-extended: [[1, 0, 163, 4], [1, 0, 164, 4], [251, 76, 4], [251, 77, 4], [251, 78, 4], [251, 79, 4], [251, 80, 4], [251, 81, 4], [251, 82, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0005.dtb: usb@3610000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: usb@3610000: interrupts-extended: [[1, 0, 163, 4], [1, 0, 164, 4], [251, 76, 4], [251, 77, 4], [251, 78, 4], [251, 79, 4], [251, 80, 4], [251, 81, 4], [251, 82, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: usb@3610000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: usb@3610000: interrupts-extended: [[1, 0, 163, 4], [1, 0, 164, 4], [256, 76, 4], [256, 77, 4], [256, 78, 4], [256, 79, 4], [256, 80, 4], [256, 81, 4], [256, 82, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: usb@3610000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: usb@3610000: interrupts-extended: [[1, 0, 163, 4], [1, 0, 164, 4], [252, 76, 4], [252, 77, 4], [252, 78, 4], [252, 79, 4], [252, 80, 4], [252, 81, 4], [252, 82, 4]] is too long
	from schema $id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#
arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: usb@3610000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts-extended' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/nvidia,tegra234-xusb.yaml#





