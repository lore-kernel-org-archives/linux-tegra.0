Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C27F28F1
	for <linux-tegra@vger.kernel.org>; Mon, 28 Jul 2025 00:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753661744; cv=none; b=X8Hsyn40d5ye+Nu5fB43N1o6Q6ipMJePVfL3kKlj2mA/NmbZFfZ4mjSH3DVBJVwH2XjSgVDBI1umk1IM+PvnIe3BcEpadjb+bvd5wcItzk1S46xNRiAKqGPfPvMBNUNi3FacRq7JYPPdRcVGYtL6iWnsp/pLWH6ZV+xuHgjfY1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753661744; c=relaxed/simple;
	bh=5k8JYmHT2cWOWtGfELADGc92fbkTdz1tEljYzoDyHO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QOW/YfiYu7VoHvzrgJB51c9ypOsYUn3Z+27vOLGtT76hIsc1Vr0lWEodaKXm+A+99HXrEz2ox/5+PNklC4BURogM4QfTpkxNidbkmDrUZ32YjCvoQD40UV+luaIwO8fKABUIBIeCj5vNIMkLBkJRwUQOMc5vPB/q73zrEPMvso8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=RPbTfdr5; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="RPbTfdr5"
Received: from ldns2.iitb.ac.in (ldns2.iitb.ac.in [10.200.12.2])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 5CE6C104D00A
	for <linux-tegra@vger.kernel.org>; Mon, 28 Jul 2025 05:45:28 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 5CE6C104D00A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1753661728; bh=5k8JYmHT2cWOWtGfELADGc92fbkTdz1tEljYzoDyHO0=;
	h=Date:From:To:Cc:Subject:From;
	b=RPbTfdr5ubQ/Ie0C5V9yg/krhtrN1zu2JngvovCUqM54zyAyv3uxoXkeQAfDD6hsX
	 09w6G31zxeqAlxBucisd1MD8NCzSJyyC1b7PYQu0CgeO74OvG/AiTgiwa5sz0BVfPR
	 fNfwKQ8TweWe07lsfBrtC0uOjEttlJoM17jhtWTU=
Received: (qmail 23478 invoked by uid 510); 28 Jul 2025 05:45:28 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns2 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.100.0/26337} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.875186 secs; 28 Jul 2025 05:45:28 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns2.iitb.ac.in) (10.200.1.25)
  by ldns2.iitb.ac.in with SMTP; 28 Jul 2025 05:45:24 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns2.iitb.ac.in (Postfix) with ESMTP id D4A563414DD;
	Mon, 28 Jul 2025 05:45:23 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id AA8EA1E8128E;
	Mon, 28 Jul 2025 05:45:23 +0530 (IST)
Date: Mon, 28 Jul 2025 05:45:17 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH] gpu: host1x: use dev_err_probe() in probe path
Message-ID: <aIbBFQqgZalOMc6r@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use dev_err_probe() helper as recommended by core driver model in
drivers/base/core.c to handle deferred probe error. Improve code
consistency and debuggability using standard helper.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/gpu/host1x/dev.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 1f93e5e276c0..e6f3cbeb9ae5 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -587,11 +587,7 @@ static int host1x_probe(struct platform_device *pdev)
 	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
 		err = PTR_ERR(host->clk);
-
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
-
-		return err;
+		return dev_err_probe(&pdev->dev, err, "failed to get clock: %d\n", err);
 	}
 
 	err = host1x_get_resets(host);
-- 
2.34.1

