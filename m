Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFF4283FDF;
	Fri,  5 Dec 2025 22:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764974210; cv=none; b=R1l/gQOIYAQwMJ3qRuq5a4BComWlNkatGXv0c9OjUV6K2ZmR99WLGXOFx0SCFTUmObLrHFaL6Tx9ZF+X3YrBQtHCZQ42LWXL/KYedw8RXPSjFA2UGExomqf7rBwgnxw/LPMjjblJHXhrzxai/01br3SaIPeqVO1V8YUFXenspSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764974210; c=relaxed/simple;
	bh=fozoT2mIHoqlaC/dIcUWXWiqeKFS54g8S0cfQ4C96mc=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nzBnbrgb23T745gOkfgCVcbjh5ltuSKOYUfgHymX/DRveK9JpAP8rsrZSxMN7qBUUkod5sgF+EfHowTmvlkPKSY0iOHJbz7rPG93HB8oWfAqoVbIubqqGF+VocP1/LjM0bF0AZc5Tr2dDtlhEMY6nwe6m+hSi+LlIcTRu18vmR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQ06qna4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQ06qna4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B729C19422;
	Fri,  5 Dec 2025 22:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764974209;
	bh=fozoT2mIHoqlaC/dIcUWXWiqeKFS54g8S0cfQ4C96mc=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=qQ06qna44Yx7eukWkJ5er0z168gA9PNBFZ9s0IewUszxj7u+iap3qm3VxGwydyei6
	 SDlHlwMeQZguV/AjhbmqOIRiHqHjrhSA5mAI3W2RkUPw+P2CeK9QqkVlZGm2PeQ86T
	 HStDYp0ioSaWzKHhqrEqU8740sr03W9527l0lVv3NVNBgl13g7/HXlyY//3PqrK/c+
	 Tdh4arNZt2fBtLtA41+PowHDAt7bziXnsp7OP3+yPH3g0UxGqGAO135jj/Ny+pICaK
	 G3MuvxnJhYGlbmeykaMDGXQ0ayeYj5hWBIsTnbXarbZBqI8RVFdZrybkHCqNWcrdMo
	 nVXJfuY7XHr8A==
From: Rob Herring <robh@kernel.org>
Date: Fri, 05 Dec 2025 16:36:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, 
 JC Kuo <jckuo@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Mathias Nyman <mathias.nyman@intel.com>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-phy@lists.infradead.org
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
Message-Id: <176497381829.863612.7431013132555369131.robh@kernel.org>
Subject: Re: [PATCH 0/5] Fixes to Tegra USB role switching and Smaug USB
 role switching enablement


On Thu, 04 Dec 2025 21:27:16 +0000, Diogo Ivo wrote:
> Hello,
> 
> This patch series contains two fixes for USB role switching on the
> Tegra210 SoC, as well as enabling this feature on the Pixel C.
> 
> The first patch addresses a wrong check on the logic that disables the
> VBUS regulator.
> 
> The second patch guarantees proper ordering of events when switching PHY
> roles.
> 
> The third and fourth patches then add the necessary nodes and properties
> in the Smaug DT in order for role switching to work. Currently with this
> patch series this feature can only be controlled from userspace by writing
> the desired role to sysfs as
> 
> echo "role" > /sys/class/usb_role/usb2-0-role-switch/role
> 
> with role being one of {device, host, none}.
> 
> Further patches will enable automatic role switching via the 'cros_ec_typec'
> driver which is currently broken on Smaug.
> 
> N.B: This series does not add a 'connector' node under the 'usb-role-switch'
> property added on patch 04/04 because for Smaug the connector should instead
> be under the node for 'cros_ec_typec' node and as stated above this
> driver is currently broken for this device. If it is deemed better to
> describe it but explicitly disable the node let me know and I will send
> out a v2.
> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
> Diogo Ivo (5):
>       usb: host: tegra: Remove redundant pm_runtime_mark_last_busy() call
>       phy: tegra: xusb: Fix USB2 port regulator disable logic
>       phy: tegra: xusb: Fix ordering issue when switching roles on USB2 ports
>       arm64: tegra: smaug: Complete and enable tegra-udc node
>       arm64: tegra: smaug: Add usb-role-switch support
> 
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 13 +++++++++++++
>  drivers/phy/tegra/xusb-tegra210.c             |  5 +++--
>  drivers/phy/tegra/xusb.c                      | 23 +++++++++++++++++++++++
>  drivers/phy/tegra/xusb.h                      |  1 +
>  drivers/usb/gadget/udc/tegra-xudc.c           |  4 ++++
>  drivers/usb/host/xhci-tegra.c                 | 17 ++++++++++-------
>  include/linux/phy/tegra/xusb.h                |  1 +
>  7 files changed, 55 insertions(+), 9 deletions(-)
> ---
> base-commit: a8817ff3b5cd99b0a5af57a92d1a3a7980612550
> change-id: 20251201-diogo-tegra_phy-86c89cab7377
> 
> Best regards,
> --
> Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> 
> 
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


This patch series was applied (using b4) to base:
 Base: base-commit a8817ff3b5cd99b0a5af57a92d1a3a7980612550 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.18-rc7-8-gf402ecd7a8b6 (exact match)
 Base: tags/v6.18-rc7-8-gf402ecd7a8b6 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/nvidia/' for 20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt:

arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'role-switch-default-mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml
arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml





