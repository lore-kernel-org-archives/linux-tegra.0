Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E50F16D9D1;
	Fri,  5 Apr 2024 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326187; cv=none; b=usbeYmtL2MKiRGgu9VPMDYF2DYU/Gaok60TX5pSRmLsOBwg/goNaCIxekl7/mplWKDSAlP4UOtn1fgqwCjaGd2eFU+vwzVlr29z/QyLr2hqaNxMZ925P0MRW9blhp3UCh+4GzQ4YMwDCD8UoVVy9wX1W5j/YTg0u/i9q1v2nxuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326187; c=relaxed/simple;
	bh=VRYsTaSzJChTvdMBNpXcGLR73AaOKx0qLNeaHSg+mxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rw5Ji43BmMWJPrV5U0/HIyOuuKtdvwNlO/lYWoJZBBCpw/C3qhCc+41r+7D8i6cVv+wHKYWQV1Gt36tBG+PMDLGhN6eAAk3//ttvgum3hEnplKHk0Lr6osV0DqwXeOPqq+uEUej3uz1QpPuuHWr+9Z8ezwp6KuPbOfzqy32Bt7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=MyXdVvjf; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="MyXdVvjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712326182; x=1712930982; i=marvin24@gmx.de;
	bh=hjlqTsZmGUCzSPKxKJ/o/kdzxmSXMa6TAMz3dageSyI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=MyXdVvjf8bVmB13wVJ9uk6Mdu/JMkwHe3Dl+1uElwxdU7Z8hOWiZBt2acXP05aAG
	 2KJ2DxHIc8+MIU8F2zqe2wD5jvPPa9RKOvrkHW7gHKz+Na77z8Di+xxXG76ZXFblN
	 4GJfXyHZItE7qs+MBLG1PEnFs2o0svcCXIyUbmw1DLsRmI6bskdqSw50t5sUrBZ0d
	 XvU1Et/ESkon51Xy+g6VNEo0sPBV+nc6+akbsF0SaoQoJIiAWakwL8vuDFKH0Fk+5
	 w79bqQsDLk2OsJFJg9thPSGTEPE0PwmUrvYV19j3p28o7aEJmG0aA9gykqXI1TYAC
	 CVOFm1X3ShBffpc99w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdiZ-1ryZHM3k6X-00EhZ9; Fri, 05
 Apr 2024 16:09:41 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 1/4] staging: nvec: make keyboard init synchronous
Date: Fri,  5 Apr 2024 16:09:03 +0200
Message-ID: <20240405140906.77831-2-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405140906.77831-1-marvin24@gmx.de>
References: <20240405140906.77831-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cCeOwXOX154Syss1YXnyDnj5YnYIncCvp1uO4m8R7U2XmFFB/CR
 L/Tznw1vnd32h7+VmuLOgJ02zW+zkVzNqaxi3JIvIYRJnFZLU64ejfr55nc6Fied/9iTers
 qKIp2A+Qv7nt3IyFxIZ+2VYeWfrGcz3Tb6TT3pPNbtvK9Ogbn+zL2JqhKT98nITY37yfhqr
 rhjqjbF9Hn1A05mGKb00A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:a6hALRB5wm4=;fcbwLOwG5bMKnR/Q9f8HS0YnlOe
 5O3RHRAVaf40TFFmalR4tXKbCbP2ZAjp9RfwJ3jLkUD5kpvrxdmC9q8A+X/FNklfT3byooDDu
 kat0NAQNMZbqCWZhfUr8UJZmX+3vXzDLjllLq5OpbUiGmeTPu6nHPcdrt0zZjMGycIQ5HSeu/
 sRS7If6PTxt/GnbQ/OIJryNcqAGfRJZOCebH/dUAPJ4nTHJ5pdqZ4gLuWTpwxLvQOgx2cpekT
 3GeonRDbAn6PJhXihJ2uBoHojDwxtZueqgj5bQVru3f8Ae0/NkPPBfgWbEnR/fGCntC/2r9b8
 y36JsbB9oOrtn5H+6KWAwnG4gfi/Q2sSzJgVMT/u7SpNB7AgMggJYVB/9ju6ImGomy+M8iu9j
 r4QkWxPVfy2sqzFp09ogU4Ccp516kGu8+Y2MqUXMFrOfKHZY8levB96xce8HhugYiNtTBdBiD
 CQb243DEsJcMot+qsroNIxAAoaYwHQ3NmoVMb39plZ2UTPfsm+/HBl6sjieHRp6P3maHfl6vM
 r6iPyQd7viLzSDLzqGGzY5KUqkrPddh4RkCyhPibfCT+wgv/9Vp5mMgitk5LsltTPBzv1KeTP
 4ltF3UW7S+7Wb060A5g77xdGute8mWphUGDfr1snDtgZ8SONuGnS6yWdMc+mtFft23wnQR3f4
 a9iNFbMjHqqAiIO0E02l88VW/lyfhCxDCOgHLsBMMHiQ4QsOAMQ2gd+9RSUXbfXaKR4mlndA0
 1cjQ4kMbZjQJWeOT6easLv7M0qfVDh5zYZo37z4LiDiYcY+XcPpsNSnZaeZ2beat5Ad1fyi/A
 GfZQIm12tf78ZOemWBuR9cNZqpcn3NrC2HH6N/7hRNsTU=

Improve initialization stability by waiting for command completion before
sending the next one.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 drivers/staging/nvec/nvec_kbd.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_k=
bd.c
index f9a1da952c0a..6b203d28b8a9 100644
=2D-- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -113,6 +113,7 @@ static int nvec_kbd_probe(struct platform_device *pdev=
)
 		cnfg_wake[] =3D { NVEC_KBD, CNFG_WAKE, true, true },
 		cnfg_wake_key_reporting[] =3D { NVEC_KBD, CNFG_WAKE_KEY_REPORTING,
 						true };
+	struct nvec_msg *msg;

 	j =3D 0;

@@ -148,15 +149,20 @@ static int nvec_kbd_probe(struct platform_device *pd=
ev)
 	nvec_register_notifier(nvec, &keys_dev.notifier, 0);

 	/* Enable keyboard */
-	nvec_write_async(nvec, enable_kbd, 2);
+	nvec_write_sync(nvec, enable_kbd, 2, &msg);
+	nvec_msg_free(nvec, msg);

 	/* configures wake on special keys */
-	nvec_write_async(nvec, cnfg_wake, 4);
+	nvec_write_sync(nvec, cnfg_wake, 4, &msg);
+	nvec_msg_free(nvec, msg);
+
 	/* enable wake key reporting */
-	nvec_write_async(nvec, cnfg_wake_key_reporting, 3);
+	nvec_write_sync(nvec, cnfg_wake_key_reporting, 3, &msg);
+	nvec_msg_free(nvec, msg);

 	/* Disable caps lock LED */
-	nvec_write_async(nvec, clear_leds, sizeof(clear_leds));
+	nvec_write_sync(nvec, clear_leds, sizeof(clear_leds), &msg);
+	nvec_msg_free(nvec, msg);

 	return 0;
 }
=2D-
2.43.0

