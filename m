Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EB140242B
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498105; cv=none; b=oU0wHKUk63SceEnV8sWF7UcfOKe8HqaWN+EZ0A6ulPEIP+VVCcszQuPYTw8HvJqyW+/AZyjgtDw3jnfy6gnZrK1AuR0gtdr2NIV9zLc/WYjaRdUTitH6alE4cXiG8yI0ps9P46+hMiSNdX4nmg2I8FD2XE4EbUUwp+m1wvptWGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498105; c=relaxed/simple;
	bh=gXNJqaf+zTctXL5WLgdpGYeFG2qxNG2Vh2hV85r/k1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ibqnOAq3A8OMVb86EOCvQ1qQ1FBnS1BN4xn59Zf0AJB6NyoG1QGMc7mxTr0u3PoGf9b/SBMFKCkI/Tkbq+QaRc1Bdu3RDnlBM/A/QCUyHSY66s65feyyGXqZgF9LT+6PH5swvexlpcfAJIM7E2vv55PAu5kdcWC2ktTOcfoidZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmx4XRlS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmx4XRlS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fd4ee0b01so228931f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 04:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498101; x=1786102901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GL48HhqEqA89OWX1SNNRwvNWdwLXSktQBg9CSPlO8sc=;
        b=dmx4XRlSwrwYQ9JJGfXoK6iFhWb0NhH7vW3efgdwihdmTj4tyy5HhJch3eHZgiCIOy
         S5cuGAzo15pFtGWfxQU4v7NLsEPRechFMjj4gp5kF8pfgYFjuBWz45y2j/ldfj5kskbW
         XtRSgeZflQv0x6sDdOWowvagnmlbDgEaKZUtzpqdxfzST4QNSwxZzifAtYOrczF6djI8
         szCXDm8DeMmIL8/iN0jA1YAGc04fIe/BKqLNxnDQyBY/Wez2dPfp4YNhQvVcmbzTlBHQ
         SGm5UOzQWxcTNXMcuhdqr5BB3hZ3AolOkA/wKUpyyU78rquoBAfQ8U0NzbzNAGj8/7Vs
         D8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498101; x=1786102901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GL48HhqEqA89OWX1SNNRwvNWdwLXSktQBg9CSPlO8sc=;
        b=OnQX44542eaoZXRc1WmUYxSkJejGk49z8tSifWV1B1yFcve71W10qNnlJJGjQT4EvC
         e22Ugdyr85JOOnq2EnO17dfgTruJX8zk5hzMuPVsesA5cYWbnVZAmzNmbf0jlgR6k7sf
         xDOoyGz0aDxQAEbqODtksZ48JT1twXlSjNe7H+PQzd7AShITT03nSkDwHnFBIMB1BC8S
         aDooX+igmAwnbEs+kgFwcqnMKJB2VksDTmr2drokojbhJMZo/eiPvh0/wa9PlQ/5kPiS
         Ze5FQAQWHP7mkeMrHo+U3/ITeeynjLI4P94ZJrN7RUPuSP+utM11Kt4mc+LNmLoYwUCS
         zAdg==
X-Forwarded-Encrypted: i=1; AHgh+RpNiIGQSxtbgbo0Zl8HCBR2Co6GW5H+cdlLAwGVOSNIJO046zKq4mrNuuff41MyAgTK8Dwxx5mT3239Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7mydJrrq2IJdMWA2AbGROMtfDl/0dit2115xUdpYzZ9hglktk
	i73jaITFO7cOSLI1w4LhulhFmljigfonH0QOyWwoojxCYZqEJMtMvbSw
X-Gm-Gg: AR+sD13oVcWiEtuoynMKQbcRqarJoX6habb1Uggt1RsrkLT9Fn1gVBBMfQPpdg243te
	BzgkUe2g4aQo3nnPz53OkJOQkHtdRDly9RBukyxmvqjX3R7hqbrlmkkY0pRmEqDYa4YJgVxDF/J
	cdbDUErh8HJHvFiL3xKnTu+5XwiuWe7+s2v9QgYB7ZeQLOYLhjGDNs4XYmULL1eG6l2RRZBsE50
	L0qyr4dS4N+NY47Ma16Z/vesjdvaSHZ+Na3YtvOWkgLmG473l46Hs8dUpnrZMy09oMjH85+Z+iJ
	ZOBYbDnk5hHVhASWKBCPe7dnuThLcTGk0j7eOWm48X1s8BNHrxoONuMrG24DekdSRKLgR25+kg7
	ulmy8K/mUP9Oe8ViEzwCqOgDD323HGMpcHIEG0dgIJByRg2i1jb+/TPlzTlnajNj2+mxGNkGk4b
	JAnfpfAOQyVssdHySjLJx81OQ93rkSD1wGQQRz9sN6Dw+mFgM63CSi3+2ykZCnzddIiZaus3iwA
	hVTPROM5g==
X-Received: by 2002:a05:6000:18a4:b0:47f:778a:6587 with SMTP id ffacd0b85a97d-47fd2b53c48mr3813169f8f.40.1785498100849;
        Fri, 31 Jul 2026 04:41:40 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/10] ARM: tegra: tf701t: Add chosen node
Date: Fri, 31 Jul 2026 14:41:06 +0300
Message-ID: <20260731114106.169398-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add chosen node since some bootloaders may require it and add stdout link
to UART-D to simplify getting kernel log via console.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 0d182fa5c1af2..1b9839a855610 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -26,6 +26,10 @@ aliases {
 		serial2 = &uartb; /* GPS */
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	firmware {
 		trusted-foundations {
 			compatible = "tlm,trusted-foundations";
-- 
2.53.0

