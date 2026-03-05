Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F84F336EEE
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 07:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697380; cv=none; b=QxBbUfLrv7XbJ+HvA6nYwUqWhuH2o/Rw86PaO3PGyalIiBZf4gS+9Tvl3HWSW2XL1Vxdh6LBYc4ABhy8IUBAYuKETGLJqX9vX6nTuwN9vCuo+BogemNt82JSEuGF3BOa2Uw0k2UFh7p00Tur1uuJan9bcaaqilDkonLhDIK8D6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697380; c=relaxed/simple;
	bh=urVD1xPdaF3hV5GqXqVqTidMinFWi7P2lc2J0G3o7gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLGOTzKNWwRGLf4kgI/HevlWD3VM6108/XEArO7M7gwbnlQZGTp4SowTdQbbz2UhqeRH54C1yym6khCEdUY6not0Z23scjXifDcaMGzYTeBZAN2+CMCuI/bYvpyCr416nkGQHnrw6cNUN0u9JDyxSXl3LzxHMlBBqkrXqtPDbu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-408778a8ec4so1685484fac.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 23:56:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697378; x=1773302178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=;
        b=buOl8HbsIvZsxUmMh/W3S4xg7zU9MbwqeVctrd6wTFbbkHKhLDbD0qLOlL3Sbmhr16
         /k+BXaK7J6Pv4prAfHm2fPHa6xOWrWRWGHw+cw+Hl+fkB2Y3SUVQ/dSr8kflaksSf8TF
         cCoHYf5De4w69gzp9G4UZytyen+1QJu7aLZir/oPEvDYkTo1NMBhZgt7kZiTOC7dhmR2
         S9jdIydcNb+6pYITMSZk99wWG1XF2G1vRjDYxsMCkIQX8UpFz2Bx9BkiJfR56XmgtEW9
         JtrXLZwWknmDN4HWdjsrXGN1ushZsX+GTDrrVDPq354fu2aZr5ecUIG3mhttR+uXYXiB
         D1qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUszx7B4dEFMJ4a6dubAUPgDoT9B8MO/mJ6J4nWY5dIYBTo2mNG8tP+4saTzHpE3Ze1WdOLROMXPTgSiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE/EPtfxzwuxzks8OE08K0L/ekm/lVJn++ybUYRmRqxDbgemBy
	Q4T59NYRWNzdvt6BQmMsOJexBFJ89P8Qi9A0mNXyhGB797Tm//4Lio1MpGQg/2YH
X-Gm-Gg: ATEYQzyCh8iBsLlfqm4hx3FC1qzkwTQM3KqayPE7LVEUYv6XwlklxfoLYx/QLvDkqDm
	ghh+FeTvTzUJOyTyhSIOGU2fwgjZQ371TR8sYErgzrXxgcYHc8Res508kot4M8HBjbBwDn+MGUA
	2jY3FYTwIlZKuka5VxZtwThCy377tBTcs+Es2WKIL8eFG/jgmRMRUvHEH3I7bsPupwIQ5ZoqGlz
	vB1c11uc6xSDDMQS4X/n35D3rsNit8pzrXLnyY8OIDIr3dtphhuFynmSu0epg4cXIxnBi7F3BwJ
	sJL//A2c2nERkoa9w9znCSNBScsM6r5fpx6BhibcuXxmxHWepeMjpZTSmEkiCLx6a0vDhZfAexG
	l8XIIFvGF9ALGtVrM0JToythTpOaYHfv7VkQfTg9e0yj5cUPkjzo8fKUc9KjV99NpMK9gXmEk4c
	yA+mXPcTle4sUY0hQDx+2OCpvcwScuALlxk7mv04XVYkvnUkDF3Jv73rnIN3rH
X-Received: by 2002:a05:6870:80c7:b0:3d4:94ef:d05c with SMTP id 586e51a60fabf-416ab5ff55amr3077693fac.21.1772697377778;
        Wed, 04 Mar 2026 23:56:17 -0800 (PST)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cff1aacsm18991228fac.9.2026.03.04.23.56.17
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:56:17 -0800 (PST)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6798f3b7163so6016812eaf.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 23:56:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXomK4g48113DuWmEiUmIHXM98NO/2uzYQvM40sb5pc0BfWf0DODdfhBgUpZlhcQI1EGNM+4FGB6HFMug==@vger.kernel.org
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93f9 with SMTP id
 ada2fe7eead31-5ffaae2d5b0mr1883200137.21.1772696877960; Wed, 04 Mar 2026
 23:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-Gm-Features: AaiRm514iMGAdfTBAVsgfVfK-GGHy9jHY4ezK-Lp3w09-JWpnENLQ0I4lkIFgvE
Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
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
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-

For the Renesas part:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
>
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +       return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);

Any specific reason you are not making this a simple static inline
function, like phy_get_bus_width()?

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
