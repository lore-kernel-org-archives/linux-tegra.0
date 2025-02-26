Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F8C26E63A;
	Wed, 26 Feb 2025 10:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567399; cv=none; b=tISX8DKSCI9TZp6EqVa4epit10Pk9FlI6RoAFbI5DoXXJi7MsQ9b41Z0eQ3cGHSl4ITPNXAmOYsK2Rv9zS+zSuBVY7thRtFUmU2TWC1Zsv87XbHTkp+8a3GFY/VYf4kG4szV7mcaSJVp0jNE7Lwmxxgrmk+yT6cWXAzHmqMBPFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567399; c=relaxed/simple;
	bh=ruMCBNYEsH2H/F+zLxI4ZuYKFJui4PTP6oTejvUsLgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCjzUa1n2V1bPBBMVXxQdAKqcKk1IYFsrBzCBl+11uC+JEt9GJyowK0YO1KiUpzQQI4Lz8045Kn9beTg1VAqdIbMLBIvxfyU2Fw+BjQC9vjuJrban4S6WE+KaoQx83cnLtaVvxMQibo41RqH8TiKZ85OQS/WHN2vyWo2bWpACbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q13rDxbl; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q13rDxbl"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb81285d33so158685766b.0;
        Wed, 26 Feb 2025 02:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740567396; x=1741172196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1iuGJLT0O3BTgwFq2zcSTsLSVOa6qSThtFXqCRlBtA=;
        b=Q13rDxbltFe8DkdQ7MRxEN/Q0uHftYN/uS0Lz6WMFRsJW0XOkuywQPZAJtkgTb0ztM
         d94zvaxEsiuwfIK3zcjwp141IhEIC4eQNE5alnEIUMhYxx8ec5vnkK7qJzLXK7E7NI8L
         vca6vZ4n65OLKhAhkPCpiKWEKDB905roYHeTG/ieQqdl1KcnNMlSpmbf1dzVjDB5ULSb
         jPTqKJYv4WgLU/+e72UtghcDpBmcg0/ANAFLf3efZvym8hYXiXybWpFdV34hQDb05TdG
         LY+iDp0qCLd9WQkbyJpoGUvKbUNU/uP4gfLhK2KLCLSwHOyx6A7qZ0AmrFjBJO9p/75R
         hxjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740567396; x=1741172196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1iuGJLT0O3BTgwFq2zcSTsLSVOa6qSThtFXqCRlBtA=;
        b=F5gQEl5tvGmkAzeemsHAcvq9dOSzOI9yV5/fG2hWwMeRPjTq3VL8zB2bBtqFg9AVCl
         uwqvs66hdy/t35COgdswtZUl9HqsTtIgI8dgiy1qe+dwOdqGTu2ioD7Mi7SmD578IW0k
         4lk0gnYFvrT31nK5ElbsgDRR4z1VucTbDVF/xlvbRsne6rTKO0TnOUBmMDGtTdKPmt8x
         ml21PVEaXteY31ZrBC9+SBhYVTk+iysqndjVApDLTpuRcymMPoq9QDeCG9By/Ta+VfJP
         3gBbQgR4C0HRK+gshhm2F8YEMks9v/+dNR0IfRRf3z4zyf91WdxlVxPmQwLuFjx+ZBwY
         pkHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0l+FzBkHKfrlqZ8QI2JDgsElCcwkN5+0jaSL4P5eyCzEmwyabjgGz+Sk5Yk3NMYYlPSwuAgjOBmuNXRQ=@vger.kernel.org, AJvYcCVPqZcjjVYWSWip0g3cBqvvbaL9QPt86ElTGnKu/WwHFnZCHJjcsy1d8ZH4VaEoGnZMxNyK28H+oXdaIw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ9nXW/dWfzPFwp75zK+E+3buXR27jQP9mt9cnyLZHbuGxUMiz
	XBFCLRc5sW7flZMEvZf7ZQ2ls0bcQShoeQKrNDIveYhThcWiSKfC
X-Gm-Gg: ASbGnctUf6eArWluVnpF5T47ckloqhY2kkUhb6TEwBqSfzaqVmrwiRDi4AADBzpB7+j
	6Gj1eDHZ7d0hSFX5pDLeTfl5vk1f7+wTU3A8DjLCksPvGp/URZF1iq0MI0FSti2R561SuUetRwb
	BLdAO5yLVQXkAZUzM8xs4ZzfuzCQOwUdZs5vhV3pWg4Ch3rMnqRevV82mjWvf4VBbRRSJWPzoFn
	2p6rXO4COM0k1CD0C122j9DZDClzxmABdoDW6ujIL/xJaMZ6W9a3LS2qjSaPhkJL0pLU//4R0bb
	bKPj3daYe8l5i4NXVg==
X-Google-Smtp-Source: AGHT+IGhBDaTqylM6rBq2WK2ESfGo+hK5MppSpY16i8zUEywqv9+x/kRNNSD4agEnQ7SLM9CZ748dw==
X-Received: by 2002:a17:907:9c05:b0:ab7:bf2f:422e with SMTP id a640c23a62f3a-abc09a80912mr2415544166b.27.1740567395735;
        Wed, 26 Feb 2025 02:56:35 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205e53fsm299771266b.159.2025.02.26.02.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:56:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/6] ARM: tegra114: switch DSI-B clock parent to PLLD
Date: Wed, 26 Feb 2025 12:56:11 +0200
Message-ID: <20250226105615.61087-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226105615.61087-1-clamor95@gmail.com>
References: <20250226105615.61087-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PLLD is usually used as parent clock for internal video devices, like DSI
for example, while PLLD2 is used as parent for HDMI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index 4365daee2f3a..62d4a2bbde0e 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -178,7 +178,7 @@ dsib: dsi@54400000 {
 			reg = <0x54400000 0x00040000>;
 			clocks = <&tegra_car TEGRA114_CLK_DSIB>,
 				 <&tegra_car TEGRA114_CLK_DSIBLP>,
-				 <&tegra_car TEGRA114_CLK_PLL_D2_OUT0>;
+				 <&tegra_car TEGRA114_CLK_PLL_D_OUT0>;
 			clock-names = "dsi", "lp", "parent";
 			resets = <&tegra_car 82>;
 			reset-names = "dsi";
-- 
2.43.0

