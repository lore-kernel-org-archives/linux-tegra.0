Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395988;
	b=4XeGfvHcCvvw9oMXiqaGTUMxUW9T11Ah3YTQhYLTfMcxPokZhPLd2ctC42MSRjKBgw0i
	 iuw/PPlCx/HxqWL+2K4IN0Q3JJbbgMOZcr9mmt0Kf+rFsM2j+Zw3wUQPJetpES0z6NJfT
	 8jqMARN+BrFsfEZH9fbtvGPjd6AmdKuQMcJRVrCzRqvSifxO9DAfF8ZNi+gNxrZIqTDHV
	 Cyx3tRabqtiHL4DG264YyT+6hCkF+cKaHG3aUOAYPPUFpUPCLqrtYnnQMrctwLdHiOLNU
	 Oh+EwRuCFHDTTqEuGKvkikdGckNojNm8KQe6tOTDAkuz1ECa0fSexGb+MpKwI5UKiKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395988;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UGGOSnoQOa8uQR6vbajtQptujNdknjBUZcDCmSIDNdo=;
	b=5TL6NjrmVTrzwcA+KCiF7blRqQ+tlV5SKvIPt4ozJvKzos/Bakb2Bt7ywaY6wRwyheXe
	 bt5qTgd0xCzgsfYsTYLEI5FOvdBZpM42KmJQVq+dwg0uevdyXK9eFDjyZxPg8UWfiWm3T
	 9Ot5KvFwyysRQHfcWhW/CVtbAIs/fQhNtyiadgel2EqN9bDaD2rwNIM3zqQLifOG5L2JR
	 eap85DsGPhgwyUamMFkqY9+/ErNeL+20tG3G/rYuqeoQfx6+cYiJkRJNZDUoCFFcE1uDx
	 kPWRMT9ea9YhzmaveoSK/efsudlu5mnMUKxEe1mOkn/ppaeT2gM7C354ryCnyccsfSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=QBOWFM3N;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CEF606A321;
	Wed, 11 Nov 2026 11:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CEF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=QBOWFM3N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=UGGOSnoQOa8uQR6vbajtQptujNdknjBUZcDCmSIDNdo=; t=1794395987; x=1795605587; 
	b=QBOWFM3NmCqXcWpeEpiAe1sLa7w9smTt2ygsWJvoDwexClILCEuyimAjy2Dszrb3lsYu4Acc/Uu
	2c6vYi4oIu+hgg+ymTO9QaAf7UP7ZP3OL3Tax6Zb8rzT9A7pywLwZCQnNXt8ysE66/Br8fzvZ1ZWA
	EW3f7wb/10m3DojJt++RZ/cJIBx/4TDW8smgJurrgvL3p7fLP1eUX3PrmqPN5sOTKz/YStz3jaL4H
	20DoIqZoybcHHvr0hpzBJjr71aTMyS5F4hLjaIEd1yoM5CspZlFMsTqAliqzPNQgcdKYx3ff/z2Hp
	I8VsFee+B2mi0pf6N1osXzG9wsT9UQPsgmjQ==;
Date: Wed, 11 Nov 2026 12:19:24 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 tomi.valkeinen@ideasonboard.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jessica Zhang
 <jesszhan0024@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Paul Cercueil
 <paul@crapouillou.net>, Paul Kocialkowski <paulk@sys-base.io>, Linus
 Walleij <linusw@kernel.org>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Albert
 Esteve <aesteve@redhat.com>, Anusha Srivatsa <asrivats@redhat.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, asahi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 17/19] drm/omap: dss: don't create a panel_bridge
Message-ID: <20261111121924.0e54e7e8@kemnade.info>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-17-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
	<20260916-drm-bridge-every-panel-v3-17-83afb4f1a707@bootlin.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 15:45:41 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> Now a panel_bridge is automatically created for every drm_panel and the
> panel-bridge API is just a deprecated wrapper to access it.
> 
> Update and simplify the code by just getting a reference to the
> already-existing bridge using of_drm_get_bridge_by_endpoint().
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

This breaks the display on GTA04/OMAPDRM.

Panel is panel-tpo-td028ttec1 attached via DPI, controlled
via spi_gpio.

I get
[   12.050201] omapdrm omapdrm.0: [drm] No compatible format found
[   12.050231] omapdrm omapdrm.0: [drm] Cannot find any crtc or sizes

Workaround:
rmmod omapdrm
modprobe omapdrm

Regards,
Andreas

> ---
>  drivers/gpu/drm/omapdrm/dss/omapdss.h |  1 -
>  drivers/gpu/drm/omapdrm/dss/output.c  | 42 ++++-------------------------------
>  2 files changed, 4 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> index 4c22c09c93d5..e3e685c931f1 100644
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> @@ -204,7 +204,6 @@ struct omap_dss_device {
>  	struct dss_device *dss;
>  	struct drm_bridge *bridge;
>  	struct drm_bridge *next_bridge;
> -	struct drm_panel *panel;
>  
>  	struct list_head list;
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
> index 6e9bc605ee22..36d37deac802 100644
> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> @@ -12,7 +12,6 @@
>  #include <linux/of_graph.h>
>  
>  #include <drm/drm_bridge.h>
> -#include <drm/drm_panel.h>
>  
>  #include "dss.h"
>  #include "omapdss.h"
> @@ -20,40 +19,16 @@
>  int omapdss_device_init_output(struct omap_dss_device *out,
>  			       struct drm_bridge *local_bridge)
>  {
> -	struct device_node *remote_node;
> +	struct drm_bridge *bridge;
>  	int ret;
>  
> -	remote_node = of_graph_get_remote_node(out->dev->of_node,
> -					       out->of_port, 0);
> -	if (!remote_node) {
> +	bridge = of_drm_get_bridge_by_endpoint(out->dev->of_node, out->of_port, 0);
> +	if (IS_ERR(bridge)) {
>  		dev_dbg(out->dev, "failed to find video sink\n");
>  		return 0;
>  	}
>  
> -	out->panel = of_drm_find_panel(remote_node);
> -	if (IS_ERR(out->panel))
> -		out->panel = NULL;
> -
> -	if (!out->panel)
> -		out->bridge = of_drm_find_and_get_bridge(remote_node);
> -
> -	of_node_put(remote_node);
> -
> -	if (out->panel) {
> -		struct drm_bridge *bridge;
> -
> -		bridge = drm_panel_bridge_add(out->panel);
> -		drm_panel_put(out->panel);
> -		if (IS_ERR(bridge)) {
> -			dev_err(out->dev,
> -				"unable to create panel bridge (%ld)\n",
> -				PTR_ERR(bridge));
> -			ret = PTR_ERR(bridge);
> -			goto error;
> -		}
> -
> -		out->bridge = drm_bridge_get(bridge);
> -	}
> +	out->bridge = bridge;
>  
>  	if (local_bridge) {
>  		if (!out->bridge) {
> @@ -65,11 +40,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
>  		out->bridge = drm_bridge_get(local_bridge);
>  	}
>  
> -	if (!out->bridge) {
> -		ret = -EPROBE_DEFER;
> -		goto error;
> -	}
> -
>  	return 0;
>  
>  error:
> @@ -79,10 +49,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
>  
>  void omapdss_device_cleanup_output(struct omap_dss_device *out)
>  {
> -	if (out->bridge && out->panel)
> -		drm_panel_bridge_remove(out->next_bridge ?
> -					out->next_bridge : out->bridge);
> -
>  	drm_bridge_put(out->next_bridge);
>  	drm_bridge_put(out->bridge);
>  }
> 

