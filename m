Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EF1161901
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209703; cv=none; b=ZdDUR8BLuHvEBVed6hMf812Xm9QFy0UhWyfq+7iO3WWCVyRuqQIvVKYoRfNgd7Z0h13bcIQnPuvhXwTxvWlBYlUL8hWjlZFPcZLK2pM5c9ItZ72dwUI769/5QU9YgaPA4br6y00XDoTn8exOoZkWAY9Oej0xMrTwCCDN54tHw4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209703; c=relaxed/simple;
	bh=z4PclDFur+vwHypm0cCW/dzU3Xu+onrV7HrMrh+lG0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUW2V7W66Kc5BuFzqRgqob9Q9nVVF0XRXTPTwtOT284OX2SpiQkHFcpAaEERz5SgR+Vx0mIVqQGHT93Q4UcJSk3ctO+Gi6LhmhPws5qSZaQcITNY4OcuJ0QvxmT9sTHFepep0YsNAGY27whJWIYG102RmA4Fp6Mgi1cHqjNWvtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DqbHWcPu; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DqbHWcPu"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78d777d7d1fso282209285a.1
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209697; x=1713814497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iRxS0Wfwa66zl/9FdFOMvCFtgSuuwnNLZrwXVx0B2s=;
        b=DqbHWcPudgXbV5rqyt0Jq160y0ubkuqh5LNrVOJcdO2eloQfX+II1f0JTZzaEHtaqv
         TtiOJUo7VrMcmiZHF4bwB9yOibEiAzxMRyTJ2amoMTDD3tB75C/Hd8o2xffzsmkyTOw3
         qUXqOstHE/lkHdfLJTKlryzL8AEkc/YY88RDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209697; x=1713814497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9iRxS0Wfwa66zl/9FdFOMvCFtgSuuwnNLZrwXVx0B2s=;
        b=XxbK60QpbJFACAd8MB2dphompM36HF4uM5Rg67l1aPslNuLFXNMI2Yh88gdovyZ3zd
         YG7HcvZCpwpzjm0o5qMfJMjsUsSWTFRFDfxSYuMpXWuuq2ec2hcpNlv6Up0fssTFvKse
         cIcjVl9U444PwNeXcF6rGNw47QNktoduhu2ZQKM0wvBq378VgZkytxLLldPu3jpHY76N
         0Okd7d3oTJjb/FPV8U6Eosmxo2Ca59GuzbI94lAgT87FB93s4UqSs1D0OvEz+xc1J4Co
         QyosCAqReHfDM9vUZEGvbwsqhBHk8dQpcQVlJ6b64GLbcG4trQheeCc+HOR16617lulY
         5Pcw==
X-Forwarded-Encrypted: i=1; AJvYcCVMvOIjKMIET8pIylS0vlPAdvA3CIo1r6Pidti0jTs2oNcg6Ilt9gDzXhligFHb0gWvPsQ1b3IxUxOYxiI7TZIKJl66H5wxRwFQQPE=
X-Gm-Message-State: AOJu0Yw+3DohqBjc0LCtig303lOxH+iqU8J+uvYITN9Mn9GWPvUKs+6/
	a80RT9pAgPDt3Wcjv3C0lblBYp+7IkmkVfhK943VCB3nQXRThqoxVq2h4KGS/g==
X-Google-Smtp-Source: AGHT+IGwiJ5/vTLqYTTLWbehOkrG3Z1CC3Ai73ckOtHPinOfOxtyAdhFhhrjbccK1nhZt1UUqJLF7A==
X-Received: by 2002:a37:e10a:0:b0:78e:d2a6:63e0 with SMTP id c10-20020a37e10a000000b0078ed2a663e0mr9260421qkm.4.1713209697430;
        Mon, 15 Apr 2024 12:34:57 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:43 +0000
Subject: [PATCH 26/35] media: venus: Refator return path
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-26-477afb23728b@chromium.org>
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

This is a nop, but let cocci now that this is not a good candidate for
min()

drivers/media/platform/qcom/venus/vdec.c:672:12-13: WARNING opportunity for min()
drivers/media/platform/qcom/venus/vdec.c:650:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 1dffeb7de76e..2bc7aecb35e5 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -647,7 +647,9 @@ static int vdec_pm_put(struct venus_inst *inst, bool autosuspend)
 
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static int vdec_pm_get_put(struct venus_inst *inst)
@@ -669,7 +671,9 @@ static int vdec_pm_get_put(struct venus_inst *inst)
 error:
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 static void vdec_pm_touch(struct venus_inst *inst)

-- 
2.44.0.683.g7961c838ac-goog

