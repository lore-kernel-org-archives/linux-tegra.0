Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841382;
	b=WUF5OAHtd/q2kZSrwz5v1mkWjRhiEe+tyyttLe53n23j9wS8To3DcpmVMSvmB/Oi0TKf
	 n1CbALiwDrCJ6w+btpZbOtcHC6ISEfOnXGpeLzmFwwj0gLV9EwamSSDJJsPnYbEqEk0FF
	 2h6czpj0gi8oOt/VFrJ7ey3BgbN74svs0boTplhDx8OYeGunmAGyw72of6EVuN3TXz0Hp
	 tKX+BGrx7x0cgQvEhmHN2xKGzxEr3kYaZNTHCbQQ01Tz8gPvh1AQ3rQ4CkrZjuAEAzoai
	 8zAvLnr1przl2dCda43JtFBE3dk44b8X+Wvsuuz+8FpCJKEA8I5XgkK3H1ujBz5s2Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
	b=EMKvkyZ/EfOODxSjF2Um1G4SIEGj91JH6TcaYAno1ROWI+FQ8jteARrbCcitna9Qcw1f
	 y23Becw4NHc/+AiH9hRzK8sIFv3NJu9YgYGI0qQBLBaDpHCm6VF+T8zLZ9QuGaNSCqzRE
	 TCXPSSDCOOPLZNvtkRux8cISHFY1o40W9UJVLZTh1WoHKI2nZ2JuHOkbwrpbrkMkN875w
	 VMvoQ6jZaeXV3HFmKk+tMwr52nZiRg+o43CuiJS42zwgo+OF52i7ASuDO6PwyeNyf/cHT
	 mSpsXbpC3V9EnnsnPh00CJ0Qh9CF9KvV8JCp+1g2gqpigJo5kl0/nM+Zt7/CIwsbBlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPfo0MX5;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F462606A880
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F462606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPfo0MX5
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so335465766b.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841381; x=1795446181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
        b=TPfo0MX5/qR4L+XUpwvsAIulq5SLhgctltzs/MtnrLc94IsHZh9WyYogU/a5Fo090J
         P44VtWX2wvpxPaGAuNm8bNS0K2a6KFZy25TiIU4NwSEwwBebQhpe2WhBJ5xz30Nl5FMm
         BRteK9fkLxsQEf6pvhNlcw55G7ooH2VR2xkHw1vAhq40GhVQ/IxTBlowyywiAzzYG4Xv
         KdlImwY5zYQhTScNfcNar6QHZSXTorGI4hKl5c8sVSoPO5hISss3807MAe+ZTVjre4MJ
         lGMV9LJ//U6Cj3rlFVp3Z1JcaSYXBZhIbGnZcnFfB/ijGBgDMq6+2xZTkYxU5nur6IXW
         1pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841381; x=1795446181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
        b=zR672YOZj2UIdnsB6fNg3kC0ZLy8NJONvK2u3DbJ+88F5uFPO+maIQd63HjVJcq7yn
         UmU1m2rcedsWCKS8cFF0ZeBVfrs0B0BpDwNMcqvheMosdT/xoKWBulTsryFzf1vQA6A5
         GMYlE33uwS0ep2qmFigK/2y5iZvN3ZUhhWf9nxSh1JBrfitooOgAjbxzTSW5spUgJkxH
         jWmnzTC5F41Xc606D5IF7bH4Ej/N7CqLfQweib5tRJorNjG7BBTAe4hul5N6z/wA1pb4
         TCD4YHor5XraaG51UjKvHMV8dJvpAUM4cl0cASgSoBYreKXiTecBAiwgApZZUHH+keOj
         HPNg==
X-Forwarded-Encrypted: i=1; AL+hErHI6h5njEhDN6Uc6S87bytA6yFPxyzRszpPNzdySsMCag6lk5qqBLnoNq0ISN+AZ+lcfjIu6brqpeoKTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8FrFnhaDcOFCgAdcku0V+NjW3/3oDb6OfOXnvNZnhsKzl1xuuD
	ecTgAZIbaiaPks/KjWOYrK2Fuv/82L4vXhwYYjNNUe7Y5EDw2Ubpvb4O
X-Gm-Gg: AYBFou0qQ9xCCoBPKWwBJRrpY8v1RO6RzzupF6fOY9BLM8H9ze4RVn9B+gnqLmTLSOn
	xWdsjQL1mote1tv/3jABF/zgHZPcDk/EughTcoeAk9QwVp+RixiiGyYWLTHqMoNksAwSnqTxsiX
	0rAYpoqQRpDJqwMiuy5SviSEMGY+2PR4T50mmLz1IktWN47uf9LSAEDcDxX/pe0QWg8B1QJxfeE
	F8dFB+TXB+bq95iRpRCve7L/t++XWJfMhyjUB05lG5yjTd2XAwuaHqS60/wVmbJ+juAc3QliAm2
	/IFMOUcosD7tSeQc4JEkg2rj7BH0bbGU9HJ/e+j1QEJlf3+hHBw6lcDZk6NTg2xJCkc9vi45XGV
	XDjvX7KZ3jMGuQRqmEHly4COBqtxh91rIBUqA6xqwF12E2Z0VLuiM0VKRxNt6azK9OpJcY3W/Co
	Mg8VuIThjPkvB1cAXYB3ZWKTBPB5E/T2AGBg6qsuGLRlYeEkTVLVDo5U7Zb4O0VvepTMh6oHoIk
	K2hHch7+xj6IxJB6PA7dPX9+UFetldluLVQzNivLjzEl0JmkwHJlEVC/2kQY0/IpDrAxLz5xk1y
	pFzlBrO58bx4P0Wa/OLnz7VGtSL1mIYcS+GsygybGKD7zFRaHrPq612TBmtwbcyrjsvLgWMeq4v
	Zz3mRc8nPhy8VtbnTIF9d5p4lQtntKZg=
X-Received: by 2002:a17:907:7b96:b0:c50:62ca:6f7 with SMTP id a640c23a62f3a-c50963b3398mr889831966b.25.1794841380793;
        Mon, 16 Nov 2026 07:03:00 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:00 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
Date: Mon, 16 Nov 2026 17:02:37 +0200
Message-ID: <20261116150239.264139-2-clamor95@gmail.com>
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

Tegra114 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks. Additionally, move TEGRA114_CLK_CLK_MAX into
clk-tegra114 source.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c         | 1 +
 include/dt-bindings/clock/tegra114-car.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 97f5500b13b5f..80b7f64125d92 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -47,6 +47,7 @@
 #define CPU_FINETRIM_R_FCPU_6_MASK	(0x3 << CPU_FINETRIM_R_FCPU_6_SHIFT)
 
 #define TEGRA114_CLK_PERIPH_BANKS	5
+#define TEGRA114_CLK_CLK_MAX		314
 
 #define PLLC_BASE 0x80
 #define PLLC_MISC2 0x88
diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index a93426f008acc..b53f5942f4bae 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -341,6 +341,7 @@
 #define TEGRA114_CLK_DSIA_MUX 309
 #define TEGRA114_CLK_DSIB_MUX 310
 #define TEGRA114_CLK_XUSB_SS_DIV2 311
-#define TEGRA114_CLK_CLK_MAX 312
+#define TEGRA114_CLK_CSIA_PAD 312
+#define TEGRA114_CLK_CSIB_PAD 313
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA114_CAR_H */
-- 
2.53.0

