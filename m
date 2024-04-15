Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0766715664F
	for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 19:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209670; cv=none; b=T4Q9rXJTf4fMSFLwAu2A5rVwk+Jirn85q6/u14IMk+Rc2RTZRI9vN7kCYi5x0+AbMjXOvZ6+2/noG3Sss5xwzmWPyIKZVD3psAPRdokshA402Sr4pTEeqaVIVMGmwoW7wI0MWkSfNX6oKJeGYIPMvtQNbdX6Wt291FrsxKtQlTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209670; c=relaxed/simple;
	bh=nJaDXaC2UVv5JFYI9MrsyQjDUNAmDoZ6Ny+NoEoYLTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CG/b0TYLJMN0rSpco6Xiiy7WLhHlwjNv5KNWANkvAB69mMjtFM4PLYbQ08TNJ9h5vucVSnFjkzm6ZghzB+jKACs4drR0dhE17HtVUKhBF3BQo8HnSMFbZlFG+HtIE9jU9RY+oeBwYSMwEDOPAh4EnkUVpUTVRiV99Q+nZEJhOPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ekCQS+or; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ekCQS+or"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c38eced701so1409987b6e.1
        for <linux-tegra@vger.kernel.org>; Mon, 15 Apr 2024 12:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209668; x=1713814468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+qS5Z4vkKN1UceEhIkP1myjPLSe7r+1w4SAg1mZwEM=;
        b=ekCQS+or2wkAbKGn4PNwB6LXkb8bPeivno6eqgraR/SenJuMd+oqaAeKu4Gdxm4GrM
         xYe973uYC0yliHeHbE4sNDl0hEEUOTYfDCEDDyQd6jBd8xzVbntSawRQCJ09lSBmn7vZ
         3qiNR6TiSZZpLM+C2+gEetvfvU0KBX9W4ugMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209668; x=1713814468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+qS5Z4vkKN1UceEhIkP1myjPLSe7r+1w4SAg1mZwEM=;
        b=ONW4jQUs6cvwjKbaD88L9AsOzUzKSeGu5aK2aQgHXCthPq2QapxiF0CdOGCAqtY2WC
         TODbHYh+MeuwaVg+8P1cRVocUFK3mfbJRJ0C4UmyqIPBIVWWEqy7wJ1fO87PYHMtEn+7
         x2gQQ7SxH5zfLmD/KoAlKpwA3V9uX6rF841MK3Rqoojt01t6Btyk4NjKR6oyMFc2v9Mr
         gcMjQ9ipakiXFIbjinug4oA3e+UlLZHFO4FYMkCPTyO2AQqwRZlPtbovpqnuB15Qafvc
         I5KOPDeOpYNC2hYLMcCYWeQUX5dTtFRf35y9UeZMRPD8FDKk4vScJPqjDHFtKVVZ3tDp
         U1CA==
X-Forwarded-Encrypted: i=1; AJvYcCUBegv0ESTmbbSgsVjr9XHsTtS3u8hXpobLAn6AJkP55ai386W1CD4foYPLB29ZXT26PolUbSgOoRZV+J+m7Xxf7svWZWD4cJzTjTA=
X-Gm-Message-State: AOJu0YyRjUqWZw1WS3zwRUV68ZqmbpNcnNRHC7Nhr/Z2UjELkHsuBYGh
	YlzBOruU487b6tpxrBxZ39BfhDo1RBURoQxvzdGAZZ+qRZ/Azpqsa05QEUznRA==
X-Google-Smtp-Source: AGHT+IGdtkSiZhnfiSTfKFrIX7aC7mQfEfNuaLQ9aOCusHbpbm/GtxuTWZQaZZkHNYhX7JRsmp7ZXg==
X-Received: by 2002:a05:6808:4084:b0:3c5:f5a0:3b40 with SMTP id db4-20020a056808408400b003c5f5a03b40mr11232302oib.58.1713209668180;
        Mon, 15 Apr 2024 12:34:28 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:18 +0000
Subject: [PATCH 01/35] media: pci: mgb4: Refactor struct resources
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-1-477afb23728b@chromium.org>
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

The struct resource end field is inclusive not exclusive, this is, the
size is (end - start) +1.

Update the definitions and use the generic resource_size() function.

Fixes cocci check:
drivers/media/pci/mgb4/mgb4_regs.c:13:22-25: WARNING: Suspicious code. resource_size is maybe missing with res

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
2.44.0.683.g7961c838ac-goog

