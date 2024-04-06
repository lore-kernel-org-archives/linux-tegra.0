Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54F09445;
	Sat,  6 Apr 2024 12:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712406699; cv=none; b=rgIhGrDujmoO2xfxazV6bpsbgB7j27mABycUOYawbpfG/dwzRYIwyxBSrrD873q9ymmIZGp0lKshnA6/YJ+rh6NZKzqlCpoIGrCWnxEsifcRSmzivNSG5wOG2S3lry4KDLmXngOxhRLLZEvc2v1m8VbQjKNjzWaYq6jPX2/Tq/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712406699; c=relaxed/simple;
	bh=e109PeeQY7ZkK9ns8M7H81yb1RyzVLkWxLAiSRGQzCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aCCk6LaoNfWJjA/jnu728V4eJXytBaea0xjY6ui5KRlH6wsUyYMjTy8Bo5s9ecoKC+Cb3e65b89rXkkq0byGKAjqnazaebq0fTszEctmqjnHyujfY6P37AITpalhQX/3hF/KCOlIdO8EUAHrsxUaoIi3peHU3dOW0bcF7f/ljq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=eYTwZLMI; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="eYTwZLMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712406692; x=1713011492; i=marvin24@gmx.de;
	bh=YOMRQLk+64/GEb58pUDoVWXe+lIe5RngdF3c37ZYiRk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=eYTwZLMIHI46A6pFuFlgDCEQvjL45Y/xXY79fpx5nNJupDpUfbUqgTWQjJ5E54IJ
	 /4HYdSM9aEr7DWqhU9+pcGo7bDA3eZy4tafF2tC6FvZ5MDoh8inaInp6evUZadWT8
	 BSY/fUyTSOLjm3ExFC1HLljgluLC97LG7rSmZZEaUCscgWZdkN+D4B/JZ7SHI4eTt
	 mtO0h8TLroXCzklwqRaSXf03k/VrFW1SZ6aoz4c3zXmewPrtv43Qzw8aWEc5OfKqz
	 7WtXmfSnvFz7IL2M8U6GGI9+tXMLmj8Z0FZr/2Js0H72stM1olqyAHxUJLPencEFT
	 T7DdVOomD3E8paHExw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1rxXBD3c6y-00DJwQ; Sat, 06
 Apr 2024 14:31:31 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	thierry.reding@gmail.com,
	dan.carpenter@linaro.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 2/5] staging: nvec: make keyboard init synchronous
Date: Sat,  6 Apr 2024 14:31:20 +0200
Message-ID: <20240406123123.37148-3-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240406123123.37148-1-marvin24@gmx.de>
References: <20240406123123.37148-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SjKeThz53C/GTxuuiUNzkvMaJfiPuLspShHGtg8GNJWImL+nGWi
 dVHJJEz99khIKuykvKWu5Be+bdTQi6TNKd6Pk7Ps5N6135V/RCGGs7XZpTN6gHC7KerHnEj
 8AQ5eUKvWoK1ffdMhA+Uoz/2o/tmNcUEZw1T9B4b71Fz+Am7qJb9kMuSJgF1lkqRSch6Wg3
 lAKoTkuO2PP2BUGOFKyzA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lhhkze1z5x8=;6p0Fb2gIpjKO6eLK+4UMzvu1Led
 lNarYsz0jZlavCuQklzJGEhgP393YDiUNJb+hPeMckI4wGeJ4YVz5s710ZkSuoNwmwMhGz3JH
 gAH7VibmJy6Yi8u4Bi9ISlgQQS3oSN5ZfyzL8AgayG6ZkcPh7bz/pzBoIfcSOY1zKgBvgtS8b
 m8J9kfgEi2g5Swkq9O684djTO4bMr2BUvPP8kE3XOLTHi1uAMYHmX7ZyJk/EGiREv+09ZvdQC
 spFwx/i3J8KgmGryCWLlYeJ3pmNJjOvUo0asUqJmYHD4sgc9lXGesd4TXbSAjMS1o+arr7qVz
 H0gnNH+lE7ebmxoVLKv5H21vjjA5yDvk4bMElMjMuLteD+BzOSdKqjdb2KcyIAjP1LlK7ArxZ
 N8oa4L9GFX+HRbjgo1DG/3knQJ+0QpDZlVvAOLa5foWGaFPQGPUkws+K/jcj4BDdwPwFEDh7m
 +SRQd20Wf4KelAucqMAMpfDFzCanxp1xoUZwXXzkJawFc6Zsop5nKxtuZflWCQt1mq+g2KnY0
 11e1WSzrcfmVvx/emWcLap87KivanZpEeJCr7PabbNWbZHlRsvYE2qxDKI+dh5mgbIpC1/qTA
 V1ZAZ0n+JTduHFsxokhPE4FgTbYPQ6Sc4G/Sk95HiJ0MDmg1e5y9QuQckBdK1vEkt5n7wKi6Q
 6qwYCR+oapj5UmSxnrCj2fZTktlrdTFsqZfOA6zFNOKLwCDiT4m2xoeuoc/Z1I9uaWl6Mrmg4
 FRCGbM7beAaqEVnxcZdNMJXpNyhFVnLS/ZSYhovBdBYlj8+MpyfAiPCIM7G2fbOhDGJuDFQrX
 /a9ppDSH3GR4Z5ezGXCnXkdj+y7Rvf1fyGhP3Y3qT7u6k=

Currently, we are constantly sending commands to the EC without waiting fo=
r them to be
executed. This can lead to confusion, especially if we initialize several =
different devices
one after the other.
To avoid this, we are switching from asynchronous to synchronous command t=
ransmission.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 drivers/staging/nvec/nvec_kbd.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_k=
bd.c
index f9a1da952c0a..d0259c80f810 100644
=2D-- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -148,15 +148,16 @@ static int nvec_kbd_probe(struct platform_device *pd=
ev)
 	nvec_register_notifier(nvec, &keys_dev.notifier, 0);

 	/* Enable keyboard */
-	nvec_write_async(nvec, enable_kbd, 2);
+	nvec_write_sync(nvec, enable_kbd, 2, NULL);

 	/* configures wake on special keys */
-	nvec_write_async(nvec, cnfg_wake, 4);
+	nvec_write_sync(nvec, cnfg_wake, 4, NULL);
+
 	/* enable wake key reporting */
-	nvec_write_async(nvec, cnfg_wake_key_reporting, 3);
+	nvec_write_sync(nvec, cnfg_wake_key_reporting, 3, NULL);

 	/* Disable caps lock LED */
-	nvec_write_async(nvec, clear_leds, sizeof(clear_leds));
+	nvec_write_sync(nvec, clear_leds, sizeof(clear_leds), NULL);

 	return 0;
 }
=2D-
2.43.0

