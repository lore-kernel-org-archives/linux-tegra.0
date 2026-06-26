Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0604337CD3C
	for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2026 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782486738; cv=pass; b=rJdXTBciM2iGAp5iY5R4HkKG12BeEEUywUxs5wETtAOyTae9YXnkCoL686+fBk+LVvY5ZI2WmGbvCx5MUNy5Uq9ILxUkJ0+8j+4CegqSPAeqGjad257o3xgO6it7lV3EoAeqa555PT/+3PJnNIgHzu12bhkmQwWpsx54v0sb3X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782486738; c=relaxed/simple;
	bh=Evlqo2mKiWd3GWD+tOTSIJ+Llo4YzdKnMs4LsgHm9FM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCHJfTfLOb2I1NwqO+7nnYeXvQSBXJhNpD7qD7YvseQJBdiWjOB/FipOrZf8lBZI/0xlCXrFnKOEnMQDFOTiRBiMj24KNGOk7PjtAUuISJXJQHl2y+kO5c/LskBonPi14aJpaMOZqqTX2lbnmF+GFEzIZdFhte+bn6XeFkpBtIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IucztFzk; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qUqywsK7; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IucztFzk";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qUqywsK7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782486727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
	b=IucztFzkThIEwOajAhn+zqBfJ+suPv8RGKGssYWDwzdr0BSp0vnPP3ftsf2Gt+aE72xgXp
	+mvnYvC1WxPjQH/1O0Ng7MSfUljHI5ukMrHCtOahfWnZF9jxS7dEb3FEZW4kz03y1o01lG
	obCYAlOckTf2RuBpW6st8jTakSMFPKw=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-K_BOfQAGP1-7tDJJ3bc30g-1; Fri, 26 Jun 2026 11:11:54 -0400
X-MC-Unique: K_BOfQAGP1-7tDJJ3bc30g-1
X-Mimecast-MFC-AGG-ID: K_BOfQAGP1-7tDJJ3bc30g_1782486714
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7fe0184fa91so20191747b3.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jun 2026 08:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782486714; cv=none;
        d=google.com; s=arc-20260327;
        b=NDKwZLZFeds0Lke8gIVEze0ASoAdQWkT9CJTMeAasODTZ5hobMBJki3PXXl2TtJExf
         fFR8QRbXvFnKLanMfHsea8EuGBp1J1lSLeZAjuxVjxV0mmo0cGrWv4A4IPIXTVomVO7n
         H1pCcWepOIqBbvRbI6Oun0uAwxT2s1Xj3ey02SJ0Wz2+SdGJMz4+canArvupUfg+VbyI
         mc3vevy+iacHUFLMDQYVHysLKRSrixs2FIlPbFOgj3wsEI/JpZTlA1ZN9msF9n52wSAS
         +886aJDky6vG2Xn/aIHO6JD8qzqnJgGVCQUTU7zOms8v5Jmg8mSlweFPEN900pJYCUK1
         Rv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
        fh=sRgxWuHqZtlvHTOAWpKo5wmuV1qNeV/StGem96pt1h0=;
        b=D/aEHMvEuCLI7UrhFkIqKpyJaslWZWfUmuRPggW/O3+68a3FFuMLapWqmacgM1aLJP
         f+BSQEuMGr83IanN5zO9RlMlZpO4vj4g2ZNvnd5IeOitjQBWMiIca4XHxi0Rsmr7ay0F
         T6WKXN013byyQ+P/Dl8aFCEWok9RXh+VbZxIruEP9kWreCPbPDIsAGnuF354YHNEQA6a
         +4eNqjqoHMVq5vjsMAzGuDvNtM53f0dhTtbowAbm4uo5M0epQS2kMjNngEto+rZG4eqk
         dHeKFcWs7xMpOohGJKyVhB3l3VS9QAxULtXGVN5Ykp3TJR5P5BgOOcuRtLAzLi61jwtC
         tFxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782486714; x=1783091514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
        b=qUqywsK75FJf1QrIm0fEU72pMXDjQUMdBuy5NaOdS+ylNmFxDSI/yKQU+tdCbNsOMr
         mIXjSZNn78h2dU6NFM2q0UdYYXLIz9/F0vxLaz/eQy//GfH2Ejs2LikJGXsz1xuHYktG
         P2uDJ7eCWLNsep0X+MOaPp7xgqsfyk9AiNpeILd6yuITy2z4t0vi0ByCuiZ9qRPMxivN
         jzaAHnLmXHKsxW9Q1U/0DjJRfUQWOKGkpAJyKxwLfyrNX5pVTRNOUImuQSn/TDTNmyZ0
         UHQtTKGIBNbvays1jYc9Tu0rbstVRSHnIs8V/upwCKGqGM2LIpWTDsYlEdrwn5YvE+bA
         /ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782486714; x=1783091514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNWd65/LlS1S7z+e2JXdypKHFrBZo/8VRicT21AfZoc=;
        b=mJ8xNruihSICWwFG9kvWPQt+piKqF6vCOYoRKPiEu4wZguPFiJIiPv/FG9PJ0FshvE
         4fYrBMzMPo7wwYwnfFMWYZSYS6vm3iZ2sPePRXuUyjzhk7CT3b7mcNE/4/nlQaaodUCX
         PWa6PZCMRja4Oc78ub0OEGTFHtcyml+cdtlSp/qPKc5BajyAURyCE8x7oJCJ2gjt5j0H
         2+vaCIg3bwk2pZdYNkS/TRQWDS+k+GOqbVGc1+D+Vnn3GA3YNrSqOKeB3Se/hzgoOVAO
         IHyrHLJWL5Fz+N/yPxahGdXcNNjsuyvfsdEalbvBoYeeLZmzTs6lpR8/QiPdFMkkW46l
         nnEw==
