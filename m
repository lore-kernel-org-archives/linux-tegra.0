Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876133;
	b=QlREbh7PkGISsDNObl2zIXqZkwOJjaTLbnAtyIQqjhmrtbgxtOYbo8OhawI3kwaB3k3J
	 kJOIw3oIs6gE6/tHqh5Z6wUS6yhBBaVwrUudubSONOK8ekyVHBOdQqQbHYv5PTJwpeaXE
	 T7B3ORl0luS42k/zxyDwjN+fkLl6CcX2spaxCSpQhLO1CgK6kGqFqe9uBEOWfTtHoExnV
	 jpGtUccuoU8pnOz2JL9kkIHScCItsc895XhJmtsGsaZZbjXsQnMod1+mln0fQr8CNEp08
	 WrHfz/OT9yD+EXPLGoG9zZZqK0Vo82xbWSawIX7NLr1Y3OnI6mWWHGYv6LWAwD6seUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mVU61TpmJTJ3L7aEhd9+AwBAPVYXcOuoiMC3P5nHC4o=;
	b=vWRMHo7TTdx22GdpWmwWW1mJGRj2rR2W2CsdQrfrBh46/+4PePuKJniy4UMY1vbttZ0t
	 1GUFJRblJzD5AnlFZ11ZIO6qWEwmCFSFnYgAqRCENC0pkHmZ92si4crOLa7vPJ/yYTwNq
	 4SLmXIBoTbBQGogdsKmNzrSuYyy45irLCDPhLoLQZ3u5StOy8p5lRzvz4aV92KQo0fS8b
	 JyYucdJZk0S//L+63VTXthUCXchXRbBTyM5At2l/6Tg0NWjFs7PQZhDxW107ylFOyfucb
	 GFACOQUFN7xvMRS4C/6265fvxSMjvlAKA2DF/b1HJDGZ8kLsc22qtkKYGUrWfE8WYMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6Y1QE46;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B71606A323
	for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 14:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B71606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6Y1QE46
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so78148315e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 28 Nov 2026 06:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795876131; x=1796480931; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mVU61TpmJTJ3L7aEhd9+AwBAPVYXcOuoiMC3P5nHC4o=;
        b=P6Y1QE46EpMmppc9PZwgJRBgckv38Bam/D2AT8n4+/TsMdBUCROBmJoP21o9ABnnfA
         gpahHDhzpwk2ki7doTY0sed70DOJna+uvNS5jA1Ojh1ymDSZsoVK5cAZz077FZzA54FO
         +pXEw9KzBBcP+ilmWoUQLDP/qYlur5sXEabSyOkRkEdrXYYc9fBYc0lp1bq60CKcGfXu
         3f8dJO39ceipqyUrak/2c8a0svSJarjThL/UsAxPvE89BMZ1+5k8ryeERAhJki7MFgBP
         1TncRN5Jgsq3u62JAuThHHGNWH6pC79efeJ+Qde7I7rWXueZjd5yyp/v/6e0waYIE1sg
         ZXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795876131; x=1796480931;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mVU61TpmJTJ3L7aEhd9+AwBAPVYXcOuoiMC3P5nHC4o=;
        b=BcHOiG11FrfSXwSjPKv7Y49gBF/QzPv+JvhdDusPMLizV3K7zKqE0uYhAWx8gKUYxp
         Bvcz3dwwD/QO+DdsQ78mZUMwI4WuHLuEK3R2jaWe82Mp49h321fRmekDCIeYxPdF/ft8
         X1WtAMqVx+3m3xb1Vhb3ux9dYiTRi+/0e/cuj5iVhRxRHqasBuLur+NYJkbux2EwcYJi
         qUtxyvXfsUt9i9NQlv15l9nzfvMey2AZya/Us6KCzFO0yJ9nJST6d31DYUmRNSMVcntf
         NiKDrEfZGCxDslaKQcdkiK6cA7HV7WiXhHQuKHb9bpi4bkpmnqco5lpzWcLXrWPeVqu7
         wcww==
X-Forwarded-Encrypted: i=1; AL+hErF6hzDBIBVtEukixdhOTQyhKht7B/mDgBRKg+EEc7amW9chIApBExpToTx1iSHSeoh8/HJGRWdP/UrvJg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ORRrT5p7WyfatiXFicBboG53RNYHmMkkQ0Amqi7l0w7AwklZ0
	7GozRvLzPJopaBKlnf4ZhU50YbaW7dXgj9v2eHou1EVxME/ID/gubBI7
