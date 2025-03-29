Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658BC134BD;
	Sat, 29 Mar 2025 19:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743275685; cv=none; b=aua9wiTk1i7jO/Py/Qv4fdsA/sRfzUX9Zn6USh7uRmzt5nP7oIglkRUHW7YlNIDDih66kVQA2Qh7//PEtS/cvWfQ1qsEu3BQ6Uw6ev/D3RAJmw8qdmC7oVKNmJC5t8+rMmdQuFNhWjSeY45CBiKqiw52asWK9P+pkgYuoMWFThA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743275685; c=relaxed/simple;
	bh=2iHFD4cCTuabZpf/KjyRS7hm/Gl/39G0GLR3oawAJHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K6U4U1ImuMNaQOprD3Xj7O4W/6WATBDrFxWJfaVz4OT5PjGB2BaRAWzS29vj/VZt/OAHvN/kGPwhFHHF7G3aafBlbhlHGd27CtXF/7Uw8BmI45nxWsCdv9JF3AwZ4AhZTlbCDo63SdzxzJahydAWSkY/Aqg9Of8SuFfxoEfAZCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=UESkSlfi; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UESkSlfi"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac29fd22163so546449266b.3;
        Sat, 29 Mar 2025 12:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743275682; x=1743880482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k4qdQmtdze7x4J+KlNeJtAH6STgJ/ut+25HlOxXn6Nc=;
        b=UESkSlfioys1tdexoKBTKXe4uD4MXlo5NOXsJUJ6b+Z3xHdj2sNhulEjMW3KUq3h1N
         qwSimVpsZtZHva+PlvEGY5au4KbqN586sn/nDBwoEUSPGRRns/f9ksMuIQ6P40n9Fa7X
         B/5DGC2p2+nuFU/TwaDX4kT6k8pqM5DSiVa95QYYc65g+Usz1LSpjlNnlzgAVA8rn23b
         G0eIVrz09n2GpwMFQGDCwJuc8SpQnXWeUIRdduOyApgLM5gPaTu8oCHth/AjjuTvlW4H
         KvzPk+0tPj4Yc9yWaVrkj2hwuxJPlfWoEeLI3WOULqZlVtpXRdDzyqbkLXD5xuDSxN1Q
         l1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743275682; x=1743880482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4qdQmtdze7x4J+KlNeJtAH6STgJ/ut+25HlOxXn6Nc=;
        b=vOyOEK5zEOf/9HAU0ZbcCrWFnYdwdEs1fY39PTPWkAHFSBiS7VZ8Yjj1dQj6hGRhYz
         Cg7m8BPQ8uutRSSoF4wxv9aUd512w5jre8lBJr2vgLWB/zaNM00QSQPVj6ALz2qTobmR
         uYi4MTyf8P+kfksAAUX40btOdyAk84Nh2ce6RFsY1PILe4NBjDXPPCYqc2fcu2R4oVL8
         M7VTGIj0hhrWtQEuIe490x93a+aNeFYh5JGJrut+IyEBWdbNHlgubQQQ1A80NfKV/Ery
         d5tJ/cOsQ5Ha1UiUSBK7F2rflMkuv9G2pHuOan+gagkt2V/D/Qdenurs3fsnKBCx7wld
         7JRA==
X-Forwarded-Encrypted: i=1; AJvYcCVH8qkZWULqWgTqO9YkljD/rwSVQWpX/onjD8AFCa+YsEPm4dw08IcqcT20Bov9Zge1YSD4qYbik9DAGYA=@vger.kernel.org, AJvYcCXDB9CJ3paEwV4JegH3Tqi0DRrWbHb34j3BzCLrAOjM20NDBFnvrLZHJ/hktEoBRhfenXWtt7cD6i4bQX0=@vger.kernel.org, AJvYcCXE0Tz6RHPiO8AC+seO2isoYdgoMymEiTCuLI0PG50L0C15J3b7N/96Oi55b0I9Vs8mtRp0LrPZyVKKBQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeN3+wNmfASQ9Pfbda33wus5VRQZv9rrgqPj4OWIJsqqt55YMU
	W8LrVdH3BYKPkcIci0kwzeEbKCLKPEpbqbVxrFnuUcUCBCkApuMw
X-Gm-Gg: ASbGncshzFlx7XnKWtGwoHvnCbyINF79hPv8AbSrvaCmZcmjtKQwmhV46XNNcG4Fd+D
	FIyKNFqD7xn8IrVu6ALuzkM/oqetgevNBdHkN06jm7O/lI6lVJH+FD3P57opOFrVPZIeFzT5feO
	pUnU+mRI/5F4z72BNSyjAw/lnihWiBJBwu47x+VryzR6ochEDxMB9E/zPIYtCURepi8Y3Refzv5
	V2KwYeEuLQ6cl46TVJ8nR8dwWWb//NhNT32rER51GlC5yAHFfK8hKQxFeZUySTVbiR+w9XeJfrf
	Rr/DAzQaa2hC+fMX8HRoi1kgveH+DMYS71c8VHbx2ehIUCinh8mkNaCFPhmreZ0is9X+qEjbOei
	AQY8WhLFk/82GYvJUN7Q9XYuHxbhYEkTuq82hLYZDZoYLvEWU3qMpLLdiixFD33CAj2UHqaKspz
	YEhSBL
X-Google-Smtp-Source: AGHT+IGKSSVjR4jmVEM1dPlaS/R+l5YVQlq5r7CWXRElqfgt1HNgA0wl2mVf2UCJ7eOqQ2c6wzoLXw==
X-Received: by 2002:a17:907:7e82:b0:ac1:effd:f2ea with SMTP id a640c23a62f3a-ac738a82f63mr347131966b.24.1743275681354;
        Sat, 29 Mar 2025 12:14:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17b2ab3sm3327592a12.52.2025.03.29.12.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 12:14:40 -0700 (PDT)
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
Subject: [PATCH v2] ASoC: hdmi-codec: wire up the .prepare callback also for SPDIF DAI ops
Date: Sat, 29 Mar 2025 20:14:33 +0100
Message-ID: <20250329191433.873237-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
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
Changes since v1 at [0]:
- re-sending since there was no feedback


The following three upstream drivers can use the hdmi-codec with SPDIF
inputs:
- drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
- drivers/gpu/drm/rockchip/cdn-dp-core.c
- drivers/gpu/drm/tegra/hdmi.c

It would be great if any of the maintainers of these platforms (Cc'ed)
could confirm that this patch doesn't break anything.

Mark, Dmitry: who of you would take this patch (Mark via the ASoC
tree or Dmitry via drm-misc)?


[0] https://lore.kernel.org/dri-devel/20250105162407.30870-1-martin.blumenstingl@googlemail.com/


 sound/soc/codecs/hdmi-codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 17019b1d680b..8bd125e18a7f 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -1010,6 +1010,7 @@ static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
 	.startup	= hdmi_codec_startup,
 	.shutdown	= hdmi_codec_shutdown,
 	.hw_params	= hdmi_codec_hw_params,
+	.prepare	= hdmi_codec_prepare,
 	.mute_stream	= hdmi_codec_mute,
 	.pcm_new	= hdmi_codec_pcm_new,
 };
-- 
2.49.0