X-Forwarded-Encrypted: i=1; AHgh+RrI4jBoEQ7GoOWLzv+SLa68Px9+woKrn1nDI5W1BXtIW8KdxygMw5H6dM1/1MQmVaN5cA3tXHAs0j94Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxmZsEU5IAJp2F4KQupcrrT0FH96YuasQ0R5EQgAC02RqiaBmA
	4vkW5pprHIGr0NtYNCbt6qoILc42l/7AgwV7++lMwGwyKnqrBcWGge7MDY1wYBYKIrWruOdAp88
	HREHPiA2wLXFZsOXdr1f3fkrY2swO4DoEtBk01ZrCkzSYmcl6zo0A4iRcMVtgUBnwgSH/xD74Ql
	0ke15++zd+ndRd/W0QlwpN3EHxaW1HhRq3+RJRWvo=
X-Gm-Gg: AfdE7clJoL3JZK4FXswD4dCcHwQOs0gIDwDBU2EUrYgH98DijzT44lSaYoihmOXOi41
	1Hk6qxqA28a/B5dHM9xu94VOUcRw3hRpEKHrBon+ccpP1thgRAMKk/sdLRTQY/ljnwEnH/0t3kj
	WE9m2Vr2cxWOubVUvFZ8fla1k/ht9hppZ2FkOcSJt56m+0s7gk0c+jjdLy67wCThsk
X-Received: by 2002:a05:690c:6804:b0:7fc:cbe1:746d with SMTP id 00721157ae682-80c73fe6f4bmr9719247b3.42.1782486713983;
        Fri, 26 Jun 2026 08:11:53 -0700 (PDT)
X-Received: by 2002:a05:690c:6804:b0:7fc:cbe1:746d with SMTP id
 00721157ae682-80c73fe6f4bmr9718797b3.42.1782486713496; Fri, 26 Jun 2026
 08:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-3-cca1a7b3bdef@redhat.com> <20260626-successful-badger-from-neptune-ae2bc6@houat>
In-Reply-To: <20260626-successful-badger-from-neptune-ae2bc6@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 26 Jun 2026 17:11:42 +0200
X-Gm-Features: AVVi8CdeJARTOKb4ohxfJd8a69EdpRugjimEtA7qtwxmMR2cbKOdWmwQblTZgKI
Message-ID: <CADSE00LO98u6aDwvjijO_hAaMBXSGXaWPuFWiveQi_RWQ0MTVA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/panel: make *find_panel*() return a counted reference
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

