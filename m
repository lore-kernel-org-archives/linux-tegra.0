Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85EC81AD2
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403119; cv=none; b=Oj0i+j8UImdrvDdIXYIRsIFLoLz6MvfldpjRStpQOwkWjLeaS/Uk9FBN8T57lXgVaRPHetK1RrmaPwjk0haCtwpazt19zYPJK1nudWFFAPEksJq9LCiz6ewmTDimk5TS0DKFNR+su5rc7JQzTg68a7Ed6rv4Ux60xRECStbx2IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403119; c=relaxed/simple;
	bh=3yiY68g3x2bHjb9WIW4k3fHYf6vWH8Dh8hY3tkaUKhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=crpoQd5NpjSC1UGdbgE6cXbRjx75aJkItMbaXiyS6zwL4y4xBaDTt26Vf2Eq10g+VmqLaaxRlEzoqZ/3Ak+N2E2Ward9iawYgA+u7JbVscVdL27ukxc+HKFM9sRT0I0yrmDC+JCdbRK7LeW9AU73n0bmFprOh5mYKBVMh/BxhGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KcSm7ATs; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KcSm7ATs"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c74a75d9adso3131442b6e.0
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403108; x=1715007908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSE1LZ8RJP6sIAmkq+8umDfF5CuS0FK0HNlyLUmOHag=;
        b=KcSm7ATsj1phhUgDGJ8dmSPeaakWlDfuP1H4O7B4FBhOf/WDGM4OxDHO4gakJ1qYgx
         2L8y16zTcYm0nAIns7ArXkW/pPpS7AZxw+rOpCYAxTX4B3F9O5CGZNfpzAGCFIgCSKgJ
         TZJ8S4ntmjYQEoE1pzQpXnWxs3J3TVTfw0LCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403108; x=1715007908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSE1LZ8RJP6sIAmkq+8umDfF5CuS0FK0HNlyLUmOHag=;
        b=j94pWtTLPJVbEITfADD2JrnUvy9aN5/HUwfMFumlDpTHKbvsDcuqpxoISGUGdx0ABg
         UKRTDAOzjfaBi/tme3QH8ue6bzoYvBFoJh+/7+CR/qc5/EQ/tCOiYUMCivlhVKwvmyOF
         48Zp4xJapq2CKI/l4UB3p0kqsc9cFbztQqpw5DLU/5XG5dqyWlPqsP7MP3ZEFKZw41xV
         gR9PgNGj11GUzUFVAqNfwisTbLOqnwIIDqDZ9WUgD1jdfLQOHDbwkoCUqYBsw/AN+bTS
         32ij/rWb/kpQr/IUhKFokuw7EX5RIB+oPxzk6k7FJlh2VzCSGf0d66E6vXmcWQ99kdJK
         sCNw==
X-Forwarded-Encrypted: i=1; AJvYcCXIc8mWQBlyPa/ZsuR38jmkbQdorxJ41OG97fI9oNji/bQ0yhl10gLr6qajxy7uKOA7LI3OR+XIV1ez8ftnvmoXLmHGQBsXQi7KODU=
X-Gm-Message-State: AOJu0YyIjv1jhG/c1J677EkeTFhdGDgyCAHCGQuHm90uY83XY30a/CG6
	dDhnCR6Y27tR9ZTsG0egwqYCRW+QEdszeAM1nYejdSoe6rgt01HBeQhVDcL++A==
X-Google-Smtp-Source: AGHT+IH4U39JmXtitBebyQXf3RiEBhrVCarSNwVpuxhIdD3y/YgatSZWK47F6u8fGZIDpkmTeNgcdg==
X-Received: by 2002:a05:6870:a70e:b0:22a:9c40:3782 with SMTP id g14-20020a056870a70e00b0022a9c403782mr12043126oam.11.1714403107649;
        Mon, 29 Apr 2024 08:05:07 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:05:02 +0000
Subject: [PATCH v3 23/26] media: venus: vdec: Make the range of
 us_per_frame explicit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-23-3c4865f5a4b0@chromium.org>
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

Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
number. Make that explicit.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29130a9441e7..2b2874aedb2d 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -464,7 +464,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_captureparm *cap = &a->parm.capture;
 	struct v4l2_fract *timeperframe = &cap->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -484,10 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
-	inst->fps = fps;
+	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
 	inst->timeperframe = *timeperframe;
 
 	return 0;

-- 
2.44.0.769.g3c40516874-goog

