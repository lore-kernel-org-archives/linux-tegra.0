Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EA2414A0C;
	Mon, 20 Jul 2026 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553235; cv=none; b=asC9FtQ9LOFx8SPfMovdnIHjUMzbkvClHfSPH9Py4pHx3xxcDRjpcKEHM3J4uTfEpgT7rGTthnUy+6pg1ksTczteOwRxRg/5FN0r0niJZ6ipmIXkUq/n0P2/j44+LdCT30Pp2e7emw4IAp7Zpe2Dp7KXhy9lrQ5AoeziOmyvX5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553235; c=relaxed/simple;
	bh=9BsZpJnlPg2HSDlbLy4ov0+Xr9dxks9E1gmOwgz7Cng=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TpEhLlSJbPRBn+1nUmPrxCa7Lsh07Xoc5y3pU6bxFjMcnZi28miqI1mgyKfUAEtLYgjb/Z3eeRCdTVfUeFGSVa+BHbtT2ja8MZ4U+S35TReuLGIa6BUltVKWd/mNuqkMY5EI/cxfhXnbxiC+cSF8VF6KNr9CIlfUSVGWo+xnRsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0lIAXfW6; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0lIAXfW6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EB3A74E40E75;
	Mon, 20 Jul 2026 13:13:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BFA2E60360;
	Mon, 20 Jul 2026 13:13:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AF1D11BD14B3;
	Mon, 20 Jul 2026 15:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784553228; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lB7WXUeDy7/vdkEKe1OOBE05FF1zuq4aESv2R41btZY=;
	b=0lIAXfW6SBEjFIbgS53IC0goRA2iHo2+WqOIKxAIkpMCF5A9llJT8IVLG8gMZunsWx2Jpk
	fBGDgRtlWCT0DXkGGMaYVyYsPemx1KV9MyCuNgTj6mqsRLddDen3VfR6HZAxfcQcSHaHrI
	KIXXK8vBzpdzJ9eDtXPsJToqXGGCQvVfyevHqYIIiVV2VIZSdlshtS6bmCkqbitWkxgPNS
	zX1qzsTd/ZIJCJvBvEEvlT6uK52ZTK/97iAqrtVF9OmF96ofFMpeAJrxerQ39Hg2s4tML0
	xMrIrW1fnoyCYr4ON5TN3PP6PoznMwK+eIKWaqp0ugbwgWJYA2t7T8GKGMbhQQ==
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 15:13:28 +0200
Message-Id: <DK3FBE5UDRGW.3S7UJ25VWHKNK@bootlin.com>
Subject: Re: [PATCH v3 4/4] drm/panel: find_panel_by_fwnode() return a
 counted reference
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mips@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <linux-samsung-soc@vger.kernel.org>, <linux-tegra@vger.kernel.org>
To: "Albert Esteve" <aesteve@redhat.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Robert Foss" <rfoss@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Inki Dae" <inki.dae@samsung.com>,
 "Jagan Teki" <jagan@amarulasolutions.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Laurentiu Palcu"
 <laurentiu.palcu@oss.nxp.com>, "Lucas Stach" <l.stach@pengutronix.de>,
 "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Paul Cercueil" <paul@crapouillou.net>, "Linus
 Walleij" <linusw@kernel.org>, "Marek Vasut" <marex@denx.de>, "Stefan Agner"
 <stefan@agner.ch>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Kieran
 Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Yannick Fertre" <yannick.fertre@foss.st.com>,
 "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Philippe Cornu"
 <philippe.cornu@foss.st.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Jyri Sarha" <jyri.sarha@iki.fi>, "Jingoo
 Han" <jingoohan1@gmail.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>,
 "Kyungmin Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Peter Griffin" <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Alison Wang" <alison.wang@nxp.com>,
 "Paul Kocialkowski" <paulk@sys-base.io>, "Alain Volmat"
 <alain.volmat@foss.st.com>, "Raphael Gallais-Pou" <rgallaispou@gmail.com>,
 "Thierry Reding" <thierry.reding@kernel.org>, "Mikko Perttunen"
 <mperttunen@nvidia.com>, "Jonathan Hunter" <jonathanh@nvidia.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
 <20260717-drm_refcount_wiring-v3-4-023900c32e01@redhat.com>
In-Reply-To: <20260717-drm_refcount_wiring-v3-4-023900c32e01@redhat.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Albert,

On Fri Jul 17, 2026 at 4:02 PM CEST, Albert Esteve wrote:
> find_panel_by_fwnode() is the fwnode-based counterpart to
> of_drm_find_panel(), used internally by drm_panel_add_follower().
> Like of_drm_find_panel(), it returned an unrefcounted pointer,
> leaving a window where the panel could be freed between the lookup
> and first use.
>
> drm_panel_add_follower() worked around the missing panel kref by
> calling get_device() on the panel's underlying struct device.
> However, get_device() only prevents the device kobject from being freed.
> It does not prevent the panel's kzalloc()'d container memory from being
> released when the kref reaches zero.
>
> Apply the same fix: call drm_panel_get() under panel_lock before
> returning. Since find_panel_by_fwnode() now transfers a counted
> reference to drm_panel_add_follower(), drm_panel_remove_follower()
> must balance it with a matching drm_panel_put().
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/gpu/drm/drm_panel.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 72cf86253c0cd..a00ae98ed0956 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -542,7 +542,13 @@ int of_drm_get_panel_orientation(const struct device=
_node *np,
>  EXPORT_SYMBOL(of_drm_get_panel_orientation);
>  #endif
>
> -/* Find panel by fwnode. This should be identical to of_drm_find_panel()=
. */
> +/*
> + * Find panel by fwnode, returning a counted reference.
> + *
> + * Behaves identically to of_drm_find_panel(). On success the returned
> + * pointer has been passed through drm_panel_get(); the caller must call
> + * drm_panel_put() when done with it.
> + */
>  static struct drm_panel *find_panel_by_fwnode(const struct fwnode_handle=
 *fwnode)
>  {
>  	struct drm_panel *panel;
> @@ -554,6 +560,7 @@ static struct drm_panel *find_panel_by_fwnode(const s=
truct fwnode_handle *fwnode
>
>  	list_for_each_entry(panel, &panel_list, list) {
>  		if (dev_fwnode(panel->dev) =3D=3D fwnode) {
> +			drm_panel_get(panel);
>  			mutex_unlock(&panel_lock);
>  			return panel;
>  		}
> @@ -690,6 +697,7 @@ void drm_panel_remove_follower(struct drm_panel_follo=
wer *follower)
>  	mutex_unlock(&panel->follower_lock);
>
>  	put_device(panel->dev);
> +	drm_panel_put(panel);

Based on your description, can we drop the get_device/put_device() now?

That can be done as a future cleanup, so:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
