Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A77E129A93
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403113; cv=none; b=A/GGk6tCkS7Y7COZqpTIHU93eNvPoFgwfhXM337wLX9XlyCVCjMICfqsybIrqwkN/cItHotNKv/lHGKDa+4jPenWK+Frs7x49R32g+iMSlgvxfYAOClRb6yr2RH0JTk3TUF2cfFC+ZNAAIdvpZCKyLZwC5O9Gjo9ZOscKTcH6KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403113; c=relaxed/simple;
	bh=jlNXpmWLkhoBvAVUnCnFp5WG/uIoSkDxDimhD2tWIcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/aGfT6fuMed6hRQpzCe5YIosJ93jZYUDe6oEto+K4ZP08J8m6w6MVqiQO44C58V5rLb2p1fuJEQQV5xiX7ap/Q1c/d31eb9J8I81saXsu6RqRHhuq5n0JzfxOmj4pTSbG3vKPHtfqC8xf5Arninm+Io8ltzMqoCVmqdoGEv1TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dThykxgo; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dThykxgo"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-790605809cbso420857185a.3
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 08:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403104; x=1715007904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OKO6D6+Uymjr7y5phUxNbL6FrIK2B37/+KaDSdt/b8=;
        b=dThykxgobM784tJZMzgxIe2MO7lURGdnGjwmcK4JdKkjGDmvekBIC9ZG1QK2G82ggl
         GfthJaw2M3InyVw7LrUgeeJ7DCXxovmFRwTqiK4Uwa94Z0daiCQesqo9kvr5D4U2OaOC
         ZaYdVO7H6LriZkQmKHpqXp3M2IX5mg+awbOec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403104; x=1715007904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OKO6D6+Uymjr7y5phUxNbL6FrIK2B37/+KaDSdt/b8=;
        b=HTCA31yaSQSM2TZwrWaJWDOfyrmwv7PVFIueu8btB+4bUDs5Md58Dt3w5DB2kThswy
         mp/qQrwMR0E8Exahe5fR9Ok408Kyxjkit7ZQPk6FVTWHxaKU9H4067P5n8SM8U94ATjg
         svDQUflcSG6YGKTLXgxOlTdEVvJ+ZOKZ8mCwo98SlXjhr7jJPwwKjNZHNf2Q6nb77Puf
         vY49nxIP3l5RvraCR12gmC+NK/9AVStSNRpu9RhS/WfWS5hSzF6LugbU6ulZpK1kp3r3
         7yCQ18e0niykYSuuzJthhTvbUAzDi8SELsFIc1yVjR+8nDQRrQgWrjPcsl32iwgylFUS
         vq7w==
X-Forwarded-Encrypted: i=1; AJvYcCVwMi0JgH0dsF2EatCWiQaMGPpkP/R8cqNdCNs6tPpsrU5vrZvarWtT1r7kDIsYvJalLrVVtegQvhaEqJ4lnXst7nXWZ4B/QxsnQKw=
X-Gm-Message-State: AOJu0YysvWWYvdP+04E7rn6aQrvQRTgBM8jpkoW+LxhoWMBAznCzylfV
	6VWgO+JOjuAKGAN+/C3uvvMSUK5erDoJKYZKWspUsq9dQ0MzjgLE3umCDD+tbQ==
X-Google-Smtp-Source: AGHT+IFaMtke8GiK3PVK81BO+wCQ6+s/afNMwPPBZtmDsaryJW0dODmZmCJQPhu+Legma0gxWaBb/A==
X-Received: by 2002:a05:620a:561c:b0:78e:d4f6:3949 with SMTP id vu28-20020a05620a561c00b0078ed4f63949mr12152221qkn.25.1714403104299;
        Mon, 29 Apr 2024 08:05:04 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:00 +0000
Subject: [PATCH v3 21/26] media: i2c: st-mipid02: Use the correct div
 function
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-21-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

link_freq does not fit in 32 bits.

Found by cocci:
drivers/media/i2c/st-mipid02.c:329:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_s64 instead.

Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/i2c/st-mipid02.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index f250640729ca..b947a55281f0 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -326,7 +326,7 @@ static int mipid02_configure_from_rx_speed(struct mipid02_dev *bridge,
 	}
 
 	dev_dbg(&client->dev, "detect link_freq = %lld Hz", link_freq);
-	do_div(ui_4, link_freq);
+	ui_4 = div64_u64(ui_4, link_freq);
 	bridge->r.clk_lane_reg1 |= ui_4 << 2;
 
 	return 0;

-- 
2.44.0.769.g3c40516874-goog

