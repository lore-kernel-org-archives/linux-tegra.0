Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279746;
	b=k0zBbnorNMhTWuCgxKJrS1X68Y8Pcr4JZN0AHcXF7j2eVMDXMOD1o0V5omNqLcPGBLfK
	 rHNCx1jr74dBg9lDbBjw12MTsW7fHIx9c6ZxQdkVt+opY5kNQCQGeGcGObRMcP7CUQyfJ
	 wfJcsnGeepn3uIkPeJRwi1uPwHwVQw3jkXnHU3p+ubLqiFKwZ/srQtqNjLU0DSonP/XeD
	 qxDsj+FhRRU4bH2YUH4MbFNxQkOwstieBshI8V2zZ0MOe2y08FWesuUThlIPLew/vXLpf
	 3oCawM3MVqiOig8lCVznc4roaIgtM6FCAFbzijQMTZRxdAQuO05yjfxNiDIMxJ1Gtxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=lNlAAFeqvPs3+2DrLUisJfKXmiq6ODin2NN2Dn+TzsQ=;
	b=yyW0bjN+eH+/K4uH2leQBfrAQ1c19n1uVHe1VllfjGVEQJeXx9WRswOLxf6BFrBdkAeP
	 PaipQ92TxwmloirJHMQv3NNWYZZ0wmoYJMNSdotq6SsqOeCRHn6noyNNYvVRFeZvZ81Vp
	 tn00tAA6ZKAZjHY0KL8zz/6VxTrp6UoTbQgIWlVmmwGQxOZh5TxInRduWUTG3jDJ+gNEW
	 aHm7aZN22uwBBEuK8aGAEZnBy/mP5iXCVds4sHV4NkzBizAxe+ZeCUBnqBkoCb/4ZUERm
	 LQTqy2xwv+tZHpLpxiHbSvrEj6u8FB8dB1fr8X9RZajXpFcDDDpkZfqG9mri849GG8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFbBk4Zv;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B151F606A31C
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 03:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B151F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gFbBk4Zv
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-845788309b4so720560a34.1
        for <linux-tegra@vger.kernel.org>; Mon, 09 Nov 2026 19:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279744; x=1794884544; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lNlAAFeqvPs3+2DrLUisJfKXmiq6ODin2NN2Dn+TzsQ=;
        b=gFbBk4Zv4HAt4Wxj+pKFz4aUR6pmLgUYtSl9v4+p5Qa2ZurJFBBsdjonxf6lmsYMGa
         fRBWiOb5lhEaD4kGO6T5Y5PQcoUS9XbE1F9vVPW29HUDvlIdrnfWwAyg01diShoK77C1
         MC9nGnbpBtO3NTY3NiIVQO01wk6HO4x7tc7yKdoFJx5/YohrMKb+E3NhgShT6d6yJlhE
         YVR4qxvny/1di+qAfMiizlOUuwMc4DTKh373Drz2wT9jq56bgrDHiQaWJWMLm1NQdJoG
         xSqZmPpqudZoM2duhXKvY4l2uJ6/wrDCaJjI8z/DpE41YpddAghl1/6zJ0RBMcC35kYD
         3luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279744; x=1794884544;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lNlAAFeqvPs3+2DrLUisJfKXmiq6ODin2NN2Dn+TzsQ=;
        b=jvs4k+2m1h8yqWdfMsjzVKf+3PyEPeTFY3T61QCvxJQ6qDwU7zSeenQrUHjaWmbpa9
         +byuAZ6vOhYUQe8D+7JF4hGECoO1lwdWKkbregCFLbhgScg4dDbhcjIUjSnEVlvwE3qW
         uvx5jcsykHIU7/clxo2erc2IPgrDfn8feFq2Wj9HsxYTFk/luuAMK6qYcVQBuW8xdpkp
         7aLnptjygSE2zWaF3AzeLWWWvRN2cmL/l59b32VWrMCPWgTn1dv4cCoRY8QWuQ6urVoo
         nvcncfwc9X1A+OHayEOE4oog19O+lynJ6+wlhHqVRWhF2Nz6XJudiij9Nqz7L16fJ8oW
         XfmQ==
X-Forwarded-Encrypted: i=1; AL+hErFVK8Kx9Vn4BGII2fvvNWSfBiRzUfmvY4sqSv8XQmWIcN9kpwllKX7B0Tg1qCmVCbl2U15O4hKO6nPYcA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9s/GQ9xAcQcCg4D0uH/eHrN95N6J7KVYWvZ+NyFzXQrTYBVNOS
	fXN8+Jh1MEOMGyJ8JO3+5HRyTdSJEmlG5UG/MAecRmJ+mk/dMnSZBUll
