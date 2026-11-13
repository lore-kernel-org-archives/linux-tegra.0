Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581853;
	b=Pv+wt3muJF9gvbauxY9BbKYC3qfGD31EF6CrwAsZHJAK0qyaiDe8H/rOMw9dLwSxB2AA
	 PNTRS821gFT3fNy66rhnNAyFWDe6p0qqpknG4tvMKRltEtSQJW+rZX1uh6Y5z9AVUjy8n
	 +axnGDZlb2rjvW08YOz1Jv3n5/UCIMAWjlnIz+KSi91vgK5cDVWqWpOiFwRm8oTH4ajx2
	 2rbCQK4CAjrL4eZkOU1QjT2Hko+OwaFDPoyjl4ECQXjieT5mkYAG8NWCvPXKIIeytWEhw
	 hL857VsY1T2qkFVlBEYDetcYrJfEFwUjVMZkCx08XeUwSHEkZcKd81JXdgbMUr6Zsag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
	b=1Q8PXB/AIBzlYqrVsqQAxn8OMXsqG4pd0AdujICU6TFMzlqR7AlFSaNX7X6QeL0gu8tL
	 /kMgQvufWiD6kRRUlPzjIqzqKbrtd9HfpEf5DBbA/1SDhOmi/tr1VA1YVaBALevzu1WOD
	 YpoRlQKtHrUfE/6l9v3k6IfzaNW9g6EZj4fnl6lwfUwnmznDT/zUoQIr8aYOblCaDSrbU
	 9UVtk6SIATrcwDkztPNYWbaOL7kem0xV9BVLcLAtBwB5boozRUgXsARdV1LcDeXqNsBH8
	 AW1Rv7F3Medc1lwXLH2HUZ2zfJwoYusJIGVON1DHycKx5Ax2Hy6zboIXusFCv2I0fsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owO76DdV;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270FF606A88B
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 14:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 270FF606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owO76DdV
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so242606666b.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 06:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581851; x=1795186651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
        b=owO76DdV+intecB+gfvcaXp9qFLZHPv1oqwmheQeztT/p+qKx7StnlQPrf9T9xHAiO
         2RUEOCFi01EIq5y6j/nq2SR27fG86EGMwVX1h+hljVpRA4Ijj5eR9Z0bgRIRnBd/LOUe
         86eVB9DZnbqXjO7xcBGYT20LQmmYCZBNTieEV/sUaNTZ/SPKG5AoAppc3pfgQiYzgL9I
         /YjJJ1gUA0RUmFDJ9xnWDxuRnpSeaQaavc0gCMehJtUUU68q1Jz56JAXgfc8FJ1TzUeg
         aCkcOZGNWE9I4STm6ZaDOqZFmmsstugQ6ug7a+7umu9UU7RsN4kdEYAWOEY0zGEKhb8Z
         1utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581851; x=1795186651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
        b=0whk5/G0KJbhwRYavhzBqjpB/r/5f0J3lgydOlRSYxk7NJLdMfduXZzME9zY49q8RE
         bP28hJl/qmLK2+v1HsflvnYiiEeV3Slh/sGt3ywREKf/hlI9BBCvWZuHN0A1vfN+bB/Y
         YvjxQL8+bcuA1UFGYjzk4COPrpHE1mu1iy+qR7l1e6PQDvQXgjKJ9AbBrPlswInDtrLM
         AmDJ+cKnLF/RZP7l9JeZ7Tlk6cmZsEIHaLt9DbGlbWbVMPB/wDHadbbk/PbUIzxGKoPS
         iYNQElM2djtxB9CyCzet/zJn8zFvR3O13A7zoWnjkyou8/1a1rPTKvTIHmYbRMbsxOJg
         B7UQ==
X-Forwarded-Encrypted: i=1; AL+hErEfvNOpdExORL98x4Xy1nvecOBiABsYo0JI6bSTBrzpkkJE4cAqSCA5mapgA3B63FWMfXVMlHRcheC7Xg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Sc7jeGgzVFZJqMRoZre5+F2E8nbt4tXxdtfNqQ1/wSiILldsy
	Nka9ISkHh5oMeMlaeIy2p+NwbDUtNAJg7wzOz8NJvZ2e5GoT9jXSP4tV
X-Gm-Gg: AYBFou0dEFJnOMK2LidPlF3kV+EKQ252jbbFRjkI1/OgFl9rEbGq8l/1LY/doKKb/LX
	4DN215axT0WS+kl0V/9MrrwVabbvv0WHbfbpCJzz25ZXkeE5ivYO885mafHZfNTJR7oh5undKV5
	PXXLgIbKHe2zhS/Y8kJqE1ehZoCyycmWsi6eTdwGSGLSpRWzkEGe/jXlH+uLxWHIDo+IvJuQTS4
	qw0cN+eG8w0NQsVD5WsVpDLa9dkt2t0dlhgqKcOshls79GKVsLjuFHZT8Z+4HOWIqT25krRGw4U
	341xW+Niauw98KcSoO6J87BRsFjaiY5JZXN6FaCpCVcEMOJhbssK3fOVGEZ7w5VgRuoD9qHqdeq
	Jo5+Tw4W1SxuG9RAEnZmOPNn62rIyU27jwu/hWsXojcVHm2D5YqlJRVdSAU2ZF1Bu+vYJxkAdqw
	9KC5oGqCjbaEKkhVmEl6cZDvu3VhdaaYw4XpKaMxpG/idQjZmCVcZkOhihhabx6CSVWAvsMuKLj
	NZfsTZ2UrxtaI+yxoOPQHYRZ56PnN5orQTItxh0eB/tQ1V/lcnk9JtW5EqukaZXO3csSZeQIuRR
	e1dWIHLby6XAVIKRQtZhK+frnAPGfsq+rQGgY9Lvo8EjUAz9JalLuFWZz+/bZhPdJckV2BQ83+f
	bg2j2WewV6Q==
X-Received: by 2002:a17:907:a088:b0:c50:52b4:eb04 with SMTP id a640c23a62f3a-c50962ee311mr275471466b.16.1794581851329;
        Fri, 13 Nov 2026 06:57:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm109937066b.25.2026.11.13.06.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:57:30 -0800 (PST)
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
Subject: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
Date: Fri, 13 Nov 2026 16:57:08 +0200
Message-ID: <20261113145708.261530-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113145708.261530-1-clamor95@gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
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
index 80b7f64125d92..e3d8ab76db649 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA114_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA114_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA114_CLK_CSUS,
-- 
2.53.0

