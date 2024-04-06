Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636122B9B1;
	Sat,  6 Apr 2024 12:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712406698; cv=none; b=VcMfSUvUkJHJWASBTZ7zgveuUPPZqY2UgA2LSRdEXJ0tJoTy/CElQSxzoefWPqQkXCsA+j/UOwiFWHfEENPWvXCSTZvVbud3VS5d35ycn9Y9jy7HLRwUGCTmsRRqQle9IXJ4CDStaK81wSnhCfmojKbgOHsQpVhGx3/5XHwoGwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712406698; c=relaxed/simple;
	bh=7esloikEOlCjR6lSKP6kwfl6x7P4OR1CJJRXemyk9pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tcoa3WBq2GUFPxtEAUnd0cGBEz3hG+hmvoKAG98/mbMnOkV/5Io+ZkM1T+c2u+wgznwVXMLF/x2X/7ldGlDGV8dtaauQB11xCjq2Ks2eB3HEf/L+8VCtlhgnkYd4C9T1FhUBtmy01rDOfcXJZnd2qd8FW+jCAD6sM6wUh6G3rmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=XHcUZVa2; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="XHcUZVa2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712406691; x=1713011491; i=marvin24@gmx.de;
	bh=y2Pd4sJ0wVJhVwOZ/lckuMsvsyUk7C/yT45pxyRJf+I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=XHcUZVa2+JCuhoKxbM0EitpWlm+7ojuDcVuHGzsClCxBS4MN8A9K5M8t5cO0mQ/c
	 9H9udv6eg+XSaZrsUerUXuybX21ViWaCnnShhC0cLIlzzBRBtM2A8VCwFhuHVLwXT
	 f4RVtYsQhhjo92XNMvHBJqB+EtzRXz/eXBql4jFP1AAjJ5ZBYroM3IEf1bY1ypaKr
	 QAKS0ZJJ1DzXyqonv26hKieOhIGSDPrJnWd1E477fp6SZkt1CWkOKcVT1tQiR5cFH
	 r5IFK6ICazYUJcqhG9f3xu3vTEMaaAqupqkXPBgWrXQxn8uOnb/r8CLYh8HuP0WyV
	 cq356qNjUCYrQr/nsg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N6sn7-1srzS82kcZ-018K6n; Sat, 06
 Apr 2024 14:31:31 +0200
From: Marc Dietrich <marvin24@gmx.de>
To: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org,
	gregkh@linuxfoundation.org,
	thierry.reding@gmail.com,
	dan.carpenter@linaro.org,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH 1/5] staging: nvec: add ability to ignore EC responses in sync writes
Date: Sat,  6 Apr 2024 14:31:19 +0200
Message-ID: <20240406123123.37148-2-marvin24@gmx.de>
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
X-Provags-ID: V03:K1:XS0aOK44tsPpKgaciXK7X20/Fq2UZNMTAXWB4jeKxS8c8txvDTy
 knyW8evAq1IzLojR+Sfqj3cLp1EoVA9tm6RPUy9XEKG0SbF72U1Puf/NESQ8JASMjEZz1TV
 rsAXA064P7LTpuC53WfI19kHpwH+GDvZx+xZBg74KphmfdBe/Rr9ZE7MVNhCsd1hcWfI92y
 Kocc36RHjnCjGjEiRnnSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CHWLOaj5IYY=;75SixANPSCHxmHRDY7bO5FAPbpn
 VDBtJxFnsENQvDz4NCRyS1VQAMA3npiLwZ3SpXRe1HU3ABqCVPlMjjCoTVKgXvzotbST+4lCH
 5MRgxPsu+hA1D1wCtpXmuW44dYzsTjRxYfyyEFFxPeHH+NJahaqnIiDkFbMpMi6jPd45hJUvg
 crIXpcWo/KUY/BQtBj1AObSLd4wFldhB8x4Vx5vCnaJx8UrqNoKJldUdAT1Ay6lXax0X2cj+X
 EdUmJcK/PtuwRrtS3s2JAKS3Vv0b4mE2+yAs8sHbDdcdcEa7x30sQ4z5Y/wbjnUoJBhDO2q4Y
 U2s/ef4SL7Y60btSsjvvslsUo0xwtbb4avVuC4GvUYIMnTApCB1fuOlJyf34AwdIqllu1qiux
 Al4KyJl1iwzQXVDrMNIy5JG1YN8+KCkeYaPttMdOyOZteQDPJlWAXE6EjzHbJuzvH2iDu3KaY
 yJ0p3ERpmbIr7OR36jmEH1SVIaom+CuJUbfM7rDRQAvhp4Hozb0C+JuS106iFe/CGSKiysC1Y
 YOi4oEQSzUk6rwN4z6rt+U6wRnPORl21JDRx5HmoHWlN3Lqf6dGZjDU/mcVEdgesTj0+Idg6v
 yVFShN9Avu7DTivix5b9I6O3wgNO6MNHzu7h4kht8BdO9h+m8dmC/Rm/14lk2CCy7MC08oD09
 U8VUMTtAUCmmqcZ2WrRw0Ad+tCPenWY8cYmEw2N5c115aunwtebwIwSkio490XH8pwTGXnddh
 EaCVwbtekWm06TG3It64U/dy3iOe7JOGkNRB8V9Q8pM7Lo2EacEV/TjKgliZYFxOZ06DR2DCS
 u01Jkn8+o7+10Cfi90ayzKqnntrVgghX99NImUys0B5ZE=

In case we just want to submit a message to the EC but are not
interested in its response, we can free the response buffer early.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 drivers/staging/nvec/nvec.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 282a664c9176..45df190c2f94 100644
=2D-- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -300,7 +300,9 @@ int nvec_write_sync(struct nvec_chip *nvec,
 {
 	mutex_lock(&nvec->sync_write_mutex);

-	*msg =3D NULL;
+	if (msg !=3D NULL)
+		*msg =3D NULL;
+
 	nvec->sync_write_pending =3D (data[1] << 8) + data[0];

 	if (nvec_write_async(nvec, data, size) < 0) {
@@ -320,7 +322,10 @@ int nvec_write_sync(struct nvec_chip *nvec,

 	dev_dbg(nvec->dev, "nvec_sync_write: pong!\n");

-	*msg =3D nvec->last_sync_msg;
+	if (msg !=3D NULL)
+		*msg =3D nvec->last_sync_msg;
+	else
+		nvec_msg_free(nvec, nvec->last_sync_msg);

 	mutex_unlock(&nvec->sync_write_mutex);

=2D-
2.43.0

