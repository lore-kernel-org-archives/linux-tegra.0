Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B4D246781
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791131493; cv=none; b=Aa+uLli68Kkp13dCAwXJGnAyVMEXN8OvNgCo7J4lXgg3HePcIIPolZgj4RXqssYXh6Hu2CmGgI+5WM9vlW1kY0Gt9z2RtR+rMCjJ3QPIxPg/FiCxO1xaZd6e/WUQf23qqW4L5HqzAU1npvRJi2Oc8z9BKfpldxCS4F0zzrarDU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791131493; c=relaxed/simple;
	bh=kRMD3LifFT0eTo3gIXvJVRlHOZTJ+JtZ12j0BXFmzmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAizAUNX7RMplNoVVyNYNLH34GPeUnqVE6mT7A2lqWUxE3+3gAnkVKZBQ+wzD09DdSsWeCUeqXRW37AHBQ8Os6uF1kCXKYe4ba087Y7KYDywbEdr3OtiwekSrEAEOPHbo9ZXNrUXvoeJtMm6V/b6mvsCJqfTapMkBSOEvOkGmVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzM5F/kQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzM5F/kQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so7083675e9.0
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791131490; x=1791736290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
        b=AzM5F/kQFVZMgfie9eh3c2Iinjg5pnCQ76ptrEnaT5W3gaq5vOKQsnUNIV7z1neoGk
         ENfp5r/SheCGsYBkBy66R3/taSv0KotMJFKxLSPww1XP0be7nbTwrzTGoycpxScAIfvI
         C2tlty74VlHeXIZ/rnLrCs6121WTzts0v/DUetlkYh88aaFS9LuQET2yIJpA5vFQL/R4
         l4U2jHPT00CjcunfRwud8CjSw8J/Kxot6/VTrW83gX39uDwaT21VH7jbBINammq+b/JJ
         iYjAXGiyjxYBLylk1nDsd0fQ1YUrcmy6YpJtEySkzco9j04tQtPtVCcBpmpG0a7AkPL3
         J+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791131490; x=1791736290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
        b=Vl8jHdwPLCYVepqcKORK2illiTknFfFXPkUI5wNvIPu0W4rMwG0p3iqexgewkQldoJ
         qLfAhP4zw+FsqBBV0hAUW0rEnZC1y+gq6SwOKqxp9pgTZaWmJEPAnlXhNz8t/EQeXqXy
         nvEEvugANChLGfYqCUqZL9JlYezYa/nJZv80w169DnlbFQ403NRn5PKmtsaVgwmqj63O
         L/EzV+DQ7/G4zJkQdn2oQqW7qNYGvHFRxX6Pz5lz3r1EzN3ozxkLypo181LGS6Phl2L4
         yY8LzOaIoFg4KxLwS8MefIlkLrMCDzKiRLhY6fLvZFQhAY4pura6+vdy8nBxLa7oDHQy
         vxWQ==
X-Forwarded-Encrypted: i=1; AKwUvBz14LaqpU+Awjkxz1UBN83eudSfmmUpyvHPQDQv2lqJKQaODfshmTxDuiHm6uF5BHHgJ487uOq5gIrzDQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l6VZkfiH3b1v/3S04gX+FI+ls0oK9k3IN8EnfX8jtHzUhUm9DA
	REfPHVZqysnNxHwsLgNozjkLuPN6IQZdHHhG9iUSplVTLoDF0yeD+w6OEw2v4A==
X-Gm-Gg: AYBFou3saIcEQpIJ/wvKqZabXbc6/1RQG4I02lq5C8FnZf2JCw5Ukk1d4HiBrFgxBd1
	HDv1tqbCuFDylFugeMblBeH8nBfqIYtpUCReCLnw125HluOBkJz7fHrC9kFwGf2zz03dNCRz2bK
	YmS+DGZny0PRHdlFOPjzkBJqQUfOrQTk3vdpSvWL4KwDpZd0Cu9qAT6oeTo8+eVcP5vXTf6DyjP
	7h+PjX3LFJFafUHryPZx5G5/6XQ5zl6t1i8f7OoIjwAnfGk0khWAE+CmIp8xPItHy2RYANDoTWq
	bygGLVh1ilidmzeMvWPExBHOyAowkF9kyx1+q1In8wC42tznHRhz5LzX01AqxeDuKxSb/UW3bKi
	n6hexgU0erICn+1j1m2sbP/AP/hsUy5iGo3b992/97IA40oxQYR2t2TSh8RrvbKpxwTIKG2xKoW
	Xevvatzckw4lslxWiuD3UEDmgjp3yFN7n2Wuek6K3L5dUOYurMU1eheyVtTchAviL8CpwUYvfxU
	4Zq/EhwrZlVrNnR4qs=
X-Received: by 2002:a05:600c:4705:b0:4a0:1c16:d6f6 with SMTP id 5b1f17b1804b1-4a1680ffe47mr81460025e9.24.1791131489734;
        Sun, 04 Oct 2026 09:31:29 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm315365035e9.1.2026.10.04.09.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:31:29 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 1/7] drm/tegra: dc: Expand available registers layouts
