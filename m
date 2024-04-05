Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C085B16DED4;
	Fri,  5 Apr 2024 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712326186; cv=none; b=D9v82IBMaSZOhRjE/8jUoZdpwA8CAzxZVcz4bKX/YrBQe13snesF7LOuekxBQgfgSiZC0PG78DalU28rTl2EYsWDNP33inropG8miufhZIg4mSOnMtjRIpKmV/YrYwiHe5DSy+WrktwMKtuCoaM3ping/Lt4EcAYRGfxZ4ktktI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712326186; c=relaxed/simple;
	bh=klRhGCJv00m7SX6PlgColGH4Ctrag8zmby9sPw+DpiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T31mEc6ZYSEyfsqZYLHDPEn75TOv3F/gCgd9ZtIB04t4j6oyo7gQTNB5qJ0hts04tl7vkDnHpV4Btg4X0WjhzHkrJR0Eh2dug5AuVyIGdx9N2D7uvAHJKPLM1nTjXhpQjSg2iXFeXrTidAMOeJFzO106lzKQ3yzGBENb/e0+pNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=Os46tNtF; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="Os46tNtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712326182; x=1712930982; i=marvin24@gmx.de;
	bh=AEEoH2lhqIwgbyeldl1SNRD4UblS7lwhv+VtDFHIR2c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=Os46tNtF5VrbrK1KC1ar7qyVVdEQghHsi8mxt+68B8RXT52kiv5+xp3Apv1ZrZm2
	 ZKU6fpi22uUoex6Cb6dhTjM6HI0swrfD9MZMOfeKwbDlxOT4luD8s0yF/cJF/BPOq
	 qOslIkFrNV0DBa+E5/kOHZ+AVvuKy49vX6t8qLvMDhWBXzeaebH0sKqroFZ0w6CgH
	 LxIxTYf4hY9d3EczUHpTqTlfNtrgAKxBwXTTzKm3LeQn25bh5xdJbd+DwCQrZdjmd
	 8JJYUUuCmBW5n9CjTKiHIGY5IujJEVF3utyUxzLDdqHYRCcZcjA89b3nnV8Xa2jnx
	 tYguSfq5mltdfP/hog==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4axg-1ruO9Y0GW6-001irE; Fri, 05
 Apr 2024 16:09:42 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 2/4] staging: nvec: make touchpad init synchronous
Date: Fri,  5 Apr 2024 16:09:04 +0200
Message-ID: <20240405140906.77831-3-marvin24@gmx.de>
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
X-Provags-ID: V03:K1:qFt4LwzUgpBaibvCCXbMseqyqNxmJldfl0QwXFixFEcXk3vQdbL
 +HT3ccf1PbjHG7k0NKvQacDZVTEVILQ6VeHo05XnoJz/TDL7psUCzi+KF24g/WtC3QE4mFo
 zuaEfdSgKTdpqtW/xBjfmX8nhqm+z6OuF8V6orHvegJOn9PAoryLAWgmbApl4XVhaTKAI6H
 SzDTj3ZvI3LgRNaUk9uxA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8/BMU2cuHRs=;sX+BVLlCzUb8LESCnvVCljDDr08
 krm3gnyWNE6KyIrsbYLoSkYLYAGAgvKr11m4alofZLJuHiy0ToAdCBm3q7XP+d33l3RR8V01S
 aChlYGyFvL8Ip3+zg6lb6PFPJHJ/f9YGcmNpGG6bipLRD2vfIOOUIOP80wmbAXyr2Arw1AbUu
 XHoXKjme5sUFU8UG9/jYcJbN9j5lpL7d6nJFRoggdmXGAhzzAcmRv7LIMLh9NY5gkwH5h9DhD
 Qnj0Ktfboc0TF0bEIyB9VuFaquzaOL70tMlV/WGg/RV9exKwWBAtbppJROJuNvDRq3PQcfL6I
 gntgC4NAgK/avNS3iWwGtifQGRrRWmhOp7BcoIy30c4YYOtXjszC5gPTUE/eWEASp2XAi8xj5
 2Irrwn/NnNkcSqRJ2W9RcmFsORCenFVJZ7fGYm5iB6KgrOTo3OaZbtGtO1XjZmg3BrW09Zc5W
 Zv7GnOJAsgzoV/oZ4sX8WyPEf6/O5actCWA9CKvhOvgt3aXtqAbAnMsrpDLUmy7FqT4XyCY4r
 /xL95OwaoTkHcnM6Zb+6QYJvtd8Boc4JAduNU6zTBmquy5PL+rAmHhukHUoebuK21eNM1Prda
 GvnOeHsWF/FSGTJ/lijo1cU3In2k+egANct0Q70P9LnEZSoXu/eo6tStvu88ndpFvHNYZ6sKK
 Bk2ziUXWTaIQLEqfn70bF5IyXuiWE3XrJo0uLn4v4u73VBr2j4F8qmNerhsrIoY22brI3kogy
 jgT11dxX4nSYqtUe+axMyvwIGfCNk4qDGUB07fN8pGGOQQawaTiVl/MBFOzI2mk/ZbX4Mix6h
 8J1+/DIAOZ+M/IQlfgchV01HK/fsu9Sc8R+KKcHezd4WY=

Improve initialization stability by waiting for command completion before
sending the next one.

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

