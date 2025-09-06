Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACCC2F0C44;
	Sat,  6 Sep 2025 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757164640; cv=none; b=esMtIobQo5D4fjOWENKTV+/6MFWh3Aq20hYtxYO7Sd9Y2csl2lEEcxugkh0gcMyjrWOZWBtanw2vbgJidtF60H6Es+wCeRjhmMyAiQd5b11rCqhe4u2XlJ7plKWMR2laqbqIHh0bd7lc+W17nOL/6VM3yZ7RW0m22KD/v2KxAsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757164640; c=relaxed/simple;
	bh=YvGQg0thiYAJim0fiKMQbCpji4LJk7ivjKm2DBhO1ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vjb683qPjb2frtLqkIXcpZUpFfzpmTFzcoIczWzpZADe4UZ5PknraL6S9Plht1uSPHHUqisfHJmricDRoQT4g2gWSnUpnbmaum4IHL4A4jorLHnvHZanyVUdzrtDQDcJM8GRNSHYYzvEBzMi9bKeczHwH1euCmWSlvAPc0KCreo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLbWLIOu; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLbWLIOu"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso3400407e87.0;
        Sat, 06 Sep 2025 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757164637; x=1757769437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cwcex3lGNThFvVtHDavDxMhxsou2FIVI5X6A3gfDqZg=;
        b=SLbWLIOubQAbNFTKd92esFtZ1t02xREYC0T6tpU+cou9SpwU1FLe64RndfE6jnxSPu
         MSCbCr/nPkdpERyc/zYzx+j+tJY6DK3XcXSJt05pQRWwbOxoJgI8k0DASL0ky+lGpgEY
         7tCLjRFnuiP+5rJAGhOvJ8Al/hNSPyxzYv0TAaafEj1SUB25McOAb03V2bwAW4z15X1a
         hjg8X3vFt6LrnwtyDHjtuADtwXCnfn2P3YbH2sXUZ0h9RO+skArXqxpqeO8DKzlTDK5B
         tneI/rC7VArxWa7QgGVWhC0dVpNQt9DCRQnF+p9+pscTdOUTzjVERadXAqRbp8Bpf81K
         TnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757164637; x=1757769437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cwcex3lGNThFvVtHDavDxMhxsou2FIVI5X6A3gfDqZg=;
        b=d2lE/deDOvARAgBjJXiFhHuM0cQLGQRSmw+hm8h1ih/ch3bCbwEWmhEKgTBXmEYJ01
         Gf/Rayqj56zF3v0lB589ou1GMJTjag6/SMtmbu/k8UKB7PI2g8alcB/BtqZ/g4tz3oO3
         mOmO2Cvf9wE4NDPsgmkdat7JgshD76OcKkny0r5er3Ipg6MZu2ttdUsduw4ueCRzYBlO
         7/RDXQDdWciLGE/v3UK0Hosmyh9z0V9jtbWZ0XyZyFEjYvQqY9P31Hi5KfxUGun28vV+
         N9Z27cbCL/6YqxDcl1uDTt4AaJ1tndBDJft4yzItprAkhLRcZ2xKX1yW07RDMNoG+/1h
         aekg==
X-Forwarded-Encrypted: i=1; AJvYcCWipXCjfZvACfCxpo7+skZ+gZtG79Q7zLaTeSYWDTqZqp01RQ4SVkbfF1Q8gzGQcLv+EAO8y2iy+by2bx+u@vger.kernel.org, AJvYcCXcPGilsNOwquJEMwhbsfPCc4TvoCqpz+V3y9eMXck9GgIMsAoEP9/mDb52NmoqxLA5PdCYl/4P0g3u65k=@vger.kernel.org, AJvYcCXmdVXYEv4GzPlmV3o4BZQnaJ0ilowW/TW4EGmDSZO4TppJK1crFkbFLx0aZy5msIAvx52IuFx6wjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNHpBc/aMTFQZDNDMRtiW7Q7HKJ7d8K+XlOV6iK0CZK1qlk7GA
	7KKjfL7Ktxlg0BRK1UiMk9QGCttnU+323cC9MVSy7WFPv0OYF+0DE1Wh
X-Gm-Gg: ASbGncsJjcHNAa2WpYK2WMe9L6/x3BlF58CW5OCX5Koh3VKAaZCPLvWpsskW18pE5Xl
	0TpfSpc2l/mooTHuhD/ZFJHpfEZoyjayBMAiAI5EmG7YYC0Dep6ReAYYt6Xljp9LAd7tKgXKzLc
	yvp051vOmkjjDJRc2xGidCCFI3XJ5aGREgE88tO80lbRblptdudWE1HiofYHsb1GmHBG4WLSQOx
	Hp9plq3TsYJ4/FoGJWWFpoeGUhdXDAhlpHXbIDWLRcCxTbUm6ahZru4wW724o0jsSQKsEug1KND
	RPVTVxnmY9PtCcd5ML+1IqxYH73a2gYeWzFcIquGtCY1nAV4bjw1peoQf2RzO4DBBNE11Wu/pEy
	2zWzV6FLHKOKx6A==
X-Google-Smtp-Source: AGHT+IHaBWtUTN4oNt10o28YH9lKMsefOT21qBqek24oDY599RFNNoiDQYJiZcamp5R2jY4qvM95jw==
X-Received: by 2002:a05:6512:6404:b0:55f:44b8:1ed5 with SMTP id 2adb3069b0e04-56262e1b19emr508168e87.39.1757164636617;
        Sat, 06 Sep 2025 06:17:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad44f8fsm2312647e87.137.2025.09.06.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:17:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] gpu/drm: tegra: dsi: move prepare function at the top of encoder enable
Date: Sat,  6 Sep 2025 16:16:53 +0300
Message-ID: <20250906131655.239340-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906131655.239340-1-clamor95@gmail.com>
References: <20250906131655.239340-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tegra_dsi_prepare function performs hardware setup and should be
called before any register readings or there will be a risk of device
hangup on register access. To avoid this situation, tegra_dsi_prepare must
be called at the beginning of tegra_dsi_encoder_enable.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 278bf2c85524..8e80c7efe8b4 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -914,6 +914,12 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
+	err = tegra_dsi_prepare(dsi);
+	if (err < 0) {
+		dev_err(dsi->dev, "failed to prepare: %d\n", err);
+		return;
+	}
+
 	/* If the bootloader enabled DSI it needs to be disabled
 	 * in order for the panel initialization commands to be
 	 * properly sent.
@@ -923,12 +929,6 @@ static void tegra_dsi_encoder_enable(struct drm_encoder *encoder)
 	if (value & DSI_POWER_CONTROL_ENABLE)
 		tegra_dsi_disable(dsi);
 
-	err = tegra_dsi_prepare(dsi);
-	if (err < 0) {
-		dev_err(dsi->dev, "failed to prepare: %d\n", err);
-		return;
-	}
-
 	state = tegra_dsi_get_state(dsi);
 
 	tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
-- 
2.48.1

