Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DCF3451BA
	for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2026 13:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479518; cv=pass; b=geHz4xcHBgwzMNlYFCNfCtjKUCz3AEXR9QZWOgUGT5KWHb9/t/aqD+vjFZBWuCvhJif/c2zrvCDk83aj7jRNqkEr1UY1nfvB2av0GeSe5gZ1i18PVFgXBdQBdnqBxS2Dq/0S1kk2EKRICKtGX58kcWXK2Y9/toc3HIjM9sOxkv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479518; c=relaxed/simple;
	bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXdafx2Jo85jSzK+lASDH7MjBmAuIBqQZVnva+/4IKW7qyT51xw2ey4AVZvPmpv7IuIgvyW/9wthsZF94ZtX/xvP5aLBr15mbBciJ2VbQ8nlSCM6IjNDIXjryZA0p/WE5UUKXUOjqIL4wDP7XJLK2HlJEH5waiEEUzOl0HDdZHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLmglm0f; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sAubD7Yb; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLmglm0f";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sAubD7Yb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782479515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
	b=cLmglm0fFtdT+tIAZb6uKVEXMr65V0gMWXMmZyYqtbeIF6nMdAu+bEKeh2VZ+R1JfpLlrc
	pU7ZGeCtvqzRnHmVrQsaAAOCvrSNFIjeCgKSqIqGo84Yq7T70fQAU4eNrDSa/MAhN2vjmY
	3rFzQKQT3MKDDLHfxYtEgTvV8Ku8MIo=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-g_duD7DFNa6_cpdciGpRfw-1; Fri, 26 Jun 2026 09:11:54 -0400
X-MC-Unique: g_duD7DFNa6_cpdciGpRfw-1
X-Mimecast-MFC-AGG-ID: g_duD7DFNa6_cpdciGpRfw_1782479514
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7f582244e9eso19770027b3.3
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2026 06:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782479514; cv=none;
        d=google.com; s=arc-20260327;
        b=Pe8lOy2uM/FXf+p/KZPn1g5rqEG4LoXM9lGAGz7ptX6i/5qHQcUYWtuPZLbOUj7nL+
         M6f6FlzfVa5ZZMtIZjHVJPS+j6UsHp42JwCTDh8hNn53RE3ORasZCqz+BhfVYnRAGrwS
         yirtlOSCMjzoErAwpNn4RvgjdhAdinf7H+S4MhEon/y6CpXQqys81bnIsaQCydWHBMyq
         08fJ1h3GM0Mp3R6QRUc1cAy10+Asu/6N/jqK2HjD6H6g9eUVePZcLN0Vz0OCgfhc4ce7
         k2Klp5Czo0T1h+yTHkadvND/dtjrM/RJ22eeXXhwOXKUKViyAHAlt8/YEHYrz+i7obr+
         UyPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        fh=t7GjCOpsTkXSR3sx190EvzgDqpn/O8YKmcERnj5lDjk=;
        b=sgOMudPZgypUzsWHQHWvhbxldTL5tMTZ1tPOPoRWGHGf9xrZI+tO5c9iVWHvgcQFwU
         jKSO0ijNzBvtgw/h21+NomBPwjxaUv+4BdGV10ao9DTvVo3GNsOX4/pgiexChsRUfzaH
         RrPfjZZFLUCAHpmeNuWYSXLOvnL3SkoJqAUURGpBNbH755RNmTTFKhxlCSOP8fZwwbWM
         bIlz46G52OJlbIwgP0FtoiNdmip7iK+EZsA+Mc6tA3f4ozwMdlX1Ye6/NqIrW/ai3Wdt
         tGLpYpPpIDnvOgQMrMxpJ0jMCIf/jOfrW07bLmp/087VNsCQIu7ik0/NEQF5VpjTEvAu
         Addg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782479514; x=1783084314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        b=sAubD7Yb7LUmfQpQu93uI7b5QWNfE1tPgkdwkbPFHEl3RoaQQbd78pPlAdZ9LR7bJP
         v1XHNREnREmDw7YzuqBj44stkuRHgykOsozXyL2VJRWyGHUQUbkP90ozIjnABrFXhCV+
         7sHJG8zudzyxKTMX4yPGSjfq/d8zGyB5xgSTme7bCSG5ArMhsaURdawmO84EpxbcfCTC
         JlPirzBNJnbPRtnuCXGPbh2slMj5i1NWU+5pGJOBMSqt2dtXIanKWpdr7MaGXK42kiuH
         2A54yq1+oBAPNlKjUXUDUcTdSouIFVKkDvReoZE9XGwZgy0bLRHzpnGaQIkyHsv7DkP8
         M5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479514; x=1783084314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKNTFsC75BNMcJnQI4eMzMtTvr9UpO3oOorJIEMb0vQ=;
        b=E2MZHMmYE2YsSY2fIHFgFMt0/Fd5zbgImc6R3dZ5KeCWmMvXzvK0NFgYiZOW3jxlPL
         +EaYYDL04i2PCyZaFthEWuPYccgYAdJkUz9GernDq/TeO+e7EROAtJqqAGaz++B0IXWu
         lm2G7ba9J5yV929X/akHmywnBkenHHQFnRvb1fmD4ClRX38aFwKMFdLZYblAKo3LrMnr
         CAo8oH4ffAJGn++kt7ncGaY+4eiMAlFYbZhAghlKW0nIo+LQjPBZv7SYr0P2KMT4iei6
         IVM1l7OXEvIRwtHGTVaj5R4WzFNjW72+DlGRVZWb+eW347+bcN1147ashr/MLKkzSPAV
         +0Aw==
