Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792839690;
	b=HMOekZkE3OEyGdoor9sOUEmcryaHxLCxMXqN8ejG+XAHTudllrwHeK13cfPG40m+aGS5
	 /IVJUUNQWbJpwjDr9dx3tH4aU8HmKNF+MTiiyUobwho+Fc+OEOIs1KgjuWPC86zN05jyN
	 6mn9ewMl66Y323LdZ0f20F8KhfDTOgrBKwBJQ76orqDUnOO/QrDjAFwEgozpQiGlDNc75
	 U//jopLpKLZUkNKLZT+nt+yVMzOve0uVcIGjOuLxQ8Shtd3qAZLCmCak7bhZrr/bt8dNF
	 yiv27L5tg56ysl83w49TihljF5rJn0/XlF2A/tczUnuP0aBb/2eFBwvBNDULi6ZNQdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792839690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z/AIP7tnKK/4+bwJtDzlzu0jwt67zrCvDiXb/N418ik=;
	b=gOWKpr9olOWf+zCQdrQDc2NQFGabnCFxJoYbTKpdxvSdUJgFQRfpZWtbJhdH+vwaMWpr
	 LF4b7HwLWZkv1txeNFIfYeC9H6pUoW7d1Jlwq5QAuhuOLZJxts58hvUPBgxPkJgdkB5zF
	 YdnaveNjiCWZga740dGACKKL+YkcdoMrxCrkRjk9ujoe1Zh8OItE2UIoqWARJDOnsSc7E
	 LQ3DraEOqnM7q2W0K/hGL2aDYHkwPmoijB47vkeFK1hSaKBi8LXuQpgH19mIx/BEFNLqL
	 81Pip3iVjEY3MIoZtcmCP4e4MRnbW0IcqF3PCYAzzd1IbFx5w7WtuU1gyb7xkgPHTRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NhIpUUiz;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE895606A31D
	for <linux-tegra@vger.kernel.org>; Sat, 24 Oct 2026 11:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE895606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NhIpUUiz
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso14246095e9.3
        for <linux-tegra@vger.kernel.org>; Sat, 24 Oct 2026 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792839688; x=1793444488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/AIP7tnKK/4+bwJtDzlzu0jwt67zrCvDiXb/N418ik=;
        b=NhIpUUizuCr4oq7rqnXBsUKCxO4JcZRB+dC3MpSSLVHuj8O8idnQNu/f16J8a+jjwo
         UzXon4kUVJP66AJolXBJCUjoyRuf6Rj6pqqctvBk560ulmj526cukzLJyuPMcV831B4d
         Y827ZiUQRLfzyTFqQJaUduRU35uW/wxOoKRtGqzMbiXBM8+0wxnM7nYsR0udyDgldFXe
         W209v1tT1cYWlnOj3UG1jS/p2WsL96rpoM40St0JnW9raVJmN4KVpySpajJWD8RiywMq
         Td2nrXHt/tll8fa1C/eudNNv73S1d7KHeEBA1ydE/QaLqw9C1qAqA509qkRxCBrR9jZN
         sfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792839688; x=1793444488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/AIP7tnKK/4+bwJtDzlzu0jwt67zrCvDiXb/N418ik=;
        b=2mvpyWGAd58aQ02OF+qks9XRlY7W2smKUjResv1cAlBnuG1WTWkUJ+WpBGK+bRV0lm
         VaBxW8pIMSJ9AXT9GG5ts0QriH7HTb7DXZz5o3ntPNnjMmnUINR2DB9KU3EDrQo5GSpe
         1Kl4iNTGT0BFLTf632wPfMK4bH/IZVbR5DUPLPL5R48n8BNsGMLPlMvTHJYNgWQRaFit
         rQdfO6pR7t5vSUMxtUjf0vHN8xfxWqm9XbjzqO2JlMccj5ZNuZK0kQNosB10r52J3+c9
         qXam79t5lop/ZjtyojxlQvoV3FC7DNFdL57/J+lFNTyeyjN+TDPKXL3+DBLHTfZhJl9q
         4WYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgsxgYmho9pLe3PYvXRuvUgsdOSfivF4iN0pfvmhNCTiwybJ2bGuqb0r9XSVJnWgQWDJTAX9DPqTy7eQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLkGdUkPQaCbCp3nWAI4n73LlWP3BiLVZ/AHZ4LYB5bTqFKcr11
	h+G7SgLP6+45ZXjMK5Xcyd6Xzzn/JDjeklCuKvs1KZA0UsobjzTkP6H4
X-Gm-Gg: AYBFou0aY++8LJe15l5ElTL1gZoIA0pHybp8LVnE38F8lcyExNSaO8dbPwZNOfA9TnL
	optQDZx/nRfwMUAksp0tL9xx94njyiJGkPKTAyz99NJpl3WugZDYJkaEx4ekyUqNpIDJGns1HPs
	cMtcAXHMF4GhQ/n99NjWouejqjkQUtZiMe4g1beL8MpM626o7Boo8u6Qj0JtrpfmzLg7f+5jwjb
	gn1m+MWQ+Cz3INHwjCdMjR2W7kH2u8/rdptatKeJe/269/6WWN0utKW0eh90SEMmAG0BM7KpfNS
	cMd47cbNeadEjmH5Byb91joXocWw7DQpS8dPQkM940QG3Tq0NM2cQIQY8aQWKbMz5642hUsvRp5
	PO71bzAFdd6MKQ1POtZ9LVPwFf6f1idzRREZo32kYyl+MGLeGRLQ82dWqNkAiDZWPGTolfp06Pu
	25lIraZUmIKkkUIrgLQr6koh+PNszV/FNLL/Sl1UhKlIpaLuOb6BviOP9PxsQI3ixmWIimOwPUF
	GUpNdOsghSSP8zVh7F/ABt5ZKD19C2h+nzcgi7Sf5Ex0Ah6sWyph+dpg8ih21J5iKdV+O/lihr5
	EaOxfILQECu1CAIU4IveCeZPCpXwtVssqQDLFmii+LKHQyfVeyh7VQv9KgHsE3gVgDXptgkmlP5
	F08WZbwEJlVg5dY8YB2qXS6ffEQ6TQ9lKZ8DK6l6QdYlSthViTnORGQ/INPE=
X-Received: by 2002:a05:600c:5307:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a35ac8bb56mr24174315e9.7.1792839688051;
        Sat, 24 Oct 2026 04:01:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9da9-5f01-d5f0-7ecf-afa4-4bc6.310.pool.telefonica.de. [2a02:3100:9da9:5f01:d5f0:7ecf:afa4:4bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm56863845e9.1.2026.10.24.04.01.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 04:01:26 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: tegra: Fix Tegra210 IQC2 clock lookup
Date: Sat, 24 Oct 2026 13:01:13 +0200
Message-Id: <20261024110113.63341-1-kmehltretter@gmail.com>
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

Fixes: 88da44c5edb9 ("clk: tegra: Add missing Tegra210 clocks")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
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

