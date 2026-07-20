Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7890142253E
	for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 13:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552990; cv=none; b=L7vKhJE5odNl9Dayubr8l64Is+/4GI3p+CNryDGZ6DCxjhNNDi11LZ/kMG+7qmo1VnjMQowsvM1RUsSSw1ymsKJAvyFrO3SAuoqx2jEgG6areF9822E1Jm2KvRglBthY5HCLvNDOShKCiNrupSErpYgess7TudlXMB2RLx+rWOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552990; c=relaxed/simple;
	bh=NibdtCwpxrzNYlWG3qc/r04EtocLChhxPuanrYhvQf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fW2kcJJ0831RP+Cga29jdzBEzHamslhtsSq0wIajK6NOMRnt7RRCalcGeNxxVvTSYCGhAy3F98v2nr8H6a4vUqlj49cpu7rwHo6lElrt4lPux1FVBqqKkX6mDeOWhrOmzwCb9Rdr3MKHEHGYjM+rMG7ppAB9uc158j8bPcbTDZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wHv6x7WZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wHv6x7WZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-475417f010dso5595576f8f.2
        for <linux-tegra@vger.kernel.org>; Mon, 20 Jul 2026 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784552987; x=1785157787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E8mYPhXUmZpNbn2oVo3k+YKafzsgCsS1GE9LMv7AFBw=;
        b=wHv6x7WZ/IV6ZYym8nQcXPLFMwS9lgllAo7xOYbOuwSQqsR0aQMfCZIOU7ib/S90Vo
         +5bMjMfpbKfVjE+1V39fstmHz9V+OuCkorKzJqFqqQbCyQwnq7UkjmN/AQzYUmnV2+L9
         vV4NvhyQZpA+DzH48IfXwHg7cP2d0UzVKiMctwOETCPrykdlruLxK6sakRFkaK+vlhoY
         w3fFquvx/0OgmNsQWlvAZBnljgWum8YJkZKIGmaLhPDL9Hi6NQCxq+QwEn36BbCUv6mE
         uCrUHi6b6iOTOY76BZ/sfWGYnf4G1DYmKIPvm1vkvBLNG3PzDYq+6KAra4CBDgLEB5dr
         0HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784552987; x=1785157787;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8mYPhXUmZpNbn2oVo3k+YKafzsgCsS1GE9LMv7AFBw=;
        b=M0ncyp7GV4XkvpngLmz8PhBJaxgRG5FYJN/Q4msiJmfXB5GWIdxO1zP2xFGvXMT1Pw
         QIxXWB+HKBEnXknf6fly0cczuljcrJoiH25C0w6xJY0Fi5vex9EtD+UKNPPC41YdrxhV
         NEFxJ0CLkDiJ4hG0BsZ2ChJ/aqOGV0SeF0L+RsNbHCoVcl6iYYKVw4usoSHFrAfU6zdM
         koOABYqtk5YNv2Zd7qekgSKmpTH0aF0Mzzi3fu5PyHwEFtYA/wJUOL4CJDsiH9JsfFZ4
         JvSxU0wm2xX29QlrGgRkcaXLu4q5xnMWBlJTySUoX2ETK+RX1gjKrSLMe++oYS45AN8q
         B8Iw==
X-Forwarded-Encrypted: i=1; AHgh+RqeiizRPXkKfN3Wa42561rpmTrhRORUpaOyFmPX3E0bB3xoNT22dEZzdxkvZIcrM+PlM5zaP9L9RqrZ1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLkohmbMzRo2lY9aai+oUc1IhIXxMitjXhXETWVjp7/QP1CwKs
	5Vm9zQOXma92CVaCaYuNkbFvknLzEQ87qwYspEZX0J6YfBy+XnhbyzWQTQ6t2DmLOB4=
X-Gm-Gg: AR+sD13koior5hggL69tz2xWcgqzsaOuy88SiSASNY/vgB7pvZLp/k/PnXVpfzuVQfb
	9jP2IOWdVhuHYin38sSyVDQqsZh3UCKshYhCRqQkyxl7PqxD5d+duDy8n+hbVIsJQfKI2LKUGpX
	j4NKyuwalhPWOCvHtj8uItAyPd8tJgMGEEDns9oTc+Nj9mCxWgHwrm/M48qVy/hI60nWMkdXXvl
	NBdkZhQ1CGfNFp6Nnn0YWnQH+5tTk8JXQnmJ9EspvTiYn2K6iXfLFMNBCN4sW2G8EI9+/+hY5W5
	cDpiQhMPJau9nvnZPQSdHDFe064vj8EE3EKd/wdhntha8JLjOXnOz3us/Awy0XOpZWhnHHjZvrv
	Ry5h3FL/1q/Mp1y8vtrzH4fefl3bSfyqKeUZjAkSAweGMcaOqZrAJoF70GQAu/7OOO9m4mePA1k
	uYAvPskicMj4os6aaw8WV0ioY=
X-Received: by 2002:a05:6000:25fe:b0:46e:c978:7ddc with SMTP id ffacd0b85a97d-47f62316b85mr16082343f8f.24.1784552986541;
        Mon, 20 Jul 2026 06:09:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7ea1sm30767434f8f.24.2026.07.20.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:09:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Linus Walleij <linusw@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Jingoo Han <jingoohan1@gmail.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alison Wang <alison.wang@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Albert Esteve <aesteve@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/4] drm/panel: refcounting panel lookups and references
Date: Mon, 20 Jul 2026 15:09:38 +0200
Message-Id: <178455228150.789946.15332957012612566281.b4-ty@b4>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
References: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

On Fri, 17 Jul 2026 16:02:03 +0200, Albert Esteve wrote:
> The drm_panel subsystem provides kref-based reference counting [1]
> (drm_panel_get/put) but almost nothing in the tree actually uses it.
> This results in a systemic use-after-free pattern throughout the codebase.
> 
> This series aims to close all those issues.
> 
> Patches 1-2: fix the infrastructure. drm_panel_add/remove now keep
> a counted reference for the list entry. drm_panel_bridge_add_typed()
> now holds a counted reference for the lifetime of the panel_bridge.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] drm/panel: have drm_panel_add/remove manage a list reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b619d9d2af33db01ea237e3546e9d55595e94ea0
[2/4] drm/bridge/panel: hold a reference to the wrapped panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/34069e04d338a333561b64a2da055bd16bfba39b
[3/4] drm/panel: of_drm_find_panel() return a counted reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/738ff709f7cf82a41cbd9f6b8f9b1f236ce26610
[4/4] drm/panel: find_panel_by_fwnode() return a counted reference
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d857b8ce04a7ed4b36a11db16968ab1652ed702a

-- 
Neil
