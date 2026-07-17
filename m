Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25EF3911B2
	for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 11:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287588; cv=pass; b=PRj2sdon63CO/wtjFo5nTlULfDZvDG/zvuDr9zhJpi3MfzgtD1brDd8i+tVR7pXQ7ObcvQ8JpQcN4NXF9QAEh8fZKFB640RpjZsiVh/RTOIyFX6I4CBXVZHrPluBvzg9yvXFbPokF4IMej2o1DcwfPJ8bnZHT3UqRpBT2/2PmK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287588; c=relaxed/simple;
	bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tleBYcCf1K5vAcKClhlkcnoJqfBUYSFuuBG18dMd4M252FD1cmbWf0U+pH8gxRrRWzLBSHhvkvt7km3gEY5i6M7AF82j5ZIYN4ydBXHNIkKbDkVppBIJDMK7+RBGAItfr33yEsxnaJrsyaV/1W6MXIcjAkSVWWMYlGA9nLsS6Yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tz9KiGH4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkPuMfAv; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tz9KiGH4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkPuMfAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784287580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
	b=Tz9KiGH4CJ5ECbcCYm4nFLCj8efZERxj7BXNRFSfpbno92VhNRMXPMEQg7BwGL36dL9YYy
	3AthkD1ewJ9M7cqus5Rx5tf5ElYXcXnBJvFz5TgL1nEfbZEWuBIQZKbI/eJogiWxz5d89M
	SO0RiJe7uTolVO30jPs+uZEd6SDEfYM=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-Pg5QSqVzOtaUxnTubzYhGg-1; Fri, 17 Jul 2026 07:26:18 -0400
X-MC-Unique: Pg5QSqVzOtaUxnTubzYhGg-1
X-Mimecast-MFC-AGG-ID: Pg5QSqVzOtaUxnTubzYhGg_1784287578
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66807ba1ce8so4228150d50.2
        for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 04:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784287578; cv=none;
        d=google.com; s=arc-20260327;
        b=lP30BN5zh4qXZcR1d7Z42XC0UG9BrZzb7cL6Z4k4enPNN5yI8bxqJbm7njg3qYGMXM
         kynCClbSbyuCocXovo5tvrxKrDUU0HrCHuxQQfmQQXl3zG1yPpCcH+QW1jhU2BjuYwbj
         HV0uQZPkz5vqQ6hZsOjYkncIuzN7LFOgEtPplDZqbA4qHVe54SXcjG6KIOSKu/PRZS44
         e0LluhtIfQ5Y2P88kXAUMYpR33VOCbJK8mjoif8PPE3oIkJ63E+cxF6OLb3qVNNeuy2p
         o9ticGiCNtG/OGlfUCLtSu4OfKDCYvQUik7Z5RRJTVm0wq5kiL7ArUO7j0VE9i1BW7Ia
         yJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
        fh=ux7VOozbGrJfOQSO9hrmThZuubWBBYxLrgk8LMHVYdE=;
        b=SfChY8avScAMlFSdcneIZUvbz7ZEsscCfQ8/mlCXr9zX84JAFtJ75W08hebG6tgVM/
         K95H3Z7pMGc4LkqgDoIL+BPaIN4Vxf2gNGpX54rdktFwY2GHs9R4zYbAjGSsnl41BaJK
         o3xqadGu/kWAiZkmMWbTHDxkM9LxnDySqS78Y10kFZYwBMkuPDnGTqhQXAZ5SBVlTfy4
         k+8fDEpzIg+8wYvNOJJpohaEN55SMMkv3WTK6YI1fLWKn+N+GNK3JWUl68G0S+G7Pi7U
         bOhp8msuG3CsCjG/4NuPKjN09TPQfu6/kbQ2OwxypnCHBguhlmtVqZmVKFzo5P3ZScYj
         f2oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784287578; x=1784892378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
        b=dkPuMfAv+k2E9nBvXL+bKAaBa+jYrnhdMsC2bR2eUwKZ4mnbrq3tiJekZW2hxFd4xa
         6eicuVh0uCaFzJ3BDWToJPYoCo2rsWg/YOK30OwvtB/KNUuGQIpqRUIpratcRfUUb8z4
         Dzsp9jw2Y1wfsThjrVG6Vy9kRlMayacB6owIbhaAY7yV9ph2adsHO5Ostz8FNn8l6qNJ
         h91KbJB4Fx2ocuedxZ5IsMwuKs/dPvJqaX3JrTLTOwo2mEKMxytUmS/QoGngM61YghBA
         piTMMKauhYhsHa56zWIi8jBr3KuuaFcQzlP4h+UHhMWbrfGgPrgdSY8VU91HtCvduo10
         VPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784287578; x=1784892378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXe76W/8pIhJ+QV+npP2Pr4GqXg7ylW2+hZyFUAZkxo=;
        b=JdsS3OVPxRfZHOlMh1ifzOzMzfq1SgwNyioBSnAKk7Diz13ot0ONolcaHL0LOf2qwW
         7B988BU4O2TOWoJA8O8FmpgQHdV0wiP5e1zcO3a9eQypFTAT48XDiCeX5Drx4bwS+tjb
         gcFVa9op2MTf6FXof25fHG0QvNGeQrfRJVuspHUD8l3OkItab/mncR6GYLKUdmOYYXJG
         7Gex2CufvmB6sGz6Qbu733IlMb02+e9P0Hll8atMggd4wloWbhkxjnsVHKjDrh3N0/xb
         TkIsltkVHxsBpfPwP3CEdnMZk4lF5wAODJ1K3TjOHodMlwG/GTy7oMnJFFiB0HU0JL+F
         ZUjA==
