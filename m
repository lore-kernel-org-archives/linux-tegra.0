Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4607282F0E
	for <linux-tegra@vger.kernel.org>; Sat,  4 Apr 2026 07:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775287621; cv=none; b=dYt5eRKXe20gtcqRr+6Wo5gMAZLeUlZznBZXHC29oTCq6ZqpCp22qcPGCwyBVnFQ/VaDKsv19sSH9ka6mQD0AhT49YXLCDcVsP1JbcK3auH7yo89khBav39AuZs+QZRbhMhevSxf+oNff5qnEm5D76sKhO5zl9e7Nz/wLKZk7sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775287621; c=relaxed/simple;
	bh=sb2fmB993ebXnCnaEuIeIRGemVRQkR1+ufsm0h+Y+ow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ci+giPVhXiX+qjdM6Jpj7MoxrJa6qjg198sEx0gyZTRDmPrOEeWKQt9VDVMG/4wE8WjcR8/nR3ciF2XMoGcr+oTGCMsJKF94+cB1dVlEgCyZPGaK6ItP3U5sG4mkIr1AFskcn9+ib3dJgifVvc4t/4+l+6xuUpGqqAWt0X0aMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVMReIK9; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVMReIK9"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35d971fbcddso1456936a91.1
        for <linux-tegra@vger.kernel.org>; Sat, 04 Apr 2026 00:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775287620; x=1775892420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nj5Y/SorWLtFN0bUiCoURTSzeOJOZqdTnQqo2WBg2NY=;
        b=FVMReIK95wvRLnk/JlFG2W+y9kkFW6XzfwrEPMYY9SCU41aT/klEQVgCeA2m9nxl9K
         9TniFBLiF7IGwMGdsv9AAPxPhBWKrhZwsKJ6/ho4jqmAxqg3eAs5crV5JFiguO35CBak
         5aPa5NenYXIzMGHhFGlZAykea3CcoIL7AQrPxv6eW6fzaOsxgr5LbnmQltaxs7J7e0A9
         Wc5TQ3NR/HvcFzUduTvuDY8rggo+yqeiLi1jqeoqD3efHV9inpPOpww9X6+G51DRH8Jx
         4pcLDZAeoD3VH/7YqmO84/Edjugy+zmiSenkDI3UZQNCcpNEgzFyacse1Zcbql+wsPsP
         yXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287620; x=1775892420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj5Y/SorWLtFN0bUiCoURTSzeOJOZqdTnQqo2WBg2NY=;
        b=WqqpjoLVeS1YSseNae0Z1F/WcKcGgxMtcfp1AVcKBRErPTn0UcmQQ67WyMHgrVam9F
         jyrIVzBne0m4qvlEKdtDEExWi4s6RoqPg2DkfqZUu9udYt5QzJe82lG1BtBO7RqUlz75
         njsxUy/JkqJygVBSMrTSoQqg+5GEd3Gn7J2r1RgGUT/vdhbw4r5YDTwBF59RWkMkCKUu
         II2gUfpnStAGSS50ddP5Ezv18UOyWqIjanx+Ib0QEalqBAZftHFVD+IEw3dUYvRKV0Xf
         dBT5Sxk1BS3V2yD16+dokvZgkIJo94dknUJpqnJeDd0xnMVXCUGsNnD5GjRj+r0Ix4JR
         +x4w==
X-Forwarded-Encrypted: i=1; AJvYcCV9YVGBYnfoeoynqEt5LWM95hHdOh7JGO/vzhM8adaXGQeggxxQ02VhQBxljGzDtw+sIvDDelEnlQrimg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhAdV7Gy9laK8jWbTxuG7ildLdWv+6crsXXmzjWpxOiY/Eom1q
	aU9jakuZi+vlht1NQy6yh06TvuNpfFNrnrozpVMMmbl984Zc1E4bceKw
X-Gm-Gg: AeBDieuBbo4O7cF5S1OGkWBSNVAmryg7IJ6eM5IwwP6oNHlUIchi+4Brvuki2GmUOMJ
	tdnojxQXfYa2dZNvqLBFLfeqWjrInk5EI3uFvJXWaY3N33KDcXj7Ssj63O89ScYuLUQgKMpSsF7
	QfwPCNX5d3Zt3XG7FYfNAe8gBhx8Hjo853CN0yAMGlKkFn8TxCB4zk7j+fZ/fCjzi5tDC0zbydL
	Sn3pDhUTSStvSOU/W/ALh0A7V+5zNeWfibHop8yyHok3c7T/3Wy6hmscyAl3MtznskyDK6xArYr
	u7TlKmCLUddzgD95v1KykQAzLExDWpVvEG+cpIrHjVYDcXQEV2IQpKXXXPK3F5wvKhJ+cXBSXqI
	SWjEsq8f+CiynXSo5afqhlBI5w5fH0io2bugS1LGiBZpe3kKA84WeLZE8oKTAwo4zRghFmYI1hT
	64oo3mNbOh0ibb9TyRXpMKL9E=
X-Received: by 2002:a17:90b:3f50:b0:356:21e9:73ff with SMTP id 98e67ed59e1d1-35de5c3d5b5mr4063529a91.11.1775287619979;
        Sat, 04 Apr 2026 00:26:59 -0700 (PDT)
Received: from fedora ([206.84.225.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f52c8sm7250956a91.5.2026.04.04.00.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:26:59 -0700 (PDT)
From: Paarth Mahadik <paarth.mahadik@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Paarth Mahadik <paarth.mahadik@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix logical continuation style
Date: Sat,  4 Apr 2026 12:56:26 +0530
Message-ID: <20260404072626.134642-1-paarth.mahadik@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Logical continuation should be on the previous line,
move && to the end of the preceding line and align
the continuation with the opening parenthesis.

Signed-off-by: Paarth Mahadik <paarth.mahadik@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 0191a943f0a4..f47c9d079e70 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -10,8 +10,8 @@
 
 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((media_status == RT_MEDIA_CONNECT)
-		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
+	if ((media_status == RT_MEDIA_CONNECT) &&
+	    (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
-- 
2.53.0

