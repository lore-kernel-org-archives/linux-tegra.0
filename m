Received: from smtp1.iitb.ac.in (smtpd9.iitb.ac.in [103.21.126.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECE92E267D
	for <linux-tegra@vger.kernel.org>; Fri, 22 Aug 2025 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.21.126.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755843261; cv=none; b=Xt5Cf8dSQEiznK+Ra1zTkz/zOmNZmABDFvbXlaWXBOnLun+tDtbwSvvhzK17XJAbEQ3JM9wpPryaVkEL5eJvidmDxKU3f1mkIUzMwB7Do6g+aP7oGojkmU5V2Rob9VzLRsqaaE3Zj8n0IcTU2hNL4yiVo+rO99S20+bKuejRSPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755843261; c=relaxed/simple;
	bh=xSTLBZgeyAStKdfuml2IaShqaI6DLW75Lj3aJeFeAdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Mf4Gqd6rALOcUtePXSf730cDKPIpXVZt8rv0JirEoVbt9eNjBfvc7/Sh+0c1w72zKZAWGDRuNURdmiShJsAD+BppZtcJH47PE5Ka5qv7ndY549ncs5Bjhi/tedXaYBXX3ARwZ4HjbtyKnche40zHbHIOLiQTI1y0fb81F3O1KXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; spf=pass smtp.mailfrom=ee.iitb.ac.in; dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b=VoTRNjt+; arc=none smtp.client-ip=103.21.126.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ee.iitb.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iitb.ac.in header.i=@iitb.ac.in header.b="VoTRNjt+"
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 75417101C101
	for <linux-tegra@vger.kernel.org>; Fri, 22 Aug 2025 11:44:13 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 75417101C101
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1755843253; bh=xSTLBZgeyAStKdfuml2IaShqaI6DLW75Lj3aJeFeAdY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VoTRNjt+9UOkFeptaHnX8VB4s8dpM3PXi0sgotYw9jHPlfQQVVWEp1skVGqCJ38O2
	 wMAhfHyWdHNFaYgiJEawVmRfVZL/JVV8GYMxzsGRJcwpOF9219xJfPsiGqqwLgUh3Z
	 V/IRlLAH8a6wmA4AcnR9pgew1DDp8MzMX1WWNP1Y=
Received: (qmail 12637 invoked by uid 510); 22 Aug 2025 11:44:13 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 2.236196 secs; 22 Aug 2025 11:44:13 +0530
X-Spam-Level: 
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 22 Aug 2025 11:44:11 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id 8CAE736004F;
	Fri, 22 Aug 2025 11:44:10 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 637081E81562;
	Fri, 22 Aug 2025 11:44:09 +0530 (IST)
Date: Fri, 22 Aug 2025 11:44:04 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH v2] gpu: host1x: use dev_err_probe() in probe path
Message-ID: <aKgKrCxUvP9Sw0YI@bhairav-test.ee.iitb.ac.in>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIbBFQqgZalOMc6r@bhairav-test.ee.iitb.ac.in>

Use dev_err_probe() helper as recommended by core driver model in
drivers/base/core.c to handle deferred probe error. Improve code
consistency and debuggability using standard helper.

Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
V1 -> V2: addressed review comments as below.
* inline - err = PTR_ERR(host->clk) inside dev_err_probe()
* avoid printing err, as dev_err_probe() prints it internally.
* rebase and compile test with v6.17-rc2

 drivers/gpu/host1x/dev.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 1f93e5e276c0..c586c242f2c2 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -585,14 +585,8 @@ static int host1x_probe(struct platform_device *pdev)
 	}
 
 	host->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(host->clk)) {
-		err = PTR_ERR(host->clk);
-
-		if (err != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to get clock: %d\n", err);
-
-		return err;
-	}
+	if (IS_ERR(host->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->clk), "failed to get clock\n");
 
 	err = host1x_get_resets(host);
 	if (err)
-- 
2.34.1