X-Gm-Gg: AZFdTZdKy4AWwToVGgjJSHjbHbXU6Gna3s+OZ1fIjZBA5djds1Cl+JECC7s/73Rl9Bh
	3GsVrnmAmKDOqtCoqsw5jURWM2wGBxmHk97GnQpWEnKo/R6ztbTmksCkphpVEMh0hX2IwdHyRLx
	Ya91VuV55jSoGA9TDRnwGaxF7JxzdDfIYZQPWOTzFTJsoiQB9D3WM5OkeaENF7IMkvEZaNO/BCi
	IfoRhQBC3UesMOupKhCdYCOyXoiknxVxncUFElFJLIL/6D1qS/ZFrNsXs9eUgkQ5T+nL6bRQyra
	vf3bzrjIrUH8wgR3v8kyoUMN4tkhbnjYrGQoN1VuYtj1mxGykrhy+m0lpK/eyjQfjad0wUc2hzw
	2jE4LKL8MICO2mQiV21wsQ8m45X9OqpPcNholOeWlznb5zTIi1mu9IIENAVT3D2c3GDvw1lTpaT
	YH21C5VirVdYFkSZATeIxHMKWp6h4pVeFo4zv1adJhrH7D6d3r0HYBuDLwLaP5yllJPyVg3yhgl
	IZHGd7ku+7yvpu/ETKjGttr3hqmlQ3GNG+xN3dnjQmhkg3kC9pSIXFidoGbxJRuCJmiJEhhIe1E
	YL8FX01HKleiKoIefwihlavZwTuoztw83Nh4rpAXtFBpIiJbfHvjT25tqueD+w==
X-Received: by 2002:a05:600c:46d3:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb88812200mr600937055e9.17.1795876131097;
        Sat, 28 Nov 2026 06:28:51 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm52519320f8f.49.2026.11.28.06.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:28:50 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 15:28:48 +0100
Subject: [PATCH] soc/tegra: pmc: Fix NULL pointer dereference in powergate
 debugfs file
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
Message-Id: <20261128-pmc-debugfs-fix-v1-1-f7238db93d96@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMTQqDMBAG0KsM39oBE/CHXKV00cSJjlArmSqCe
 PfSdvk274RJUTEEOlFkV9PXgkCuIqTpsYzCOiAQfO1b53zP6zPxIHEbs3HWg1PXe4nSdHXToiK
 sRbIev/F2/9u2OEt6fxtc1weUr9AHcwAAAA==
X-Change-ID: 20261128-pmc-debugfs-fix-c782ebe57056
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, 
 Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=4Lt1cnlU6lJh2jRmUBxT1SnO3jgo5eRQM4maFEErxD8=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXU8VTuqURSz0mrZRYduCPXf2klbEHD2Q3n9kasvq38
 qS9LqdmdJSyMIhxMciKKbKYPRT6wjPP6/2Gl1s7YeawMoEMYeDiFICJiEcwMtxqDZIrCHq7lLcy
 e7rMwp1n1sk+ynzJH7Fu75eEXvsF30UY/gqF+3BwsYuEXFuy/JXD4v6PxfOi+sqCGD9eX9Ae/ut
 DLRsA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

Commit b2a3e8200056 ("soc/tegra: pmc: Pass PMC context as debugfs data")
passes the PMC context as the debugfs file data, but powergate_show()
takes it from its second argument rather than from s->private.
Reading /sys/kernel/debug/powergate therefore crashes:

  Unable to handle kernel NULL pointer dereference at virtual address
  00000019 when read
  ...
  PC is at powergate_show+0x38/0xd4

Take the PMC context from s->private.

Fixes: b2a3e8200056 ("soc/tegra: pmc: Pass PMC context as debugfs data")
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 721e9596b07d..09aca9fdc22c 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1228,7 +1228,7 @@ static int tegra_pmc_grouper_power_off_handler(struct sys_off_data *data)
 
 static int powergate_show(struct seq_file *s, void *data)
 {
-	struct tegra_pmc *pmc = data;
+	struct tegra_pmc *pmc = s->private;
 	unsigned int i;
 	int status;
 

---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20261128-pmc-debugfs-fix-c782ebe57056

Best regards,
--  
Artur Kowalski <arturkow2000@gmail.com>

