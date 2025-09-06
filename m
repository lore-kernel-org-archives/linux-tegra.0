Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2C29993F;
	Sat,  6 Sep 2025 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757164639; cv=none; b=d9rur795OBB4xzAK36SJQl+AAxZ+1jr5/jfiR/XV75W73iKQNAQpnUq5T/EDU2W5T3RBaVrS9rSftoED/ZZBBgAgIxscjEIOY784/9ks3SFWoYPvZzJYcEsdA2DbWfGI2m7lNO2JMFM/sRmCcyfLZqEjhVQ67ONoVjuyUVqH2oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757164639; c=relaxed/simple;
	bh=nFysZDUNTfkbtQ+eeQTi0QE5j4+FKORi9srgfd/24sQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jQPkzZ+GOr0Zzga7JSFc45Pc7JM4YPOXzddlknUGZeHwc5795Va8wVb2UmA+D+l9UAeGuUsE6O/Ju9mP5oq17iB0dhQKaeDaxoOfMyoVDA6ObSfIumf+MuK0T1QnFtATqjrmTs+O5yy5l065c5rzO53zRG1I53733OmV79DNvuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Epy5knxf; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Epy5knxf"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5607c2f1598so3119994e87.3;
        Sat, 06 Sep 2025 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757164636; x=1757769436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wpKL/VW2mP4lPVTNMBZP3xn93sk8skKfMbrLSoiJVc=;
        b=Epy5knxfb7eA1wLSkHrUjEg12mHJrAkHgopJbcARjKzuP+6gyrJUg2eUR/3NnHr7vu
         0j3p1qriz82Ph4aZJjw2pq0Tg7cM480l/gSwfvWwrVwt7oagSqAOWUcmRb9ITY4PrmVM
         LiEszp/O0//bhWyv11K1kLyzEnZMqmUtqvuaJ09rUhGhvvzvW26wyN9xq04CwImUJ3XO
         gqdQQXnPQ9Sabd3NpMAEHgUIU9wSSsSyOtCnTDL6wxXGA/22OOW/LHjQqRVwqaridOcx
         bfKO2sWnzEkA1mlbXnLcqnX2DoWLP0D+/oMtmWa24YCTLVLcHw7SwOdxKBBhqqootsfu
         gTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757164636; x=1757769436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wpKL/VW2mP4lPVTNMBZP3xn93sk8skKfMbrLSoiJVc=;
        b=dRtyCh1bVBuvqyeJKznQB6RbTWbWk33yy2qyacQ2vocgaloHTJb/nWk9PSpZzFPebQ
         swJj2NJuEg3qrwSnLLyWxNFVD3yjV20O2F+ot4Xk3a/gfjdswZAt9i4KHT7BW3sULNHF
         2iC6Lzwoduk4i98w5rXSIOfz8zQzVDI88e2vZ4HtS3TXMJTd5Kp0VoYpoV5Cf26rz0hu
         iowUc960Gyt1fa90bVV5GOGxI6mlhTM4OGsyYOMjln/Nr0L+Wtk5ZlBc8jiRxE0FHZMv
         NeuYHIaOMSueMNA2q/3ICI5gXV7nyAn9rkrjhcKsschy0oLI7Sz+o4zIGWaCkMLgz3dz
         bD/g==
X-Forwarded-Encrypted: i=1; AJvYcCVjfCRxJckHuLrnJBavrh8Q5Qexg6HJLh6n7i3/i/++cORL6DIhUNLZAq7j9hTRaviNXgVaKvJQetI=@vger.kernel.org, AJvYcCWegUNheCdwNTse1FsQpXqyOzhofyM3XSRWOLBElxlurlLRb/Rqdl8eEK1iYvPntP4w+ritqcnJPbR8GsTR@vger.kernel.org, AJvYcCXusqVOtdKdfUwkpXJswYD+5RAdGCncN+q9OsVVGpSCo9EMjvREvfmvjreVF/2kxO3Kw1uDN0JutEoEWIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFm9ul9rxf1l0lGQsRoUcGj5II39vV4m62slZr2JsRqepZlT6C
	gb0DUMT/1mjLWcdoMx/oHqlKI7MLMPprLusus7u84l3YYmz9gIJ/JDjI
X-Gm-Gg: ASbGncuinJXMJhGQUez1T0OjL3nA7tG3hJuDt64yVOEjz6fDgeyRdtFDjgDJWnK1JPJ
	n9Evx6xYqXnL4IBnb62s0b7i34jQX61kgtO1haqTA4+ocFZlaYn56zC7MeQHVIKM6hmGKZaw6IY
	5zfuSeVxu+pCF5am1aiSblCfe00szP61ZxMCUB5bfJfm2Md+nKnGkOJhsUWYI5GHj0gEnicNKba
	TWcfC2vZUl31uK9z/iwASxATKMXI8jTZmISmSu3zitOHsiIKRa14hsAgOMdXIFXFPX2SgZ8TcnW
	A1d4ATz5xRqWOMdVSed1hJVVzj0xH3tk5miLvO3O1pr8UAielF5pmR2Jvq9LU5Dd9mMvMXXI0HE
	nDUauIFqeXK8+fqN2q9Z1YLbBRTD37r7qJ8Q=
X-Google-Smtp-Source: AGHT+IF4vcK+yMCzXEsm/lgvHaUClNHtNWTSnCt3HxCxB3oDHp+2TiZa9QXeqNeqFvnHYqhQnPQXSw==
X-Received: by 2002:a05:6512:ea0:b0:55f:4b12:755b with SMTP id 2adb3069b0e04-5625f53609amr549635e87.20.1757164635374;
        Sat, 06 Sep 2025 06:17:15 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad44f8fsm2312647e87.137.2025.09.06.06.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:17:15 -0700 (PDT)
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
Subject: [PATCH v2 1/4] clk: tegra20: reparent dsi clock to pll_d_out0
Date: Sat,  6 Sep 2025 16:16:52 +0300
Message-ID: <20250906131655.239340-2-clamor95@gmail.com>
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

Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index bf9a9f8ddf62..9160f27a6cf0 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -801,9 +801,9 @@ static void __init tegra20_periph_clk_init(void)
 	clks[TEGRA20_CLK_MC] = clk;
 
 	/* dsi */
-	clk = tegra_clk_register_periph_gate("dsi", "pll_d", 0, clk_base, 0,
-				    48, periph_clk_enb_refcnt);
-	clk_register_clkdev(clk, NULL, "dsi");
+	clk = tegra_clk_register_periph_gate("dsi", "pll_d_out0", 0,
+					     clk_base, 0, TEGRA20_CLK_DSI,
+					     periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_DSI] = clk;
 
 	/* csus */
-- 
2.48.1

