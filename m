Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB27156238;
	Sun,  5 Jan 2025 16:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736094281; cv=none; b=mxfKea09EU3f1+T/jDK34fmJWg2eUC0CvjlfZ41HNiAYPtuEoH3fqA1/smKPal0ULIS/tUVRTD9euzevVltY0mmadH1ed2u9uqXiZ/2ulhcEiZTihB4woC03NHuEFkyrvq+JIRC7O6pwpfwR/Ryb3XrIMfY3WMbzITDMK4acwNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736094281; c=relaxed/simple;
	bh=93keYEgBvz0LSwbojVZVnySM+fK8tKOU/aocT3PzMdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FH+U6e7iv3/n8jYAMBKvQH0dN0z6m3GZnt64Wxif6RhNGSi3iTzgGOQo2+0dsJeSDJoQENDIQ7rbGeOFu+V2uZEfkF+daAQQrnLGHK5pez1A27N0dTuh6rC9D0FbK//uJawhZC2fPTOqEkt4oneNx3/qn55/DC9zQ7d34VECOv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=mMoZlNdv; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mMoZlNdv"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aab925654d9so2398247466b.2;
        Sun, 05 Jan 2025 08:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736094277; x=1736699077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2QXCym+qURZLKUjiCAQJjwuz9Yk/HpcW0NRBFsoncNQ=;
        b=mMoZlNdvPAFwTSFW+zKb7UwiSHXGD7BUzOJj0/vqAggTcVtZk3n1Ig8lhhBgUHiwOb
         yfIscFGNkKi6pASk9hyo7upeb2X0G5DexLVT32WGbranhVFq9xtKhm9uy4J6hMqNauv5
         U0TkRvp3f0IoghXPpDtKm/EqxplfJc89um/cEZ5k6M1K3udKGM0HgPcMQBMZHGodTu+M
         CQuCCAhjY52Td7qTujevAzMqMvTxD9tISOFkSy3aBjoS2a3OpbKiTDp91wVVIqjPN3wT
         DjTl4HW7ACj7k3RrY692JJq9i2dMKIpYQQih6VURlUlpCTcexDQq3rAAiMhXDx+WYIO2
         OMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736094277; x=1736699077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QXCym+qURZLKUjiCAQJjwuz9Yk/HpcW0NRBFsoncNQ=;
        b=IuFGjUCRDdDjlQF4zm8S30iy7JCZgkzuKA7i/M9tQnNhBjo1T68E//QE6+3lmmc60D
         +Yghw0qR1vjGZd7uoh+G9Ci5hwnZJtSMahIkUcykpHB5n4I2m0Ok2YBiG0vTT8f3Pt/C
         ITGgllv1Uj/fDAsjeSDh1B/E5ykyVAY+WcVt4dJIu1fiODCL5xoXB03sF/tlLML+o979
         BriMdMgwRN8KfoBi1YO+Jbn2W3opgPiHJtRw3QQprX/b+3/zz6dIiy2p/UU46T8crKW0
         Ul705GtQRRQerYx+TbmeufUTD1jAFx3f+KN3GViXchC+qRfqGh57CeAA70aQqOfNOreu
         TaGA==
X-Forwarded-Encrypted: i=1; AJvYcCULwLnZmAQs7I/4jBkGLzZ7c0w8QlG1DuJF3SKrWNXdJfxHklFnGNO34b7/1vQZOWQLRJTwAMNTl2pZgdw=@vger.kernel.org, AJvYcCUPKQsMXedeTfKcvCaG6qOBMj0HVr1a1boFE4yfjpNPGEXyrTz8TnUBJWsEqBUty5GEjINWcoOe4dz+o9s=@vger.kernel.org, AJvYcCVXUpT5YKVEqmKjXBInzJxjiqR53LUKdkksqY83syBCHX/4RSTsmCG2SWs8qxCM4XfeaJByWnWOrWyQo2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/uaX1G0JvzawKjxJ9dq3EX4ExZh+OmuZhMn5VZYvAw2+1n7nT
	0RoJpSM14w84t/IDA0o5XZsEqu5PcMXYXVV4XjbF1B10vxVaCsMU