On Fri, Jun 26, 2026 at 2:50=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Jun 26, 2026 at 02:03:25PM +0200, Albert Esteve wrote:
> > Callers of of_drm_find_panel() receive a pointer with no reference
> > held, creating a window where the panel device can be unregistered
> > and freed between the lookup and first use (e.g., drm_panel_prepare()).
> >
> > find_panel_by_fwnode() is the fwnode counterpart of of_drm_find_panel()=
.
> > drm_panel_add_follower() worked around the missing panel kref by callin=
g
> > get_device() on the panel's underlying struct device. However, get_devi=
ce()
> > only prevents the device kobject from being freed. It does not prevent =
the
> > panel's kzalloc()'d container memory from being released when the kref
> > reaches zero.
> >
> > Fix both lookup functions by acquiring a reference with drm_panel_get()
> > before returning, under panel_lock. Callers are now responsible for cal=
ling
> > drm_panel_put() when they no longer need the pointer.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_panel.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index 545fe93dc28fe..a00ae98ed0956 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -458,14 +458,17 @@ EXPORT_SYMBOL(__devm_drm_panel_alloc);
> >
> >  #ifdef CONFIG_OF
> >  /**
> > - * of_drm_find_panel - look up a panel using a device tree node
> > + * of_drm_find_panel - look up and reference a panel by device tree no=
de
> >   * @np: device tree node of the panel
> >   *
> >   * Searches the set of registered panels for one that matches the give=
n device
> > - * tree node. If a matching panel is found, return a pointer to it.
> > + * tree node. If a matching panel is found, the panel's reference coun=
t is
> > + * incremented before returning a pointer to it. The caller must call
> > + * drm_panel_put() when it no longer needs the panel pointer.
> >   *
> > - * Return: A pointer to the panel registered for the specified device =
tree
> > - * node or an ERR_PTR() if no panel matching the device tree node can =
be found.
> > + * Return: A reference-counted pointer to the panel registered for the=
 specified
> > + * device tree node or an ERR_PTR() if no panel matching the device tr=
ee node
> > + * can be found.
> >   *
> >   * Possible error codes returned by this function:
> >   *
> > @@ -484,6 +487,7 @@ struct drm_panel *of_drm_find_panel(const struct de=
vice_node *np)
> >
> >       list_for_each_entry(panel, &panel_list, list) {
> >               if (panel->dev->of_node =3D=3D np) {
> > +                     drm_panel_get(panel);
> >                       mutex_unlock(&panel_lock);
> >                       return panel;
> >               }
> > @@ -538,7 +542,13 @@ int of_drm_get_panel_orientation(const struct devi=
ce_node *np,
> >  EXPORT_SYMBOL(of_drm_get_panel_orientation);
> >  #endif
> >
> > -/* Find panel by fwnode. This should be identical to of_drm_find_panel=
(). */
> > +/*
> > + * Find panel by fwnode, returning a counted reference.
> > + *
> > + * Behaves identically to of_drm_find_panel(). On success the returned
> > + * pointer has been passed through drm_panel_get(); the caller must ca=
ll
> > + * drm_panel_put() when done with it.
> > + */
> >  static struct drm_panel *find_panel_by_fwnode(const struct fwnode_hand=
le *fwnode)
> >  {
> >       struct drm_panel *panel;
> > @@ -550,6 +560,7 @@ static struct drm_panel *find_panel_by_fwnode(const=
 struct fwnode_handle *fwnode
> >
> >       list_for_each_entry(panel, &panel_list, list) {
> >               if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> > +                     drm_panel_get(panel);
> >                       mutex_unlock(&panel_lock);
> >                       return panel;
> >               }
>
> This part should probably be in a separate patch

Yes. This is another place where I hesitated on organization, as it is
very similar to of_drm_find_panel() fix. But find_panel_by_fwnode() is
much more self-contained (it is declared static to begin with). So it
makes sense to split them. I will do so in the next version.

>
> > @@ -686,6 +697,7 @@ void drm_panel_remove_follower(struct drm_panel_fol=
lower *follower)
> >       mutex_unlock(&panel->follower_lock);
> >
> >       put_device(panel->dev);
> > +     drm_panel_put(panel);
> >  }
> >  EXPORT_SYMBOL(drm_panel_remove_follower);
>
> together with this one?
>
> Maxime

