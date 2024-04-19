Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D0E8624B
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 09:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520185; cv=none; b=q5BEtY5t+vwL8Zk9tYQrjMSEIlqqrx+MZvVG0nXBRQ1z+bzQqOAViVCgW4ExYxtFNZr8J1kI0/8uSWE3SaXUWq97F2Ma+KELrTSTRIFZmfkXxq4EP56PZO0I0he67AJr6DKHGu6kN0rMnTMeSyrja5g7yIOsMIC/MzcZXZmOZkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520185; c=relaxed/simple;
	bh=m351M6HyiT8IWLkyID5itxiSqWILJmFaZ7lxVFnP6BY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZtExC/fAU3g/Z/spA7YuRRFACUdPW2hEsdkTBC3lDd48lBzosqqEeyYKs3qPI0wzHN/hGJgrIDndfifD3vVubSHycxUJrTUSvr7n+RFLVn4SGrAFpqBHDnMNIh21vrSPwdoOiTSeuf+eYAh86uZReMFjd3dT0YQ9YWOZBf9pRTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KS1N1qjZ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KS1N1qjZ"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78f02298dc6so151341785a.1
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520182; x=1714124982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=;
        b=KS1N1qjZK4OzIiQOBGYVGIGO5tLwBdsFre+btJV+UyPpHLTvqDZc3zkz547hbkRU5b
         beg6iw5r1aaQyFnlmFRoXhfS2s+g7xR05mgjtfvcmF/Im2eoTK4iyhNNR9HbcWULeme/
         m53QBrR0k8wwU9+UVsTdBJX0SlxL2xYP1NR3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520182; x=1714124982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMpzOFCFY/OFyCB78Iqov2ITRER3c7lueX7XaC40UJk=;
        b=X0WJmN8Z4X9FBuJ326ewqQchSu7cGBWYQrg3ZzBWGGg/w7C5H3Wc1EHyDS1usEsB9I
         9BbjxOWOrBw9l/TGnudE2pqpCzOA+pnW8aPkKmwxScb3OUZc0rTI7WMZWOasf9BRm0Gw
         FgTCMP9NojJ/nOnLbv7V/i1E8SlbRcC6zGdNj1DEjrwcmMx0W2nUUeg4K9uK4SMWqC9L
         mt6DE1Tq2se3ptedcuZiPBGc8mE67/zYGEC/wWInOT13/8Em/Q8XOB/HLMrjF8R+UcOu
         /u3Livq4CkqN+0Fz+hDRSZOJ3aLIV3H1fdTmlwJSDFVrSdcIiT2/m1JYqRcYoVNph/6I
         hgbA==
X-Forwarded-Encrypted: i=1; AJvYcCUgG3PCStoeng5r13pUdsiR41uAERvFk/HShC4rOPA1mGZRkSannUvHvb1tVN+cR3Jf0FnO20BO9eHA/CE7aSHkJ/JmSAzXiHPgdkI=
X-Gm-Message-State: AOJu0YzGESm5nVJJlpmVnoy2kNetguT+Ivhur5QwHh67peOQy4xu2mNO
	6rb6ecV4plL2DVvjDCWvcfDV6hIS+ynkx0htCw/ox3tdTkyTzuMzZJzYzo/3BA==
X-Google-Smtp-Source: AGHT+IEXhcUKUor0dxuV3thvzJo2y+QPxtJebfEt+tWOQcWOyhTJf9Fve6oWEuZlRhBFIInhoP8+Wg==
X-Received: by 2002:a05:620a:956:b0:78e:bd2f:1088 with SMTP id w22-20020a05620a095600b0078ebd2f1088mr2994401qkw.4.1713520182200;
        Fri, 19 Apr 2024 02:49:42 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:41 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:06 +0000
Subject: [PATCH v2 20/26] media: tegra-vde: Refactor timeout handling
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-20-2119e692309c@chromium.org>
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

Reorder the branches a bit, so cocci stops complaining about the code.

drivers/media/platform/nvidia/tegra-vde/h264.c:645:20-21: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nvidia/tegra-vde/h264.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index 204e474d57f7..cfea5572a1b8 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -633,7 +633,9 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 
 	timeout = wait_for_completion_interruptible_timeout(
 			&vde->decode_completion, msecs_to_jiffies(1000));
-	if (timeout == 0) {
+	if (timeout < 0) {
+		ret = timeout;
+	} else if (timeout == 0) {
 		bsev_ptr = tegra_vde_readl(vde, vde->bsev, 0x10);
 		macroblocks_nb = tegra_vde_readl(vde, vde->sxe, 0xC8) & 0x1FFF;
 		read_bytes = bsev_ptr ? bsev_ptr - vde->bitstream_data_addr : 0;
@@ -642,8 +644,6 @@ static int tegra_vde_decode_end(struct tegra_vde *vde)
 			read_bytes, macroblocks_nb);
 
 		ret = -EIO;
-	} else if (timeout < 0) {
-		ret = timeout;
 	} else {
 		ret = 0;
 	}

-- 
2.44.0.769.g3c40516874-goog

