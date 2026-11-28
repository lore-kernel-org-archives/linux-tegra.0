Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880123;
	b=HKD5odR9LGbjZFbig9dMgkqQ/dWCTO3a1bD8DuJ2cuqyeZEqhBl9ji2KWkLb/dqyVjHE
	 WmT5HETSmGPoMr4Z6eAJf8YWz8qOwj5LbqUdCNhe96uEnuXoVSnFUWqblIvVAt7hXHQFO
	 cl4EDCR0JDxNjxxiH8UK44+1HyNyC+uJ/xX9O2m8ZxU4SrvzS0BFwN1b6rg8rkfQHNj3m
	 qzzRhQY4mkcbmPVzY7/R5znScEGgdbbWop2Yu0sgO9EIJKZfGcmYhh880cI71EJFbb9UI
	 ga5NW1s+1DoKUfPd7UdMfw2YP04cmhAV4f62ldTayHr8FTGJcusFGHISvj/1C52mMWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OPDZCl80ucoRcFw+rfeWFDnofPgw+y6THl/lFgLOQIE=;
	b=uQ/S57E8TqkELbECgXUsKGtePdbiVWpJ5aw1y4je2DFcBhog0LkMnW8vjCu+IeBjSunS
	 euvK9peJ6ntDsvAt8UfCVWXH9craUWPnHVeZ+TFd0LK+CTx1hne05wvdl+aaiBLSaHyxR
	 bAQ8uttDcMvt2utuaH+gkIMVC18n8xhKG77mvMAwOXPrm0T9XXHCjP1KvetjLl38TXhxU
	 pbSWdi7G9EZJdB07nXce28sm1m4Rz3/VN0I6PgqOkxQEgsUNNCD6gQSBTWh2UkxKz9wEd
	 oDx73Rym0JEyIoVi2U4xKiAC2TjXIV7/f1f3QeGrBCwV9oJRENYIDjkVXOxlmLCPWXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh4J8m92;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD38606A321
	for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 15:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD38606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh4J8m92
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso86937555e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 07:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880121; x=1796484921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPDZCl80ucoRcFw+rfeWFDnofPgw+y6THl/lFgLOQIE=;
        b=Vh4J8m92U7pP028aM2/ISZUVuC6lkE0oxMFU/ttDkTeIF39KQQOVkmRlKUN9UJ/HC/
         5U/+ebFAJYFlrzl5gO/9m6Zygrh5sxjNrl2NtUuJ6jicRrXR1xSnEwc83rk+Mq8esNaD
         WSMN/3RZAZjeHZJh3SIY86NR3z7AmpCM16Wf0xuxpBdHnQWy7MAbRKmchEOvS3mS3JHS
         Bs4yZc/DfKotbJoNOBcIEpqt2YiPfM7cRJdE4I3gO5HmUusseoxXV7qjmsoPaF/BG4bg
         9cCr7q3DfFbrqEOuojDpCfotukqd5Gnas0/L90dl3vdUWv9ysGe/4nDnV32mAdBo7C7z
         Kfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880121; x=1796484921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OPDZCl80ucoRcFw+rfeWFDnofPgw+y6THl/lFgLOQIE=;
        b=bxt4PxhWqmnB/8Szwsb9YVahdUMGuNjJJjg3jfSJQPzREvuOrTikb1Pz6rgkKNuypN
         sgh5ztgKyeFJtvcKLYr+V9x0UCimV5SQuKRZj6YJj/MFZrurta1OeJ+afD7RSGEyoYgS
         8PWxNKA4hQhlPUBIBbUxpoRgNrHhRDp2+XR38e5v1pVPt7hdaagfWQSjVr9bh3aOZ4xV
         FcLIKVxpAKtwKxpW8zgy2uNsf8YeYHT1vlRvwZLO6zaqUCnQMudy0z7Gsvezj0i9fwil
         u3+4ai+hR3b5rkxnK0jPJIrO0/6K6iumYNr9UGuqDJgtmCAgKSvXUvk67ZkFLWP+M8k8
         82ZA==
