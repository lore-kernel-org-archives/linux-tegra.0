Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200438;
	b=FbQSzASeVK9rcnObAObQivz7vv7CT9NlgupKt0/QYwVVDbvfjqToolqRPUaoh2UAiCWs
	 Wmi3OJWDOiBWVVNYxvmMrvQy01f0CGrEKnQ25AZL+1/FVIE78qJwRifJNUaJHTUgwqjYY
	 ZrW6IZKls17bduH7dH1xHhcm+ipM/5YYnPBOjMYCmXRFAiNI6PO1GyTKzK0AWrqJakAmR
	 09F0AnRmhWl+7btYmiJkmYDjy/Z+A3r7fwtNiMnm1EwWvjKBsZQErfqYxzdG7t5s4WRyH
	 XaA6VCbNCHS4kt9ZqkWNXhfSjcjOC3o0u+N3bIjjXrW4t3OEfs81Vll0gmDp/cJkHdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=oESDww53zGSoGH4IO1bUrrqGEhAQT6H46eRyViPIMYQ=;
	b=y1AeI7hjM2UKOYRbml4RCgvjALN/KxZOPGnS/YUM8ty+r+zSLhFXKXPhbrh65olmCNlC
	 YyV9CdcAYyyHVF7h+cFygvtCEv3ElIc6imqnMtda/n0QPuzBywVcOaZ7CoPpne6JvGa7S
	 nEQFn7P4KSMzAvaIMEH7pMR95hns2yPPofCtHe9wSCxlkpUJPkE6CNzEfLI4PX2Fxr/81
	 2jYBT/jX1GgNn8epHB/23x3AyeNyd+9s04kBH0J43kmyDGsJcrriCA1coBO7ssjErwod4
	 +BZoYIGWJAAieUZDu3FkCtfH/QJL2AHIKIt0kAQcw3IFpnkOWNxvCyIXxORYw7x5lzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwNoimSt;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA573606A322
	for <linux-tegra@vger.kernel.org>; Mon,  9 Nov 2026 05:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA573606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwNoimSt
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-843a4ca671eso160104a34.2
        for <linux-tegra@vger.kernel.org>; Sun, 08 Nov 2026 21:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200436; x=1794805236; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oESDww53zGSoGH4IO1bUrrqGEhAQT6H46eRyViPIMYQ=;
        b=UwNoimStSSPQTdJ+XmanVE386Z3IgzT3eWxbLpFXXMkNjf/noTv8mxVn7eyG3MYHAz
         bNTT0kEnP6BvRx4sao4ayQdh7/I/3dMVoLK33SNaPiF5n049eeiw+jDEmWU/C/ixw0zf
         bN/1GckfHsze3jyUtV+I/NrY0qcwBqZ+xGorxjWeJfIMXS+mgJVJNPXjlo810Y8Ipaas
         FLalFKze3VMLEMvltQ91D2thIlkLoMhIG/+rUYOTpQL8/j2vE3BiupnSa0aNn+e8eEcL
         qv/1lpNVoICG5mAElMpPmO/eMKVyRzYLuZ5zXxUaKSbJIxrVO/MQhiiS/MaTAY/vD/s1
         S91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200436; x=1794805236;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oESDww53zGSoGH4IO1bUrrqGEhAQT6H46eRyViPIMYQ=;
        b=P4XciU5IjjUHh4fG7ag3Nm2i1usHX+WD4yxnf/i0JdapsFzL24VwSMsbLXtPXL/d/H
         4Limpj59woHiRWdLzMV3KJtfwWV7Ce7z88ns/EdO2dqfyZIxcNWYNARY41Voo5C4dnHk
         aKa1VTL5495RmNDOhRDaJS7Yw4PrKpsEBYE/DTPT9agSVutfIuhmYsqXGkAK8YizAzUQ
         T85DO82foDBaxPxMDvZ4p/IGHAFRLy+n3qgK8jcHCy1PK1ybfcxbpiNB4dNZUQdLvm4n
         caAaSVB5zr5rX7/jK9TGCWd/xD0WqgF+MFnZ5xP2GLD9aSc+twSUwGWfhbd0dQmSjw87
         8zWg==
X-Forwarded-Encrypted: i=1; AL+hErEN/pZwtOI4QIcG+QaAGk7Nit9719ecC2ly2C11AfFjc+bLnm7BH9izBLY7NiEmvEu/zOJFuEztl4SZfg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9QIiZB7k8YKKAIdXbnjd0aHrX/VYPjlt67pBxB5DZoN66RZEA4
	ut21T3NkNnlB4DHIPTxBQCss++dWLcEcnucjp72GF+pirOSz1hJJHHOS