Date: Sun,  4 Oct 2026 19:31:08 +0300
Message-ID: <20261004163114.181800-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004163114.181800-1-clamor95@gmail.com>
References: <20261004163114.181800-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand existing DC register definitions with additional fields in
preparation for adding the 8-bit CPU interface.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c |  3 ++-
 drivers/gpu/drm/tegra/dc.h | 49 +++++++++++++++++++++++++++++++++-----
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b0bfa946e6979..5c67928bcabfa 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	if (dc->rgb) {
 		/* XXX: parameterize? */
-		value = SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
+		value = SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
+			SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
 		tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
 	}
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 0cb0515968b35..7005df32f485f 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -274,8 +274,11 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_COM_CRC_CHECKSUM			0x301
 #define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
 #define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
+#define LSC0_OUTPUT_POLARITY_LOW BIT(24)
 #define LVS_OUTPUT_POLARITY_LOW (1 << 28)
 #define LHS_OUTPUT_POLARITY_LOW (1 << 30)
+#define LSPI_OUTPUT_POLARITY_LOW BIT(8)
+#define LDC_OUTPUT_SELECT_V_PULSE1 BIT(14)
 #define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
 #define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
 #define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
@@ -303,9 +306,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS0		0x400
-#define H_PULSE0_ENABLE (1 <<  8)
-#define H_PULSE1_ENABLE (1 << 10)
-#define H_PULSE2_ENABLE (1 << 12)
+#define H_PULSE0_ENABLE				BIT(8)
+#define H_PULSE1_ENABLE				BIT(10)
+#define H_PULSE2_ENABLE				BIT(12)
+#define V_PULSE0_ENABLE				BIT(16)
+#define V_PULSE1_ENABLE				BIT(18)
+#define V_PULSE2_ENABLE				BIT(19)
+#define V_PULSE3_ENABLE				BIT(20)
+#define M0_ENABLE				BIT(24)
+#define M1_ENABLE				BIT(26)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS1		0x401
 
@@ -451,12 +460,26 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define BASE_COLOR_SIZE_888    (  8 << 0)
 #define BASE_COLOR_SIZE_101010 ( 10 << 0)
 #define BASE_COLOR_SIZE_121212 ( 12 << 0)
+#define DISP_COLOR_SWAP_BGR	BIT(16)
 #define CMU_ENABLE_ENABLE      (1 << 20)
 
 #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
-#define  SC1_H_QUALIFIER_NONE	(1 << 16)
-#define  SC0_H_QUALIFIER_NONE	(1 <<  0)
-
+#define SC0_H_QUALIFIER(x)			(((x) & 0x7) <<  0)
+#define SC1_H_QUALIFIER(x)			(((x) & 0x7) << 16)
+#define SC_H_QUALIFIER_DISABLE			0
+#define SC_H_QUALIFIER_NONE			1
+#define SC_H_QUALIFIER_HACTIVE			2
+#define SC_H_QUALIFIER_EXT_HACTIVE		3
+#define SC_H_QUALIFIER_HPULSE			4
+#define SC_H_QUALIFIER_EXT_HPULSE		5
+#define SC0_V_QUALIFIER(x)			(((x) & 0x7) <<  3)
+#define SC1_V_QUALIFIER(x)			(((x) & 0x7) <<  19)
+#define SC_V_QUALIFIER_NONE			0
+#define SC_V_QUALIFIER_RSVD			1
+#define SC_V_QUALIFIER_VACTIVE			2
+#define SC_V_QUALIFIER_EXT_VACTIVE		3
+#define SC_V_QUALIFIER_VPULSE			4
+#define SC_V_QUALIFIER_EXT_VPULSE		5
 #define DC_DISP_DATA_ENABLE_OPTIONS		0x432
 #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
 #define DE_SELECT_ACTIVE        (1 << 0)
@@ -493,6 +516,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_CURSOR_POSITION_NS		0x441
 
 #define DC_DISP_INIT_SEQ_CONTROL		0x442
+#define SEND_INIT_SEQUENCE			BIT(0)
+#define INIT_SEQUENCE_MODE_SPI			BIT(1)
+#define INIT_SEQUENCE_MODE_PLCD			0x0
+#define INIT_SEQ_DC_SIGNAL_SHIFT		4
+#define INIT_SEQ_DC_SIGNAL_MASK			(0x7 << INIT_SEQ_DC_SIGNAL_SHIFT)
+#define NO_DC_SIGNAL				0
+#define DC_SIGNAL_VSYNC				1
+#define DC_SIGNAL_VPULSE0			2
+#define DC_SIGNAL_VPULSE1			3
+#define DC_SIGNAL_VPULSE2			4
+#define DC_SIGNAL_VPULSE3			5
+#define INIT_SEQ_DC_CONTROL_SHIFT		7
+#define FRAME_INIT_SEQ_CYCLES_SHIFT		8
+
 #define DC_DISP_SPI_INIT_SEQ_DATA_A		0x443
 #define DC_DISP_SPI_INIT_SEQ_DATA_B		0x444
 #define DC_DISP_SPI_INIT_SEQ_DATA_C		0x445
-- 
2.53.0

