Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230D586642
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403097; cv=none; b=eEjKmwKj5TbUdKZWNczp4qVNgXPj28yKBaUOu1+DNk7k0y9RR0iYS7Axaod42GiTx1UEFzIIPhYDcn2hdMy8g8G9y7qAe9ABMPqDX1MeMPK5PHGAOMUkS+F2+HJel/n9QYN0i8AY3jSQGsQPrqT12RxLdNXNjTos6MZvOwNyEDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403097; c=relaxed/simple;
	bh=+AXbzIt1DCOyX+j9nTM1S5LGWAW6l5Ne8tHYdxY2P08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4mBTmx9djiUXivvoPVHo8GpfxcdwC0InuI0j8IDN0oakP5lO1QQJJv3LpCQb9kLaD5ZeE4oiqMuf01dtQWZNAq6HEVgY3N+qutZHO85Luo4t1kSeNU0SeB9L6wuBnF25XSUdgOMjBgH9kIRbUaOHFKc1yrLdbWTgJgmJqogj0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BIAxj/zw; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BIAxj/zw"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78f04924a96so385476185a.0
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 08:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403094; x=1715007894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5MK517M661jXeUTMXVPJlov9z4l8/dISyr2IlNuzMY=;
        b=BIAxj/zw4RFm71Y8xK9EA4WdP73OlLbn/YYMPCt45a3qsROesH8V93UILh1SXZDkxe
         Jn28aJYn68lwplw6t4ndzgKJhRznPsRhzafl7XDysx0VMeSgx5ilckl/GlXSans+O8F7
         WDPzw3ViJoJwQWXczB5zZTkUPWXG2oHXiZOxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403094; x=1715007894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5MK517M661jXeUTMXVPJlov9z4l8/dISyr2IlNuzMY=;
        b=oY9n9SaBJcNFIkDdmUZtEZF7vdQYTK6IfTDVyq6z7563/gnbTOCYjzwvb8J1oVxIzi
         +Ecbn1rK9jDdloumNj1a13OdreV+8S9fZUGwb/UIuTFsG4d+DGP+abz137fj/cgunKwn
         c6xvGAHeqB0Yw1G3CBstVDlID5tr/MfObqsPtPa6OacPy6mh6iM1cQqpiYL89z+1wlG7
         xbBscIJnqwO5655DcfGmvdmG4mxsjFpqnIjL2spH1pznZCgM6NQvUJZ/Gvk8oGT68/Rr
         30oY+5ASBp4hQ15XV9dAW0Z1XtntOj12kCpF1iMT8M4BWVNb6k6RnJLHzNVdhQwVPtrS
         FHTA==
X-Forwarded-Encrypted: i=1; AJvYcCUj9XHl9eqORGfHaYCGIfmriYmIBMpuVyH+ZH2PkCHHrKbxutY5J51Iv6PpsBklMfvLS3dof00IqIdDwNwiYWmip+wDhLlpES2nrNM=
X-Gm-Message-State: AOJu0Yyy8ErqWT7wbvbh82DeDSJSIB/JJ+T7/Z4utFXwpyAOi84drpFu
	0MikxkqPZpSUvhHx6pvryvSENVD1zrJmg5LFgvm9cFxNKMNrlNeUmpj8V3qO2w==
X-Google-Smtp-Source: AGHT+IHd6ddxHUwcI+GO63TKnOLl3i4M+Xxc5o4/p3XMVcglh0UUR3rtSUQc8AjhdVbPbvMA6ElG+g==
X-Received: by 2002:a37:de19:0:b0:790:9eb8:b6ec with SMTP id h25-20020a37de19000000b007909eb8b6ecmr9509923qkj.30.1714403093917;
        Mon, 29 Apr 2024 08:04:53 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:53 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:49 +0000
Subject: [PATCH v3 10/26] staging: media: tegra-video: Use swap macro
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-10-3c4865f5a4b0@chromium.org>
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

Makes the code simpler and cocci happier:

drivers/staging/media/tegra-video/tegra20.c:324:44-45: WARNING opportunity for swap()

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/tegra-video/tegra20.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 630e2ff987a3..7b8f8f810b35 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -317,13 +317,8 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 		chan->addr_offset_v = chan->addr_offset_u + stride * height / 4;
 
 		/* For YVU420, we swap the locations of the U and V planes. */
-		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420) {
-			unsigned long temp;
-
-			temp = chan->addr_offset_u;
-			chan->addr_offset_u = chan->addr_offset_v;
-			chan->addr_offset_v = temp;
-		}
+		if (chan->format.pixelformat == V4L2_PIX_FMT_YVU420)
+			swap(chan->addr_offset_u, chan->addr_offset_v);
 
 		chan->start_offset_u = chan->addr_offset_u;
 		chan->start_offset_v = chan->addr_offset_v;

-- 
2.44.0.769.g3c40516874-goog