X-Forwarded-Encrypted: i=1; AHgh+RqpbvIdEfH1H1wuXHuuRK7QnRHXSYvp/DXnuD9njjGPw38NtEV0X8KrwrEGUFUph+h6TQn1mdPkpHWE3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzodqbwZ4+O/IhG6dFL7zax0jMCmh3EAH97EbStRofDMJlfBcDi
	Yun2WPNbU7luAk5787U6GngAseZrESqYVWVlN4z+UoZz1ixhJDG6kZ/t/9hLpKMIELYBc8F7meY
	zrEyfW8Iy1NuGaliQdZiWO0T+HFwRc4i7/olptg8r5QmOCxptbMcxRuK9JNNBD/pEFdLgiwvZ3d
	nH1MJ2KBzFQIHa8e2SAQXQTtqoYE16vLywTYk6AlI=
X-Gm-Gg: AfdE7cno+gOT7mRWCkoFrjRLnB+jACLOxR1qPcRijUZb+BCvfM9n8dN8JdfRMyAOn2m
	oiYsQAmFpbqSZQJkSQqORJsS2WicLdh6jMMFOZ3Nm8j6/D+2GUhPN9px3VKycfXkRE+cunGISDT
	i8jDJ4ooaXNzdLn+9NxRebMgXrqcHRU/Q6t374tjyFpeTmg0+5jQzy0NZb
X-Received: by 2002:a05:690e:43cb:b0:668:43ce:50e4 with SMTP id 956f58d0204a3-66843ce511emr36173d50.53.1784287577983;
        Fri, 17 Jul 2026 04:26:17 -0700 (PDT)
X-Received: by 2002:a05:690e:43cb:b0:668:43ce:50e4 with SMTP id
 956f58d0204a3-66843ce511emr36162d50.53.1784287577611; Fri, 17 Jul 2026
 04:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
 <20260713-drm_refcount_wiring-v2-5-d3bb61f4bd4d@redhat.com> <20260717-heavenly-peach-guan-82f0f1@houat>
In-Reply-To: <20260717-heavenly-peach-guan-82f0f1@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 17 Jul 2026 13:26:06 +0200
X-Gm-Features: AUfX_my0X2LQ6M_jKeRcxy0r6pG-sYFIFgqEmiZmXcdV57T8jjudIQuMMnSFyJg
Message-ID: <CADSE00+7=2ph4kRQLc7_MFbp_SSt3eYz-bBxWcfCj6_oFPjwFA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm: release panel reference after panel bridge creation
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 10:56=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>
> On Mon, Jul 13, 2026 at 01:53:08PM +0200, Albert Esteve wrote:
> > Update a second batch of drivers calling of_drm_find_panel() or
> > drm_of_find_panel_or_bridge() to release the lookup reference after
> > wrapping the panel in a bridge.
>
> I would have expected this to be squashed of patch 3, any reason it's in
> a separate patch?

My intention was to make the series easier to review. Patch 3
contained the initial set of callers mostly found via the Coccinelle
script (simpler to address generally), and patch 5 includes the rest.
Including all the changes plus the core API update in a single commit
felt like too much.

That said, I am happy to squash this for the next version (fewer
patches to track).




>
> > Also handle the cases where a panel is found but cannot be used,
> > dropping the reference immediately in those paths.

