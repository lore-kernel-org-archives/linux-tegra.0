Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0763C81725
	for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 15:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403086; cv=none; b=UeZbWqiWqpvgPjz6tLhBJXM2yMUOF7KvARBpBpuqUWmYAVfpeBht0WKG57dSduf1O0loqtEooqYlbkvJqxAmjliZohRufaZ1FJdspNGJarnd+ypFQToOrykkZzUECdUzD2a5qndPqgXJwgSJwkuRanvA8RUBkAqUInR/DvQTuFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403086; c=relaxed/simple;
	bh=eXbttcpUuvi0IptVhr7LEXzauMF/5khZjI9wxngZz54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnT6l6+KzvYUFOnIhOnjy2j3Wz28ERgek6m0yu1y6okyzPMQC6zMQSwNzfyppWzZPtgP9F97COILi2+9amZ9ir0ZA9iEGpCAReIh3LCKInswrS51nujKS/+XolbwLwZ1JN/hOjKQ06Yzz8gFVkyR11jdx2tM2RxPxjRoMgBD/Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E7pF7Kj7; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E7pF7Kj7"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-790c36dcee9so178325785a.2
        for <linux-tegra@vger.kernel.org>; Mon, 29 Apr 2024 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403084; x=1715007884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX0Nt2WjhKwJC/tEnFmYRvlB1MfFk2LmbDG81TIdFVM=;
        b=E7pF7Kj7YHu7v0KeWbK7tlOVH/XNvfCMiesa8wWsDzyV7Dh4J/9toLXFKozDKuCjnv
         vYzjgitkWDKo1a/7agy0dXwaejfdgFHgMQTOrWKQftefM3pRxBkPqfTyIZUz66NFALGT
         Q398n/3jOAdyD2V+AxG2HMw972ewx2mu1sgVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403084; x=1715007884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX0Nt2WjhKwJC/tEnFmYRvlB1MfFk2LmbDG81TIdFVM=;
        b=pDOjCAtVdXIsxuZJAYRnh5gtqxWvuZiq7FLD8il7bK5cSE8yNJ94X71Jb27gaGRALp
         UuFbw05UsUL7bZgDKjj2zyuCcjkuatwDfLvvIu6rzUGCjP3ASJHLkmXMu6MspEPByHny
         DF1sMdO2Eq5GqJVVBq2V3puKflhMcY7PKALlp41SNda4aPKkmVxexsOA/We/x46bR3FU
         h/cLLyGzLLReSkSQv9g70t7qv8G5AC83Y4VgU1NymWokcEa3bg8/MX3jtx1cKZdos62a
         21K3xD22d/vhqfHVb3fnpLoq4EyZn2amj5J0zCk+rQ5uL37RDujbK78m69gX20yMme9g
         jKGw==
X-Forwarded-Encrypted: i=1; AJvYcCVKCozq9djZ2pXGFvTFE3IU7QxIkAaZ6RPl4BW5k3vX8b40IsL0yMr5wtOpslQJ72W8vXyD1iuP6hvH9hrTNhjj6MuAL/FcvKx2cNo=
X-Gm-Message-State: AOJu0YzgDoKO5D7RjNebY2UlkYsGNZTeNFuOy5ERcVlQ4RhpbqMxF1Yp
	qleYR7oCABIbvNFTB7QbO6omr/QJiP9+81ZSp8Jc1xtqhxbXMYGtlym+lRQmmQ==
X-Google-Smtp-Source: AGHT+IHWuK1oddmDBavr6+ksLu5/g3HWffeblwIQsTBH58X6jA8tyFIvmLIj97Bf7YP3AKSemxlfBQ==
X-Received: by 2002:a05:620a:4eb:b0:790:8e96:7841 with SMTP id b11-20020a05620a04eb00b007908e967841mr10130143qkh.60.1714403083799;
        Mon, 29 Apr 2024 08:04:43 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:40 +0000
Subject: [PATCH v3 01/26] media: pci: mgb4: Refactor struct resources
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240429-fix-cocci-v3-1-3c4865f5a4b0@chromium.org>
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

The struct resource end field signifies the end address not the
relative offset from the start field i.e size == (end - start) + 1.

Amend the .end field to specify the end address not the relative size
from the offset as is currently given.

Fixes cocci check:
drivers/media/pci/mgb4/mgb4_regs.c:13:22-25: WARNING: Suspicious code. resource_size is maybe missing with res

Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/mgb4/mgb4_core.c | 4 ++--
 drivers/media/pci/mgb4/mgb4_regs.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index 9bcf10a77fd3..60498a5abebf 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -493,13 +493,13 @@ static int mgb4_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct mgb4_dev *mgbdev;
 	struct resource video = {
 		.start	= 0x0,
-		.end	= 0x100,
+		.end	= 0xff,
 		.flags	= IORESOURCE_MEM,
 		.name	= "mgb4-video",
 	};
 	struct resource cmt = {
 		.start	= 0x1000,
-		.end	= 0x1800,
+		.end	= 0x17ff,
 		.flags	= IORESOURCE_MEM,
 		.name	= "mgb4-cmt",
 	};
diff --git a/drivers/media/pci/mgb4/mgb4_regs.c b/drivers/media/pci/mgb4/mgb4_regs.c
index 53d4e4503a74..31befd722d72 100644
--- a/drivers/media/pci/mgb4/mgb4_regs.c
+++ b/drivers/media/pci/mgb4/mgb4_regs.c
@@ -10,7 +10,7 @@
 int mgb4_regs_map(struct resource *res, struct mgb4_regs *regs)
 {
 	regs->mapbase = res->start;
-	regs->mapsize = res->end - res->start;
+	regs->mapsize = resource_size(res);
 
 	if (!request_mem_region(regs->mapbase, regs->mapsize, res->name))
 		return -EINVAL;

-- 
2.44.0.769.g3c40516874-goog

