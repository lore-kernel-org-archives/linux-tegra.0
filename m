Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C3612B7F
	for <linux-tegra@vger.kernel.org>; Thu, 22 Feb 2024 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708563945; cv=none; b=lIbxFeYpGeIsKEdvE5ecg750W2tzzuVy27MEiyweDewtQcrbqXLa1itL/AUKbQ1KIaQidA5sw0QU0KpDQHPZu2aLfxnTJ1jSDoHmTzkPy49SeJKmBX6c2BiyW2wSBgn0n24STWlsvANQHGiY5s3stfOMSWQYGDBwmVdnVG4Vvak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708563945; c=relaxed/simple;
	bh=ESICEw+x41lZ/Ep2kaw7bABdtIEbuhPHbIzN8walRjs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DT8Hsh0dsV4ExnZuHuTuZEJZHLYW2pgXQ5R0GbQdsvNiF1hu6R7UJsoxKfZUi+dj2AXIaz+6tV+h9mC0imYYi3c79J8jCcs7mwHyqv6aDVdtznhh1Ixaz5ixoUDd6BiM3D5HSAMLUFPh/h3Nm6GJhS9lMm+Wea4QUfGoe2DrmEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=b2VrQJjM; arc=none smtp.client-ip=91.232.154.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="b2VrQJjM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jFf0u+hJrnn5Kjqs9MiLK+d7fXYO2IAajVrZzed6+3s=; b=b2VrQJjM5vT1/umqw8vahCnSnM
	+cHV6YFz3pWZwDj0na2LK3l44XqbeotNP4rBAC0A2cGJsv3GJ2OCQMZr/l7R/lpzsqzd+5pZ1d2t/
	84CnbvBIU+pAI1NyHqchomn7YfPe4j8L9XGcTdVaI9MjIL36ojHg943dRVJtiFjbY/KDSCxcP1qf+
	CTcwPnPC08iCaIp2m2PO1lGu0i8gJztlFNR1Y9SYL+mBBpMm1DEfXGwCHyL2hqyg8mVL5SBzNLNXa
	22DpfBH9wQ+jjXDegicLj+eGlM+quPZ/0vnf9khVaTQ5mwkjBcLurdqn98vT3bLEmvjayN4XikAvD
	GAY6efdg==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1rcxWj-00EL7a-0Q;
	Thu, 22 Feb 2024 03:05:29 +0200
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Skip reset assert on Tegra186
Date: Thu, 22 Feb 2024 03:05:16 +0200
Message-ID: <20240222010517.1573931-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mikko Perttunen <mperttunen@nvidia.com>

On Tegra186, secure world applications may need to access host1x
during suspend/resume, and rely on the kernel to keep Host1x out
of reset during the suspend cycle. As such, as a quirk,
skip asserting Host1x's reset on Tegra186.

We don't need to keep the clocks enabled, as BPMP ensures the clock
stays on while Host1x is being used. On newer SoC's, the reset line
is inaccessible, so there is no need for the quirk.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/host1x/dev.c | 15 +++++++++------
 drivers/gpu/host1x/dev.h |  6 ++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 42fd504abbcd..89983d7d73ca 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -169,6 +169,7 @@ static const struct host1x_info host1x06_info = {
 	.num_sid_entries = ARRAY_SIZE(tegra186_sid_table),
 	.sid_table = tegra186_sid_table,
 	.reserve_vblank_syncpts = false,
+	.skip_reset_assert = true,
 };
 
 static const struct host1x_sid_entry tegra194_sid_table[] = {
@@ -680,13 +681,15 @@ static int __maybe_unused host1x_runtime_suspend(struct device *dev)
 	host1x_intr_stop(host);
 	host1x_syncpt_save(host);
 
-	err = reset_control_bulk_assert(host->nresets, host->resets);
-	if (err) {
-		dev_err(dev, "failed to assert reset: %d\n", err);
-		goto resume_host1x;
-	}
+	if (!host->info->skip_reset_assert) {
+		err = reset_control_bulk_assert(host->nresets, host->resets);
+		if (err) {
+			dev_err(dev, "failed to assert reset: %d\n", err);
+			goto resume_host1x;
+		}
 
-	usleep_range(1000, 2000);
+		usleep_range(1000, 2000);
+	}
 
 	clk_disable_unprepare(host->clk);
 	reset_control_bulk_release(host->nresets, host->resets);
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index c8e302de7625..6143c2a61d70 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -116,6 +116,12 @@ struct host1x_info {
 	 * the display driver disables VBLANK increments.
 	 */
 	bool reserve_vblank_syncpts;
+	/*
+	 * On T186, secure world applications may require access to host1x
+	 * during suspend/resume. To allow this, we need to leave host1x
+	 * not in reset.
+	 */
+	bool skip_reset_assert;
 };
 
 struct host1x {
-- 
2.42.0

