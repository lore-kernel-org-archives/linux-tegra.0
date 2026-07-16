Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C541D4F5
	for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2026 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784202474; cv=pass; b=awwiEF12Gs/uPHrLX5Cqnoq1HWp0r2I87VcVJ0fr9saJhzByVpat2tocaW0eWoGdKV7J0p7MI6CJRcAFEvcaJY54r5PIBcdZnqlga00cDVUYv02TjXzyH3dLSqVTpKowbCxVmOeo8LbGj//SC6IBFEHhBcPHPWH+h8Kr6lcuBqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784202474; c=relaxed/simple;
	bh=WFGxEqj5teLAtdm6TUJPPXIunLCbSK9EmD6oiIoa/6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQpwN4KkJUYD1YISYkExYSCh1O7/P0h+cTTj7SWs3eApqmY9dRLOL+MAoE6v+A4yxv3HgVv4B+V8I8GE/iLG2czWej5NGsKWH+1/tWSsyLiOTj2+cYY45+QUrp+Hi7G5DaUPYYxoV/ow/Rc/iNy15QlstUmbm6BlCJheyjqs6AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K1ltrENi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F3Im3E93; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K1ltrENi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F3Im3E93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784202470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAIX8vflpEyEoElDzYTggPPmyd+hUNgJkFp1xG3W/a0=;
	b=K1ltrENi5kDUlSCZlwaz+nD16cj12kkLkqWrOpIYJ7BXPxF89xjYmRhEDfg3Uknh4/L+5t
	7k4TBGkYd29RpKQhC/AO6ZoPRoB53hgIFb5uWNJALEZTHvX/y/1gbQCEsXnQMc4+YHnGFg
	/4gFQxIy5Qmt/kHTqKKPi9vMayomi9k=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-kmAorT2nNcO30pnoO5STXA-1; Thu, 16 Jul 2026 07:47:49 -0400
