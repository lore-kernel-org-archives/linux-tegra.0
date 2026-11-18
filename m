Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003718;
	b=aeBBCEoU7l9O2Pkz+CGVGXqIZA+fd3sYQ10SQHwyPMtcunQcDsYwWdDgncGp3ajTZDiJ
	 NHg/nlI+gODxspNjpAyR/Ao3Z+x8YgOYmE+Vvk2HByoVE/iXyI0et1oSUHjRr31fUMbP6
	 Imu+Kwy5w8wS5ungw6/1UiB1gGet8I6/PZGIvWNiNk/ICsJBZ3CCOxcydX+tqqF2YyHVF
	 8Iza8aO/BvMdceqysofO3ac7/eu0K7AEMR7BMX569VMZukBn58+VStqNEAQmimF18UmG0
	 6f3s/hhyf4j0vo2sWAc4BdlGPP7YXFR+WHpRJBazzfhe/z9vgNTaVA95+ijsYJITHuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=ZqIfHdJWGskORflhidLcXHU0GNeut3EmsuGrPNz6McQ=;
	b=XpJ9tkt34tJCvl7q3r0oqFkFFz3bE5dGmctcDnek4HuDjc78QqPUTkCu4kAXXOU2KujO
	 85fO9geZjtDprhmge7SD1W3HqAj/3Mnov2xDNwiyavLG7ghqaKyA57EDgMPygJrYTQPNh
	 tTSLgRon1VxphvABf4A3jNPnW58oQibgFD8BktM2sG476uS32ftkfPzHpjH5fPbb3MGd8
	 5J2ONJ69AkJ9XYAWqy+C9zNJ7vXpDKZV7w9x9ptuM2BsAd+GAIJjtka9Wmt/JYgeh0mcb
	 EAm9Ce3J6dJjEWDxYBbgmaYMubAhqgh/8wicy7/AbgMSIhvDq/jm6QA5rqnBqdRGB1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dHjEII7s;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE69D606A31C
	for <linux-tegra@vger.kernel.org>; Wed, 18 Nov 2026 12:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE69D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dHjEII7s
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so433009f8f.0
        for <linux-tegra@vger.kernel.org>; Wed, 18 Nov 2026 04:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795003715; x=1795608515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqIfHdJWGskORflhidLcXHU0GNeut3EmsuGrPNz6McQ=;
        b=dHjEII7sYKIGDvLqQ4pO+drGT2jbvxAYWX6B8hU1vtFzIioPi/8tyerhlNwA9cnulo
         nM+C/9HieZamGe+RlqKIczNBktKtAJfYJCTgnlrMTziSLFS6+hoAmBBDG5rdBYPrft37
         PBnsGvT4fhaKYJX+WtVuDtUZlVJeutsFgQoB9cQnIg21nS1aOZoZfBS/0ja+0t7dHX3E
         Gi+Rl8C2O0iJZt9Ozg1US4plKShehwe52MrQOrt0lbcUyhPbrHo/SYZAai3aPRq57Ong
         katWEpW3T+I6clLpW89u3Uxwr3xmoM3mbewq2yeh6xqBtTi1B0vkBiCdgqtYBeq7a1YP
         6XIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003715; x=1795608515;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqIfHdJWGskORflhidLcXHU0GNeut3EmsuGrPNz6McQ=;
        b=KTVHLKDXFQQq+9kkj3186oB8fJ7iO4vzvk3zG8n3CZHlcm5lFjfw3BW2RpmdwSIB2m
         OyViAFqU4hAJDl5DDcA1q9JMjJl5Jg2FeL+Rhy7aJeblrAfQJ8CogcBqCQcsckg+43O3
         aT1Votd96QLR3UmdA+EHIJzMFMWSMl0v+nEU4pkoP2HCoeD4jvGZgIuvDlLNPAMXFgJ4
         FvGEYFlPgzJIQSkEAJn05oQuUoT6vLYE17rRbJ8H4Waa6GVUhIydv2m0ewca0/sBEq/J
         MyVQIZrGoSeCDKEVH0TPRN34uzG/sOZj5zQaoHMDNBzBoQQQilevMlJpbBotJO+U+f7t
         QqBA==
