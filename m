Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795860579;
	b=QLb4SGdbStltmc+WNadFhwnH0LXTiamMVGvlIfXnDrLN8RalE16UA2PJEX7nzrTP5bMJ
	 x0HsfBsTzgKfvT48A1cLQPfgp8LaL73AxlPUu8HUERbtb+0nRNqnSLjg3KOyT/8Wyoccw
	 ctx3DM62MhZn1voNmZEFb43vM7g3fsDWLbrOo7xEnJf2E3K+j9faFX0Ik5N0cpN1vFN/m
	 QTVm9q0wEHrdQ7Vg3c7jE4gngPLSgusFt8D3aHNmrRoabBx5Bf3lAj0a9DCWTx1upCrbD
	 egrtLnBlBm3Dq58YdcYmVDi5h2jbLJB5hVJgF8fLQtcbmSm9x6P+J4niEQpT4imSZhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795860579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3jFkQl+1kffZkQUkv18i3cnYxd2zz1oEQ3A2zDQZ/xs=;
	b=ySFt2NI1NiCeVq+VJ/qqF6RhN1mw2ikKhhn9XdaTgeIs6M2paFlFACSgANujzPnHB2mw
	 BQmZbx7rkQzspZyfyZEfpiN4Gsp9GbCQ/jeBXoSho4CXfgldCuMiw89FbjXByvMkIHnCb
	 EBBVruFRjT8GDfCJoW8D3WFZJ40HBJHDHDflmGOjwLpfl9OCHslkGMpTYTldSkvNlMAFM
	 nT6wEpyThMKEmnhLVzjfaT2gCbkkPGjV/lzgq0C43FvUjA8hl8LpEzgDGxuXE+F8xlroy
	 DHEqfvGw8mhOWBOgpi2ShF5XhZv7CrNvrCxw5YvtezjSE+AWvFIUhTWu5DeSFUPCYug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRcuHncE;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3982606A321
	for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 10:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3982606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRcuHncE
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso89324685e9.1
        for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 02:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795860577; x=1796465377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jFkQl+1kffZkQUkv18i3cnYxd2zz1oEQ3A2zDQZ/xs=;
        b=QRcuHncEDc8jX2CaVQr9tB0YRx8yimBZsVErESyXrG8bQXBU4H7Wk8vm2VCt9OqcA/
         rgNZdYjTTzbpbBp/L+SePcvq4qh4Pba+NQH3SHFxrnmXizvPvWEENXJeNXzc8s6DkJgx
         JPBC3SMKgjBvj1r70K1QD/+uU/GsP2EK7CdA63BnG0wjA14TZfIGyKEmY9rn2MEU7APp
         kg/Dk4F7QRFsWaqwUDpGyPs32nn3lOKGOzyJlefVuVagrVNrZvCKoaC/pDVdis9WYLsi
         1HGRz/YZanKjjEr2Kdw1+WKT3AdeGGa9jFtwMw7eXlVZZSHd+wk/R3YjaXoCanfb6crL
         N1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795860577; x=1796465377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jFkQl+1kffZkQUkv18i3cnYxd2zz1oEQ3A2zDQZ/xs=;
        b=DqUENjcL9LBwB6e+NRksD87+klAEoQypQ40uf063La9J7jXWXre9pcao+GSZc0dIdg
         YxsyJO+x865Dtmo/wrjiNhs9kv5yv0/261ao0d5rYJjzjmIIhvkBNDXUbmsWRB/0hpJf
         IhGYNs/EsAxEDkPRydjG5alskfJSSUgJCNS8u9iBExr4gA5r7rIrSdohMBAGpBkiv+2z
         SO7GNuFEYeo12iyr4Cm7oHhbeS7NbBbuxHGpv2yMSO4zMeQsrBHXjOGozzRbg0K0fy+3
         YDKQOkNx9+5Z3ldcgg2lZwEDiekmLUm+opCxehPrcEzb/RRUw/n0y+fj9OQ0xiWWNQ2z
         cc+g==
X-Forwarded-Encrypted: i=1; AL+hErFNp9cg3ihHJLJaTWD22xuFgINH9D4rkbVDb1yyRQrQxxDX/LXLsKvxpl2by+8kxUxniZpxuV3kam07+g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8JlM+7PzLwQuqG6La6REpjQf/zTOoOLuCd2KdR09BTZeUq8Rs8
	vS03y/9+J1+rPE4fRAcDisrcxAA/i/n/T/77F99oSsGux/wJn/XlWaY3
