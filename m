Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F2219F130;
	Sat, 15 Mar 2025 07:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742024698; cv=none; b=DkFe1W43vMQdT94Yyn6c6xN8XQF4ILeCHKDQFDM+P0xiLpVF+4OrbCM0UCWc0C5/7H8zHgEMa1wSIzV7kb4av2ZhrNDCfVKse3FsXGgOrGL6woFY6/HL4H9PSeyIFme/VVYI8U0ymYbFuSHkgyzepUmgeIP4zEyjTWKVeAqcGPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742024698; c=relaxed/simple;
	bh=K5iyRhuj5reTtDPm9Hsirojit/yJagFRJPH7ejK4xT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q3XZiP8KUxcS8htjDNikDVKeW+mT7j/uVD6b9WkTU7Z5mEXYXoXgUG95gsMC9PKzmkNCeKsIw19CYLOfhw4h93vk+VejelKgR2AMjvzMxcnQN4gRK391T/6DzY85m0fepx/WpfBahZfuTHJ5SwU3msgkhfQNnzSwR3hH8uhPzpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXeL++Gt; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXeL++Gt"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab78e6edb99so419463366b.2;
        Sat, 15 Mar 2025 00:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742024695; x=1742629495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Np6Qi06kBHOn2o+cRGeSFXhf2TobMOSrrIwKjvKgyS8=;
        b=cXeL++Gty8AIhizIuvbqbaMtBHjYQ5XZlmY1eiyFcXkXpgsrVN5ukRFXHs/q4FfpLG
         CT1xVkQ9DXF/Ys8QA0LGJYwRTxOC+G0u9lHqLX+/TA+kXYwypyfO+3YaysgfOH/qPwzp
         VLtU2hQ1k/p6G1WQfNnSrYI2xBWY3TQC72JqYSMx6gmSf2m62M3o+qf6xIKaM3ZMzhba
         fPjpFY/QeiiiD0tzGESbiGEpeyYv0YnQIrQ1zsde9GSp9jptdh/33Ui8j+6CUWR/OY5A
         rxP+RgmgFCgOpq0ucWl2XKWmZi3Ik9TSB+4KIdLJTgmKBiCNFPMk/tqkqswHGkfbpR3/
         lMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742024695; x=1742629495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Np6Qi06kBHOn2o+cRGeSFXhf2TobMOSrrIwKjvKgyS8=;
        b=RSNIMscdog0kAbb6uKqsoz5xP2iYocUjguneXlkzUAYH+2fuXYoFjC6vS7X8xouAKG
         fyhtMqUfI7KPrvRxrIsIkfrGf+jbhaOFGYd9LekiPOQdRD5Ks1AhYbmP1MZme5rw5Lnl
         hw64tqQ6i45UH77Bcgcm18W1hpQLEP9cXBgXBSJbHURczJP1Es1h8bMJ4yN4GXm/LBPe
         9gidGl9eiB8Iy2yISiSBWUc91vbGXU437PsYm6qUJtirgMgQVb9kz6SQ6iik7C+sJKfS
         QPbNYV350NkoN3PRM/KefOlHPpRbN44rpcRwe9NRmW7zxySFxlPABzTiQ85d+1d9fgTF
         QsUw==
X-Forwarded-Encrypted: i=1; AJvYcCVcrSnFS4lRz8oMMNLCliCZH+dd52EJ4mWrFIJiq6Bv6xJ1/jlSUursnkl2WxxssZ+SAiVf8wXYekLSfCE=@vger.kernel.org, AJvYcCW4WeokYIGB7EH3a+xhfUN7zgDfjCce2a3taCnzGwXwInUhcO0w6tyjOiz2Q/FKM55tiGb13YzQsJlpzJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQKBU2G3L9hoMFbw/55fI574jwRBNt1n/uz/s4CJKwRVxUYqT0
	T3vDgobLVOTlyRs5RwVvEHT/abm+SZb5jxUy7NRKA4Mw2j3FS4xO
X-Gm-Gg: ASbGncuLhpC2ddbGaKUxaEWZeK5Y26HZ8VeHh8jBQ1pyy8vQ9KkZapH0u8w06P/7yXm
	YrMBvEaeHrd0h2QSazFIBQHp79fZdG7NGUw66OZJc+6P0uKDMDMYJq8QfDtiH7iKsLiNwhc+GNg
	m7UwMrPusBtdSGdRfkWtAwHKOB25q8O9Wtw5leSTtFXy71gFHw12LkSN5OMowyx69uk+ohdurKD
	S9ByBf/bGUNTpyLCal4GOK2TsgoW3SFJ9FBjDqYpqIoHpb1Hrgnzsqs8Tz2LbPXF8r5JwLfSnLv
	O3k1lgoSlKzOOF/f+4L50gIcxC0JR2sxJMB5
X-Google-Smtp-Source: AGHT+IFCP3ecbVN2MmQx9andgv7F2i7jvw8fRk4Ra4IGdP4bSAAuAZB4lYOK1OFLZGxH/2Pq5cfcEQ==
X-Received: by 2002:a17:907:7296:b0:abf:4d97:9ec3 with SMTP id a640c23a62f3a-ac3302513d0mr580684466b.13.1742024695019;
        Sat, 15 Mar 2025 00:44:55 -0700 (PDT)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a3fc0esm336247366b.137.2025.03.15.00.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 00:44:54 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Brad Griffis <bgriffis@nvidia.com>,
	Dara Stotland <dstotland@nvidia.com>,
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: tegra: Add Asus Transformer Pad TF300TL
Date: Sat, 15 Mar 2025 09:44:15 +0200
Message-ID: <20250315074416.8067-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250315074416.8067-1-clamor95@gmail.com>
References: <20250315074416.8067-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the Asus Transformer Pad TF300TL.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 65e0ff1fdf1e..3e106ff2a8be 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -61,6 +61,9 @@ properties:
       - items:
           - const: asus,tf300tg
           - const: nvidia,tegra30
+      - items:
+          - const: asus,tf300tl
+          - const: nvidia,tegra30
       - items:
           - const: asus,tf700t
           - const: nvidia,tegra30
-- 
2.43.0

