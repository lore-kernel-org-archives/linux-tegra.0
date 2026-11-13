Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611629;
	b=GlFCZX1F6Hc3kaLNQdVWiQywsce3b02USyYGlp8PWpm5cI8EQill6dbFqTr0Wdeo4Ui7
	 TEtdLZqDq83uh/oQIXRIuBOpfLwCMAmlIQMzlu8IYHUMEUxPMaKE0qYmEQAY1vO84eHis
	 smkDbuZ0uwmATM2StiK8H90QkO+u0LVEtgjGoHUk+2Ic8yIbInnm8dp3p2YQRFE/30fe1
	 ka03hXnmf0ux89MdoALDpIL1o63rUxIiqrGpxb8PZSRZ14Zrh81SNsQMqiXB51IVUQ4Tj
	 fuZmJ5eh88qnTn+mqLmjVjxIhD1f30cgp2hLJ1rfW3MH8Hfjuwyz39mr9OFsfNK8OCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EG6s7IXphn6NOHl4nh68/lOvSTp0F1fia3IQ49tN0fQ=;
	b=pcVvSxfXjB0+dbfY75NZO3dzIB7Qn4XtD5QzVR0SQDTqdiIwJzRjOEwwCmAe0XgkT7Ic
	 Bfv2PoWgtHKRrBSP5VeNLT+C3K/dID3ngbZ/HnpSxVFkLxIrttIEqcQNsA50R1PMIxnr6
	 JGom3HlhWFueyuKF9BLL+rbpVIqSXkN/0NrVc7nmkHCWI3AwEVjuaM/hvclaxIoD2NFFt
	 6b7oFiYaULm1MyhVpVrUK4vB71QIOqelXUp1ap3eMSK/utqGuzNFLU1SlXkGb2YHO/XSb
	 PDfLarMps3yOMbiCmTOrXsQ+IQeNbg40Qx7foR0CynYKGPfGKSqm/ZqGeeY5cAlm8KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSt4dPSK;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C87606A331
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 23:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C87606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jSt4dPSK
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso2133233eec.0
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 15:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794611628; x=1795216428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EG6s7IXphn6NOHl4nh68/lOvSTp0F1fia3IQ49tN0fQ=;
        b=jSt4dPSKRruz1pY4S3eqCOEYbFc0io6eBEJdLq2NG76YVTJ8IGs2hx1WtYgcA1+Ls4
         Ws2si2Q3MZYlxOemx2wdJplId73D9rjtU0SPNetFUHe1K/VL5jujBckLG5iklZZCIcrg
         +I94mNsDT9FjVD+Zbx0EhPu+P84+IDWj5EJNS49BJ/efznOf9mhE8nsujcCXLD8QLBa/
         fqR/w6yXBnHrLarWXQBqIs8lKxrrI1Ak//xYc/2nXqfr2A7R2hOAw17U5+g0kUJM55G9
         szjj1VJoxlxA8+kBUHgw1/L7oWUZMhXOah19zpQyUPRlKdbSNqjZMRFDY0KAb5G0nRQL
         rnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794611628; x=1795216428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EG6s7IXphn6NOHl4nh68/lOvSTp0F1fia3IQ49tN0fQ=;
        b=q4IvXicJeWnG591EviNTM2tWGA/i8DxIakNT7DkHgtp00tI2+RBeeFA1l03BXbqC4b
         BhOgwnLA1UW/7lvB2oxtDEE5RwBORe4jt2qTUcevwiWyg4XM9zW5O9fQURT4kXGPmFug
         8t/iQx66tMQ2n4LVaEqtRs8wEJV8IlopcGSQJXy0nKcEIoouXWJ1mcIiiEd56Ms3qcvu
         JmWPZmaIqwi0rwEJ8gxa9BODXK8mTo6YP/j/CW2PZ8aWet9AoDT0pnHXiRxYnndNiAcH
         an6l1cBkVrgbGbZDboEBM0vd3WFuJ+gF8TtYKshmcq/0rUbO9s6lLHC6hnUoLTG0n8Le
         2F0Q==
