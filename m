Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67A07C09F
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 09:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520163; cv=none; b=l4KqDEde3FeKAwrcS5d7hYofNEMNZmBARaN/kV68GOG0ARxhVxm7+Swd1yFq1cC1UGqKSqEfBz7QmTavgT63wzOEx8NanBWJySErVtLMrlxLP7SLrMePaA3S7Kfc2jBycIEOwq26mXGZp0E1nMLQ+RgisSR8V2wLSXoz1BbbzOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520163; c=relaxed/simple;
	bh=Oy36FoyBGe72y+nQ9C/xUGn3HkAwEUaNB0CeLr8vc+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tk686wlBrmrbv1dFItW/nV5llZ7mWAl09jwNoq5yoTchg0I7Pwixhrg0BT5vXc6sjKSopGHyM9qfEY3WdPIdgriJVtMyQdzxxz/gxyjEpYsoX4Hihm44Y3z68g/0fpe8n7Lno2+7THwm2E7E/a9vkulnt5hLAm8VDzGDNGiNShI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e8JZWmxy; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e8JZWmxy"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78f03917484so111315585a.3
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 02:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520160; x=1714124960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xe5eM9+2rh+qYMrEZDkgx2/xN2LnDn/yiZVZC6+s6fs=;
        b=e8JZWmxyofnDazG93BvCeq1J2pZysTZUwMS2Obi4PMx42Tytz857AQxhLTiXRWNKWG
         SN2u/My91DWhbn0tZ20qRZTwm/Zi5RAlaLv0Tzkv9ljd55QRfWDhmhdLtl9ONFLnI2nm
         iq5wk46Ex3bKFLxs6uDzoUXtpn92IFrS5Gm9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520160; x=1714124960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xe5eM9+2rh+qYMrEZDkgx2/xN2LnDn/yiZVZC6+s6fs=;
        b=F66+exsha33FTN+MarbdsqHOh/s2Ceg1SNb6NQfpkEp0MF7bZsHZmZnDJyhm+NGpZ6
         T/BN6YrlgEOPUg0SoCs9zAV38iCWHtgwGtKKOESbEDB3CExi3+6v/W/j51ch1QNzye1Z
         TEqOsbuwMTFmk2k/x0z6XCNNvpkMdCGjEpjWh0FsoT4QQ1C2G+xHUE5pJ9aTmm+w98rl
         PCzBN/Vq+0Opiwwv5kuvNWN/dzyB6nGi8JYrQDuNnl7/pXlHSBg+EofJ8La4Yqvsl5Zl
         cvHslBA2hW72fKI4AsQ0psOwhfTHsM8O382h3oI0T+/W9Hv8P/t5jnCjZ+NKJUhPknoY
         YzDw==
X-Forwarded-Encrypted: i=1; AJvYcCVSqW4tNw0NMUejm48NYlrwHFrkY0C+uJu3xvNdMqKNnqvikqELaOqGiRzh407uMVI4YY0Kk5vI/LJDqR/RmIFYD/eRvahnREb8RVM=
X-Gm-Message-State: AOJu0YxFe3q11f52LFxc9PKXFE9Z2FFeK3LPVlN+yDyqi9AvU0nYEoc4
	gWjjZ/4EzXup8TLFCzD/zCgcfD08Sw6/3Q9ugbQuqHrFeEPj5LmgjmThi3Z+YQ==
X-Google-Smtp-Source: AGHT+IHKE5I6bNN/ygxYDQdIMuWr0dmGCsznmTcTgLl7Ioa5cL0u9qYtPjL85KqnZCORUNl4F1qURw==
X-Received: by 2002:ae9:c119:0:b0:78e:ca95:81c5 with SMTP id z25-20020ae9c119000000b0078eca9581c5mr1646405qki.77.1713520160591;
        Fri, 19 Apr 2024 02:49:20 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:48 +0000
Subject: [PATCH v2 02/26] media: stb0899: Simplify check
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-2-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
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

chip_id is an unsigned number, it can never be < 0

Fixes cocci check:
drivers/media/dvb-frontends/stb0899_drv.c:1280:8-15: WARNING: Unsigned expression compared with zero: chip_id > 0

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/stb0899_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/stb0899_drv.c b/drivers/media/dvb-frontends/stb0899_drv.c
index 2f4d8fb400cd..35634f9a8ab5 100644
--- a/drivers/media/dvb-frontends/stb0899_drv.c
+++ b/drivers/media/dvb-frontends/stb0899_drv.c
@@ -1277,7 +1277,7 @@ static int stb0899_get_dev_id(struct stb0899_state *state)
 	dprintk(state->verbose, FE_ERROR, 1, "Demodulator Core ID=[%s], Version=[%d]", (char *) &demod_str, demod_ver);
 	CONVERT32(STB0899_READ_S2REG(STB0899_S2FEC, FEC_CORE_ID_REG), (char *)&fec_str);
 	fec_ver = STB0899_READ_S2REG(STB0899_S2FEC, FEC_VER_ID_REG);
-	if (! (chip_id > 0)) {
+	if (!chip_id) {
 		dprintk(state->verbose, FE_ERROR, 1, "couldn't find a STB 0899");
 
 		return -ENODEV;

-- 
2.44.0.769.g3c40516874-goog

