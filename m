Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635F3652;
	Sat,  6 Apr 2024 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712406700; cv=none; b=ppF3NahQGhauGBwCn7UgYQeCCLywcTeLf5K6SYjRzHMHGXVNg38lFAJO6aAgNCQXOIE8UQhvZlksPcW8LOx3kytHfaLory2pp8XlvacqhG8p2APZRWYJwq6V6xbaHDSDcIGxeFrcfxxMjYUj6TkC3i8tq59WfOJdk1K6zepSH04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712406700; c=relaxed/simple;
	bh=z/2B8L75ElAdlZu9/d5OQo4+Ma+flVQgNOWf1kdi3TU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyjoGBvndsHSK1jRGqpQShiqMwm23iOHIdAGfMSnPy44kLLpUIiAqnG+SGn2MilClT9C0LVjZeeL8QCuuTkMLWC8QiDhUFg6RostNpIBeGFxXiDauGlMW9oFsmQK79bWeBh4ClCTGoaXJ+J194UV3RstHaKqgall32G2aGFBHzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=nq0YVb8u; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="nq0YVb8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712406692; x=1713011492; i=marvin24@gmx.de;
	bh=ySJVgxfVsG9tqUI9Cc53ih2r48axjGHjrzWApTXISgg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=nq0YVb8uxoYTO/bnFH4rgPi79Tq4rDI6ZVCnY0bjJlABSmquls4ou8x6C0E4ns1f
	 JFVE88akYSckKG5QA0MPO0z2Y5Oazvk62QEoHyRINnravFYNg1smrV49tRQULj8zz
	 byr9eb9BRCd3oBb/B53SKvvuptQwZGSVKAGWEyABIoe2E/8GcCXea//ASVRJZOjp0
	 zwbFOkssS4rt46oKrcFtRQK33UlQZLMIcsQTOfMccQl9okqf+qwLEHaqIivlV2h8Y
	 F0GMsFU7nDQKUjpivBaLGPo1DSW8ninoXTzFuRQfvCsrOdbdi15+pKtvlaQEwwGSR
	 D/qQ6lpTvHQH+Zg2kA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXp5a-1sINS40Ojs-00YAD8; Sat, 06
 Apr 2024 14:31:32 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	thierry.reding@gmail.com,
	dan.carpenter@linaro.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 3/5] staging: nvec: make touchpad init synchronous
Date: Sat,  6 Apr 2024 14:31:21 +0200
Message-ID: <20240406123123.37148-4-marvin24@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240406123123.37148-1-marvin24@gmx.de>
References: <20240406123123.37148-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A48dcqQpIxD+tNmxEf6Ktc+3AdevQkFGzMugU0qYIRf2jTbSXAB
 ADrdeQQZO/26raQfyi8VRU9x6Vjv+Q/vaLamctxewuLnvwEx5k7rCrG/ljTVsuMA8YX69sV
 kmJu4IDEPAsSCIvyMaymDQ7e6VMKeIff1snISYu22E/2iClBygDBFcx1p/6leOgIWeCVKxz
 h4nE+myyack8+ecijOK8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IOUV+YS+9ig=;+avWqWeBCzXjhGfi9lEu+jZZy13
 RRvAu5K9qNiMLrjMVJSMFksB8CDuFgPB52lI6N1HDgVVm+ynlRmIbnwQz0DzT1nidUgoIHVUx
 lQy1tGgCn1677BQPpOWk1+L6pbxt9YL6cwuhs9FmaMveAct9eY2RsvE1IhkO5WVsBi5sG0Tdn
 YoBEvIqHcJh63TT0AlC5+rDUlDfdfUqQ4mMKvgZRi+ioFnxJY+SVz2BFupyodFkWUhA0SkIfk
 530SfMAsb4rGOgCbDJETQcqgsX/qmjqqilaX4whsqoccmgaVLc/sowutYl1gkOGZjct5s6c8+
 mIZzfl7DzLHdlsbP3oepYFL2fPEc/UcTIDWozkxQGi8wwHTdj49VU1GUhr5gx16Jam815bRsY
 H2LB8tOaaUWskn1+QdURLemoktBq/Iuv2SEw2YWVKzV4YZJ126GDZUCjO5GqEAPkQ5RpFb+8X
 ndYxlzqzYE6kAZyi9uyZ2elehiRuG6zzNN+9Ab+q5PAfYbooCgu3vs5/QMtvcDe+A8LYBjkMR
 as5f5239aiy0k6krCy94B7sbgGusfBo0uK5clklw+rYj/8vP/DlOogH5mQUP2rJgiNf7r9Zbi
 ETzbdjjdlCKl8DZBE0EopYiNXYHh68XJJpmXxpMrdpJARXhPR+rMypOJ03+Aa3chv0AzcdL4y
 G+W13ifsg+XpPqqn0bHvRxTEAwve/4a15vRMDES61BVfLZfZZD1PYA15Utj+o9PPKj5EhDuVU
 k86X1AuO32uiIaqjNKzsCu2mjfti/x04fv3kQYz0a6C/HO4qmD2jaXMeRwJiRpbxyeaPXK7g1
 vmYklPMVTBYnW1kQe1tN4UREvevwrY0RmNNMCvvTBHQAg=

Currently, we are constantly sending commands to the EC without waiting fo=
r them to be
executed. For the touchpad initialization this only worked because we were=
 waiting 200 =C2=B5s
between each submitted command byte, so the EC had enough time to execute.=
 In the furture
we like to avoid this delay, so we need to wait for each command to be exe=
cuted first.
Do this by switching from asynchronous to synchronous command transmission=
.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 drivers/staging/nvec/nvec_ps2.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_p=
s2.c
index cb6d71b8dc83..f34016c4a26b 100644
=2D-- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -60,16 +60,6 @@ static void ps2_stopstreaming(struct serio *ser_dev)
 	nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
 }

-static int ps2_sendcommand(struct serio *ser_dev, unsigned char cmd)
-{
-	unsigned char buf[] =3D { NVEC_PS2, SEND_COMMAND, ENABLE_MOUSE, 1 };
-
-	buf[2] =3D cmd & 0xff;
-
-	dev_dbg(&ser_dev->dev, "Sending ps2 cmd %02x\n", cmd);
-	return nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
-}
-
 static int nvec_ps2_notifier(struct notifier_block *nb,
 			     unsigned long event_type, void *data)
 {
@@ -98,6 +88,27 @@ static int nvec_ps2_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }

+static int ps2_sendcommand(struct serio *ser_dev, unsigned char cmd)
+{
+	unsigned char buf[] =3D { NVEC_PS2, SEND_COMMAND, ENABLE_MOUSE, 1 };
+	struct nvec_msg *msg;
+	int ret;
+
+	buf[2] =3D cmd & 0xff;
+
+	dev_dbg(&ser_dev->dev, "Sending ps2 cmd %02x\n", cmd);
+
+	ret =3D nvec_write_sync(ps2_dev.nvec, buf, sizeof(buf), &msg);
+	if (ret < 0)
+		return ret;
+
+	nvec_ps2_notifier(NULL, NVEC_PS2, msg->data);
+
+	nvec_msg_free(ps2_dev.nvec, msg);
+
+	return 0;
+}
+
 static int nvec_mouse_probe(struct platform_device *pdev)
 {
 	struct nvec_chip *nvec =3D dev_get_drvdata(pdev->dev.parent);
=2D-
2.43.0

