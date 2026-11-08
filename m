Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794114416;
	b=yT3noetZcfDaehYt/deuMBw7+gFpBdEueLAGPPsgNzx/xLASL+XCdFjkoDJdQr2BdHy2
	 PsdsS2pBah8uNr/FxO4s7DT+24JRIJrCwkxjrocPF+/4J1ZToxmmD1ndY2qoTIXYwffVn
	 D0u8qjKfNqQST6Tq1A9hKup6eOsxtie32pwtOeJu4d9dqDpT1uzFpd7PQWqjHSlpLX3lE
	 G3/mB5bj2EGSdjd7FxJ84W7xF6yXmgzYALMDMO7Pmk0NOo9b90IlY9KolIuIUBNPsu3LW
	 329n7rEVZkQpGazrDiVu90Vb+QBVQewOPodeceG9TbKXIDLVRJST66HqsrGGub5aKJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114416;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GcD4B/NC+LPFa4i7abrIGM3Q2OUWv45Xz+W+4d/g96Q=;
	b=a+VbGJGy8l2ttrbD/Ks/97S8hj5bYSCtINPpmd50VPDewZr5PWsW5IQNIzh6S+W8C0l3
	 0INcyvc01EgLqyRnoDV6Qip3yb7OOVs2/8chkmmsJiVKBsiKysCKox/juMHT0VfI4FSPa
	 CsfK5YPcG9mBENQHzwpDgviNIRNZ9NetIE6kp055yCNZVrrZ7A1T+3JMmFhR9AA+ELWbH
	 gi4LMul9qEO/a2wK8FXuiTe+n7KvXgOBwnkhY87MLVACISuKC4iJMVps3MOYNsUlYlM5c
	 ZHJEojHOfoLpL6D22fVKA1gU6Gnp9MDSPFsNOXD/aGBsfS041iJjE+t7nlTzWOLIXxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3lOJzt1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F07F606A31A;
	Sun,  8 Nov 2026 05:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3lOJzt1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794114416;
	b=vHFcTRlLO8qvcS7kc1A2Uqh1gbeQ0U4aTjyUp9VFXdPKXZYDAGJyqppGRQZLCMLjC9jZ
	 y5In0hX43KhjXImlRHoZmsgrQO4Aqz/HkMYhl0t9vEpgMr40h7Nv2M9wfYc7LXg6PClyU
	 AG5BH2vgKdzotMJJ5iBvZkDsDXg2ukfa9NX5WTORnBxAXpdcx1/2yXXAbCZHPHhisRclU
	 lKlK/wmqws0v2q8jywq3y/LeeF1JQ7Hu2ZYw9Ls2IG0m25chGQFQqdcgx/2xBvB6eTGwA
	 BIzMe2p4gdXv8zyrbKSmua16yihsKuGEUnOG+DMfjVc78AHlx/+HZM59pdoS0f+Nw8Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794114416;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GcD4B/NC+LPFa4i7abrIGM3Q2OUWv45Xz+W+4d/g96Q=;
	b=wxxgrZ2NQbYzg+lTQwT9OXMpbDLF/jvYXWirmBfdyJDOLnZKMylZtu5v1we1b7k1ARYN
	 l40qBT6+4mtwCOVsnMNBgYUPYva3YLYtIMYnaLPWKQeGJ9bVxoXV4hsoRIPM2EJX3qJqY
	 9klnQsR0kkrVHHVRnTo7B/hxvA84ZCJ6B0k7HhKorpjV1r988cVC0Hv4h2NrLGPkcvbLc
	 B2bYSLvoDjloxQ7xJ/uDMCSUplQsWOcPFpRSIBCk8xcd8WNBGvhknY0mE3osmD2DD/xTx
	 HuAix2ElZk/o5vqOh/9LwtOf8V8nkCuTGFDBga/gNA8t0gmvhtzqBt+GKtNmSfxow2w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85D421F0089F;
	Sun,  8 Nov 2026 05:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794114416;
	bh=GcD4B/NC+LPFa4i7abrIGM3Q2OUWv45Xz+W+4d/g96Q=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=n3lOJzt1DhcnFWAcKq9WlrWuNyYvo44tVqVEa8zInf+rW+2RDVUXWqFhVNav0y/dU
	 OqG6+fmu54V3HF4n7boBuCK90C1q+XIk8Dh+bijjf4LSRB+KlAyR8vSCLpmEBNv/L6
	 OC1cFF8PNJKSw3gYehk3tylWQe3ha0kKywklP8W2evnj63LHTG9kkJQINvYKF4ywG5
	 9lzlfBqagplQQ/j5nmuGNl8zMrUNKGGN3Y3PC8L4F3rDbDrTqBCdBi2IV6HzrqbmOu
	 Go/L8f0RB+QLTOIAE0DMwFp9VHz7rqIzq0CsGZLiuFkTQS5GnQI/sE11yWNOVmtfJ5
	 3zCIV3YELl2dg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E69C447DF7;
	Sun,  8 Nov 2026 05:06:54 +0000 (UTC)