X-Forwarded-Encrypted: i=1; AL+hErEHlGwcSe0+RW5+kGZtTMoORENohI6aZvsnm+o5BAge7XR3eurd6UGJlrD5iiayf9kOBKpde8RiUVNSDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z95vKOR0WTY6F+RwwoN9wE/KoO1djWD1YUdUUgFjH8j8hXGnIzJ
	LRLZ1SPR4oTtpenVBYDzpQ0jFRKl9JeuP9lEwA+DrOfvSfmsBdAfOuJi
X-Gm-Gg: AYBFou1FObK5yt5oS3dkvjazqQGZtOsh1cLBt2PXrs28VU3+cGYKoJdwuzJm54oq/lJ
	gnywN81N9komb2abbs/TU/oQp4b/6q0DiXc4y1dh1qZp0KT7iJSmgqU/ELqvxyLQXs4millVJOv
	pJdXMr88dLXIGGW7aAOo0C/OZmf0yZamnMbkR8uGyx08UIJ18BefgpV5p9LZTw4PJ8/wwVhyv28
	qIZSUxT2boktHb5a1mzC3xoNvnVAykq5WQkjBUlVjFWS9Izvrt+B+MNXbd/tyieUrOenZfO+SmQ
	IcIRB95Q+YOu40NXthNq13no+CNlLzu2pVrpDuFvDSrp2Skvy0fS/iXEBWNqJvSYK2GIbDjcGmK
	v2axE92Zfv5JTSS2OFWx0kh5xBBZl0zCnotXRRflGZ23D3Zg/g4jcHhtgsgOClfjmHcTW4lmaXr
	U31mpOrtpYKhuNi8u+Z6w3Kb/X4eTBQBjdT64AlBq85jR4X+FeURYyd1b8QI7ZW03Y7aJBM6rlJ
	tOwEUh/tENnf41AwjaA9OpAVohitMimQig8QN2qnzPzj8i/mAgpc+xOvBHRfmo1Ge3pJ4keat7B
	sm5QV3EomjZfgETa3p80bN6aGd1+Vl6Y0YfYu2NtYpno2+kOiUSKX1wDUvTZHABHgNgUes3L+Ob
	O20djtuqB6KVjvb3HAMVHyPLQt0vY2AoaT57uGHKiH1We9+7bkNP/nhxCrmU=
X-Received: by 2002:a05:7300:d718:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-37966b52740mr4985969eec.20.1794611627449;
        Fri, 13 Nov 2026 15:13:47 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm9922842eec.10.2026.11.13.15.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:13:47 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Shubhi Garg <shgarg@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] rtc: nvidia-vrs10: Disable IRQ wake when resume fails
Date: Fri, 13 Nov 2026 23:13:27 +0000
Message-ID: <20261113231327.22109-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvvrs_rtc_suspend() enables IRQ wake, but nvvrs_rtc_resume() returns
early if the I2C access to clear FORCE_ACT fails. This leaves a wake
reference held across later suspend and resume cycles.

Disable IRQ wake on the error path before returning the I2C error.

Fixes: 9d6d6b06933c ("rtc: nvvrs: add NVIDIA VRS RTC device driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/rtc/rtc-nvidia-vrs10.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-nvidia-vrs10.c b/drivers/rtc/rtc-nvidia-vrs10.c
index caac63f4e0fc..a5e73baf03a5 100644
--- a/drivers/rtc/rtc-nvidia-vrs10.c
+++ b/drivers/rtc/rtc-nvidia-vrs10.c
@@ -505,6 +505,7 @@ static int nvvrs_rtc_resume(struct device *dev)
 		if (ret < 0) {
 			dev_err(info->dev, "Failed to clear FORCE_ACT bit (%d)\n",
 				ret);
+			disable_irq_wake(info->irq);
 			return ret;
 		}
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
