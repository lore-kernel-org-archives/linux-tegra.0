Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B1B3D8108
	for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550831; cv=none; b=CDSDMcy6fi1+otGyVaTMqALllEo8P8s2bU+96F1iT1iU+9UUj2hMScHyL3h3fiSPwSSv//qxHbUc4V1zAYoKAn5IzvbqHiavxU0TwVNIY32E5I5DwK0oDn+O3cNNNxEbJqEDS+CXrm358jLQ0bEHIDfX67dtG3CuODesBLbYVWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550831; c=relaxed/simple;
	bh=EZZ2E4Hk4P3ioWVMaervDcnw6ADW65oM1zGar71sbpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkOGLztnM/MXjV1AsLZA0D64ML+xFvpdfEZsg7nYcwtVtf+MVbGt7H0AMD6fbvQwyYAg3B7ZVzwJ3g95YK4c6/T/dff5sM+ictqN7Ib/rRXgypZpP8EKwTmpsPaaeuubXn5gloilArC0n390WYHgNbxy0QPL7OO7FuRVuFBkhbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d1872504cbso687943a34.0
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 05:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550829; x=1778155629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=;
        b=Nw0oiiEIeG1BVrVFtnckD/lOfy+OX2h+v1BImXgoEa2npKBuBXb6iFxLRmn7CNPHC+
         104iJug7uDGKbefLxR9dbJwjB0KNcHOwF38WUugS1IV9H3lbCJGQ58D9xWW0OoH+9DWE
         yKTgUWJfVxVBKiCAUSizng5pU6mv3NxaibP1R3EdBgxUv/YjqoyL6e93Y44uvSB2jsUC
         XWiLl63t2hULg5LqEK8KnuZlG+fNASERBWetIl/71Cm9OrBdxWtqVVb/+GciRdMKXvjA
         2lCiOEHwv6W6V8AQUIi2K8x1xIxrdebhOGEFHC1vA41TkDqkdyQK7eyx+gxYgZNy8rFf
         tXIA==
X-Forwarded-Encrypted: i=1; AFNElJ/MRASLbkUFxTeT7Ui+ozLhP4IcKbw5FmHvz0yqxSC4MtGkoYYDNbvIiBZi3/CiTFFKyZy1cxbYDp7SoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWHkAtmh7wg93TteXWwMVpSEwv9sE6eH1YqD/zqiSse8aMBE3M
	xiHe6Dv6cYRfRx8ay5O3JUhmFmcR/FysL8lHN68kkX6IxuJ+uFwk8SYcaESve4+TCp4=
X-Gm-Gg: AeBDieszlETAnSyKnfQnCXYWRj7EJxydRQFllCJCbe9sXGVXnJ2MSsaOkC/A9/mwET7
	1dW0x0VYxPLfuBqJVesrCZtMCN5Y+n5FgHcQwugP9+cszc4MGFNrHMNY+70BVYAvWb5OEpgsbW8
	USJUWPA80x4zu+S/Dd9+ZqWi6CGKqdRVdmCXaV9j/Jf64xofTbnd42Se8/L4Qfn3lIuDz6ywtjc
	ZLf++TCOVhnwFfQvp0h9HG357vtFlhfaqQ/zTC1rdIEbaEu7Yr9jUQWH6x4nZikyI6eg7T1x1kA
	2xCNI/jBQnTrF4wyj0leFaF5GXmcWntVyMU7S+NUGZ442y4DV5V+znED4x7DIDKOmJcDiw9G7bt
	j5KH8LNeh52edcxPigc6e3Uuhk0nkNYC9lQj/6jUgTB8VOooW6J80VdBbTihCda2vpJW8MZhCwB
	NmBo1Honnyli27/09/W0RmAzZMFAF6nSeFhO7JS3CMMhwdps3rYdA1l/u2U8uwQ8cpRORBfETif
	C4=
X-Received: by 2002:a05:6820:61d:b0:696:13e9:6863 with SMTP id 006d021491bc7-6967bce1a9fmr751970eaf.2.1777550828879;
        Thu, 30 Apr 2026 05:07:08 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com. [209.85.167.180])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43437231b7bsm1435297fac.10.2026.04.30.05.07.08
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:07:08 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-479d4df9035so1134697b6e.0
        for <linux-tegra@vger.kernel.org>; Thu, 30 Apr 2026 05:07:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ90Pd6tCwciPGB6rdu3UAm1x26boQwqn3k+dvYyNk1nWuL67rsEt08Lx0CgNm1cF0HLksWwGO/y0UxgZQ==@vger.kernel.org
X-Received: by 2002:a67:e708:0:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-62afc506100mr613209137.3.1777550404889; Thu, 30 Apr 2026
 05:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430110652.558622-1-vladimir.oltean@nxp.com> <20260430110652.558622-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260430110652.558622-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 13:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
X-Gm-Features: AVHnY4K0yYb6vTu9KdtDciwvAziqboYRX_ITZ386sa6ttixZ1EP_Mzy9gi4Pi0E
Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
Subject: Re: [PATCH v7 phy-next 17/27] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Thu, 30 Apr 2026 at 13:07, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Markus Schneider-Pargmann <msp@baylibre.com> # m_can

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar_canfd

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);

This (and all the existing getters) should take a "const struct phy *".

>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
