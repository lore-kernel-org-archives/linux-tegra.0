Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81937127E25
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 15:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403103; cv=none; b=gHD8bMjKbAF11PWW+YcO8l9EnoMj+7wUtvvcSLIlZzSEhPoayOOM1YdEY9nDIn6lKEEXaF4epq9kCDb4w8cbvfGYEwa2zqakRbQVubTWlimGo/WEGZJxy3fpKLnZClsT3387Z8xfP6J24e2dMD56otT6EPClz2F5OWHKpj/gw+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403103; c=relaxed/simple;
	bh=HnkZzu3hOGP6WP/z/J628OEomq/9kbGj6cjO+bxIfdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XGHFeF5JTrVjCePfNmtrmVBI6SSMClJaH7DpKOMpYMqcZMfpD4XFnrhr2aHRZdaQe1T7cCS3w8Ug5IozktWd+Q9ToHCFUcBUpzLNXS0OFT0/UV8o8fe+5Or0Vee8ObRmengQavxRDSndas2R85jz5UvIvMe9Fp9kCtUEZIXbDbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lXukkAfz; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lXukkAfz"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78efd1a0022so364794485a.3
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403099; x=1715007899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=;
        b=lXukkAfziG1WhBen2kYadAkV8g+azOcxaGabqcT7pdCwccZDcTPK3u+hoJInK57RB4
         QPZLOr3f6DQEkqRGdtl/Tnfi9haih8b/MhpQmyXyg/GIQDWydqdUB3NJdmJXRX8rP080
         RRt6Qeo6Olwuz3Xhhd4J7v2ArakNyxpM0gDz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403099; x=1715007899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXXgUMwvGuh/bAZ05Vu9f2lIZUwmSZiJ1Ue2E9QmyGE=;
        b=cyuPa5O78tNxPIP6JymOG1aS36KLrNVEbC88MDf1kaeh3IcSRCEkrhFOeCUVHNKATQ
         mvh17u40qwOd1X9zUMRufGujVf66xFfJmt7diAgTorga3ajuV2wyuSBBIQqdevDM6qVP
         b5p9H3f4g5vrDmAFf6J9Of33vtQhgGSb6VV4WjJuKaWCj+7YQ2tLeodcu5QqMICZwWEp
         1PM181gadTFnzLZH+1V/j+gpy6uaTWWQhF10aP5ISkassLFdc8a5Wipg6zbzgmeDq4Dj
         k6riaUTEXdN7mPSHT+hCzg+KPyB+xBHCiAErJ6GGTF6XejIIeXNPWUlQMeg4AveB+0XO
         W4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVDoJsp/cCU9pG793zPn3bhEdGavu8X0wU9s3yQZpEiUz60Pxqk4+JN4lhMjCapBoZw9zPrLdc+tJIQrw57mtPpQq67BMWJhPjLinQ=
X-Gm-Message-State: AOJu0YyPd97dCFv011r0OUFHNj7CH7SVgiRwIGoupmRWfwqa1qSVTZ5p
	4dbdRdYDz7k4Hjwp965ig+1o4TbJtDp4FX5yHGHeDMac3Ij5G8+WdsjHI74+FQ==
X-Google-Smtp-Source: AGHT+IFJT4Q2Syc1PBrJKVClvA35sFEGet4fgiHKy6TprlGgcTs6U4UnMxlpWR+ax38rGRoBMytLog==
X-Received: by 2002:a05:620a:410c:b0:790:ef3e:24fc with SMTP id j12-20020a05620a410c00b00790ef3e24fcmr5535437qko.16.1714403098672;
        Mon, 29 Apr 2024 08:04:58 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:54 +0000
Subject: [PATCH v3 15/26] media: netup_unidvb: Use min macro
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-15-3c4865f5a4b0@chromium.org>
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

Simplify the code.

Found by cocci:
drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c:138:26-27: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
index 46676f2c89c7..1c885d620b75 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c
@@ -135,7 +135,7 @@ static void netup_i2c_fifo_tx(struct netup_i2c *i2c)
 		(readw(&i2c->regs->tx_fifo.stat_ctrl) & 0x3f);
 	u32 msg_length = i2c->msg->len - i2c->xmit_size;
 
-	msg_length = (msg_length < fifo_space ? msg_length : fifo_space);
+	msg_length = min(msg_length, fifo_space);
 	while (msg_length--) {
 		data = i2c->msg->buf[i2c->xmit_size++];
 		writeb(data, &i2c->regs->tx_fifo.data8);

-- 
2.44.0.769.g3c40516874-goog

