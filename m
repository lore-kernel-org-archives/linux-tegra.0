Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597A01DED77;
	Sun,  9 Feb 2025 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739132280; cv=none; b=uu2JAaYiLyWGrRhMS8eLkEIw+po9Kbdjqf3/D/nOShaQ22eu3+e5hWE96JyKLK8HgIepOnnwK6iZVWShgJ6uMXwMSwCxuS9Eb4HXygv8cdR5S2EhACTqXwVBX3n6ksy+LxAk9SzBIC4Swt0WyUArWwQla+04i3IqxA3swHSvj3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739132280; c=relaxed/simple;
	bh=AQ6odMwswQpR/gW2O4CgljqqZuGXpqAtDTGJzvxVEog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xp8G58uGlC9j8Mfgfr5fUg0iTExiVayzyMgvDQKLYVElmFKEllFCxmDNMUumxRIrvlFSpvE2ZaLsv2j16toe7NvI4C7CLb8PAak/ZAXdGBnGTaSVM6TYyeoSr6qqcTWtKLJ0ZDQbX4bGd9LDN6JjFzmkdLwZF/9Zn7HFRfLpNlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLtNmQXe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLtNmQXe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436281c8a38so23992065e9.3;
        Sun, 09 Feb 2025 12:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739132276; x=1739737076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQ3FI5My26wmUFNBpTndGOfq2Fc/AOh4z7kKeSSxtxg=;
        b=YLtNmQXeaqmRrKz/EaGWSGUdfbVpbyoLHxz9Ij/lhMwqlss+P8zfLaXwe0z77uGqlw
         YLIvu+6Sx+yeCzSkVweMOzKDni5ga96KMMOeACNBX4NpgrVJM/tr4qD+F7tEP4w/NdkL
         h30Go9/1W/E14JlI9L4tzeQnaH3dOX27t/9A37db2ZfakqvxvWOtMDOkSBryaVkqLKok
         lby7JbLrXBA83QrYHWl/XQBbd+vp5Prqfv+xXwhIcz1FfR05zh18GeEE5m1Tt/Ti6D4D
         /QuVVnVU1BqXRfj4MzCBPc2YC/6wcIfz0t+I96iBMc3FwB6cNeST4yuQGTnVRGqPmA12
         IpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739132276; x=1739737076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQ3FI5My26wmUFNBpTndGOfq2Fc/AOh4z7kKeSSxtxg=;
        b=wG5iDayQ0lGafAsKCGcNa1OS4KQ+GzURM4c/gITjYQwqibUvA2BklGEzJhaIQVHRuB
         QIUD5uKQ8BA8PsZpHBjwqMDomNiWgEG8BYmcPCuqcF7hU7ecYjRorusPmXUWLRrEcsKq
         XqLIflm/eLeDMb+8Gx5g8hJw7rbKnGygFEb5tUomwloU2JztmmosWiA/ji4dBs0g/5Fh
         Yn5FP2uaDjs17NQgeYtbcxqrgR2pAQNJ9hyyziL3lDQDagOHY7zPbWUBoLdJnoWJhaD7
         9PanxF1DwD1hLGYUxm4v+WYbt7xwNoJtS7kSyupfXYPEnv0EPkmPvVGzRlh+XDCRgBpN
         /l2g==
X-Forwarded-Encrypted: i=1; AJvYcCVSBWJlMHH5Kv/lehK/VpMJD0XOd1NqKUzPNoJJijX8Af100AXqRUr6ELmQ9MquEblhBwgfYLQ7ITqullc=@vger.kernel.org, AJvYcCXKjnQbmpuy1+r7EuGb9nUvLUMiWbMbP5xo5G4uxvdnN3qGlxw+EoTZ2Hwxot8/09yWT0mqYnc3aBQdqrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlP+gLyfXtEuhJ1k7mRFR/8/6QNqyX3B2Ev6YMFSWPaN3tOCGu
	tWZ38siI6UPlECc/safm0DhhjrNW36FXZtAeslO3b7IqNBndNGzm
X-Gm-Gg: ASbGncvJjD94Z8dSp9kr2oJAzs6mk5uHGcB8G+uk0zE1K22c7rIuW02qPZZ5CLxiFnG
	NQ70oxQ4shgnsGoqUg19u//nQp9NA86jUVTwwIWQ1Wr6AA3RVr7BCaPPYU0H+JM6ZOnZr8r0CVW
	G67Av0OPZ7AzOHQsgzj8P51tP6uDo3GTOvUrNZNYQV6zcPpHGIErSk1taQtSw59OOHVeIXgF9cD
	A8+pnd19SnFmtG4BgD24Q7Neq53K95XD874CkeCtoY2ZfrrLrRRhbWpCPxwaDTScMqJGWg0hNcf
	BfVt+QcA
X-Google-Smtp-Source: AGHT+IHEvCUgNCNgyOULla4EZmbXGcZ8ZSLL0zoyT1eX4sE+csy5GJlA5rQ1umLzw4s8iGEoZTjXeg==
X-Received: by 2002:a05:600c:3b20:b0:434:fec5:4ef5 with SMTP id 5b1f17b1804b1-4392498fe53mr89889705e9.14.1739132276364;
        Sun, 09 Feb 2025 12:17:56 -0800 (PST)
Received: from arch.. ([2a01:e0a:5eb:2a40:2ac5:d2ff:febd:46f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc8881sm122153605e9.28.2025.02.09.12.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 12:17:56 -0800 (PST)
From: Dima Volkovsk <s0ldw3ll@gmail.com>
To: marvin24@gmx.de,
	gregkh@linuxfoundation.org,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dima Volkovsk <s0ldw3ll@gmail.com>
Subject: [PATCH] Staging: nvec: Fix pm_power_off reset condition in tegra_nvec_remove
Date: Sun,  9 Feb 2025 21:16:48 +0100
Message-ID: <20250209201752.66313-1-s0ldw3ll@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the current implementation of tegra_nvec_remove, the pm_power_off handler
is set to NULL without checking if it is actually set to nvec_power_off. This
change ensures that pm_power_off is only reset if it was previously set to
nvec_power_off, preventing unintended side effects when removing the device.

Signed-off-by: Dima Volkovsk <s0ldw3ll@gmail.com>
---
 drivers/staging/nvec/nvec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 263774e6a78c..9057f061e927 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -903,8 +903,10 @@ static void tegra_nvec_remove(struct platform_device *pdev)
 	nvec_unregister_notifier(nvec, &nvec->nvec_status_notifier);
 	cancel_work_sync(&nvec->rx_work);
 	cancel_work_sync(&nvec->tx_work);
-	/* FIXME: needs check whether nvec is responsible for power off */
-	pm_power_off = NULL;
+
+	/* only reset pm_power_off if it's our handler */
+	if (pm_power_off = nvec_power_off)
+		pm_power_off = NULL;
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.48.1