X-Gm-Gg: AYBFou15Wa8LVpQIO5Gbl9lZKjfk5hiwdWojRISiqhb1yUO1dNymu+ir+kklX3UgMjk
	XBfH8sCFwbdbZ/FYsMOl0tpqgCzNML6tSAp2mJVIzaVjoxfnUjuChvSpq7xD2HBO5gu8RRG9gKc
	Ddtg7e7Z7uthiK8//lYCfHUtIKv28/gifNEZ//xGrYYzX94pUdHkIo6fca9vG1OauCwbDhonvGL
	JUUCuCfIOsvjyg8WrEyS0bnDSgAhICrACdbwrnnao0hXVbBAx6ECwa1T5BXitESlCNBujWBXm1p
	aVZIiuVGY/WHU8mycD1kyl5RY+WUp407dqgcCrw3S8o3bDQ5qAQtMzOXrclp9B/icICaZRgAtew
	bLkg3rsx1JGlGOlymUvdryRwtmQk0KTecdcSte26yBJs9nXPTCbrSZKUMZK8tOK9vBR5yj1+uFS
	e+WkCSbvadT4APuPJVOPDI/vxK1Jd+hJB/gupUyk6U8nr0mrzPdniRGxAh/MWI2MR4uJlpTNZPL
	Fm0uuD/o2lf/hmaAxxMjtEKywwtpwnuBiVkxXBpBVEBVWlxGDJsGZsNqv0e1O+r+uuVLdITdtCu
	6YuNt9W0XQhyaTwXaFUm/swvWuaDZjDK9eadIvtgl8QXQzI+2LdWqD5bWFJsds6VLCTyWGu3gue
	iyu51giW3rp41E3hQE0JWKWK5tfEKcGPvbumgMgymctCRwiGMGV3GiBI53DmQJxYql0Oy+a0OMN
	6AKXvgtW2Q2rosTOXoqI4i+Baf1GB9JdaUybzhuzj/Epqo/TBySYQ=
X-Received: by 2002:a05:6830:b13:b0:81c:dbd7:65dc with SMTP id 46e09a7af769-85f50783fccmr2360049a34.7.1794200436306;
        Sun, 08 Nov 2026 21:00:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb2be33sm2953090a34.13.2026.11.08.21.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:00:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 22:00:32 -0700
Subject: [PATCH] dmaengine: tegra: only advertise supported pause
 operations
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-tegra186-dma-pause-caps-v1-v1-1-9cc9b17a033d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ7CIBBEf6Xh7EZAJY2/YjwssNI1KRKgjUnTf
 xfs8U1m3myiUGYq4j5sItPKhT+xgToNwk0YAwH7xkJLbZSSI5TFzlyhUsioRgN+Rki4FAKHqcC
 qwJirVxct/U1q0Twp04u//4/H8+AmeZOrXdwbFtvcZoxu6lFTUgwc6Xzs9v0Hy5/Ip6cAAAA=
X-Change-ID: 20261108-submit-tegra186-dma-pause-caps-v1-664d1320d502
To: Laxman Dewangan <ldewangan@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Pavan Kunapuli <pkunapuli@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Rajesh Gumasta <rgumasta@nvidia.com>, 
 Thierry Reding <treding@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>, 
 dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Tegra186 does not support pausing a channel, but the driver installs
device_pause and device_resume for every variant. Both callbacks return
-ENOSYS on Tegra186.

dma_get_slave_caps() derives cmd_pause and cmd_resume from the presence
of these callbacks. Clients such as generic 8250 therefore accept RX DMA
channels that cannot satisfy their pause requirement. A receive timeout
then reaches an unsupported pause operation instead of being excluded
when the channel capabilities are checked.

Only install the pause and resume callbacks when the matched chip data
advertises hardware support. Keep them available on Tegra194 and later.

Fixes: ee17028009d4 ("dmaengine: tegra: Add tegra gpcdma driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/tegra186-gpc-dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index e76c58f213d8..72266f490e8a 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -1518,8 +1518,10 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
 	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
 	tdma->dma_dev.device_issue_pending = tegra_dma_issue_pending;
-	tdma->dma_dev.device_pause = tegra_dma_device_pause;
-	tdma->dma_dev.device_resume = tegra_dma_device_resume;
+	if (cdata->hw_support_pause) {
+		tdma->dma_dev.device_pause = tegra_dma_device_pause;
+		tdma->dma_dev.device_resume = tegra_dma_device_resume;
+	}
 	tdma->dma_dev.device_synchronize = tegra_dma_chan_synchronize;
 	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-tegra186-dma-pause-caps-v1-664d1320d502

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

