Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A78288515
	for <linux-tegra@vger.kernel.org>; Sun,  8 Feb 2026 04:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523460; cv=none; b=nBMwGYzdS/ObUShrrozSDeV2iBHp1mG3LXcQzICZ7DutZf0xoMnhkyYxKRCg1Wj8BX5eThAhiydAOOXS/aKc/OkZRJikmzF4w1jnwonELBh/rubrK/o+vakmFW5OGKMwfAHyE5Y7elAJG2H8kN6+8QbhAXH0pw9x4jpgX5Jo+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523460; c=relaxed/simple;
	bh=1nmI592gVRRRNazHbetRGlWzODgcIIgosQMVHzt+Rxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqMIqGTJP6wthCLGfs3v9HYQMo3f3TFdxPlUsbecvk/KYmkpP8Ij3VELflv+ZlpeH1FkBOfiJRTGhtxgpJVWas/YzRVo6Ao6goB+Uuf2SJ744syDl37Gp28VRkV5ZSAgWpF1bsG4v5dJoxnT5uXHCPaFqMnHAqFGUSQJURX3dG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oCR8ysfT; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oCR8ysfT"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1249b9f5703so2505482c88.0
        for <linux-tegra@vger.kernel.org>; Sat, 07 Feb 2026 20:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523460; x=1771128260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFjxbTsIX43trF9X6h4ASWW0dwvPNCEYejqKDfbp6FU=;
        b=oCR8ysfThUl6jfjHJNvGseJMVp+YJnP4S8SaBHpt/WCNr0KVD0V1719Xg3eC1QwT5s
         JtMK5uiwC5HRUssqD64YaUSMRWUggMcJqVJDhzzIz1uyCBABOc5zoRd+vwMmBlbAfLQs
         Vv88xYL3EKobLos5Tmr+XD0Qgts1l+a99k3N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523460; x=1771128260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FFjxbTsIX43trF9X6h4ASWW0dwvPNCEYejqKDfbp6FU=;
        b=qS12F/RC6JBFpxKQ4rqqtGWOeXLDLFwJNCcSIbMYmhaHvN0vnTa9cx+LUDqB6fN/+S
         rwkOwhxbdUNsoOIEtlmz2oPacL+L5BYKOsh3VOSH11vDbAeQr9gP7PtaRQ4PBY6OsNIL
         9oJiQJaqXU+tGT1VoKuEniITJ+Bhq2sQmn/y98r+stdymx9pzCBuByEM/Gsa8Vo/hOvv
         vo3GPjyjtZsTN/2Q4+osqA2mb+gwe+jI8J68qvHtAX0HQ6geVSw4gqwkgsxprd0CLVqF
         L+6x/+eJJC3Au0AdYkeQDVfVUEfnxO7Dv4UTIac9h7GwWpk2NYNcYKovttQbZXto5oDs
         nL1w==
X-Forwarded-Encrypted: i=1; AJvYcCVew9hhQMCwnCcqH5IPQOc93PEtMDYwnzmLUplaeo669Y/O3Bg8RIm2Ndu7LjHP+Bq7JMkL3c6hxa42JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqu0KvDd6i+mzP/iszasfjhzE5Z6O7L9ulXK7BVP+agCTMbmB+
	0HJijgy1b1Huy78zH/4/RkgVJp0euFEsyA5VSU8zEhZA5voy/rjciAoKOf1+rQAvsQ==
X-Gm-Gg: AZuq6aJfzk6S79IN2xO9iXeh1S+Ddc0+bCDBuF3XEXRrRbNdzTqVWF8mByQVWDQ5aoT
	zhBJ7cXrMbP9Nx1LR3p3X0mza24TgjRQb8KC2HzK/TWSO64+vjSsF3g6IVIahSWtXavaRAxLJ7u
	i79MsVCfTh9552m9qP3kjrdS+Bhn89YqGpEUzFaIxMLZZaZZITn0GUz4O2/zKA5vU+bcnqbASRx
	9zjtGD8X7YJtaf5QofOz/Y11zDuaq24WuIq3YOlMUGw2ap8cRj9flBA1zCXDO/zttI27oeiybn7
	JV7XXgPiund12uaVYUsuOp5cZGlqPC//8yNQgxfE/JotPyB0u7FVkEvPrsLfp4tT5VQitKaKqe2
	nBikoSOUrnpUmfoBhz//+fUR3OvH4Yr/uhKGMWW4gVnzHiAj9vUq9A1t6rNpIV7B09GE+W0NIEL
	kDVkHtGS04MLMlelgznTyA5fPtwipaVO8WzDeP2z0/eCqTfcRenpNCTmgxC22Ra9I7D/GBlNnhQ
	i0sKegXqQ==
X-Received: by 2002:a05:7022:250e:b0:11a:2f10:fa46 with SMTP id a92af1059eb24-12703e569femr3754818c88.0.1770523459863;
        Sat, 07 Feb 2026 20:04:19 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:18 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	robh@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v2 05/15] firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL message
Date: Sat,  7 Feb 2026 20:01:27 -0800
Message-ID: <20260207200128.v2.5.If1255977439f4cdbb3193f73f90a784566254f15@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward. We can remove the call to mbox_client_txdone(). The
call didn't do anything for NULL messages and it's now officially
documented not to be called for doorbells.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/firmware/tegra/bpmp-tegra186.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
index 64863db7a715..c45ea66aabfb 100644
--- a/drivers/firmware/tegra/bpmp-tegra186.c
+++ b/drivers/firmware/tegra/bpmp-tegra186.c
@@ -84,12 +84,10 @@ static int tegra186_bpmp_ring_doorbell(struct tegra_bpmp *bpmp)
 	struct tegra186_bpmp *priv = bpmp->priv;
 	int err;
 
-	err = mbox_send_message(priv->mbox.channel, NULL);
+	err = mbox_ring_doorbell(priv->mbox.channel);
 	if (err < 0)
 		return err;
 
-	mbox_client_txdone(priv->mbox.channel, 0);
-
 	return 0;
 }
 
-- 
2.53.0.rc2.204.g2597b5adb4-goog

