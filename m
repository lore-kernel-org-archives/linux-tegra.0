Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123477;
	b=fuOLAtFTE594k7oVbmhMrhQ9LNe7BzVqNK3hbAjRroCsxRouSIfAYWCYkWH+r+1ZI43L
	 zZioTSZGYjkBjGqEjf60qNN9S5YRX2splKO2Uj1LVNn1ItF9c9EPTAzpcX+rEpRPQ2ccT
	 m5gr2Jqko7Lhahx9gd7hDQPiICJM7XUaZedhOvfT9lBOvDlj0MgFy+4Qxn3AHu2LZGAYE
	 LuXNSijufHvBa0d2F3GOVClQglw/7K/hpY9YltRcSQODLoSrrkEHLrkILSQUX2DAHANVy
	 hrSm8R1UsAPIEVUbY1yKPTfSp9w1HD66EEkFA/+xeaQ6k1l/RQcU3BmIAkLE59fj79g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123477;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=M0+JEuJ8OIOjO1vhvMj0G5xuGrApLGUATURHEGMW734=;
	b=xNTm1E9I6q9v3RoSmDignjMrgj7d4ZX8nsMDOtkQjfg5TEK1tK4QNTgiWS8qmFGrw/j1
	 WHA2CMmTIsRnUG1nACujDHPpH+XkXxYT5wUgKOmGxRPIfw0aiStSauEd3vwAqQzdHOxis
	 ybHX5Y46DAd/ENiVjr5mwC3OukI3S/TrqAbi+ffjUVfSgrgvqi3/awEQolz1TAOFtdK82
	 jdqTDhxCN+0MWPzrXsWbB95Q0OXWyZTtW/v31eJmO4Oe5fIYfk4tAQyn+JJ207Ri6T59T
	 vwVq7iaeywuhHhI12UIzIy0Gu+O19C2BuWnFgKmpd7Yuq3RLGqurfuhc/drJ52cYn6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27361606A31A;
	Tue, 27 Oct 2026 17:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27361606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <763093e9d22390a36a53fa3f392b49c7b84d09ab.camel@crapouillou.net>
Subject: Re: [PATCH 05/35] drm/ingenic: use devm_drm_panel_bridge_add()
From: Paul Cercueil <paul@crapouillou.net>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Douglas Anderson	
 <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jyri Sarha <jyri.sarha@iki.fi>, Tomi
 Valkeinen	 <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	 <luca.ceresoli@bootlin.com>, Marek Vasut <marex@denx.de>, Stefan Agner	
 <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer	
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham	
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven	
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Biju Das	
 <biju.das.jz@bp.renesas.com>, Linus Walleij <linusw@kernel.org>, Sandy
 Huang	 <hjc@rock-chips.com>, Heiko =?ISO-8859-1?Q?St=FCbner?=
 <heiko@sntech.de>,  Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan	 <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Inki Dae	 <inki.dae@samsung.com>, Seung-Woo Kim
 <sw0312.kim@samsung.com>, Kyungmin Park	 <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Alison
 Wang	 <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, Yannick
 Fertre	 <yannick.fertre@foss.st.com>, Raphael Gallais-Pou	
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai	
 <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, Thierry Reding	
 <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,  Javier Martinez
 Canillas	 <javierm@redhat.com>, Igor Reznichenko <igor@reznichenko.net>,
 Michael Walle	 <mwalle@kernel.org>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>,  Jagan Teki <jagan@edgeble.ai>,
 Jianhua Lu <lujianhua000@gmail.com>, Guido =?ISO-8859-1?Q?G=FCnther?=	
 <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>, Jerry Han	
 <hanxu5@huaqin.corp-partner.google.com>, Joel Selvaraj <jo@jsfamily.in>, 
 Icenowy Zheng <icenowy@aosc.io>, Michael Trimarchi
 <michael@amarulasolutions.com>, Sumit Semwal	 <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,  Michael Tretter
 <m.tretter@pengutronix.de>, Cristian Cozzolino
 <cristian_ci@protonmail.com>, Junjie Cao	 <junjie.cao@linux.dev>, Ryan Brue
 <ryanbrue.dev@gmail.com>, Nickolay Goppen	 <setotau@mainlining.org>, Stefan
 Mavrodiev <stefan@olimex.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Robert Chiras
 <robert.chiras@nxp.com>,  Alexander Koskovich	 <akoskovich@pm.me>, Markuss
 Broks <markuss.broks@gmail.com>, Artur Weber	 <aweber.kernel@gmail.com>,
 David Heidelberg <david@ixit.cz>, Dzmitry Sankouski	
 <dsankouski@gmail.com>, Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, 	linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, 	linux-rpi-kernel@lists.infradead.org
Date: Tue, 27 Oct 2026 18:50:55 +0100
In-Reply-To: <20261026-drm-panel-funcs-v1-5-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
	 <20261026-drm-panel-funcs-v1-5-5e3070a3478f@oss.qualcomm.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Dmitry,

Le lundi 26 octobre 2026 =C3=A0 13:09 +0200, Dmitry Baryshkov a =C3=A9crit=
=C2=A0:
> The connector type passed to devm_drm_panel_bridge_add_typed() has
> been
> ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge
> into
> every drm_panel"), the bridge always has the type of the panel.
>=20
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 625ec76cf04d..cafadcd2b765 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1298,8 +1298,7 @@ static int ingenic_drm_bind(struct device *dev,
> bool has_components)
> =C2=A0		}
> =C2=A0
> =C2=A0		if (panel) {
> -			bridge =3D
> devm_drm_panel_bridge_add_typed(dev, panel,
> -							=09
> DRM_MODE_CONNECTOR_DPI);
> +			bridge =3D devm_drm_panel_bridge_add(dev,
> panel);
> =C2=A0			drm_panel_put(panel);
> =C2=A0		}
> =C2=A0
