Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A623DD87B
	for <linux-tegra@vger.kernel.org>; Thu,  4 Jun 2026 06:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556187; cv=none; b=pZgGuHFjoqn5IkZNGhng4g55AMRS1d9ZkVUXT5ASKK/zmK1rRGororEY4h+ErkBH6LlJGePUKiqiM2+aA15pUjnx/RfUuqfFCR5AH5C59k8D86pQ56egVccYGfGiABUAK1cLrbJpGmDXS3mR5SsDurVYi0ToClvjNgxzcU5tq7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556187; c=relaxed/simple;
	bh=WD6SpV06z/+rCtv5vu2qcqn8DOTtcqpPeKOCYnW7Gl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Urs65poUemu/5ygWP4CCR7b9Rv0QTHj0NufNKXs9MsLXMQ6HCepQL79UMEY6cRFeXJcnhjWKd3Y0Ve0iMmQUzHr4+kB2+G9+IbK29FdpyKHKmemEpAOZcItAn9l4IUHcsWG/p2WmkZ+jvJ2A9fXAGlqSNFn2grp6YZbZAg7ih8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anlTD5H1; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anlTD5H1"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bf046d4da1fso31739166b.3
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 23:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556183; x=1781160983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qj5QrO6XqMBpUhtJt/zlH5aTxtuKQkoxIMlaQ1G+P/k=;
        b=anlTD5H1/C1mYsJVoVC83k9pyO1ASOxNH6uSJFl6CtdRxAWGMOsmX2VN/HVtCNWOjP
         6jzjjCVTqMJ4fC1Su5fEodD3i2Uj9xen50Iokfc4HK11M+xxot077Ogck82Xw17epZYI
         yW7pHfQ3ayYIq+n+I7BQ8f6jQlEkkHgJ+UfejFBWjOW25QjfPS/jpFhuuHVIwEWwwrMd
         i3RcWP5961aaviZ2j6/lgwL6bGJEQc+OgQRUMUevB4tTedAqjXnisjTfFPZvoJPlV7S/
         vsvQwlEW8th7ww0oXUZabUIykGMua5CQXhPy4t4avDhvhsA2UVG5vu6lNDWjpE86H6j9
         A/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556183; x=1781160983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qj5QrO6XqMBpUhtJt/zlH5aTxtuKQkoxIMlaQ1G+P/k=;
        b=tOOdpdKrf1m6n0lUqAozMVWanWGRnSOwv4BBL5iEmGdRdRdh6JFHLtUb9gDXjAiIBK
         SKJdBvSrERUC8Wd9Y8cIWvkRj7jRIehQ97UZaBOhrKX3KX8pJ2f9uD76WHtP1G7xqoOk
         drrqjLEIvaYeyeUKlSHJl8tC6MkZqOyVZG4jNv3X7z0l9/LFsnu8ij9iOXicQEoZWEG+
         wFeVbODBkWDAzaXFphTAXrVRJOvdmW/aVe/1IH83mEL9aKjwXoy0+BgHaenTZWATrPQz
         YT7/+u+FIpQt2u7E8pC40I1rc9VPBHJhNfoef+tLMZ2EaEf0hSbMCQRq/Dm5fualk0m/
         tlCw==
X-Forwarded-Encrypted: i=1; AFNElJ8LZmGDGskD8eET1vSiJNUXkfgfitVeotB9ra1NlShGwC0qmJLYVE3uXZidmbjUDFhdc4Apr3RWyyjk2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys+jBAYUwOJiISgMGH+vTXknm7KSg25h3gbs/riZmmyg390vyZ
	/0fCSoegwiaL8f7YTJcTRhPpVWs5vV6cNYlkj5uLwyWSN+IRz2KOmcZ+b9qNTg==
X-Gm-Gg: Acq92OG80L/BtvrYWl4AY6cMp+zx+WT3ldttvntu6v1xE97WqDERQG0L+szjDxukjwV
	VQmBzbUAD+k0aDSn9Z1+9RjxwEloRK4CDrmMUOQoptdnukx6JZkaYBLMIowZWdtQVmmQ2kUOaDA
	9e4za+eXDd0B4ZmUAfqhKxuUZzvc4LsWLCIEFQUjoeSk8ErbsBMJbi9SlrliSeFpsL8DWp9Qs2M
	q7JDyN/2cI1tE6rcFUvV12MfZ0QSYzbqn44uOZ4DMW/2skKFvPsgE5WMRmp6FxDj1RWrt78RstQ
	fHqjL9N6C2nbZP47vGsLjTvEG1XdQj2HBJ9+9KGnpxwXtnQ4zxxfrMEFlf3ymqhC77ViyvER05v
	lY2n1/NNFa9v5zjp4dLo/NHVCyRaIVx0BvhTZTdEhdCGktyLyDRTOi131T/H02bt+ENBjQNggt1
	I8Wfs4wE9a8aGS/w4ymnymBgQ=
X-Received: by 2002:a17:907:3c8e:b0:bec:157:a63a with SMTP id a640c23a62f3a-bf0ac20eb8emr318362566b.1.1780556183335;
        Wed, 03 Jun 2026 23:56:23 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:22 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/10] ARM: tegra: tf701t: Complete power sensor node
Date: Thu,  4 Jun 2026 09:55:54 +0300
Message-ID: <20260604065556.137614-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604065556.137614-1-clamor95@gmail.com>
References: <20260604065556.137614-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing vs-supply and io-channel-cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index e3e0b4ba7eb8..df4ccb332301 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1391,6 +1391,9 @@ power-sensor@44 {
 			reg = <0x44>;
 
 			shunt-resistor = <5000>;
+
+			vs-supply = <&vdd_3v3_sys>;
+			#io-channel-cells = <1>;
 		};
 	};
 
-- 
2.53.0

