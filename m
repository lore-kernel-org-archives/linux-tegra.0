Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841385;
	b=JRxWm+faUmHoFnOvPXO3+dWXQqttRCkFDSjBERdyOUIPwjbNyRa71thr70zck8gQHx9O
	 IiirM/Hd5AQXdnsncQzT4Ajec/Y7UuoZ8yRwOVm/YLJdUOt2DDwlV7PPB8l0X/EUXeCxU
	 OfGjbrDZTjCcjuEOmGKtAcm3o1D9pGXp/owFK7EsDzjljVbv/YR70nj0dcWvVPTHCL9lN
	 4k9ysh6Bxm5ggXScLM39MS32UHZjcucAfTh2lmrpwedQnNNQfm5wN/0G+z6xTpiBCOXmK
	 XnKwwOsH0czbyj3BZcAYykqaBELC9NGAkkzqTwA7ckFm+mT0/U8LfRzw6QvhEERO3RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
	b=avCKLHagbavYAPIH5lTM87SWU81gSMYBs0j1StKry32Nd6BEP2beq04bGAIN9+MZGmy2
	 VHCzoswDdcJ5jWoDRwdAr80Cjvp57BURsmzNMZMw3cYmXBwdAME99kbPMY120nh4xIYuc
	 IFn9b2jTK9wSAPiytjTKRi8y9WM0h7POBFDHG+unI9io8O/U6zGyKra8LaZ+LKbz8JOeu
	 ORIJua4QlNdjFsDbDUcGhKbLsH7PQj7MaVhKDxn/DKdT4JtqYasL6fCvF60JiSj8qdSdC
	 mjwWKQiFxwQ7JmqZDTEK5h+i69MTzYjB6b2JKC6JKtTpQJoWqBRRqzw91fu4xc36eMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEj0XDIx;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9C1606A33D
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9C1606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEj0XDIx
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40f29667e6so627865766b.0
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841383; x=1795446183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
        b=YEj0XDIxnVpNPh1DI2ma2SbX2pA5ZgtjEweikP1Agh+FH9GBYjgKpmyp+ruqzqi5Te
         mEW+DXBtzmB6vAV+BVH1GD+eQAe+yNKdaNHAph/os0MGvxmO/T3cdsH3At+3krs8SAEM
         Aht2+glUmrVQCK1y5xumU0DFyXOYOm1lnAZngFvntBfbT3c31FhLv+pOytir08+XLow3
         CePrFiu12Pf6mqYIzOGPhrq8xJkwceSvVsC1o8ARLU/w1EsHBsOthRsULTp8d2287XO3
         yLVX6XYXNQ/QvPKZnvCsuXN0Z9mWqyNvtDmv8QUTeo/P/1mMKe/uEczz7wOUlykcc/K8
         id6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841383; x=1795446183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
        b=2AIbxGvoaVZi5ZPb1ah0cP21BAfRWS/tzhD0Yp2cslpcP1gaIOzrf50lWD/ASRgxSM
         vXO0kt8KZCQ5Ja6Kq8tT3ttTPOP6ZNLBLP2498KlNcu/tfdeB5OMdgYQ7Rc+lXMhSEAT
         L72RTU8mOpr34QElTkULGQ/llajNzfyJTrveMMkHLk37dx92CTxt/YwDAPCiUSWCY89R
         WiDEZ6JxcFS2BdA0bHZMAJ56hkS823iYyAYo5ei1U7cMwPhp0LIqevuaHLVX2Crn6HRG
         vm9DWRxCbL3/R2f7Qep3rDi7DzEp4V1WNx5nhvCoDB0m4Cq4Ch7q8Iz2S5nqwwDHADOb
         yL8Q==
X-Forwarded-Encrypted: i=1; AL+hErENRipSjLeJDoa55rK6XHhdgDrPkL3lFI4CJQQyuF6mEFtygJnp04MeJGjA1tOGs6/JeRXMMXVF8GsdnQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8zoSL27cAl6uIGF036Of/axegIovetCJAS4M1G88qFfiZ36DME
	YWueVBR+GawgOtlNetPOd5FRzqT7oVhKbbkf6mPtcarcDfvCbfCfTM/q
X-Gm-Gg: AYBFou044Xe/LciZO/UT56UGJz3AwlvlPB4bLYY56/7Xh9pvE4glkfUhzLvuJEofPTV
	SDH4VEIaPccjJniN4uNNN96az6mxO7Y9Cl7Gay4tooS5I9xpseaN2Y7ypYbKo3zyLMcIqV0WomQ
	EiTjx07eyP1djN9IMgL4Y9DnAn/YVILAo9+7LHHrHMUTHCOTgHaA1tLEb0mQQWoJJCWMqAmseSk
	Iyf5tfzwxRBa5XSgxg/v+7/M63Zp9879VFwJNhkxoRihd4UEUl2dc8jHNT9hpnXUH1uEp3PfjiS
	r/usX/5toYIDNSwZCGJqTq2IpyWAZavz1Gt20kDCCDwJ7v1yHvvXhAQT/nIpLPbw/1RJG5x/4tr
	Bee/DxH/8ZyvufdN1c6XKdLaH/FBWdwhS/YZM2ZotsSmZ7BAumk5G5X1Va0FXdY71rhHsXI97O8
	/Uzxfs82xJHzSL/wuUfcyoO/mu73tY8sf6iiplqGO6ZP4gSCUO+ROfULJnAA+f9DalAtZummcC4
	ERd9Z/+F/4/0BAH6b0qQ+76a8xQUr3g0sHOwdmLWE4R1WMsKEDy7Wi4R2tDZOW5dB3dCkeacEyA
	+9Les6uc8j3SRLB61PaOGFBQdhSew6ek0ZFCAt+yMQDN4OTUmpZwxQnjYkT6G4IlHyysIeWHXVT
	jQVjE7XW890p4fchA72UU3FJ4d5KjGLs=
X-Received: by 2002:a17:907:a785:b0:c46:a607:6922 with SMTP id a640c23a62f3a-c50963d90b8mr891096666b.25.1794841382509;
        Mon, 16 Nov 2026 07:03:02 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:01 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] clk: tegra114: Add CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:38 +0200
Message-ID: <20261116150239.264139-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
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

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 80b7f64125d92..53899f2b1772c 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", 0,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA114_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", 0,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA114_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA114_CLK_CSUS,
-- 
2.53.0