X-Gm-Gg: AYBFou2PSICPBLPBdHHNA1HZHb+I6mNxXP+xXZVex0FWX+3EBVwjGhJUGgkIyO4DTRd
	7lZtpmPXtn/hR5AN7MWf6S+EUpxHn2O1PfQAla5U1m4JGCmvdjt8VX6+16LOVQVmcY3PjmuZRAR
	MwpBsQ+tVK40tG+TiQJ24KSB5Ucf+VRJ/IgxGNR2FjajKXKe4MmFd2ruXdhqeP8Bz2IyuxxUcyE
	rPIDH2jGInCBXsgDu4KBTiR91KPo8/Ejq1Sjxgv2anxM798ZKkgHug7kGQTXpxgJCBjCsViymKP
	4+Hv+eUJV7prngwseQJR7bVsacBOcsBKoiAvfcPzOgq6oJtBmiCMbU2ORUhHK7ofyPQwU7EyuGn
	ShuL7xdpQyGMRJfNGgV2h5dpWv8VONAiYR6QlCX5E/T01Suny1JHybeRFiuw0Kc7V/NhSfQmZmt
	P/u47mAVhHlUgkylu0UcwnG9kYVK9TryyeXEyF1MlOH5Vr6Lxn27LqSxcJwCfIRKSH52AQwQy9G
	PelYFRoYPztXka5xbgJ4BlLr4bHHU8ZfkHmA9xa463H2OBORQIEekAKJFNsxfBQmH+MeZBdocG/
	rIp2nXsrhONnVx8IxXa9R+XeOIk9HqgXWO6N91iRHQOlmqyhAAcy41noEP5qgveZilJoVAeP84n
	84a0m2/txM3NIJUCMSV/J5c62F8xqQucKRPaCcXRuZQcK/CTvVw6uTE2TCZdlyAyYJfvK+1xYms
	G7cQlVJ/6sSuFANhJoK04mw3RIVXHUGT4EZIHYK2tVVvIzejIlAXc=
X-Received: by 2002:a05:6830:913:b0:804:365a:bb82 with SMTP id 46e09a7af769-860dc818e73mr1351189a34.22.1794279744586;
        Mon, 09 Nov 2026 19:02:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcbebfc6sm882545a34.18.2026.11.09.19.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:02:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:02:14 -0700
Subject: [PATCH v2] dmaengine: tegra: only advertise supported pause
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
Message-Id: <20261109-submit-tegra186-dma-pause-caps-v1-v2-1-accf568bf0cc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOwQ6CMBBEf4X07GpbFMGT/2E4LO0Ka6SQFoiG8
 O8W+AKTvcxm5s3MIpBnCuKWzMLTxIE7F4U+JMI06GoCtlELLXWmlMwhjFXLAwxUe1R5BrZF6HE
 MBAb7AJOCLDtblWppL1KLyOk9PfmzdTzKXUfIi8ywgldHhTFeeXSmWV8RSa5mR6c9Fx0Nh6Hz3
 23mpFbSP4viKSiMKSp1RZmm9l63yO+j6VpRLsvyA7Q7gp4GAQAA
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
advertises hardware support. Keep them available on Tegra194 and later,
and remove their now-redundant checks for unsupported hardware.

Fixes: ee17028009d4 ("dmaengine: tegra: Add tegra gpcdma driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Remove the capability checks from the pause and resume callbacks now that
  they are registered only on hardware that supports them.
- Link to v1: https://patch.msgid.link/20261108-submit-tegra186-dma-pause-caps-v1-v1-1-9cc9b17a033d@gmail.com

To: Laxman Dewangan <ldewangan@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
To: Pavan Kunapuli <pkunapuli@nvidia.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <treding@nvidia.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/dma/tegra186-gpc-dma.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index e76c58f213d8..bd606b71e714 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -419,9 +419,6 @@ static int tegra_dma_device_pause(struct dma_chan *dc)
 	unsigned long flags;
 	int ret;
 
-	if (!tdc->tdma->chip_data->hw_support_pause)
-		return -ENOSYS;
-
 	spin_lock_irqsave(&tdc->vc.lock, flags);
 	ret = tegra_dma_pause(tdc);
 	spin_unlock_irqrestore(&tdc->vc.lock, flags);
@@ -445,9 +442,6 @@ static int tegra_dma_device_resume(struct dma_chan *dc)
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	unsigned long flags;
 
-	if (!tdc->tdma->chip_data->hw_support_pause)
-		return -ENOSYS;
-
 	spin_lock_irqsave(&tdc->vc.lock, flags);
 	tegra_dma_resume(tdc);
 	spin_unlock_irqrestore(&tdc->vc.lock, flags);
@@ -1518,8 +1512,10 @@ static int tegra_dma_probe(struct platform_device *pdev)
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