X-Forwarded-Encrypted: i=1; AL+hErGZSDP272Hr5sFLlHkyEswm00om2J/PPLxMT89F8YVrBWYHFc5u2oPzLg7UFXvEmmcHWWQhsNZNawu9Jg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8eJszfkydCnuUxyUZV0YTBkwNZdd28eCfYWMnIF/w13U2LbZMw
	ENjy/42KamJxZ27zpTjoja7U76YaA7xnuJgo7uy/tvuvsbykDtgeKORjR/LMk7v6cNc=
X-Gm-Gg: AZFdTZdx1xDQWM+PMbm0vRF0CmGBXXxx5tlGu12P8fAkEREGqJVMBjgqzPp5f3tUPL0
	/GQ5zVP4SGnPFK4z5rfJnVSNA/58yzeYEWNBbS8+GGrEj4Re+BW+TsfUKUrUyDTENTNhxDgCgrU
	vIIkZK9+Quuh7x/LoMx43wiIYGH7m/QKLpElvmoh1qJwuJG1P7VDD184cYB8I7nAwCk7Iz/+BCm
	Ce3u0ZYTI7gu9jZY7VRWgMTq9+1hdWfnyMUSdNrYtu91hYi6oTWv/tGsgtKLL7dWS3+gNEWlvrB
	evjSEv7eCgQ74FPQV68wjZK65D3Jn/oK26T3Kqog2X75x30Hc3JFrBWAv7uDVEm37vkIDW6HS3Y
	r2SzODnOv50S9SqmGTfBDPCh30hMOG0ej5zKBS3AcwVmeGI2ETt1UnVW7zs56XMMixqzCNfQqS2
	PkAAkwUQFVO4YUJVddqMikggZjezoVoKNgkNjr+p513+Z2pWRF8om8eXWhBScqzjAd0Vqat+PMh
	s1hPE2O4X6uQNNHZ1qPwVAGPeLecyieSKNao9McT34R9iWjyofUIz/Vb3WrCwW1DH9Gqsr3jqPu
	Gef7pifg7t4rytaXYZ4NlV4f/9qrY5UKfLPIs+4bVo0v1jzJCVdfWMQzdI3xJfEHxgRsubXbYnq
	5rE/UvN3q8Usdijw=
X-Received: by 2002:a05:6000:470a:b0:4a5:a777:b5d5 with SMTP id ffacd0b85a97d-4a63d1da532mr5045850f8f.55.1795003714869;
        Wed, 18 Nov 2026 04:08:34 -0800 (PST)
Received: from localhost (p200300f65f19a904dea20c2220232395.dip0.t-ipconnect.de. [2003:f6:5f19:a904:dea2:c22:2023:2395])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4a65541f3b3sm4537428f8f.23.2026.11.18.04.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:08:34 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	"Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
	Hugo Sales <hugo@hsal.es>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Zhigang Luo <Zhigang.Luo@amd.com>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Lechner <david@lechnology.com>,
	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	LiangCheng Wang <zaq14760@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dave Airlie <airlied@redhat.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Linus Walleij <linusw@kernel.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Iker Pedrosa <ikerpedrosam@gmail.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nouveau@lists.freedesktop.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Yongbang Shi <shiyongbang@huawei.com>,
	Tian Tao <tiantao6@hisilicon.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	asahi@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	etnaviv@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	imagination@lists.freedesktop.org,
	linux-mips@vger.kernel.org,
	lima@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/9] drm: Improvements around device-id arrays
