Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8770178C60;
	Mon, 30 Sep 2024 19:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727723470; cv=none; b=JKRogjA8x/Gg68ZW1y40qvphbnf43B8Z3H6sllMmzpov8mtd1mLiGkLuAuz+/W1rpA1zSr89ZFRusZrhdr5gsN/XBHTYY202t/l5B49zOUTUF57cZrg+9vc9tvPGyDNEf0p/+A1PY68kf/quQhoqbqO4F1F8q8/Yigd7XjnchxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727723470; c=relaxed/simple;
	bh=qbmrI3OdRofUX7H4fimrZ7tT8NzWBs0d5LqBRpN/82g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qPNJbTqqf9CeOJH2WV681K618k2PXaupQXMg3QvICfVkAKdNZS+s8SLYe1b3/r/w6drXHgsZtiE2jSXMMVsM9w8HMaxvYOuIld0grR9IVvzAaa1x7v6RxoZSO1JfBbGCCfg4BoO87zMrd7V5ktXaTTH3OUIFbyQPzTkUQjCL4ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R30OO+W6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R30OO+W6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b86298710so12715115ad.1;
        Mon, 30 Sep 2024 12:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727723469; x=1728328269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCTSpjE7HL0LhWw7HAwvpibvAomrawMsBzaMkMKPJCs=;
        b=R30OO+W6kesb/yKI0s7YFwiGBm4kz4kzPW+9udxmeXhKPE9Oc9LMzoMHSXRKmTD9nP
         ZNwKYySRZhfl2iY7htLNlvPml4bn7rhtc76q26uS5bNlKmAcRXH9AgivC57fIQGWFweO
         xdhH6U3CoDhWazbbrexR/jLR08yvR2t8yYV320ycxJ9av2suWlVPTquiSVLGIi3ukPbD
         kt2ofQO2gLbHygaE9sr2RArp7PsKfYhAIMqlEzXC6WohDTuMczpjiVgKHHifGhvQKkTT
         5jGJmlCjGW1J4qtXm9AXYg6dIF83hUbS4EseMTbUVr+UDmnXbnIJbsvQFgtTayZ7X6IZ
         Xw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727723469; x=1728328269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCTSpjE7HL0LhWw7HAwvpibvAomrawMsBzaMkMKPJCs=;
        b=TjWfx32+q7XpBaz+W4SkDv34gbxF20ss+LuaEN492ckCx7VDZUMEy3zpj19Rx7STVd
         oT1g0/wYQuxSyZWY/lAWWLpreQeMXfu6+ETeuMKBkFBYd4Tr4mpx46VjJeEI1qLTPjp7
         Ii5z6aahjX5lqNtVGS/WfYWeLiXlVAc6FL23Vrt6HfGpum7Rby+5pKBpyWw0QAKmvovo
         oynm0eIY3XAd8LdrqAoSCMsDryKqbIs8pLT6+HEtD2NYEq9odbNmNsmLv004esve0xIl
         kjA21G26HmMDqzZjr12zd3s3B3I91VMQ4b+QrkL8l784gHAgsKeTQdW3KBJPrdzrdCKb
         Fpmw==
X-Forwarded-Encrypted: i=1; AJvYcCUFzoFNG4fqZZD2L9RutRXwfzQpX2ECWiMt15jDUPqTLrBpWSzbcPyBXWzvlAf22cNkn40LiuovDxBAj1o=@vger.kernel.org, AJvYcCX8/11gWK33i4nWRSCKjUDqTqHGBrNX0OzghRQd0DWxA3UCPVpNMp8Ka2yYFvQxgjAs3AgR6c1tYbemYrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YytTTCTe8Hwj+UqpQs09UhiEITqX05ioQl45f8OzLnBuTh8W3mZ
	hmbLfGz+ohbYPJ6Kazf8Y8fTpO0qWtZeEqJBDPbaK96n+SNJnTn8
X-Google-Smtp-Source: AGHT+IGPKqgmSCwIUXXbGEMtmjlMHyUWhICIzjtK2cewowvU+9I7L/QxmmbWD2bHNlk1OGpGpmIQOQ==
X-Received: by 2002:a17:902:e5cd:b0:20b:968e:2585 with SMTP id d9443c01a7336-20b968e285emr37146775ad.6.1727723468585;
        Mon, 30 Sep 2024 12:11:08 -0700 (PDT)
Received: from ubuntu.worldlink.com.np ([27.34.65.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e5fd40sm57598175ad.266.2024.09.30.12.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 12:11:08 -0700 (PDT)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: jckuo@nvidia.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	nkristam@nvidia.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: tegra: xusb: Add error pointer check in xusb.c
Date: Mon, 30 Sep 2024 19:11:00 +0000
Message-ID: <20240930191101.13184-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add error pointer check after tegra_xusb_find_lane().

Fixes: e8f7d2f409a1 ("phy: tegra: xusb: Add usb-phy support")
Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/phy/tegra/xusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index cfdb54b6070a..342f5ccf611d 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -699,6 +699,8 @@ static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
 		return -ENOMEM;
 
 	lane = tegra_xusb_find_lane(port->padctl, "usb2", port->index);
+	if (IS_ERR(lane))
+		return PTR_ERR(lane);
 
 	/*
 	 * Assign phy dev to usb-phy dev. Host/device drivers can use phy
-- 
2.43.0

