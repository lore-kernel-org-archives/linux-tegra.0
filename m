Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2EB283153;
	Tue,  6 May 2025 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538299; cv=none; b=Zyv5OfMaIrhZ3H7X6NQMi/nZh4VmXx18nGX/THu4Q1isYFd1EljpqlSKU24nEU2joFFlc/IpJm7gimzlMmPcoeDwV7x6xGnudAY3ymV8slRgI70ilO2UCCl6nrtfAqRTQCzeG6VKKmc1Szo8Ze0dje2x6yjY13iIHq7v9KdIyq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538299; c=relaxed/simple;
	bh=2gqEAyRAObW/UvNLgbbdm8vxQwWZfBOoRnDst4T6rHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TBiVluhZUqWmPxUj16EMLBa6xXc6LoM9QBS2FRhEdcsuOhqmVn9rZqG9YTUOfl2vUffaNlt8TIZvlWiey4BwsWIJqw/5tIMmfmeErPAl5l9TNXa/WWkaVwiK6tRuslKWvNqmmUFp0IN/XTYVJzZGR/EZfaIs6yi7ialdimUcZbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAkfXyhJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAkfXyhJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso25869035e9.3;
        Tue, 06 May 2025 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538296; x=1747143096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46goNwVrX8FmvxLuzJxblWu//jJa0Films7JPsZ0ZeY=;
        b=RAkfXyhJxwNshrKeLV7wHuhsWBhxAbK0mqd6oPeURCucQtwXqCHquIuq69+1YtQXaE
         aS+jTFMhCdkmoS+mU9GfVKUoZGIBQhNiJZ2V83ybVzm9ekwYUf1DkPCbXNDValkdADKH
         czjLVBgpd/fxVPjPSWPcQC20AMXPnTrGIk5+ciKpfB4n+0PxRFots6p6fo7c6AX9JqmQ
         aS1MkpiIA2ledHmPGy4uBHG8EEMAwK5ZlBkQwja86W/H+mrKKQ9zaRI+wHjV/JFEFNJu
         j0LFuC1HTekJC9m5keAso17XFT46lwqi6wzkCDZKb6dYj3BRnGQUBYTssT3qeKtE6cMI
         AsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538296; x=1747143096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46goNwVrX8FmvxLuzJxblWu//jJa0Films7JPsZ0ZeY=;
        b=IX0z4A9Po+0ZuzTN23jzesxTO8qoJs/rWUAChP7Hwf6n4mu7lVxRo++TiohLSZe9jo
         tRY4Ooo3r/ceQCIuifjyX802moceRs5O6YGYCjEkbbR1OEd7fiWFPh1qdWH9LD1WTo7b
         hyqpQIPPdnHzAQTqhhjqpN1ve7A+ymnw3H/kQfHM5c9H7E8L59d3im141upCCvCeC8/i
         PWRYEjY+VlAeA/tRDLsiermJ83cfBexDifWtqH4k+Kxn35UbUM+qp7AX7PXN2WXvV1rZ
         xOU4tu+K/hg2Xy1vFMzktn+dcPVISCL66SRcY3Fp2vN6DbVYJlhgSDL8QJ43ccrV1RuD
         BnWA==
X-Forwarded-Encrypted: i=1; AJvYcCUs91jTJzbcFu53Dydl4gbdmpDnjxbW0Dx3F5q0KohdvvGgbcC4kIUqtFOBowbhG0glJt48m2Plzq/9Ybk=@vger.kernel.org, AJvYcCWYheZHxJtaWw3l+ZO3hQQ5FPFFCzmdKX/+5gMf1L2kutvwla9kpweupITG1Lww3lXvVK59IlxsV1/B@vger.kernel.org
X-Gm-Message-State: AOJu0YwdamZ+vwM1qiQW65LsO1QwsJhz1PYNWWjnXG+jL0vF6zKwrMUZ
	EzUukDoq/r6atYk2jtL8Wr23vSHfT0FOsB0kIQmQJhQtEszu1s2d
X-Gm-Gg: ASbGnctKNmL73Wru8eaSDAmMzi3XU016onZ4BJ9NDDUcN/S80pAwTVNaNmp3eOuSXjP
	UT5AT6OV/NJFp+svkKmggx2rm+5qpusmBD5PnpO1nqLvKcX8+cjiJO0+GHII5AZ5Eu/pTiKRpeh
	fOgyhZV2z2gxazApGoBoquF0zjo3mXRTcEO8Y2l3KDkE+lAGfj1Dc0nY9t9RPVz+6N6/eFUbcsJ
	/5Q3XGm/3QG9JMA1Bn++3MA4EM9JvcVBL+hOmKNbSvbAAvOAxB0qi+9OP/OC9AtgzoE6nPqnOIL
	HawSe1zk4JDYEDzcR0ppRq/0weVlZNCdpkV+Dm5640CLO2l3tzrB0mJ9yV/MIg4N20L8RMsRLIS
	LBfNNzDqaLH8JNlc3Vj8g3I5+9twkIT7/
X-Google-Smtp-Source: AGHT+IGYRu33z/WiPgEFpmCJzulddOzp6iFBhMhv77ohFSKf/h+meHXuCMidf38XNU7QsUhp0EFjVA==
X-Received: by 2002:a05:600c:83ca:b0:43c:eea9:f438 with SMTP id 5b1f17b1804b1-441d0fd1f83mr33173775e9.15.1746538295990;
        Tue, 06 May 2025 06:31:35 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b28dadsm220944695e9.40.2025.05.06.06.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/11] dt-bindings: misc: Document Tegra264 APBMISC compatible
Date: Tue,  6 May 2025 15:31:12 +0200
Message-ID: <20250506133118.1011777-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506133118.1011777-1-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml b/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
index cacb845868f4..87fcce7cbb40 100644
--- a/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
@@ -20,6 +20,7 @@ properties:
       - nvidia,tegra186-misc
       - nvidia,tegra194-misc
       - nvidia,tegra234-misc
+      - nvidia,tegra264-misc
 
   reg:
     items:
-- 
2.49.0