Date: Wed, 18 Nov 2026 13:08:07 +0100
Message-ID: <cover.1795002467.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=17437; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=cusi/boMbD+x1Pm/G4pa0m2BbrVcm185QOqhPTSRPB4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq/ZUnzEwB4mHy5ZgAJ72PvaAQv4DmXs/I31u7G NTyp2l7bSCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCav2VJwAKCRCPgPtYfRL+ Tv7RB/9msZyqIvVeGaXtwizzwzzkwmEvZBogp403ClUyjQf6dOFf8vD9xdMFNWtqzOwvKhQuXfM SzT9hOFo8OtXAMVgH/GaZrDV2ErZPyGgUIjEDufg9GVearhhRaUM/g83kesoE+IHiG96xKUxBOD wL4cb1gnIAp7Dn7K1azJGWD11ofvPUxBn73KunSE/xmaBZCStfgyl+oMAtdi3ZLcKZwJ3Sud7Lj HBSJhoawj/nWfTauw3Nl/dIZ7tmkEa1Fu8SdGXIk7YEACZ5uawffoHOn9kd1F58wzXUuoCKMmFj NOForLt+l8rIVAUuwfgytSa5MwOZMoz+ZcOSMlzTgvdmZwID
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

the motivation for this series is the wish to replace .driver_data in
various *_device_id structs by an anonymous union. See
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for the idea behind that and the added benefit.

This bases on top of yesterday's next. (Note:
https://lore.kernel.org/all/cover.1794469153.git.u.kleine-koenig@baylibre.com/
is also needed for my quest, but this is orthogonal to this series.)

I didn't split the patches per driver or maintainer team, and I hope I
don't need to because that is quite some effort for very little gain.
I'm happy to provide a stable branch for the unsplit series if desired.
For that I'd rebase on top of v7.4-rc1 in the hope that there aren't too
many changes that were introduced after that point that need adaption
here.

All but the last patch is necessary to progress with the quest pointed
out above. If you consider the last patch churn, that's fine for me,
just drop it then.

I didn't add everyone to Cc: who was emitted by get_maintainer.pl to not
trigger mail server limits. Even only keeping maintainers and lists was too
much.

Best regards
Uwe