X-Gm-Gg: ASbGncsAXVLSGSMoio/zYkiqIIrK6/3srGdsCqFzwED6Vd1zCclrHa/R4S87thM/zOL
	juQPCMHp/21zPtXwNCXPaULcEt+SwnYxrrqngDYPeFMSVDKKl/1jnizyp5GkBGaqje4/Ko8/HMV
	XqGux+e0R4zIWI+B2bC03DtL28osbfX1BuRFmCD9mfBMwfXHXkz7ExXqqbio/UGv5BhYDPQenFr
	hw4zDymg/ySfgUyrfFkKuoQ+YfdT9PcnxnWAJm51dY3+MFCfuOP1l6eCko/owf9+GzC9kRGjvhq
	VXIptj4IG+TmuT4TKvBXMY2CJa7yZuJCXgyJwkuxJvqNTHGwwIyF6VuHl1ojqz1kqXcq6H9eloD
	H4rrzgNM=
X-Google-Smtp-Source: AGHT+IHOgRt1x/8zuainB/CGlv8dqT970cd91R3y1Tf4vEV7SB96d0jKzjWhEjt5kmSD26M8WWxk9g==
X-Received: by 2002:a17:906:730f:b0:aab:de31:52d0 with SMTP id a640c23a62f3a-aac2b28ee4dmr6142740866b.18.1736094276643;
        Sun, 05 Jan 2025 08:24:36 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-ac0a-d800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ac0a:d800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm2164707666b.65.2025.01.05.08.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:24:36 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org
Cc: mperttunen@nvidia.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hjc@rock-chips.com,
	heiko@sntech.de,
	andy.yan@rock-chips.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@linaro.org,
	mripard@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFT PATCH v1] ASoC: hdmi-codec: wire up the .prepare callback also for SPDIF DAI ops
Date: Sun,  5 Jan 2025 17:24:07 +0100
Message-ID: <20250105162407.30870-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 2fef64eec23a ("ASoC: hdmi-codec: Add a prepare hook") added a
prepare implementation. Back then the new callback was only integrated
with hdmi_codec_i2s_dai_ops (which is used by the I2S input code-path).
It was not added to hdmi_codec_spdif_dai_ops (which is used by the SPDIF
input code-path).

With commit baf616647fe6 ("drm/connector: implement generic HDMI audio
helpers") the DRM subsystem has gained a helper framework which can be
used by HDMI controller drivers. HDMI controller drivers are often
tightly coupled with the hdmi-codec because of the so-called HDMI audio
infoframe (which is often managed by the display controller).

To allow the new DRM HDMI audio framework to work with the hdmi-codec
driver for SPDIF inputs we also need to hook up the prepare callback to
hdmi_codec_spdif_dai_ops. Just hooking into the hw_params callback would
not be enough as hw_params (is called too early and) doesn't have access
to the HDMI audio infoframe contents.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
The following three upstream drivers can use the hdmi-codec with SPDIF
inputs:
- drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
- drivers/gpu/drm/rockchip/cdn-dp-core.c
- drivers/gpu/drm/tegra/hdmi.c

It would be great if any of the maintainers of these platforms could
confirm that this patch doesn't break anything.

Mark, since there are a few minor hdmi-codec changes in the drm-misc
tree: will or take this patch through your tree or should Dmitry take
it (he added the other hdmi-codec changes with your Ack in drm-misc)?


 sound/soc/codecs/hdmi-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 69f98975e14a..f485f26b9f57 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -942,6 +942,7 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 	.startup	= hdmi_codec_startup,
 	.shutdown	= hdmi_codec_shutdown,
 	.hw_params	= hdmi_codec_hw_params,
+	.prepare	= hdmi_codec_prepare,
 	.mute_stream	= hdmi_codec_mute,
 	.pcm_new	= hdmi_codec_pcm_new,
 };
-- 
2.47.1

