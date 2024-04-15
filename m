Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B3A15E21C
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209688; cv=none; b=a4DiCe/4ikpTcRrBc1HIXcU3CzDKLCw5uLh93wPxVUKM60aOyZ/ENSGzocwWE7rN3fC6ALwnHO2QZM1nNvxxbqY0yQSgxeOfADQ+NaEsDgODd8Zs73Fu8WEMa1orSgZ4ozdVDp+C/bCZHvZH0nyAACxe+uRpkUzZC1wNbGSIHDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209688; c=relaxed/simple;
	bh=MUqVtQZnq5YrPZr6pNTFJQr9fKe11JNLTSYR8M7S0M0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fff5P8vUB0GH3rAcJ1WJZehvdy7Tdaes5hHyIwaaU4ttyIABwAB+i8yKOIr0hbwu21d/nor+0Ow+w5epTHrMkZw1UjpsB6PjuwP1aPvVFD980aDVZWHpnBQ0kNM39newyT2NRxWjFvDp5P9UWHaKGSRmLybT9j/XvHzjqh8Hryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gtAXBN29; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gtAXBN29"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6eb7500abe3so894815a34.2
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209685; x=1713814485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DQ62C5vkEz8a1t/8x1ghE+E9JYa6TkiF3DSBiMd/dY=;
        b=gtAXBN299AOxQv4Ao9JEm1WX/KzKvP0EdCg041KDQu4xJxItcdHCWtt4XPPhaSR0iq
         wNe8Xzz12jv01p/IiJxzzmbECfk2rPK1Ds+QEotxLbT0rPe6OXxb2b9aN6zokvxG4dtP
         NEwAiBraf9xeCFASUHI6VjTxM9k1z8OHceBqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209685; x=1713814485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DQ62C5vkEz8a1t/8x1ghE+E9JYa6TkiF3DSBiMd/dY=;
        b=qliZrSOXOtnItlwqthruW/ywG3FS0/Uz7oQ3KkY9J3hAGqEo4S+9l/H69uX9IdI68C
         +nn8W/cH102pZk8ylstqkCqT+JW3gEZJMQI2vHptWJimhX1MkT3JSJNTmyrWwux6arHR
         fVuSfys+AntPh0oY72Fa3MSkiXhMNmqNDhp4wc3/0C+4+NE55njfrEy3fYmnBmYPQ/ow
         cccFMjUztHmfvaCfCW/dSzbrJ7oiwWnics1SSUwWHhL29nmWg5f56R8QnquvHVIUyonG
         Xfd+4fI6bXUw098kD/YboJzuXF1wbfcSA49LGvXt13bBEwwPr75q+29bd0lEIcjVqK1c
         tIOA==
X-Forwarded-Encrypted: i=1; AJvYcCVU7r2bHVGioo5pJZ6IGPl46RU/bVa0ME/E0WQREqC3/oc4JUF7haoh3JYxWDs3MONmQxZIUNGiPRsVb2bN+Cuv32x78s7qY4pVIlk=
X-Gm-Message-State: AOJu0Yw7EOEovrhwtHKDp1uUnGtS3dGGx2snHoRP/aNPg3M2MoFy3Uwf
	QnMUvWJb/khMcSxD1zuYmCOQ/oeREURUGdINfjG11vvXKoXnwxtomdiTo3/9yQ==
X-Google-Smtp-Source: AGHT+IEAF9806y97qmHJ2SnDYiOLkOnVwPWcqFC1NWaJsEOh0gdLwpHuhOdGRcF5Wy59Aixlf/05/w==
X-Received: by 2002:a05:6830:100f:b0:6ea:ab3:5c1e with SMTP id a15-20020a056830100f00b006ea0ab35c1emr12447905otp.29.1713209685165;
        Mon, 15 Apr 2024 12:34:45 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:32 +0000
Subject: [PATCH 15/35] media: netup_unidvb: Use min macro
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-15-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
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
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
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
2.44.0.683.g7961c838ac-goog

