Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCDD2F7CF1;
	Thu, 17 Jul 2025 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762127; cv=none; b=B3uU2nCw2kfGO6hVrt9sJkTGAa9vj5XrF++swEwRvm4n0IU9innSfW24Uq8I0UsRV11C+77/01XdCT5aszIHWWQhUZvZJ9VQeNHHdrAKfitG5fmEK7hDjPB01Z0J/NLN786Xc2iIqljMA5rfMIJCuQo+OZq/VcVQP95XS9PW43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762127; c=relaxed/simple;
	bh=a5IbzyKjLis3eRn8I8yPDJONzC7VptAGC33I38MNFzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8PX792bYGaeNdm+s4Z0zLnr1cwISTX1dekoHmk60uWdso99CiLR1OIKcp3+ky4FjGMhCFyCsLJvLDzBpBSPFZOGOgt+JkX6Ne+9qT8lAelk+osMZCyOS7moC6TUUdkS2/yDxlJfxkVi8eAlE2NKsGBJk8TQWKjzUHUbCmG69Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1/ynN3R; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1/ynN3R"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-558f7472d64so1835269e87.0;
        Thu, 17 Jul 2025 07:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762124; x=1753366924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AuVuUjraHty6myNY4pFBrvXQYP4/ymaERtjyOYr6d0=;
        b=R1/ynN3RsWlUHNXE4p6AWz3KhIEFfhp4/dFbl74jKug/Cc5mSuhHeHW7AFsnhEPKay
         Uel4A36bon9f0XgVEALi63H8f8Z4guHyBQkH0dk2dSt+eKAMBjNiBKIXANj94njcszZ+
         Qv4bqPpiuvhAZU96l4imsJA21HTsXDNd5Y4CxfNtgoQC6gXFVTDlIW56/Ayfv1BxUCds
         4Wnj/fIItHLRu441NcA6BJi1sNFrr4EA2b//3bIZ+2tbOPTz6KnZ2r2PvmIhDy0BupUy
         7GXoAwSV2/3UepTd43oiskvG7ktbLO8dp+arV7+BySZyGRkAy93W2qf1QSw1fRSS7rae
         zkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762124; x=1753366924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3AuVuUjraHty6myNY4pFBrvXQYP4/ymaERtjyOYr6d0=;
        b=YXWhfQrumg0YH2dF38StouWX4fBL3LfsFx0JpCgu0qXSMwCBG4c+Rhk5fg58mvVia2
         6Qew3zsLKMOSpQwyH6skw+kpPJbiRqxp0G0uJMpZrHEtUTj1yIgUeFZ6axAHgZRFMnoz
         vykdH4YNqEH7pjgkUA+JhGvzD1FWgvyDweeAj0ROm9i/cLc1OXkzUsuwQ5Mhgfi9J34s
         UcfYddYOLuX0KlSNEM8M9ZTos7B+3UIJLxnoavyNIcOT0H2m+BM2f+rS+sFE0PslURd7
         Br2AegrAboCdCIck/KHaD8B0lXvFi2780KuSfs/GOarteKAsxIiYHX8oK0HRuRFol2Ju
         Irgw==
X-Forwarded-Encrypted: i=1; AJvYcCUEkpQGAN4UrKcKkMgagVePzkPjKmoRU4W0ZUWQChhRJzRiHfPDf+wiaZDB4DH+9Kzv5MRnnSZwUoBU@vger.kernel.org, AJvYcCUQr99cRjG5tmn8OftF3/MNhSD5RQFPGLjUIv+v4QBnfRZ5b3XMdW+u0y2Yg1gL/Tj/EvtjgL2Gl4fx8lE=@vger.kernel.org, AJvYcCX/QLCXZD6lN/L9N56VTdGbFbYyXdQ/qCRkoh+MOLVxozBb0O7giKSR16nVsku/JFtpcZvwyZGZIjnb@vger.kernel.org, AJvYcCXuEI6FFlQsfLk3gH7FNauR0i1HEtYfZ/7DMoENqOpIH2iXjaQtgarc4J3TPwovttuF1biQVyHU8wN8gqF9@vger.kernel.org
X-Gm-Message-State: AOJu0YyKTfF4JBss1/T1ibhilstOA4D03ZQ9M7QgW3LbhoGG5SQBgbtK
	eTDAqaQgN02AhBZueZei+B7lILdWNjxH15kVrVheLT0NuPBFZ0dX5l8Y
X-Gm-Gg: ASbGncsrQ3Alr4SnhEX9uqufaI+ujccJsVm2gXxj1TLkXYblKtitnDbnneMJiRuAjLz
	K7zQ0u1pj+rBZFNrGOUmMwKSOE/FCSgXSfqkVwlew5Bav7cKoVVEKdx+vm0f4/DpuNKbhkVNfev
	lxTuy6kgxbauTK0MSfG9XMrCjElV0Y1OUZVD9qFa8UUp5DN4YCrSuDjWZ83jvNHKcWu9uj6UGXd
	7xMm//3goDzt1lKhQNuzmYSz17X9MWH6hexLupjUqV1olLsIy5TNbCPHHrK31hIyVHYsudhMNAd
	eNg5Pxo6ee2i+hDQeJwIOKAf/i9TPOpaiYVROo+mSLcjfZhDkAtw3pjSuAGihq4aiBSolib3BOA
	kRNCnlYryXAdroA==
X-Google-Smtp-Source: AGHT+IFVLvSyFMYeWgDO3Q9TkYiZnGsx1YBjsxvDp2uUcTuS3i6Q4FWTpirXn5sKnIPguPZLkF6lZA==
X-Received: by 2002:a05:6512:15a2:b0:553:2969:1d6d with SMTP id 2adb3069b0e04-55a28cc948amr1101140e87.13.1752762123691;
        Thu, 17 Jul 2025 07:22:03 -0700 (PDT)
Received: from xeon.. ([188.163.112.60])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b61134sm3079983e87.162.2025.07.17.07.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:22:03 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v1 2/5] clk: tegra20: reparent dsi clock to pll_d_out0
Date: Thu, 17 Jul 2025 17:21:36 +0300
Message-ID: <20250717142139.57621-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717142139.57621-1-clamor95@gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 2c58ce25af75..551ef0cf0c9a 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -802,9 +802,8 @@ static void __init tegra20_periph_clk_init(void)
 	clks[TEGRA20_CLK_MC] = clk;
 
 	/* dsi */
-	clk = tegra_clk_register_periph_gate("dsi", "pll_d", 0, clk_base, 0,
-				    48, periph_clk_enb_refcnt);
-	clk_register_clkdev(clk, NULL, "dsi");
+	clk = tegra_clk_register_periph_gate("dsi", "pll_d_out0", 0, clk_base,
+				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_DSI] = clk;
 
 	/* pex */
-- 
2.48.1