X-MC-Unique: kmAorT2nNcO30pnoO5STXA-1
X-Mimecast-MFC-AGG-ID: kmAorT2nNcO30pnoO5STXA_1784202469
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81aea53d559so19424977b3.0
        for <linux-tegra@vger.kernel.org>; Thu, 16 Jul 2026 04:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784202469; cv=none;
        d=google.com; s=arc-20260327;
        b=B0vnZCNoPuyEjoIbbVbG23g4BVzbgwjvVYPV9PuTSZSdeUUmVKLYgtrKsTWA+bGCyv
         XrHuhvhq0D9+GT/seOo584LkZVqvA73gZXYYWKjMLujq1at2v2onoaPFKPbVGLOKl2qa
         YSd14OkDUV0vq4qF96m+MfLLVEQtBsRSi0ViUn2fUFutVRST5+w6gvDtEWnb22yOVnbe
         NYHlqPE7Yi42bHJXEqguWFj9aiB8cKDTw4ho/h/TBomqCAL2xZdEkFDSSBZ+9EjBQdk/
         4QJZ5XtkJIieGJ/a0CcLbTXu48OrPHtwjHV+XUveaA/S0aukpKQNRoKMSqY3uuQ3V174
         9tRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UAIX8vflpEyEoElDzYTggPPmyd+hUNgJkFp1xG3W/a0=;
        fh=VenZeord/n6VtpS9u9Qrplhov0fUBGPcye+BuGRg208=;
        b=H4k5EogG6fz/QwaX1nzFgoWB90+98Sgmweo+hNwKSTnvdZeFMtBq0wBC7bkbJZERJr
         tY3rW9lnHevcNXeZkk6FL8T5cZomFXSbWvfHpQIR14G/tkm4H8A6PwD69cbqzn5I02Qq
         xwE6Ewf/Ol+9Q0tMph9Ww2GKlUQjeNiEcaZiUEklE54usXDjcY0ouk5xgudPKcY6G+6Q
         /CJ0uSq2uuJoxfUfoKbWEyN4AWpz3ULOcDsxElVjLby2FbzmFVhkzf9PJ/xydvTkVQAr
         xZCHIxL/fY7EKSTWTPdhPIsLtSo/O87dUyTk38vTjl+tlcULdhsJo1TPflRY6Qlp7uv7
         ucow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784202469; x=1784807269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UAIX8vflpEyEoElDzYTggPPmyd+hUNgJkFp1xG3W/a0=;
        b=F3Im3E93wf2Fxhuk0gYA9pdZDWcy8eFhjhSZ6lY11O8qkNz12eysXn7R5JtkVldwq8
         6+MdJIbnovhN/pkHLKjz2mmJuhsLDGo//aPKauWYx3vZmbs/3XIZYdbDrbCl0opvJ3G/
         JgodPM8RzkkYoqQKCX10vDj9byz+cAKSws1iPdWQe5jBYV6Y9UYruSy0qeg6oVrmhwC0
         7jz/In734wTb7sXl30lcQiGPmZ0KUAy3MwuDpFKTorYtPhPfiA+K/k2RtK8I2I/mVOq5
         0bbkI0k6MrKbii1F6pmrSRWWb9QhqhvqMF/NpTlrzaHXAXiJsULqkOC8FfTcd8aFSq+5
         qzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784202469; x=1784807269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UAIX8vflpEyEoElDzYTggPPmyd+hUNgJkFp1xG3W/a0=;
        b=SaBgDNiAcsKDPAFZZswt2h5TORvto7kmNXkdCWBl1IqonWu1LvTNm3c9UjWUWjmPUj
         MWFS2OHuGC5s6+8njuKp0PeE62pet/+NDHvS+QN+jGjIa5hUdekQ2QClR/E5g3uKB/OC
         0hJRscs31UkJOMPJl5A1SPteecwohIcSVFguZ/1LNqDBlDOcmC4yDL/MIiBcEvF4JuWo
         ra2wHurw/TeDVBsTo0fYbM5M3yOqmktLyrt7Ge1MCa1QEew98tongTPkvcAxns5+G+so
         PcbpWeMImSqRI/aCyumURMT5+VQcI4Km7KiRMxp6tbPzTE1t+etFy7AOea0e9uOVR9KP
         2W1g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/lIAK6PuYtu3mLOkvwW4sjwG5LGr0dG7xEFuzrmhPyaPJlPu13AktmjW+iCwERUdhVIINusXkGF5F3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHAB7v9dAdNkApHxp0suW4CZfJlbWz+yB+nfDULEO3MpxUmi/5
	Zv5rUIgT43DKwtXOu/PD5kyaLOxCInlhgYYUaLPL+dX43H3se92dGgJliwvO3TLMx+I4aG5Cl57
	hLkqzN81mArFlP5iQtkTFwTJNlmbcI9s2AUwlppDOD1cnK6GfHpPj8YeBYI9CtjvqXg4CzaA6X/
	Mslo7i41JdcpdQLzKmK9E0asQyGqMlqPutcBTRqbY=
X-Gm-Gg: AfdE7clrfl7i1aY39sFVwzgK3IFnEsO0reHzfajy0Wi5nF7D8bj1HUKJ5oKuA9cNmB2
	SG2u1W15IDwR7YVDUyhpa+7iuGxrkJSLfq3CohxGWj5UZXE/3fiZ0uLwRC6YoaNBKaq+wo9I89y
	VvfzaeZJgmL53KQLYOoR8Fs84kjnixcU3jraTaU/wGEXK5Wq39XRpOhT77
X-Received: by 2002:a05:690c:6a89:b0:81e:c898:bc51 with SMTP id 00721157ae682-81ecfb77678mr53197117b3.70.1784202468562;
        Thu, 16 Jul 2026 04:47:48 -0700 (PDT)
X-Received: by 2002:a05:690c:6a89:b0:81e:c898:bc51 with SMTP id
 00721157ae682-81ecfb77678mr53196867b3.70.1784202468141; Thu, 16 Jul 2026
 04:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
 <20260713-drm_refcount_wiring-v2-3-d3bb61f4bd4d@redhat.com> <hm3gW14-QtmZmT6DKePecw@nvidia.com>