X-Forwarded-Encrypted: i=1; AL+hErFEocYjr1wYLXcfX/70obgVpktw7SfvbW/Ao+h1IF4rwpIpCC8g9d+gGzFMmpEUwFmo9ixxdpqZJ6szzw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+8x0/H3Y94EycmHQAMKw3evV5XDqb16bP5Ih3OCXpul5Y/iBGX
	VKgtF7Ahpizg+AT6wxS1FSXgCvRb4BoPJbUUtPgFcHYyWLIFlEBwzz40d7EJJQ==
X-Gm-Gg: AZFdTZcN9Vt7b+JizMjrrNDF7M022izryI52tH+4m23cFpSRTCob3lmo1fSw71JkoW+
	cWobfojICkjt4FnJtweuR4Fh2fuMhKz40WKuibzaml3uD3d6SkKef4fcjeLUAq6z147Sc1J79gH
	PnsX04fYdL//kRaL0vNKUTkBx1+eYAeed1uyhGFz4Bkgz4KNtraRBBs207237O9XNqFfRvoZyD7
	DYeTHMEtuGP1JsWbVh1rctpm6kGhWAf1/b37febCqRuCXdD73JF8McThBlOjTgsU9MxYE7LDQfb
	pbrKn7zyF60uMcDX5Ik55x5XywpivST1rEy2HtFDHEOE/YrnbNaSufSbkZJlB0wx/GTIKaw3D4x
	1priPhWae6rukxdpNYA8ZkBWEoNy0WFWgGsFJ7lZJoV3P2PNavy3CpgjbahKhZidaz0D4e05+0U
	O1WAaoHJpBmwlrMeSZ4hyOyWWvzd0qr0BbRGdU3JvA5l18qDq9ErwoYGIRl20S3PTIr7ElUGOLb
	JMqx6f+etMnydvO8X9e6LfDK+83fHRCMgF2x+ovFnHGa3uGOCoHCZbaN38WTprsCufmxSa1Qcd3
	Y2dF9Wg2uG5QabJ9ozRAQz7v6WzOvXYoNdsWGfI1
X-Received: by 2002:a05:600c:4e0b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb887fb66cmr593468135e9.5.1795880121168;
        Sat, 28 Nov 2026 07:35:21 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:20 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:34:57 +0100
Subject: [PATCH 1/4] mfd: tps6586x: Leave warm and soft restarts to other
 handlers
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-t20-soft-reset-v1-1-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
In-Reply-To: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=FHhG5PpLJ8sBoWRAgEyavLjNn+Vpbum5Z4mXHlUvn24=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl63uaa5fTqyS9o1cHizZdj2/KkBUbtHh5O+VJ/w+l
 RQndSZ2lLIwiHExyIopspg9FPrCM8/r/YaXWzth5rAygQxh4OIUgIm0zWH4Z3+xP7ZLvNYjSYDr
 zGJjjnPXr+lbHvVrZeWKepPeKMCSzfDPZrZktCcHe0KJy4/bjx69L58vn2f8V6Cl+LHj3OU1Ndl
 MAA==
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The restart handler resets the PMIC, which power cycles the whole
system, including RAM, so a ramoops/pstore log of a crash doesn't
survive the restart. Its priority is above that of the Tegra PMC
restart handler, which resets the SoC and keeps the RAM contents, so the
PMIC handler is always used.

Let the reboot mode select between them: return without resetting the
PMIC for warm and soft restarts, so the next handler performs them.
Cold restarts, the default, keep using the PMIC.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/mfd/tps6586x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index f524bbdc8f3b..a92a88ac987d 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -480,6 +480,9 @@ static int tps6586x_restart_handler(struct sys_off_data *data)
 {
 	int ret;
 
+	if (data->mode == REBOOT_WARM || data->mode == REBOOT_SOFT)
+		return NOTIFY_DONE;
+
 	/* Put the PMIC into hard reboot state. This takes at least 20ms. */
 	ret = tps6586x_set_bits(data->dev, TPS6586X_SUPPLYENE, SOFT_RST_BIT);
 	if (ret)

-- 
2.56.1

