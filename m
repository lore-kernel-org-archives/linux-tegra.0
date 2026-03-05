Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D9373BE4
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699345; cv=none; b=VRq1BKvmWHw2y50F5E1F3r48J1tRxBPlXQw8oDoVRCmj+yVR90Yq+W1vWz+nwuxGhC6sl/NMNOW8mM717YO9SFq7V9XqceTabYUx6Rc/v7g/VyyznyamCXyxybwieKnzN/cCmKgBli7z7RbfOsMkwBKkfJ9heXxH8L4FW3ekDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699345; c=relaxed/simple;
	bh=hefLtFvtSppGuVWRD/xSsfWMjnGgnQggEUG9Y7OFLDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEgCPqEFQmCofC3Phux+gZMZz8+6xsxk26DCUyo54VeAOKhV9ZBPGwMuhBgMMxZ0s75Kcz/SQJy9iAtDbA8iruhHd6gigo+QwbvztiJgDdWCIdtHPrG2r0Kx4eWlCO7LVnl5y79kACakja1xtDvRvONTRuxHk6ORGX54U0dpBbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a981f44c9so3435366e0c.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 00:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699343; x=1773304143;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=;
        b=EbWD0LYGjKPhxz2bDwZ7/6IeVDKQIn1lFbKAcubbX1dXU8HqTHZXosx7hm+RBjJ4px
         1o+WN7Z7i0e1k+1Pgxj/cPPmu2/d+FgorZ3umUGVjVyR4oUhj2LpzsWDRF+w9iCsJS1x
         J6kslkwV4yw3vYU2VMykJk9voMO1juD5ZtSBO2WtAHV4XcEu2ZofeXI38F0qo9MwiZ2q
         77UcMhBvh0jVK9vO3lRYAnfSEzAVCXul/jylqZsBOV6BVzDKpoKP1dyb7kp2fj06Pa3Z
         T7hf0xPpM94wjCSamv9cflPmaHQ7pz/r5bfiT69tBjnifbY+WcqRFblzDwS2JRlPyEpZ
         oKWw==
X-Forwarded-Encrypted: i=1; AJvYcCXCVgsuDW2tIB4uA7h/spRqVFDbKS2bCIJMoIw4KHRu7wp9s6CwTsAu+fuRpd4w5tU3h+sm7yrAeE7eXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxo8eTTVO0EXxhPaMPHn/ktgZCpib5hoPVgiy0KEsbIFCVPhGA
	7ups8pZ01XwYFF8kwhqYk2Lfd4+kiEEhhGO+O0mlFy7r6imq0vHqPXLFz0JYv20M
X-Gm-Gg: ATEYQzwMhcns8znUkvAwMHTE3GpD59loXRM3Bs/9tv2pivtKMfgu6lCaTSbslbDFsHO
	pGYfuNfTxRsYVynzJCqPnWv9Ld7xoSlN3pBAWrNXy63/6VA9Bbq9y5hcHi3MCZlgSb0g320gOlz
	Fuq/r1T9hdaYULuwRIOvaUpIyrx17mV4gIuGMfHLqZiWx+E8AKHY5TZWC4ZQk0WC6pDrO6pJlPV
	Y7pPxLGdSaPV+6BIbEnrs0oaVwt8W8odT2WXTiOwYNpJsgYyigrxouRt1IwHOKEElqOmLrm/MEI
	cLHGfuPPmN88+1H2Ye9BqLWp78RrKfLuDafdjCXpL9blznkugmGpTBkYfjeWjjmZbbWZf81Qjqf
	XkKad0YduB9WVhZ/PKesfsvG/NZAMoVWISOCzCsvZPCbxQtIi7SoRQKaujwCKCq3Ocvj8FIboOz
	jJzd+y/7FxHW5sXx+gEsFR8wNyGfaZF3d4A94YmdFTrUl2/RO3vojoaaUpXjuJ
X-Received: by 2002:a05:6122:e462:b0:563:4a88:6eb0 with SMTP id 71dfb90a1353d-56ae75fbaefmr2142799e0c.5.1772699342697;
        Thu, 05 Mar 2026 00:29:02 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56afc9186a6sm168900e0c.5.2026.03.05.00.29.01
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:29:01 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ff1836b4b5so2102011137.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 00:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlQ0ETidAs/t/FdsgUNNouqQoVXSqulo2Z7R0fUwXXKjEZCYyXmyjaDbiDW0qn613rGmgYFkq/NCBpBw==@vger.kernel.org
X-Received: by 2002:a05:6102:1607:b0:5ff:c64d:228c with SMTP id
 ada2fe7eead31-5ffc64d2600mr724913137.22.1772699340961; Thu, 05 Mar 2026
 00:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-13-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
X-Gm-Features: AaiRm50Kgxrt1IEt_9GEmeNyCIrylErpUd7qkh7D4FIoK_FYituUB8DTITetq4c
Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public <linux/phy/phy.h>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:03, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
>
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
>
> Two slight points of contention.
>
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
>
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
>
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
>
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
>
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/phy/phy-provider.h

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -1,246 +1,38 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> - * phy.h -- generic phy header file
> + * phy.h -- Generic PHY consumer API
>   *
>   * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *
>   * Author: Kishon Vijay Abraham I <kishon@ti.com>
>   */
>
> -#ifndef __DRIVERS_PHY_H
> -#define __DRIVERS_PHY_H
> +#ifndef __PHY_CONSUMER_H
> +#define __PHY_CONSUMER_H
>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-props.h>
>
> -#include <linux/phy/phy-dp.h>
> -#include <linux/phy/phy-hdmi.h>
> -#include <linux/phy/phy-lvds.h>
> -#include <linux/phy/phy-mipi-dphy.h>
> +#include "../../drivers/phy/phy-provider.h"

Shouldn't there be one more "../"?
Interestingly, it compiles with/without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
