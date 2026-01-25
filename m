Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B1731AAAF
	for <linux-tegra@vger.kernel.org>; Sun, 25 Jan 2026 13:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769346826; cv=none; b=o4OAdRpFxhVnNfWz4412+XmcVZfxMfvgV7tRYgofl52X1Lut8EFAPJ2RxPF+zgte751e27V5J735zWwaXyvxTgsd1X3BH2I3Y1eZDwWdDNHleiEAhpS6A+WBi9guo2mWbYG0Pf5b7Aor7WaceXMQ9Qk2Z3KHOAIO2lEVj3E2gjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769346826; c=relaxed/simple;
	bh=pl7a8m44c7raz4iD6niOckVE+VyRqINgt5taoKr6vy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QuCUag7E/6FsUEIVfiLBrP2KMong4EmDV+9G/+NAxPlL5BkZyfl5kXA0nfrRfnE/mDV2raSlwK4KAb8KvqTGMA/F9N0HXVTmw4h/xAQzDn1m+tAy7MTw8QZOd3q/QDReVcsBUqh52JxzR9Ea2eyZRfxggnAwrH8f1eY7V4ODdtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYxACsjf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYxACsjf"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so41851085e9.2
        for <linux-tegra@vger.kernel.org>; Sun, 25 Jan 2026 05:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769346824; x=1769951624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wk9/KUnsa8pc3YOrwEPZ2UDRNz9c/Z03foaMd/NJjKQ=;
        b=ZYxACsjf29Tom6QOH/VsVpOwY++q6tqHap2B2T5nU4KpkvXQUo56CeK8Aa26Ivc4bF
         xckDBLXd4A/mYpgrh/3YCI45s4TZPt6xjjiOccpuucIG1B7XZG+Ue2RNMM6ABq8WF0+D
         ET8Q+QDl0zfNFdaflNIt/Y2fG3LixY21KfyR3aum6rcpIoCx0NthVjjPxxjmoxmGieNM
         w5LbjrxkWBBXKh8Hms6LYdwphK/kkXHWwfW0fXALmjXLpCq9xnyqSDbhb8tlsvK3mhUR
         8Jyuhihu89KoutoKPvOSEaYwnSvwnd8Lc3nK5NCheAeiCy73n1UqldSggRyMJcay0hzO
         jchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769346824; x=1769951624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wk9/KUnsa8pc3YOrwEPZ2UDRNz9c/Z03foaMd/NJjKQ=;
        b=mRAYdE2P94tgzrUzZlvBm73j8SmXVn4I0gFnhHBmgSqb0+H0ZQ0ha61jIuVyB4ODQJ
         jmenFHR3hz9BdHK6gmz4Mf7VpOEPoLi+MFKxKUzqoJ4nEBvAq2a9MJaOxqXt9QwEoUK9
         7r+xKoWVCVHvAnXm7zi1T/EemZ4RSnYOgFipjEL7Kg7djLs7TD1E37niVR2vFRL91CKz
         J2co+MJ9DBNX1beWZ4BwNUf1Kn2lafAX1asVYw7b/22CW2KZwPkH4YvHBLInh/fDKCk4
         hot6JVPBv3kE9MPIhb+98F/I/ZXFvuVCWrFM40OLAck0KiaxRxZjZZN6eCQinb4g5/Xg
         ud5w==
X-Forwarded-Encrypted: i=1; AJvYcCUi2uLCAxLt/GdAjdYMGEaE1HWBdDAZ7NaSQAyNwck9AaNjANxTYMEu3M1Z2Q6HACil/SCaYrIFifWHkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRJsVPlYEaXu5m4wByelCBCUjzd86RXCWti9cywGQbyCv6aYKm
	nMQ6Zje9TvHkq99yrWtfx3Cx6oiO+P33O9gUuztNtitLJLgLG1sifyBh
X-Gm-Gg: AZuq6aKTn4lOm1bv+CTSJ8+FaXk7vR85TfqfUYpNqYkMoqb8cPamplg1/wQwpUlUA7T
	gdChopDNzExBYc7TDojVolMROkJtDgDoQV5naKC//Xa3sV9gcTecr2IguuNlvpC3GVPKMqS+xRW
	5id5xnKFmFnqzxxX8R9+4z44Y4K6AmCXv2OlLgcQe2qjL4EQNySozDdwIYrJrRq9Yzupf+qPMBZ
	3Q0vVsapx7jaI5qQEVXlYyEwYaJLGJzbzwRHhG2wRxmlyidn9n4ADS+bn9NfiwuCH3MYa4PCggE
	7RqCdvpClnOlLq+Ez8t5wQMIiTC9tocfcDGqbFW+va+OMyEC1goFSonF5Jgwr8OXtUpk8dTQxH9
	C6FsQmVsIQlMIlFObcv3HIukt5LrInXGDuTHOhEk4K+G25hThLKkpFqg0IJ54CBCjkgjQnq+woP
	aD
X-Received: by 2002:a05:6000:240b:b0:432:da3b:5949 with SMTP id ffacd0b85a97d-435ca0704fdmr2320057f8f.21.1769346823610;
        Sun, 25 Jan 2026 05:13:43 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm21958244f8f.12.2026.01.25.05.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:13:43 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] gpu/drm: tegra: dsi: re-add clear enable register if DSI was powered by bootloader
Date: Sun, 25 Jan 2026 15:13:23 +0200
Message-ID: <20260125131323.45108-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125131323.45108-1-clamor95@gmail.com>
References: <20260125131323.45108-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Original commit b22fd0b9639e ("drm/tegra: dsi: Clear enable register if
powered by bootloader") was added to address the issue of DSI being in an
unknown state after the bootloader, ensuring correct panel configuration.
This worked fairly well under the assumption that the bootloader had set
up DSI; however, in cases where it did not, the device would hang because
a DSI read was called before the DSI hardware was ready.

Removing this workaround results in the issue described in the original
fix: the panel initialization sequence fails and the panel gets stuck in
an undefined state. This is especially noticeable with command mode panels

In order to properly address this issue, the original workaround is
restored and placed after the DSI hardware is prepared for R/W operations.
This fixes behavior for both cases: where DSI is set by the bootloader and
where DSI is untouched.

I have tested this change on Tegra20 (Motorola Atrix 4G),
Tegra114 (NVIDIA Tegra Note 7 and ASUS Transformer Pad TF701T), and
Tegra124 (Xiaomi Mi Pad) with U-Boot, using both bootloader-initialized
DSI and untouched DSI.

Fixes: b22fd0b9639e ("drm/tegra: dsi: Clear enable register if powered by bootloader")
Fixes: 660b299bed2a ("Revert "drm/tegra: dsi: Clear enable register if powered by bootloader"")

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index ebc78dceaee6..e499822b6030 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -934,6 +934,15 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
+	/* If the bootloader enabled DSI it needs to be disabled
+	 * in order for the panel initialization commands to be
+	 * properly sent.
+	 */
+	value = tegra_dsi_readl(dsi, DSI_POWER_CONTROL);
+
+	if (value & DSI_POWER_CONTROL_ENABLE)
+		tegra_dsi_disable(dsi);
+
 	state = tegra_dsi_get_state(dsi);
 
 	tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
-- 
2.51.0