Uwe Kleine-König (9):
  drm/amdgpu: Use named initializer for acpi_device_id array
  drm/sitronix/st7571-i2c: Drop unused assignment of i2c_device_id
    driver data
  drm: Drop unused assignment of spi_device_id driver_data
  drm: Use designated initializers for spi_device_id arrays
  drm: Use designated initializers for i2c_device_id arrays
  drm: Use designated initializers for of_device_id arrays
  drm: Use an empty initializer as pci_device_id array terminator
  drm/pl111: Use an empty initializer as amba_id array terminator
  drm: Unify coding style for *_device_id arrays

 drivers/gpu/drm/adp/adp-mipi.c                |   4 +-
 drivers/gpu/drm/adp/adp_drv.c                 |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |   2 +-
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |   8 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |   4 +-
 drivers/gpu/drm/arm/malidp_drv.c              |   8 +-
 drivers/gpu/drm/armada/armada_crtc.c          |   2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |   2 +-
 drivers/gpu/drm/ast/ast_drv.c                 |   2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |   4 +-
 .../drm/bridge/analogix/analogix-anx6345.c    |   4 +-
 .../drm/bridge/analogix/analogix-anx78xx.c    |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |   4 +-
 drivers/gpu/drm/bridge/chipone-icn6211.c      |   2 +-
 drivers/gpu/drm/bridge/chrontel-ch7033.c      |   2 +-
 drivers/gpu/drm/bridge/display-connector.c    |   2 +-
 drivers/gpu/drm/bridge/fsl-ldb.c              |  23 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c  |   7 +-
 .../drm/bridge/imx/imx8qxp-pixel-combiner.c   |   4 +-
 .../gpu/drm/bridge/imx/imx8qxp-pixel-link.c   |   4 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c  |   2 +-
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c   |   2 +-
 drivers/gpu/drm/bridge/imx/imx93-pdfc.c       |   4 +-
 drivers/gpu/drm/bridge/ite-it6263.c           |   2 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c      |   4 +-
 drivers/gpu/drm/bridge/lontium-lt9211.c       |   2 +-
 drivers/gpu/drm/bridge/lvds-codec.c           |   2 +-
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |   4 +-
 drivers/gpu/drm/bridge/microchip-lvds.c       |   6 +-
 drivers/gpu/drm/bridge/nwl-dsi.c              |   2 +-
 drivers/gpu/drm/bridge/nxp-ptn3460.c          |   2 +-
 drivers/gpu/drm/bridge/parade-ps8622.c        |   6 +-
 drivers/gpu/drm/bridge/sii902x.c              |   2 +-
 drivers/gpu/drm/bridge/sii9234.c              |   2 +-
 drivers/gpu/drm/bridge/sil-sii8620.c          |   2 +-
 drivers/gpu/drm/bridge/tc358767.c             |   2 +-
 drivers/gpu/drm/bridge/tc358768.c             |   4 +-
 drivers/gpu/drm/bridge/tc358775.c             |   4 +-
 drivers/gpu/drm/bridge/tda998x_drv.c          |   2 +-
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c       |   2 +-
 drivers/gpu/drm/bridge/thc63lvd1024.c         |   4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         |   2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   4 +-
 drivers/gpu/drm/bridge/ti-tfp410.c            |   2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c         |   4 +-
 drivers/gpu/drm/bridge/waveshare-dsi.c        |   4 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |   2 +-
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |   6 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |   2 +-
 drivers/gpu/drm/exynos/exynos_dp.c            |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  33 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |   2 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    |   2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c          |   5 +-
 drivers/gpu/drm/exynos/exynos_mixer.c         |  15 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |   2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   2 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |   2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |   7 +-
 .../drm/i915/display/intel_display_device.c   |   2 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |   6 +-
 drivers/gpu/drm/i915/i915_pci.c               |   2 +-
 drivers/gpu/drm/imagination/pvr_drv.c         |   2 +-
 drivers/gpu/drm/imx/dc/dc-drv.c               |   2 +-
 drivers/gpu/drm/imx/dc/dc-ic.c                |   2 +-
 drivers/gpu/drm/imx/dc/dc-pe.c                |   2 +-
 drivers/gpu/drm/imx/dcss/dcss-drv.c           |   4 +-
 drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c       |  11 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |   4 +-
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |   4 +-
 drivers/gpu/drm/imx/ipuv3/imx-tve.c           |   2 +-
 drivers/gpu/drm/imx/ipuv3/parallel-display.c  |   2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |   2 +-
 drivers/gpu/drm/ingenic/ingenic-dw-hdmi.c     |   2 +-
 drivers/gpu/drm/ingenic/ingenic-ipu.c         |   2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                 |   4 +-
 drivers/gpu/drm/lima/lima_drv.c               |   2 +-
 drivers/gpu/drm/logicvc/logicvc_drm.c         |   2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |   2 +-
 drivers/gpu/drm/mcde/mcde_dsi.c               |   2 +-
 drivers/gpu/drm/mediatek/mtk_cec.c            |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     |  14 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c     |  20 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c     |  20 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c     |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  50 ++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  26 +-
 drivers/gpu/drm/mediatek/mtk_dp.c             |   2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 395 +++++++++++-------
 drivers/gpu/drm/mediatek/mtk_ethdr.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c       |   4 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |   4 +-
 drivers/gpu/drm/meson/meson_drv.c             |  28 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c         |  24 +-
 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  70 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   6 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.c                 |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c               |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c           |  38 +-
 drivers/gpu/drm/msm/msm_drv.c                 |   2 +-
 drivers/gpu/drm/msm/msm_mdss.c                |   2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |   6 +-
 .../gpu/drm/nouveau/dispnv04/i2c/ch7006_drv.c |   2 +-
 .../gpu/drm/nouveau/dispnv04/i2c/sil164_drv.c |   2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   2 +-
 drivers/gpu/drm/omapdrm/dss/dispc.c           |   2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c             |   8 +-
 drivers/gpu/drm/omapdrm/dss/dss.c             |   2 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c           |   4 +-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c           |   6 +-
 drivers/gpu/drm/omapdrm/dss/venc.c            |   8 +-
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c      |   2 +-
 drivers/gpu/drm/panel/panel-arm-versatile.c   |   4 +-
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c   |   5 +-
 drivers/gpu/drm/panel/panel-boe-himax8279d.c  |   4 +-
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  |   4 +-
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |  47 ++-
 drivers/gpu/drm/panel/panel-dsi-cm.c          |   6 +-
 drivers/gpu/drm/panel/panel-edp.c             |   5 +-
 .../gpu/drm/panel/panel-feixin-k101-im2ba02.c |   2 +-
 .../drm/panel/panel-feiyang-fy07024di26a30d.c |   2 +-
 .../gpu/drm/panel/panel-focaltech-ota7290b.c  |   4 +-
 drivers/gpu/drm/panel/panel-himax-hx83102.c   |  47 ++-
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c  |   2 +-
 .../gpu/drm/panel/panel-ilitek-ili9806e-spi.c |   2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c |   4 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c |  17 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c |  11 +-
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  |  30 +-
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c |   2 +-
 .../gpu/drm/panel/panel-jdi-lt070me05000.c    |   2 +-
 drivers/gpu/drm/panel/panel-khadas-ts050.c    |   4 +-
 .../drm/panel/panel-kingdisplay-kd097d04.c    |   2 +-
 drivers/gpu/drm/panel/panel-lg-lb035q02.c     |   6 +-
 drivers/gpu/drm/panel/panel-lg-sw43408.c      |   4 +-
 .../gpu/drm/panel/panel-lincolntech-lcd197.c  |   2 +-
 drivers/gpu/drm/panel/panel-lvds.c            |   4 +-
 .../drm/panel/panel-magnachip-d53e6ea8966.c   |   4 +-
 drivers/gpu/drm/panel/panel-nec-nl8048hl11.c  |   6 +-
 .../gpu/drm/panel/panel-newvision-nv3052c.c   |   6 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c |   2 +-
 .../gpu/drm/panel/panel-novatek-nt36672a.c    |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt36850.c |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt37801.c |   2 +-
 .../gpu/drm/panel/panel-orisetech-ota5601a.c  |   2 +-
 .../drm/panel/panel-osd-osd101t2587-53ts.c    |   5 +-
 .../drm/panel/panel-panasonic-vvx10f034n00.c  |   2 +-
 drivers/gpu/drm/panel/panel-raydium-rm67191.c |   2 +-
 drivers/gpu/drm/panel/panel-renesas-r63419.c  |   2 +-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c  |   2 +-
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  |   2 +-
 drivers/gpu/drm/panel/panel-samsung-db7430.c  |   8 +-
 drivers/gpu/drm/panel/panel-samsung-ld9040.c  |   2 +-
 drivers/gpu/drm/panel/panel-samsung-s6d27a1.c |   4 +-
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c |   6 +-
 .../panel/panel-samsung-s6e88a0-ams427ap24.c  |   2 +-
 .../panel/panel-samsung-s6e88a0-ams452ef01.c  |   2 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   |   5 +-
 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   |   2 +-
 .../gpu/drm/panel/panel-sharp-ls037v7dw01.c   |   4 +-
 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   |   2 +-
 drivers/gpu/drm/panel/panel-simple.c          |  70 ++--
 drivers/gpu/drm/panel/panel-sitronix-st7701.c |   2 +-
 .../gpu/drm/panel/panel-sitronix-st7789v.c    |  26 +-
 drivers/gpu/drm/panel/panel-sony-acx565akm.c  |   6 +-
 .../drm/panel/panel-startek-kd070fhfid015.c   |   2 +-
 drivers/gpu/drm/panel/panel-summit.c          |   2 +-
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c  |   2 +-
 drivers/gpu/drm/panel/panel-tpo-td028ttec1.c  |   8 +-
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c  |   6 +-
 drivers/gpu/drm/panel/panel-tpo-tpg110.c      |   8 +-
 drivers/gpu/drm/panel/panel-visionox-r66451.c |   2 +-
 .../gpu/drm/panel/panel-visionox-rm69299.c    |  12 +-
 .../gpu/drm/panel/panel-widechips-ws2401.c    |   8 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  36 +-
 drivers/gpu/drm/panthor/panthor_drv.c         |   4 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |   2 +-
 drivers/gpu/drm/pl111/pl111_versatile.c       |   4 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c    |   6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c    |   2 +-
 .../gpu/drm/renesas/rcar-du/rcar_dw_hdmi.c    |   2 +-
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |   6 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  12 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |   8 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  32 +-
 .../gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c  |   2 +-
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c     |   2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  32 +-
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    |   6 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c |  12 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |   4 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |   6 +-
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c  |   4 +-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |  92 ++--
 drivers/gpu/drm/sitronix/st7571-i2c.c         |   6 +-
 drivers/gpu/drm/sitronix/st7571-spi.c         |   6 +-
 drivers/gpu/drm/sitronix/st7586.c             |   6 +-
 drivers/gpu/drm/sitronix/st7735r.c            |   8 +-
 drivers/gpu/drm/sitronix/st7920.c             |   2 +-
 drivers/gpu/drm/sprd/sprd_dpu.c               |   2 +-
 drivers/gpu/drm/sprd/sprd_drm.c               |   4 +-
 drivers/gpu/drm/sprd/sprd_dsi.c               |   2 +-
 drivers/gpu/drm/sti/sti_compositor.c          |   5 +-
 drivers/gpu/drm/sti/sti_drv.c                 |   4 +-
 drivers/gpu/drm/sti/sti_dvo.c                 |   2 +-
 drivers/gpu/drm/sti/sti_hda.c                 |   4 +-
 drivers/gpu/drm/sti/sti_hdmi.c                |   5 +-
 drivers/gpu/drm/sti/sti_hqvdp.c               |   2 +-
 drivers/gpu/drm/sti/sti_tvout.c               |   2 +-
 drivers/gpu/drm/sti/sti_vtg.c                 |   2 +-
 drivers/gpu/drm/stm/drv.c                     |   8 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         |   4 +-
 drivers/gpu/drm/stm/lvds.c                    |   2 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c        |   8 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c        |   6 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        |  12 +-
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c         |   2 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c        |   6 +-
 drivers/gpu/drm/sysfb/ofdrm.c                 |   4 +-
 drivers/gpu/drm/sysfb/simpledrm.c             |   4 +-
 drivers/gpu/drm/tegra/dc.c                    |   5 +-
 drivers/gpu/drm/tegra/dpaux.c                 |   2 +-
 drivers/gpu/drm/tegra/drm.c                   |  84 ++--
 drivers/gpu/drm/tegra/dsi.c                   |   2 +-
 drivers/gpu/drm/tegra/gr2d.c                  |   2 +-
 drivers/gpu/drm/tegra/hdmi.c                  |   2 +-
 drivers/gpu/drm/tegra/hub.c                   |   9 +-
 drivers/gpu/drm/tegra/nvdec.c                 |   2 +-
 drivers/gpu/drm/tegra/nvjpg.c                 |   2 +-
 drivers/gpu/drm/tegra/sor.c                   |   2 +-
 drivers/gpu/drm/tegra/vic.c                   |   2 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |  12 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |   6 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |   4 +-
 drivers/gpu/drm/tiny/hx8357d.c                |   2 +-
 drivers/gpu/drm/tiny/ili9163.c                |   2 +-
 drivers/gpu/drm/tiny/ili9225.c                |   6 +-
 drivers/gpu/drm/tiny/ili9341.c                |   2 +-
 drivers/gpu/drm/tiny/ili9486.c                |   8 +-
 drivers/gpu/drm/tiny/mi0283qt.c               |   6 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c         |   6 +-
 drivers/gpu/drm/tiny/pixpaper.c               |   7 +-
 drivers/gpu/drm/tiny/repaper.c                |  12 +-
 drivers/gpu/drm/tiny/sharp-memory.c           |  44 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |   2 +-
 drivers/gpu/drm/v3d/v3d_drv.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                |   2 +-
 drivers/gpu/drm/vc4/vc4_dpi.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                 |   8 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_vec.c                 |   2 +-
 drivers/gpu/drm/verisilicon/vs_dc.c           |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |   4 +-
 drivers/gpu/host1x/dev.c                      |  20 +-
 drivers/gpu/host1x/tegra114-mipi.c            |   2 +-
 drivers/gpu/ipu-v3/ipu-common.c               |   8 +-
 drivers/gpu/ipu-v3/ipu-pre.c                  |   4 +-
 drivers/gpu/ipu-v3/ipu-prg.c                  |   4 +-
 272 files changed, 1238 insertions(+), 1017 deletions(-)


base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
-- 
2.56.0.rc1

