Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541D92DEA95
	for <linux-tegra@vger.kernel.org>; Thu,  4 Dec 2025 06:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764829036; cv=none; b=HoMFBxCMn/OS/EK6hbJzv/RbZDCrYmhINJBTx78FXpf2f2JZ1+JxrN9Vi47U+yGML8f1iTTthezNH3iIM6wY2Z+r5urL0P/i5kAad3sZLa174k8FpIS9ai8eXevS5A1rg2CyIWq5qEmoCNGOVVu9zhxXHlvJzgx/RucYA/8OSOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764829036; c=relaxed/simple;
	bh=uBzb5hn8RwRxDCS3Rfjd1ySeo8/NB82z2Y70tDhB9tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qkjhO8NJzzb7inA6LcmiuPf7iRBJwdkwr0kG9Mv+MpWKjedu9h5Lu4g+iqMg12vOIijP/obwfrGi1FA3BvHQHrMQTu3bsJ+c/TqkQB9TLh38S3qyZzqwMFUsgQ0KQWvC9NP9MYqpV2jHknH9mp0S85Gl5Jqd4g1bqKF3XYCtjDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgfAGVmF; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgfAGVmF"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso793622a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 03 Dec 2025 22:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764829032; x=1765433832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDV4ueJ5OUHwsY4jMIVfrhYRT+0a4XHLxBIh9+KCo7E=;
        b=PgfAGVmFCm2cl4ESqWNRWEBmC6sXHfsz21I/xPctdrFnA6kWasg+71OM4WlApeXBLa
         Q2pQfsk/80lmgU8M5kBfSeOJe4CAi3wFSzQdmNnd+uNTsIX3TbhUW/GrJtc6bCdFdWyH
         vDkTnq/rfF1B5Ya37nBoQMwZsA/ELtVgluq2A8CD6vnr1RpooVtV9ttFST1FYDADjj8E
         fcy+IERsTceE37q6NCUXJvcEPlZhi1NGuUn4rmM84ogtay41NLMHwbwubKBIwO1080RL
         GKEpmeFlmyHiiGnrXvHKNeY+mt3lptTvajnyn5yKvB/DJ90GfKizjYiqdpUcvwU1Ux2E
         bH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764829032; x=1765433832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wDV4ueJ5OUHwsY4jMIVfrhYRT+0a4XHLxBIh9+KCo7E=;
        b=Q9O9RScrSyT8HpUKdJFQ2i+XpdSu/JMPznbs5HYA7+m+hRi1mCcjii+i7JFYiZbAyI
         E6MPbt0wYHPt4AqbeAglO2wm2Sv0btqz2yzouEH807MbzXofv1IIEat3g+XGueIM7fFH
         pZ+oV5WIKRU+FV2b9sGd8AjIpcpV9oug/rpkcQ/4xLCBTPYUPKveluXPUySYKMSkMCII
         q6v7pm6T1emjwp2zq9SJ+z23KnK4IqEL1NFt5rfj9rL2WReTwlgk2lTVxYTeHw5QgHn4
         xWP1AdWZFAovuaIGkTwguVgbAhhAj5Pn2BsNh+s4aTqvkc7wcOmPqqrgEDjR6hnDo42s
         z4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCX6uXPhRcKKwhelYDwMj1wuDHJH36k/3Zn8ZTKfmEZLKQBy83gspYXEAjbFUosEDVlLNpA8+h42kAdvvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5B7Owz54Udhp3DTxyTO9o/GH0qhiCn1aRgBItfmkz1te9CDfB
	WdXDhM4IfZ9YjG/acdNo3rpIU859/E9IkR0GS2qvVNSrOiWwkv23LX/m
X-Gm-Gg: ASbGncshwWDveR/CN/SEB6TdkKPhpAYn2tfq2wqm0V85NqRDsPpUMLxh/9jNtgCtTW0
	+jg9gO6ciO+hC2n7vdpBfCnrnCpYiZNdXpGxoGgV1Nuf7g0IdP5f0K86Z2sVeX0mUnFjL7/9Bik
	ZSTPuIzFFbrfYlhvy8Ys22mwewr4Tej7gLQGxVcXzzB6rqi4ROpuGUDDz6dUED9npGmwWUj00mU
	j0mS8eW9OB3R9FTAJRf/URe4vSzGKJxUmJsvoS9TBc57ifEgsncebAA4NsoF016keAevJtSuz66
	zaaygCp3ijBwQYmzA8K8RUsEFAfiPEqpFPnCSu9FX4SCXptzz2V9MZQ/iJIsvIPoQdA02LMQOzg
	Wv4TU9Qv0pH8NlBD4+DpsVJKzhxsk1fLbdc9i86JdpDyKFZTDcQvpZtH339lH6Kqk7MoXFRa08X
	w=
X-Google-Smtp-Source: AGHT+IHjjOps7OFhIOvLIknNQvKPCH2qAuahzZ5Rpu+KEg83rMQ1MpF/A+ajRn484dw3CkB2Jg5bjA==
X-Received: by 2002:a05:6402:1eca:b0:640:cdad:d2c0 with SMTP id 4fb4d7f45d1cf-6479c49b919mr4308385a12.25.1764829032448;
        Wed, 03 Dec 2025 22:17:12 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b2ec2d8csm490159a12.5.2025.12.03.22.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 22:17:12 -0800 (PST)
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
Subject: [PATCH v2 1/4 RESEND] clk: tegra20: reparent dsi clock to pll_d_out0
Date: Thu,  4 Dec 2025 08:17:00 +0200
Message-ID: <20251204061703.5579-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204061703.5579-1-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
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