From: DelaySystem via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Sat, 07 Nov 2026 21:06:54 -0800
Subject: [PATCH] staging: media: tegra-video: use dev_err_probe() in CSI/VI
 probe
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
Message-Id: <20261107-batch1-s2-tegra-probe-v1-1-b4775e6437e5@tubot.lat>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1g1MBmqpVyldzE/UuFBJpqUg3
 r2jLr/FexsYq7BB12yg/BWTZa6gWwNpDPPAKLkavPMtkXtgDCWNhOax8KABV10iY879nenpsqM
 ItV2Ve/md39f7sn3ixKkcM9j3P5PoQpN5AAAA
X-Change-ID: 20261107-batch1-s2-tegra-probe-ddf5e190d01b
To: luca.ceresoli@bootlin.com, mchehab@kernel.org, skomatineni@nvidia.com, 
 thierry.reding@kernel.org, jonathanh@nvidia.com, gregkh@linuxfoundation.org
Cc: linux-tegra@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 DelaySystem <DelaySystem@tubot.lat>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2702;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=HadRakgfetZKfm5cBPmgCO0PbLmnRqlErwjrkQRxrOE=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFkfmPMuPLl/SnLyI83elVuCq5deXp+gs9VSV9vGtVnsL
 4/BnnCxjlIWBjEOBlkxRRYxGZ739fd14qyt5pyAmcPKBDKEgYtTACbyfSkjw+l9nf7nRc6vPrqd
 +YjtL/9w3+s3g+x+RqyTSO6x9N9R9ZLhf+bJ2cf/qnf7eF06clJtf9ulDZpRR6bd+WEUENDC+O2
 qJh8A
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: DelaySystem <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat
Content-Transfer-Encoding: 7bit

From: DelaySystem <DelaySystem@tubot.lat>

Clock, populate and other probe-time resource lookups can return
-EPROBE_DEFER.  Convert the remaining open-coded dev_err() + return
sites in tegra_csi_probe() and tegra_vi_probe() to dev_err_probe(),
which suppresses the error message on deferral and records the deferral
reason.  This matches the existing dev_err_probe() use in vip.c and in
the regulator/MIPI paths of tegra_csi_probe() itself.

No functional change other than defer handling.

Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
 drivers/staging/media/tegra-video/csi.c |  6 ++----
 drivers/staging/media/tegra-video/vi.c  | 16 ++++++----------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 5a5fca378ae6..9ec04ad3a893 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -810,10 +810,8 @@ static int tegra_csi_probe(struct platform_device *pdev)
 		csi->clks[i].id = csi->soc->clk_names[i];
 
 	ret = devm_clk_bulk_get(&pdev->dev, csi->soc->num_clks, csi->clks);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to get the clocks: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to get the clocks\n");
 
 	csi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
 	if (IS_ERR(csi->vdd))
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index d8c77d1290ef..34507a52016e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1875,11 +1875,9 @@ static int tegra_vi_probe(struct platform_device *pdev)
 	vi->soc = of_device_get_match_data(&pdev->dev);
 
 	vi->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(vi->clk)) {
-		ret = PTR_ERR(vi->clk);
-		dev_err(&pdev->dev, "failed to get vi clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(vi->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vi->clk),
+				     "failed to get vi clock\n");
 
 	if (!pdev->dev.pm_domain) {
 		ret = -ENOENT;
@@ -1888,11 +1886,9 @@ static int tegra_vi_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_of_platform_populate(&pdev->dev);
-	if (ret < 0) {
-		dev_err(&pdev->dev,
-			"failed to populate vi child device: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to populate vi child device\n");
 
 	vi->dev = &pdev->dev;
 	vi->ops = vi->soc->ops;

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261107-batch1-s2-tegra-probe-ddf5e190d01b

Best regards,
--  
DelaySystem <DelaySystem@tubot.lat>


