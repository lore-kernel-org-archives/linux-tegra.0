Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457CC1635AA
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209704; cv=none; b=EEH6VfmXBWmX6WB+94gY7bflMS52/EZnaDVN9OnocPoy5rdTXc+3bFFGlLjmR+AVxP3FsdlwAsSnkkyaQ+PqJKcVOHE2kwboBsxW7HHAsIPUUT277C1Wddo5ssIhhJdlc9Scu1tJiDStWlR/EEWxsRTp//f9DmPw9nC/OYmvUVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209704; c=relaxed/simple;
	bh=As2d8puekv3wE81Lbh8pk0aXTZ4wR0q1+eriDu5asDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiOo1P+nn0NgwXnqfU2ZQjPSw/QE1pw9yU7ZLU+rxyxWdmL0zXU0utaSvf05j8FeE0YlW5YlzrbHn9oJ1DWzLi9PvdxSOMLUSAH0kjnGGObrFPVI2GwrAXmw8n0puDOvLA9jq00fyESkw2vpVEJq79sRzvVnWR3Fju9C+8i4ROM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bPga3VYY; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bPga3VYY"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c61486d3fcso2133140b6e.2
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209699; x=1713814499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mj+/6N0GPAfvwkpBReOqoC7KAQaGgvQV6dmd/kYlEN8=;
        b=bPga3VYYQw063FYKul6YD4eTUmZWCCY5ZUdwfw1E6NdvIzHf/djDUQcdYByjL6b4YG
         YWMTTmVH6b7t33hrqhkuA8HXaHdiJ8zPsDMPocraVwS2P12jEFEYCpDsOIUWjddfLLD4
         L+FQ02dy550HTIpo2KGgkFok9XBIt4tyDHGbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209699; x=1713814499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mj+/6N0GPAfvwkpBReOqoC7KAQaGgvQV6dmd/kYlEN8=;
        b=sM6ANkbblcuHIvuMVvlxYoey9FOO+hlWpUTJ1zqmjLBx2S3XZ2C5nWUY+JnBMWXRP0
         15rbUuYiQHaG0Iw+1q+ZdQ+iMO15ZTFl7MKrA6yFZXsAwABqwCb/yk06Tal3J+rIexu4
         wKbm1l/BFjyCvX+UMaOhY73ugmIVD4bzcvmvbvvQLxCgrmqzyjMeXR0z4Z3ITj3p0jZz
         3o+gfZjP5imQ4Ui8WnbNTB6TaSM3KGkZkBE9kTuPXPxSSf1o+Lt0ckyr4jBsjlCsR7LL
         CxL1A72eS3GyxwlxMlfMo+BbQN1WzBrCcyI8D+9g2n26VEzLbCSUuvZ6G2u/HEKTe6AU
         dX1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYaIdi98z7ZCYB0WaJE8BAWH4WFgAU0ZP6UDITgBALtKKvBmbUvGHOoL9F9RF5aoS4mDVpMcnDTGetM6ezONGoB/FK0/5mvl+Twdo=
X-Gm-Message-State: AOJu0YxsszY23p1pr8u2CYjd7Gh3fjanySrvMJicxnUGxAs7vsVgCqvN
	JsvEyXaypk1xXfvgZcCeSNfAEylRYExNl/zbpLmtcwbsBDSErOTpkPMjWOHHcQ==
X-Google-Smtp-Source: AGHT+IFB7ej7jQ6Y7TTKmDCBXS4WSfTxH8KcZpQzoboVm109oqWmXInnRELaaHMlCW17SN5elKNPwg==
X-Received: by 2002:a54:480c:0:b0:3c7:c12:e2fb with SMTP id j12-20020a54480c000000b003c70c12e2fbmr5150205oij.56.1713209699409;
        Mon, 15 Apr 2024 12:34:59 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:59 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:45 +0000
Subject: [PATCH 28/35] media: usb: cx231xx: Refator return path
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-28-477afb23728b@chromium.org>
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

rivers/media/usb/cx231xx/cx231xx-video.c:1282:12-13: WARNING opportunity for min()
drivers/media/usb/cx231xx/cx231xx-video.c:1328:12-13: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/cx231xx/cx231xx-video.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 8f347bbeeb32..bbe207d72427 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1279,7 +1279,10 @@ int cx231xx_g_register(struct file *file, void *priv,
 	default:
 		return -EINVAL;
 	}
-	return ret < 0 ? ret : 0;
+
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 
 int cx231xx_s_register(struct file *file, void *priv,
@@ -1325,7 +1328,10 @@ int cx231xx_s_register(struct file *file, void *priv,
 	default:
 		return -EINVAL;
 	}
-	return ret < 0 ? ret : 0;
+
+	if (ret < 0)
+		return ret;
+	return 0;
 }
 #endif
 

-- 
2.44.0.683.g7961c838ac-goog

