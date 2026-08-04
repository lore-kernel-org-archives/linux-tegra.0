Received: from va-2-112.ptr.blmpb.com (va-2-112.ptr.blmpb.com [209.127.231.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C399E340A6B
	for <linux-tegra@vger.kernel.org>; Tue,  4 Aug 2026 12:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845998; cv=none; b=T01osJ9i5Y9+QUZZmqJq0ShX5/HxRJUcOCw1mOXSIUPYb5CKHq9jBOT7K0aLqeGNCqzWs78AlSzwwYm9tsLsPIeTOIxpuOSLdPHLOYe/sOq798ca1/opyrOVCH1y73MiYGMP4giP3bDyCHg0Kb3sgUtetqhNOw6Md0FXQJsgIYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845998; c=relaxed/simple;
	bh=cWnRX+F6pSZ50gCO1T2pIqavC+5cROnufmzn4X9xYic=;
	h=Subject:Date:Message-Id:Content-Type:To:Cc:From:Mime-Version; b=J+nrbvzZ0V3zf1knSUQJwx+kPQcioo/1sfXfHgV6CfY5pRTD+Ynk52e/tYZlE3vclZSAwpwIqlEg3Dgob37lv9QaRU12BUJrIy7bJQEJUqbnA7fGSnFaUfx36pKjCMvQObfG4/7azSK1S3UJD8HRJ6pqpDHZADdBhrc4rx8mt70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fMQQLBrC; arc=none smtp.client-ip=209.127.231.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fMQQLBrC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1785845984; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=P19ATPuLCNxGndt2q4Nncsh/4/vm9gnAvLuWowkZanU=;
 b=fMQQLBrClUi8ON0T76fNdUUlrTsiFvbxTokm6m1JBtDFdMFMa/2gZkqTL1Bl18y7wwe4ip
 0tfkT6psoaL60tTN/kaHWnI6mQ5rDiu528kV+NSFUImKpk0bQZHWFFnVB9xnf004ao2x5C
 luAaZUPJYN/SEj3omZrI9oyQNKhehjpQq5wValqtEVfJYlw9cTaUVHlSSUNXpw6EQ1J+Tq
 Jd3J5xUe5EXxehAexJ9kwLJ8zzwF211hOKTsbHb9VXK0OJv7ZoWPhmz0OSwlyjWI2Iz5T+
 Pild7IRwIWTKoDSHHAVaQ5YDB4GcSmZOD/fOGg1qiQqDZ2UQRzo9vKa9cU+pzg==
Subject: [PATCH 0/2] soc/tegra: fuse: Fix unsupported SoC init path and log formatting
Date: Tue,  4 Aug 2026 20:19:08 +0800
Message-Id: <20260804121910.4961-1-guojinhui.liam@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: "Thierry Reding" <thierry.reding@kernel.org>, 
	"Jonathan Hunter" <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, "Kartik Rajput" <kkartik@nvidia.com>, 
	"Jinhui Guo" <guojinhui.liam@bytedance.com>
From: "Jinhui Guo" <guojinhui.liam@bytedance.com>
X-Lms-Return-Path: <lba+26a71d8de+7f69b7+vger.kernel.org+guojinhui.liam@bytedance.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Jinhui Guo <guojinhui.liam@bytedance.com>
X-Mailer: git-send-email 2.17.1

Hi,

This series contains two small fixes for the Tegra fuse driver.

Patch 1 fixes the legacy initialization path used on 32-bit ARM systems
when no FUSE device tree node is present. If the detected chip ID is not
supported, the current code only emits a warning and then continues with
fuse->soc left as NULL. This can lead to a NULL pointer dereference when
fuse->soc->init(fuse) is called later. Return -ENODEV from the default
case to stop initialization immediately.

Patch 2 adds a missing trailing newline to an APBMISC error message in
tegra_acpi_init_apbmisc(), so the kernel log remains properly formatted.

Jinhui Guo (2):
  soc/tegra: fuse: Return -ENODEV for unsupported legacy SoCs
  soc/tegra: fuse: Add missing newline to APBMISC error message

 drivers/soc/tegra/fuse/fuse-tegra.c    | 2 +-
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.20.1
