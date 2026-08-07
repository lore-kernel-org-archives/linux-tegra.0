Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16CB447800
	for <linux-tegra@vger.kernel.org>; Fri,  7 Aug 2026 06:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786083899; cv=none; b=UY9zNdMMgFj7bNPYTGBiOJ6m6awbdiWNJ4KtSErsHE4BAsjiOakrbqEDXssY2Ftp71q6TlsnHg60SwlNwZVq47p6wLPlgAkhSvwOdhtY2tiawCkTA+FhaHAQ1IV5ZA1BpDzs+0zZgfCtZNg3kcf4SNfj4UsTYaiclkJlxAecpD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786083899; c=relaxed/simple;
	bh=tOoyzZIcwrg508BD2BSBqGUCV+F8iPOrOgSJDENAUAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bUz3eEkjQZYZPgSnJHOdO33Kfcot6ioqLkk001fkD2Vn6J/0tnh/1uRi/hCDgM3No3pMbr4EHzAUjx2Xik+0OJoqdTniauEQxIlxDagBlffxqCLHD6Skt9mMoV6KdWXrnxrYt+4GVJReo6y824LFzKAmDeirSq7z9Ka3VyDk8vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mg6cFVLX; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mg6cFVLX"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cedda2ce6fso26414725ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2026 23:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786083897; x=1786688697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=joY35scKKvUcuByv0iLOqCcjbK5xOHM5U+wXxck9JC4=;
        b=mg6cFVLX/uTmH8vN0srVC5Tt2eV2qo7gKp19UY4DdurNXl2cceWyfH/QJ8bjSw7Fk3
         D9YG1cKCXrj6Ljnn8YMgDUVWbcdmQXiL49BLwYCNiyniE1VEla2cBOooasR8uIUZ+L3a
         ReQrYaDM1VUtyuPyNTBRSAM9eg8AtqoyIp5eqjKjWY7gadzU/x2LKOEP+eoRdrdwAq76
         fudHfBHx7WBexQnfTXk6bf2KYg8f1ym5aho1cfVtAQfzhg8HM/AZ8SwOG0n6BaAUKNNR
         J4lD4hiGW2Xwx5TYvHCrN3pWkg4Htv+i+gW8KLSfGXleFucxMSMHpJFFI7XZ99gtIU4W
         +faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786083897; x=1786688697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=joY35scKKvUcuByv0iLOqCcjbK5xOHM5U+wXxck9JC4=;
        b=NtlvCqU/84iFHOQ1SXCcAyRQXEU034u9yWFcZ6IFkrDyN25gJpO8NwEU7Ykm8WCq9T
         8Ibe7yB9s/llwcM83ykATIQjMg0TZDuvfbI3TbiXHo6ev0oIxoUUjgWbNTrAr5xUd6Ax
         2TBsvFM3H8Vn387kdO4x2d7Kk/N9pD+MiW7EklZ99LjuaaXDcqZAyYklSB+bB8DgMSPR
         lC27ZaM+BofS6njtdP1alS90AICs9n+WrEkX5DvNLOSGW71Rpyk2K9AXWrBLnUelHRmd
         WBIy9qAUw+7WSSqeNEKHNY9kA+/PLGlJ233eR8WtnJXzXRigWdYTff8CVZ8ILJ1c6gf6
         PcCw==
X-Forwarded-Encrypted: i=1; AHgh+RqQkWcptJUZsI55yYx0kVo77ZyhoKlvZyo4FphbwMJGOUBiKwCWbddWKFmgh6MFN9JU7IqMj0NEFN9xag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3W6Wt5zcjXwax583y3WAX9xkfLWY8RjKkiEjKNLCRsrNoCkbC
	+CIu/7jIp3ykRLqhB5oL5sJo1e5rTkoQ8ZiRptFnF2RkBrPlholqHIQ4
X-Gm-Gg: AR+sD11z6yNrLVcA2FZ4kfYqjrEsEMOEF8RDsaDAWyHHQNaHHrrf6B5qefamayUHFWj
	40HhoQvf5hDLTdmKWoTw2uhyzQczWushtYC5QSqFC+rfYzzs1CprNZ5ZGw6FjeffR5QgmQasNY8
	VeBlWu60yPkGSchb6/+HBJV0pTNnraCMUlUcAKMrgDxOPbLnJgl3Q+1Vy4IueQFounlf9kzSCS+
	5Iv5FyCOzpInUq6FyZSkjcAe13wlxoZiemb5gYqb8nasPMZSgl/Q4gh6JSCgTsSkOgmSfQIEtgh
	3un2EHbS7nquwks4pu4A4WhK606/DIR929+C7+5MvXXneOFhUGHZj78UYYIGJ7QKZSGainWSoyP
	3fWiT9l2euP0J70NVjcUaO/XsNLkzfnKHeGw2g8DMblz+t9gwtPh3fIp6o8QV6FRJia6b/tUhrD
	/JLc/wgOJc47y228bS9qFjJyS6gna5ZJ0brJAtRmlavGc+LmK+i05ikn5Z0aAHKiomCsf6jCn3T
	99ikN8A2Gsck+Lrvcut02DxXFMQfCAV0wyOkvDpa+X+iIZ+q+RMEB/66fF93A3PjrfL8ynlvDmL
	XaL0
X-Received: by 2002:a17:90b:264c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3903c598e8amr22339777a91.4.1786083896969;
        Thu, 06 Aug 2026 23:24:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6dfcdsm1043073a91.4.2026.08.06.23.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:24:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] usb: xhci: tegra: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 13:24:40 +0700
Message-ID: <20260807062440.24708-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Links v1:
https://lore.kernel.org/all/20260806063933.27331-1-phucduc.bui@gmail.com/
Changes in v2:
 - Update the commit message and error handling.
 - Propagate all errors from platform_get_irq_optional() except -ENXIO,
   instead of only handling -EPROBE_DEFER.


 drivers/usb/host/xhci-tegra.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index e7e6d569f1db..d7ae279acdf0 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1571,8 +1571,11 @@ static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xu
 		struct irq_data *data;
 
 		tegra->wake_irqs[i] = platform_get_irq_optional(pdev, i + WAKE_IRQ_START_INDEX);
-		if (tegra->wake_irqs[i] < 0)
+		if (tegra->wake_irqs[i] < 0) {
+			if (tegra->wake_irqs[i] != -ENXIO)
+				return tegra->wake_irqs[i];
 			break;
+		}
 
 		data = irq_get_irq_data(tegra->wake_irqs[i]);
 		if (!data) {
-- 
2.43.0