X-Gm-Gg: AZFdTZcnYo3y8xkLyaCdVRCJspsn/NIjmCeU2cjECtaSK3cW2y0bb6MJLRTTp9yuf3R
	NqeCl+Em1Q+L3yfNsVipCNqDPWZAPaKvN9AnQHdec479VG+gf3y0YKBKorMvX4Tp5DhZiWakc4d
	OXu1R7rvCMC0glRlZXRJ+UoX36icYPGCsoz/hRcZ2xaE+RzokpFerfZ5kq/Lv0yNlG1lHYd2hVF
	bCar7UuVGqAfI0fZEh2p9L7RuGmVrOGUJkYX/bVylpW7sHNYqApzQCULqlLxyOMncrDQDK74/j0
	DDoYUg61a0JuFrzjvQJlJoknVHjPNXFzMNAnhSElvNS32PLk4LWKr6xPvV/JXQ/bKiqSqUlqax2
	lZ2Z4knN6qJtbcSN2v47zPZH3j0DQlDKTcHD5knVy931GOkPp4vDChxmnmwCNlJ8wzpTjLD1cIi
	6/4pDaaea8RaHbNhSetNCA3q9gZaWaQf0AB+F7G7JSSE/fCmwWENGovehkzk83r2zSSBMsDEakU
	CRbSqU6TqMLTLFbCrmYUo2SElC3EksH5cUeHkRT7LFIw91EMiTNWq7RkJW2sxcX55dfbJk8ljxU
	902dEbK5t0T+AhGkDiyC0pPX4Jll7rYxc5SYRPsZisTolbfKHVdnLtThVdAQjWi0E9lJQF55oEB
	yFHwgrjRdCW3qJXNcvzNdG2RDkvg6cFfNIeIxuZXt1/+y1NyLzp+NmcH4NksZzlFxc7Y=
X-Received: by 2002:a05:600c:a55:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb88827db0mr588682865e9.30.1795860576991;
        Sat, 28 Nov 2026 02:09:36 -0800 (PST)
Received: from localhost.localdomain (dynamic-095-117-034-170.95.117.pool.telefonica.de. [95.117.34.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm698641065e9.9.2026.11.28.02.09.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 02:09:35 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: tegra: Fix Tegra210 IQC2 clock lookup
Date: Sat, 28 Nov 2026 11:08:09 +0100
Message-Id: <20261128100809.97430-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gate_clks[] uses tegra_clk_iqc1 for both iqc1 and iqc2. On Tegra210,
gate_clk_init() overwrites the TEGRA210_CLK_IQC1 provider entry with
iqc2 and leaves TEGRA210_CLK_IQC2 unpopulated, so looking up
TEGRA210_CLK_IQC2 fails with -EINVAL.

Use tegra_clk_iqc2 for the iqc2 gate.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
---
Assisted by an LLM.

Changes in v2:
- Drop the Fixes tag since no IQC driver uses these lookups (Thierry).
- Add review tags from Mikko and Thierry.

v1: https://lore.kernel.org/r/20261024110113.63341-1-kmehltretter@gmail.com/

Tested on a Jetson Nano 4GB (Tegra210) with a small probe module that
calls of_clk_get_from_provider() on the Tegra210 CAR node. Unpatched,
TEGRA210_CLK_IQC2 (220) returns -EINVAL and TEGRA210_CLK_IQC1 (221)
resolves to iqc2. With this patch on 5b0764a53235, ID 220 resolves to
iqc2 and ID 221 resolves to iqc1.

 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 4dcf7f7..47bb657 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -813,7 +813,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("apb2ape", "clk_m", 107, 0, tegra_clk_apb2ape, 0),
 	GATE("cec", "pclk", 136, 0, tegra_clk_cec, 0),
 	GATE("iqc1", "clk_m", 221, 0, tegra_clk_iqc1, 0),
-	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc1, 0),
+	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc2, 0),
 	GATE("pll_a_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out_adsp, 0),
 	GATE("pll_a_out0_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out0_out_adsp, 0),
 	GATE("adsp", "aclk", 199, 0, tegra_clk_adsp, 0),

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.39.5 (Apple Git-154)