In-Reply-To: <hm3gW14-QtmZmT6DKePecw@nvidia.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 16 Jul 2026 13:47:37 +0200
X-Gm-Features: AUfX_mzB2JkO-VIACloxhbX7HbPpRRw8TGetupyA1jCWwziSfKUaXthnbS4hOYU
Message-ID: <CADSE00Lsr9gsW6HEFrrc6Aq+ecN5mN9Kev_mf5XKjKjAk44-GA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/panel: of_drm_find_panel() return a counted reference
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 9:14=E2=80=AFAM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> On Monday, July 13, 2026 8:53=E2=80=AFPM Albert Esteve wrote:
> > Callers of of_drm_find_panel() receive a pointer with no reference
> > held, creating a window where the panel device can be unregistered
> > and freed between the lookup and first use (e.g., drm_panel_prepare()).
> >
> > Fix the lookup function by acquiring a reference with drm_panel_get()
> > before returning, under panel_lock. Callers are now responsible for
> > calling drm_panel_put() when they no longer need the pointer.
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
> > ---
> >  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  3 +++
> >  drivers/gpu/drm/bridge/panel.c                     |  8 ++++++--
> >  drivers/gpu/drm/drm_of.c                           |  3 ++-
> >  drivers/gpu/drm/drm_panel.c                        | 12 ++++++++----
> >  drivers/gpu/drm/exynos/exynos_dp.c                 | 10 ++++++++++
> >  drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  3 +++
> >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          | 18 ++++++++++++++=
++++
> >  drivers/gpu/drm/logicvc/logicvc_interface.c        | 12 ++++++++++++
> >  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 11 +++++++++++
> >  drivers/gpu/drm/sti/sti_dvo.c                      |  3 +++
> >  drivers/gpu/drm/stm/lvds.c                         |  3 +++
> >  drivers/gpu/drm/sun4i/sun4i_lvds.c                 | 13 +++++++++++++
> >  drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 13 +++++++++++++
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |  2 ++
> >  drivers/gpu/drm/tegra/dsi.c                        |  1 +
> >  drivers/gpu/drm/tegra/output.c                     |  3 +++
> >  16 files changed, 111 insertions(+), 7 deletions(-)
> >
> > ...
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 7f25c50621c94..57a016f47434d 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -1516,6 +1516,7 @@ static int tegra_dsi_host_detach(struct mipi_dsi_=
host *host,
> >       struct tegra_output *output =3D &dsi->output;
> >
> >       if (output->panel && &device->dev =3D=3D output->panel->dev) {
> > +             drm_panel_put(output->panel);
> >               output->panel =3D NULL;
> >
> >               if (output->connector.dev)
> > diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/out=
put.c
> > index 49e4f63a5550d..90db39dbdd332 100644
> > --- a/drivers/gpu/drm/tegra/output.c
> > +++ b/drivers/gpu/drm/tegra/output.c
> > @@ -195,6 +195,9 @@ int tegra_output_probe(struct tegra_output *output)
> >
> >  void tegra_output_remove(struct tegra_output *output)
> >  {
> > +     if (output->panel)
> > +             drm_panel_put(output->panel);
> > +
> >       if (output->hpd_gpio)
> >               free_irq(output->hpd_irq, output);
> >
> >
>
> tegra_output_probe's error cleanup paths need to be updated to clean up
> the refcount. Also, it can technically call drm_of_find_panel_or_bridge
> and then overwrite that value with of_drm_find_panel. While there's
> already a WARN_ON for that case, I think it would be good to fix the
> refcounting there as well for consistency.

Agreed. I really missed those. I am doing another general check in
case I missed similar cases.

>
> As a note, the tegra-dsi code also uses tegra_output and can overwrite
> the panel field with its own -- but in those cases tegra_output should
> never populate the panel and we've been talking about removing that
> code path anyway, so the dsi code can continue to assume that
> tegra_output_probe doesn't populate a panel.

Thanks. I will add a note before of_drm_find_panel() in tegra/dsi.c to clar=
ify.

BR,
Albert

>
> Cheers
> Mikko
>
> > --
> > 2.54.0
> >
> >
>
>
>
>

