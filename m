Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587D323E32B;
	Sat, 14 Feb 2026 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771101807; cv=none; b=iC/K2KsUfQkpwVh+NEQ5TvPjVAp0HwzVYQshE9b675h9sq8Sba+/HgH0bVmcJpvI4SQb0Dgq45R37TLwExToHk6HB4n9qHZ2+wtzVe+Ona9b5oBbkY5W+rtrRSxSwShl4Z4sFsYKx1qA1E2A7Qjcjqa7+n5Ln9mTfIG3sViM/xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771101807; c=relaxed/simple;
	bh=Uwebusdb8Z6+N5pUlWIUBZsYts09gcO7zWn2NNGlu8g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ye0YYV5+oaMI6Ra5XPGeWvM9xNhxKjpWqondRLCngiYQgaXIQK7/aWlOcntwBbpDkGFhFVeDqWAEnyTcojYsnv26cf/xDZSRDcy0Nx1kQEb00d0dATwolvUGVTubRSGaWje9TSS1644IRg5BhVX4J3FakxJzcM9Ck7R0pawUme0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=GN/m2nzM; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="GN/m2nzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771101789; x=1771706589; i=marvin24@gmx.de;
	bh=C9ZRp6qHyfxi/eFg7c6n4KnjO0baG/3uTh+De8ZnYxw=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GN/m2nzM1fYlNUL9fpQg18689GLUOjoydlcrUknVjjA8UqTLcncJ5T638bFy6veL
	 xaf/lYMi7zGziNVmYiRRBHUWm5WdHgku269cLafz31zOpWnlEMlkf/yhP8Qcygyhv
	 v8ZfkMTkyibgIJhqNamHBXZi6Saf4I2bQ3Cq0tpXbVWxmVHj8Jz7pYhV42PeQwag+
	 +xeLjGvsYTiXdom8BgESOMpcwU+Dl81v/wRkKZjWtb55/wg301U8+b58kc6LqqWOg
	 2xR3BGmkrYl4LqMNzlGntgSyXT87os2IXLETiHyc89ZJrOtIoPTZs2BA7vYY5B62L
	 t7AzUJGgJRyk0oFA1A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from N8016W05 ([46.81.31.227]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6Db0-1vp8U90iUa-00DeDE; Sat, 14
 Feb 2026 21:43:09 +0100
Date: Sat, 14 Feb 2026 21:43:08 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
    devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
In-Reply-To: <aY_BpRQmLdqOOW2K@google.com>
Message-ID: <82f24afb-1fd2-bfc9-2215-4526aff372ba@gmx.de>
References: <aY_BpRQmLdqOOW2K@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:DEwIXIws4ZApmvH+/inyf7x6DbTNScwVJ08pxdZflXECeWvZYAy
 wfuOUhmj8KToRROKDlgOrwW6Xep27PsIy5wysyzivl+1UyIYNcQG87jZJrf23NBqnZZ3ojf
 5hUB1wsi9hEtgH5Rzq7TswcShm3130gsLXKrRdMP+M3j0bUDzaXI428Dvh4K+ecEwj9xdod
 1dxlwyGt/IFbfvDN+6tfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6MVmqk673Sw=;+L2eaXGB8dhWgRJNXr3asFusg5a
 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
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Fri, 13 Feb 2026, Dmitry Torokhov wrote:

> As of d64c732dfc9e ("net: rfkill: gpio: add DT support") rfkill-gpio
> device can be instantiated via device tree.
>
> Add the declaration there and drop board-paz00.c file and relevant
> Makefile fragments.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> This is not tested on real hardware, compile tested only...
>
> arch/arm/boot/dts/nvidia/tegra20-paz00.dts |  8 ++++
> arch/arm/mach-tegra/Makefile               |  2 -
> arch/arm/mach-tegra/board-paz00.c          | 56 ----------------------
> arch/arm/mach-tegra/board.h                |  2 -
> arch/arm/mach-tegra/tegra.c                |  4 --
> 5 files changed, 8 insertions(+), 64 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts b/arch/arm/boot/=
dts/nvidia/tegra20-paz00.dts
> index 1408e1e00759..d1093ad569e6 100644
> --- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
> @@ -706,6 +706,14 @@ vdd_pnl_reg: regulator-3v0 {
> 		enable-active-high;
> 	};
>
> +	rfkill {
> +		compatible =3D "rfkill-gpio";
> +		label =3D "wifi_rfkill";
> +		radio-type =3D "wlan";
> +		reset-gpios =3D <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;

I guess this can be removed, as it should trigger the LED, which is=20
already included elsewhere ....

> +		shutdown-gpios =3D <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_HIGH>;
> +	};
> +
> 	sound {
> 		compatible =3D "nvidia,tegra-audio-alc5632-paz00",
> 			"nvidia,tegra-audio-alc5632";

I'll give it a try and report back.

Thanks for the nice cleanup!

Marc


> diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
> index a2bb55bc0081..9e3abb14fbc1 100644
> --- a/arch/arm/mach-tegra/Makefile
> +++ b/arch/arm/mach-tegra/Makefile
> @@ -15,5 +15,3 @@ obj-$(CONFIG_HOTPLUG_CPU)               +=3D hotplug.o
>
> obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+=3D pm-tegra30.o
> obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+=3D pm-tegra30.o
> -
> -obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+=3D board-paz00.o
> diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/boa=
rd-paz00.c
> deleted file mode 100644
> index 3ec810b6f1a7..000000000000
> --- a/arch/arm/mach-tegra/board-paz00.c
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * arch/arm/mach-tegra/board-paz00.c
> - *
> - * Copyright (C) 2011 Marc Dietrich <marvin24@gmx.de>
> - *
> - * Based on board-harmony.c
> - * Copyright (C) 2010 Google, Inc.
> - */
> -
> -#include <linux/err.h>
> -#include <linux/gpio/machine.h>
> -#include <linux/gpio/property.h>
> -#include <linux/platform_device.h>
> -#include <linux/printk.h>
> -#include <linux/property.h>
> -
> -#include "board.h"
> -
> -static const struct software_node tegra_gpiochip_node =3D {
> -	.name	=3D "tegra-gpio",
> -};
> -
> -static const struct property_entry wifi_rfkill_prop[] __initconst =3D {
> -	PROPERTY_ENTRY_STRING("name", "wifi_rfkill"),
> -	PROPERTY_ENTRY_STRING("type", "wlan"),
> -	PROPERTY_ENTRY_GPIO("reset-gpios",
> -			    &tegra_gpiochip_node, 25, GPIO_ACTIVE_HIGH),
> -	PROPERTY_ENTRY_GPIO("shutdown-gpios",
> -			    &tegra_gpiochip_node, 85, GPIO_ACTIVE_HIGH),
> -	{ }
> -};
> -
> -static const struct platform_device_info wifi_rfkill_info __initconst =
=3D {
> -	.name		=3D "rfkill_gpio",
> -	.id		=3D PLATFORM_DEVID_NONE,
> -	.properties	=3D wifi_rfkill_prop,
> -};
> -
> -void __init tegra_paz00_wifikill_init(void)
> -{
> -	struct platform_device *pd;
> -	int err;
> -
> -	err =3D software_node_register(&tegra_gpiochip_node);
> -	if (err) {
> -		pr_err("failed to register %s node: %d\n",
> -		       tegra_gpiochip_node.name, err);
> -		return;
> -	}
> -
> -	pd =3D platform_device_register_full(&wifi_rfkill_info);
> -	err =3D PTR_ERR_OR_ZERO(pd);
> -	if (err)
> -		pr_err("failed to register WiFi rfkill device: %d\n", err);
> -}
> diff --git a/arch/arm/mach-tegra/board.h b/arch/arm/mach-tegra/board.h
> index 7b3ef0dc9be1..86c3ea0d6b30 100644
> --- a/arch/arm/mach-tegra/board.h
> +++ b/arch/arm/mach-tegra/board.h
> @@ -19,6 +19,4 @@
> void __init tegra_map_common_io(void);
> void __init tegra_init_irq(void);
>
> -void __init tegra_paz00_wifikill_init(void);
> -
> #endif
> diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
> index 9ef1dfa7b926..f324a7e491d8 100644
> --- a/arch/arm/mach-tegra/tegra.c
> +++ b/arch/arm/mach-tegra/tegra.c
> @@ -83,10 +83,6 @@ static void __init tegra_dt_init(void)
>
> static void __init tegra_dt_init_late(void)
> {
> -	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
> -	    of_machine_is_compatible("compal,paz00"))
> -		tegra_paz00_wifikill_init();
> -
> 	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
> 	    of_machine_is_compatible("nvidia,tegra20"))
> 		platform_device_register_simple("tegra20-cpufreq", -1, NULL, 0);
> --=20
> 2.53.0.310.g728cabbaf7-goog
>
>
> --=20
> Dmitry
>
>
