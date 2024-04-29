Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E4683CAE
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 15:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403091; cv=none; b=GP0GsZiY/4iXTpSnIr6SdRvOiFRwvxLI6wIbqPOUm8f7DcDt+mZIJmTEBnKkADCz0zNetIdCZg/JqicDPug+1/N/KJvQVhrw+AmH+nh1QqwtzLJabV1xQUf7+2yQk40lnMbLrz4ozmEDwuXWMw+nqGgc5w65IeNelxd9Z+iDozo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403091; c=relaxed/simple;
	bh=tgP7330qO1mr+C8ledXxDdnPOgFMNNMKFyNIH7SkETU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LdfhypO7TFu3UTE9J5HqvcxLp5bomdxE5khRQkBOa3Nr86ogVHcl51qeg5+NSz6RntRhPdhboouElUsiBtEmSw6A/AdyJQ4s7/Fq/4Hv0lYr+1DZ+LeGNJGCibp3BwNtpo39j2IvAIDlsbIJ/YnDMHoueYHTlN+igFhMtZ24oRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aCEzwoN2; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aCEzwoN2"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-790fb2b780dso64325785a.0
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403088; x=1715007888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/QHDINTXxaHfJymmPQd1ntNOyaEtGJ2b8ypDUwyIXI=;
        b=aCEzwoN2lLOOuHDMlOMcjAjcy6DkzX0/00FZ+9v4Pt2qspb0SjYWWeKUIuhCvqk8mP
         /Mflk046stnBv7aIJjg0fd8SX29apqCSZkGAk4KVDGezdIMd4oXOV/HFOMTnWX7YbUsF
         p7yO7meFeXHjYZPL18R0oANNip4C4anFA4xGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403088; x=1715007888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/QHDINTXxaHfJymmPQd1ntNOyaEtGJ2b8ypDUwyIXI=;
        b=xQ0gHY+szUI3ULu9fTUPQstMKr2RERp3o0JaNqTTUVVXnGPyRfxLmaHBuR+ieYKQIV
         WUCJnn0Y/bErG+J8zQh4ZptMwoO/lFr+4PW75T9V59rw0y5MJq6i/8WK34Tte4DosBuF
         JjqSFawNM5LJT+7nZtRK9MxXigYVh6CjlLOa3mUwAvlv+JlEQIJGjIp/0U4KrPFGtU9Q
         gjCCkoCzo1ZniREyFtnHRlb+nydHA/+vQBxC6GsdRuiQ30CrVPemPHEYESG+x2xbviPi
         fUB3CCYKAc7zcdemZo0gzjtrqXsz8BzHDfSTnqSJfX0olPHZIpx2KCJZEc26G8cwiw/X
         cARQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwGHS6ztD1TUU0Juv/2HAAdWdOdTDOeVmJPXa+UcPpw4lAWQa36sxzT3gLQbYVSiCmP4vBU1vMftRVKxbtO8xbIEGuK+mVzeGSQk8=
X-Gm-Message-State: AOJu0YyEWmUNLUo9FCoUJzXk8gQ89UstMdfNtwEtI3Hm6DH/CIgsZ9Uh
	a8eU+3tcRPgv6QvnIxJ007rsQJ5Kh4BBRTN1wvfBIiCVWcWIXWLN9kxEAzn1Vw==
X-Google-Smtp-Source: AGHT+IEZLuGKR7d7W/XG/sq8LQdtDnaq4FWL5zvJstwztGqQFStkjBLrDGAeQqjGLBaD6vVb0xh5nw==
X-Received: by 2002:a05:620a:21d8:b0:790:81e5:5f30 with SMTP id h24-20020a05620a21d800b0079081e55f30mr12924542qka.70.1714403088208;
        Mon, 29 Apr 2024 08:04:48 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:44 +0000
Subject: [PATCH v3 05/26] media: go7007: Use min and max macros
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-5-3c4865f5a4b0@chromium.org>
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

Replace ternary inline selection of f1 and f2 min max values with min()
and max() helper functions for the sake of readability and to make
coccinelle happier

drivers/media/usb/go7007/go7007-fw.c:1292:14-15: WARNING opportunity for max()
drivers/media/usb/go7007/go7007-fw.c:1293:14-15: WARNING opportunity for min()

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/go7007/go7007-fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-fw.c b/drivers/media/usb/go7007/go7007-fw.c
index 018019ba47d4..86ce593e0c54 100644
--- a/drivers/media/usb/go7007/go7007-fw.c
+++ b/drivers/media/usb/go7007/go7007-fw.c
@@ -1289,8 +1289,8 @@ static int avsync_to_package(struct go7007 *go, __le16 *code, int space)
 		0xbf99,		(u16)((-adjratio) >> 16),
 		0xbf92,		0,
 		0xbf93,		0,
-		0xbff4,		f1 > f2 ? f1 : f2,
-		0xbff5,		f1 < f2 ? f1 : f2,
+		0xbff4,		max(f1, f2),
+		0xbff5,		min(f1, f2),
 		0xbff6,		f1 < f2 ? ratio : ratio + 1,
 		0xbff7,		f1 > f2 ? ratio : ratio + 1,
 		0xbff8,		0,

-- 
2.44.0.769.g3c40516874-goog

