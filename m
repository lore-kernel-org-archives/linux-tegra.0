Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48530373BF3
	for <linux-tegra@vger.kernel.org>; Tue,  7 Jul 2026 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436616; cv=none; b=Ou0mI6oCo60/zNxJQhbcCj5M6xUziFR8UmMoT4jlPpuC+RpcKmvqL/NCBCscB8V2+hgsMFycN3UwHP9HKqq5k/MvKz/yjHA09dJA7o7sTK3JfdjEWvqwPILY2reRXDYm95j14wOT1YO+fojFT5rZmTwUxyVTb6PO20tuAbsRwws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436616; c=relaxed/simple;
	bh=WIvJ/zjcMo6mUW9sI3RPnc0QUrY+/Xv0ltvp3NGiIxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PV8KydhWLMabLQebTcdj84VbKqjuCKO3cZ3nJVxm6ubBQeXwRA8f8GR7V0RVFFVql1J3xSBtT87n1h8vH77Ntx9WeLghmdrjz069OMCjnuifNldK4P5TEeZ8WgQnubvU0RfsMBET+SxYIqHlza/A1GrtcGoTqooaB1ZDXUo8pKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBA1Jc9S; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBA1Jc9S"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-847a483e344so968745b3a.0
        for <linux-tegra@vger.kernel.org>; Tue, 07 Jul 2026 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436615; x=1784041415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Yuz6fHmdCtAYz8Y8qNJQTbNofhSYgvmngc/Kl/kwUc=;
        b=XBA1Jc9SlOsgVnZxXsrBj9ci3NxI7t6b4NkrXetg7KatqSBA6sbraHwYtW5s7OInxE
         q0z9DorUexnPP7J8/t/UKMxJ1gfUqn7AyKHSsxmF0Upvlhg/tvwzg7/811hXeIn7TeMy
         NOnMp/OaJLFAkKuWxUll8/k6XXkoWZkO7KOUvUCgD8xXHDjn+DjblIF3CtBcUR2cK0cW
         l5GdOxJgpZ77jFpsVrAttXaQuCAJ1Qz4o4F+Na5RetMqd5IX02Rw1ZX7Y6NYz481Fw0v
         OKBW/YM2rl471xbQHCgYfIYb2hY4kbHq5ONrfH2aseg9b0XXPmkWz9emmCObs1JKWf3N
         nocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436615; x=1784041415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Yuz6fHmdCtAYz8Y8qNJQTbNofhSYgvmngc/Kl/kwUc=;
        b=Nz2Mq0V+hasWY0UcVbWGtsxbrqtqKaPLCggfel5MH6U1yGCUU7KaHDXYWLU2TOM+sV
         34FjSmFy3rijrx8DK8uXVWQVe5fvZsV87zbJ3CpEsGPNPqWkbu/3IKqDoImv5BmTof74
         0m1lnPKnU/Rm+g4r9Ewlv2ZPDWDjFCpeKTDtslo2J0qbdFGgifqytJ1PfNYLvWpJauiW
         QellmQ6hrnaeDBYXcRpRSmr+6W8XxEduSguBwNwBObxCewdm5fe5hRCzlQ1YUyg3B7ZA
         XAmfA6SikW2aLwXxfm1YUGbI/oNlRD+GKLQs/92o2qGMH5a2RnWZ3V3eTMSpBN0T7fqZ
         XUCA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3oK+khZq5Nk3lQRlFOy4DMPN/5276RbGSbMNt18mpKA7CObvC2l533yZ2ElehDjVr/HF2QvQxGlN3Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtIOmERdY0YLLXMfVwVbG7BWT72pkGhnDpckH2V0xAKXQ/ruut
	rAf0zt156fa0OdRWtjEN0/3yJqYTkjvkLBjAre+vZieHISVZeo7gZALB
X-Gm-Gg: AfdE7ck5cpHOEJRHTqPcY1auts+biJKdTmB+PsG2PLjoMdLrGMdKIElbzFj+H82St00
	p8kAu9QiddJ8Xa0n/0C01mHh4yvRN0L/41G45qZCnVgEKi3XILXgbz80bXuWdOppSqPoLocLnjc
	05xIlLRSRSPHYw2EHEDjBmYhPV+NzcA1HMJ8OkvXd8XhjP4/PnP4V79yX/XUaJOXPgJFWPdIH8H
	gqcE5ZaJRVgNc77LXOgtZFL+lgdUtMLOnTMVknjRAZadfIQOzHBGrqHk7dAn1QuVMbRMfqHVneI
	WcljjYgPPN4GQGCDQp9aJUIQJ9/o1wDU6Ool0krLkUH2zKkWk5mQiNKDGcLRhJBGiY8dizm9PyI
	BAzJxNaij3eRFQEiehhb+KtqOlah6Q1pD5vW5HNXs6ZSO3Hrq6QWMiJAXNRNrYRDo+3d4NuoaAD
	iPz7CuHxSPz0Vlhr9VQMubvDKNsOoF8AUruCLxlNTd+R9J
X-Received: by 2002:a05:6a00:844:b0:847:e2e4:a36b with SMTP id d2e1a72fcca58-8482f4ba9fcmr2733557b3a.19.1783436613808;
        Tue, 07 Jul 2026 08:03:33 -0700 (PDT)
Received: from Alvin.tail8ccd9a.ts.net ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dd3bd3sm5604773b3a.58.2026.07.07.08.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:03:33 -0700 (PDT)
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hao-Qun Huang <alvinhuang0603@gmail.com>
Subject: [PATCH] staging: media: tegra-video: fix of_node_put() on VIP parse errors
Date: Tue,  7 Jul 2026 23:03:26 +0800
Message-ID: <20260707150326.554689-1-alvinhuang0603@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_vip_channel_of_parse() initializes np from dev->of_node without
taking a reference, but its error paths drop one through the
err_node_put label. This underflows the refcount of the VIP device's
OF node when endpoint parsing fails on a malformed device tree.

The only reference the function takes on np is the success-path
of_node_get() stored in vip->chan.of_node, and that one is already
released by the tegra_vip_init() error path and by tegra_vip_exit().

Return errors directly instead of jumping to the bogus cleanup label.

Fixes: e740d199cf0f ("staging: media: tegra-video: add support for Tegra20 parallel input")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
---
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 9ff1f1750a15..5fba11e31e1d 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -126,7 +126,7 @@ static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
 	if (!ep) {
 		err = -EINVAL;
 		dev_err_probe(dev, err, "%pOF: error getting endpoint node\n", np);
-		goto err_node_put;
+		return err;
 	}
 
 	fwh = of_fwnode_handle(ep);
@@ -134,14 +134,14 @@ static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
 	of_node_put(ep);
 	if (err) {
 		dev_err_probe(dev, err, "%pOF: failed to parse v4l2 endpoint\n", np);
-		goto err_node_put;
+		return err;
 	}
 
 	num_pads = of_graph_get_endpoint_count(np);
 	if (num_pads != TEGRA_VIP_PADS_NUM) {
 		err = -EINVAL;
 		dev_err_probe(dev, err, "%pOF: need 2 pads, got %d\n", np, num_pads);
-		goto err_node_put;
+		return err;
 	}
 
 	vip->chan.of_node = of_node_get(np);
@@ -149,10 +149,6 @@ static int tegra_vip_channel_of_parse(struct tegra_vip *vip)
 	vip->chan.pads[TEGRA_VIP_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
 
 	return 0;
-
-err_node_put:
-	of_node_put(np);
-	return err;
 }
 
 static int tegra_vip_channel_init(struct tegra_vip *vip)
