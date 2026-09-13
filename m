Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0B30E0CC
	for <linux-tegra@vger.kernel.org>; Sun, 13 Sep 2026 04:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272644; cv=none; b=GXtJFsEyrnPwzCLXsXKJwaaA6Jh+f1MXxkYMqkCFsu6Skzh3yPOxRJu0XuERrohm39aw+PGqLpL1Wf4CoCDgqhmlayyWpUbDYCY4fKMBZ0mN9H73BkAXHy8pNIuBnJmOdgxxp2vQrTI9nqPG7zMmbMZs3Zvedh71hpalRnWb7O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272644; c=relaxed/simple;
	bh=q70lBCJF9U8Wv9pSNev+Rilr/PYDCEDGEVWmQL9R7qo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OKHU+tJzRfoDyv/wHO+zEY1w2xh0Rw3Bl83n1cnJ+NrYSmQkeC/qapfN1ox/7dyhDrbM2sTviZakNC7bLir3C0darH419f4AG6aaWGfj7QF8NKCV8uHt4ZeFIetTYOt0f9n1yQCYUnSdKVTJ3vCFz/JieH0hXfUE5cu73ci/2WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA/YgI/L; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA/YgI/L"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so18538876d6.3
        for <linux-tegra@vger.kernel.org>; Sat, 12 Sep 2026 21:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272642; x=1789877442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LdnUVZ9fGnxxypDVfl/aC1u8LA5L3SFgGUxVp+gDyPI=;
        b=BA/YgI/LX8qY2e/HXaOWFxUY8/TQCfPDJXudwkboXgVFDCbP6vkykCYAJyz2VUKd+e
         nQwruyyxF7x6OK2uNNvFSaXXNYXKM1tykIJlhlyguyoSvcHpCo1oPewNEmtyA4E9aFCb
         Hh0f+7U6MKLq8Xn8bQAH6JtIBE2Zd1iSDOFjDD20lzC7ydYCXUdNcPilScTKocTt3Cy0
         I2M7rfj008J2ZsbtrFSJblzVlWNzEGQlFgBxIPCvmMOxaarDMBRrQgRBMatDC/XuH15y
         303IZKs+Fo6rS3gClNgspR6EacP3GXrWtD8VVgyKSYVUo2BsyYwl/+MKxhqr+Oa+H3TL
         LB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272642; x=1789877442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LdnUVZ9fGnxxypDVfl/aC1u8LA5L3SFgGUxVp+gDyPI=;
        b=L9/luByVh9gHzSHVaMdQFfYVNGM2HFjxGI6tHPULQr0GV9sc8z1mpzPyL5fB1avT4Y
         dDge1zmxQf6cRKXu+wrI9uaU/2OZiQXTOZH6IsJD3bZU17nd4k7Jb52G6+5g72nOaLQE
         tV1U2rF7uKBbGZY/JtBZS3oWpTuxBkPWGcZN1cm0K/E7u6gHm3bHe60+wd6aSxYyCuvC
         xw3kXOOxbupawPgOUVQug2RFxYS7ClFDO1RD6poLSqGL6mcm8FIak6SA2irKvrMIpShk
         jVf+lKqFwjBjK/ejjTYEEwBo9ggiPkv9MKvVfBGPIVjkH8urQcbge6cfMEAg8NwUbwsN
         bKJg==
X-Forwarded-Encrypted: i=1; AKwUvBzJWHCGGa3daGwmWagKDnMg73JNjWp05BX51et9Gp6W5uRtJPd0i0Ey/ar/6fIMpopix5kCxKWI/PpHGg==@vger.kernel.org
X-Gm-Message-State: AFuF++lh+93RZM31Ff20earx8yzy8i703RtX2cJJrQyYFEa/tPDNXpSX
	uaZSSXEL03DaC/g1bpBUWHNRL3cK/K7Buklbz5ENeCUr832yK3m8HLg=
X-Gm-Gg: AYBFou2/PhL2JC/9YJiz8iLsPDrsjKZVWg0CFmOYsVXRWqeoW7TUCq+QOMD6Td1kJCh
	//bt/0//mpMhqYdg0TUTSH1y7KjwqIogqaPQnQkVstig3XQeJknqg1mXW+BCXYGvXkuXo+twzAQ
	+undPhnerEOznri8AtHPV8N3mjBMYxiG2IW73SvU2KG1U87XhunNknT1GDV9rTzUwTwamxJORNr
	sbQt467SV2+XxmK81NobLJhXX/4bN5Iz5b2JsAxEkqkDWQEEGcjOsjPSc0rNY4bMPrkjOUYq8e5
	xUzogTwE03eMq4wnrVAv6dry4USHJ4RmpjRwguxty++FIsdMV8CeAK4oxFt3llwgT8431r9H/nv
	xPI3KHDQUUK1ZEIE5RtTm0gkTtGYEl0WaxhZyI7/P3BmlTIjpwsBKX0g+GnoOcE4N5BWM6IQ2B8
	S1nAW1x8JOQEbRRN7tGjOsWzrLWTQND03cYB/7eU+tLGukiVrzhQEixZsoff8cZE9nu/j9ZIm0w
	GzOCdDbFpfplUN7PDWcRpW00YhO+DomDM01dU8PLEsXOeclhyhGYTtSInc2PVYTYYzye0jnHKtC
	y+m1QWCXMojuAeChOS/OZ6G2P8LZLMQBfw==
X-Received: by 2002:a05:6214:2a47:b0:910:706b:6a73 with SMTP id 6a1803df08f44-9121206f50cmr172281656d6.5.1789272642083;
        Sat, 12 Sep 2026 21:10:42 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45a780sm61544396d6.10.2026.09.12.21.10.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:10:40 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: chipidea: tegra: disable runtime PM on resume failure
Date: Sun, 13 Sep 2026 00:10:33 -0400
Message-ID: <20260913041033.25144-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_usb_probe() enables runtime PM before resuming the device. If
pm_runtime_resume_and_get() fails, probe returns without disabling runtime
PM. The later error paths reach pm_runtime_force_suspend(), but this early
return bypasses that cleanup.

Disable runtime PM before returning the resume error. Do not use the
fail_power_off path: the failed resume did not retain a usage reference,
so its pm_runtime_put_sync_suspend() would be unbalanced.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 8b85e11c1a7a ("usb: chipidea: tegra: Add runtime PM and OPP support")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 372788f0f..26225b034 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -306,8 +306,10 @@ static int tegra_usb_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 	err = pm_runtime_resume_and_get(&pdev->dev);
-	if (err)
+	if (err) {
+		pm_runtime_disable(&pdev->dev);
 		return err;
+	}
 
 	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
 		usb->needs_double_reset = true;