X-Forwarded-Encrypted: i=1; AHgh+RpehWkZogOKbrc6p3pLfCdf/GkeHnX36VR6O5bsktWuYxkJLrK6dmQc/8NF8s1N5ivRB9xsHG8mbhdPCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5caKIUS4P/B5gfN1z0a9JXv64bbq7fB8LkNuaVK+NwwsYboV
	Q1PcOL5AGq1NmQPdPFzr7H/pyGxPWVVgvg2i3LBYqb0m3B0UOgAAYLRGZKhAYhrMZQiyz+2bavq
	sgv4hah8+cUhoVnzAq7qmBmjb9GSUPTp+14e5K4kXYTsjTa/duB28LB0hgcDriKRT/haElNuSx1
	bWu/eGCd3z1vU+Y9xJdA4PvEUl7j7o7f+hOQPzm+Q=
X-Gm-Gg: AfdE7ckeaAzc2GwnvidRebdxhtGygZ9d3YszXubMgsxqf2kfGwgxUvO5EeyzSXh69f7
	YUQznRDGsReRaLg4yjPz6pyk9ZbwVSwgQqKQNBMIHT8X3bgYhYW2ZGtaMjuDFkF71pWbbQVw+lB
	awBjm8MZ+V0KK/dYEOwsyrbetpQsaWRZJ8Gm7sdeAJ25ciBVW0oFoa8p8k9HS0Ep7i
X-Received: by 2002:a05:690c:2601:b0:80b:ef0a:7aad with SMTP id 00721157ae682-80bef0a8585mr15809687b3.31.1782479513429;
        Fri, 26 Jun 2026 06:11:53 -0700 (PDT)
X-Received: by 2002:a05:690c:2601:b0:80b:ef0a:7aad with SMTP id
 00721157ae682-80bef0a8585mr15808937b3.31.1782479512984; Fri, 26 Jun 2026
 06:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-4-cca1a7b3bdef@redhat.com> <20260626-manipulative-rainbow-rhino-d73b65@houat>
In-Reply-To: <20260626-manipulative-rainbow-rhino-d73b65@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 15:11:41 +0200
X-Gm-Features: AVVi8CcW-L7vrM5Bm_e3_mA7DiL0CVsM1LDa8FwSzsOcNktoquvN-pr6tbwgp5U
Message-ID: <CADSE00+1m1ASzJzefO2bLuMYAJa3kSmW4py7Qng70VnZSUv0sg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/bridge: release panel reference on all lookup
 exit paths
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

On Fri, Jun 26, 2026 at 2:53=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Jun 26, 2026 at 02:03:26PM +0200, Albert Esteve wrote:
> > of_drm_find_panel() and drm_of_find_panel_or_bridge() now return a
> > counted reference that the caller must release with drm_panel_put().
> >
> > For bridge drivers that immediately wrap the panel in a panel_bridge
> > (which acquires its own reference), release the lookup reference right
> > after the bridge creation call.
> >
> > For analogix-anx6345, which stores the panel for direct use, release
> > the reference in the i2c remove path.
> >
> > For platform drivers using analogix_dp_core with a component lifecycle
> > (exynos_dp, rockchip analogix_dp), release the lookup reference in the
> > platform remove() function. The panel_bridge created during bind() hold=
s
> > a separate reference that devm cleanup releases after remove() returns.
> >
> > Also fix devm_drm_of_get_bridge() and drmm_of_get_bridge() in
> > bridge/panel.c itself: both call drm_of_find_panel_or_bridge() and
> > then pass the panel to devm/drmm_panel_bridge_add(), which acquires
> > its own reference via drm_panel_bridge_add_typed(). The lookup
> > reference was never released; add drm_panel_put() after each bridge
> > creation call.
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
>
> I think this one should be either split into one patch per driver, or
> merged with the of_drm_find_panel patch. I'm still not quite sure which
> would be the best, maybe the latter?

I have spent some time myself thinking about how to approach this.
Initially I thought about doing one patch per driver as you suggested,
but since there are many similar fixes that are mostly one-liners, In
the end I decided that grouping them would make the review easier and
result in a less inflated series. Maybe merging with of_drm_find_panel
patch makes sense to avoid having one patch introducing a transient
reference leak (even if it is fixed right after and is bisectable).
But that will also create a giant patch (harder to review?). Another
option could be to merge patches 4 and 5, which basically update all
callers, and keep the API update separated. Either way, I am happy
with whatever you decide is better. I will take note of this for v2.

>
> Maxime

