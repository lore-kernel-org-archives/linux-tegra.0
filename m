Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B653090EF
	for <linux-tegra@vger.kernel.org>; Fri, 22 Aug 2025 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869642; cv=none; b=phJ310BgAXkgHC8vESyl3fQJhZUhuMKxbnRngjg1BfhVGONES9ibCICouFG69ztlIV7e5HzFBRb8BEgIf0T+QaJ6LRmPgxyH3smv68oXQqG46ZavQTmEuKYZ1M4YQSggBaCqwr0iEz0OJDkugfBqAAnAhXMrpNMesNBAu3SaLE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869642; c=relaxed/simple;
	bh=8gAmAJpykAypxXShgpXJ+YHQRn2sBo0ccaC3j3ZbunQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=euz2eSAB5JW0iNubAomkTZzlUlJB85w+FKVhtrZKLrnb9nk9nimXt3M280BhSiYrsxP9MYVD8IyZD31rhEGQ5QbK7rX9cqtTCwQ8Lj6CzDcBzjDyJdk7OvgG2SJLAxTvvS7KwNRcUgPuAk+ozOyCG279Gn4kTm4nTPUkCk6TXts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tURL10Ht; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tURL10Ht"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7a01426so28360466b.2
        for <linux-tegra@vger.kernel.org>; Fri, 22 Aug 2025 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869637; x=1756474437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7AgEtBb3vOoQNSD1V/oSDnP6NsNXAYQ/9W8TOu1CYY=;
        b=tURL10HtuXAjkQGSa6fXu8Z7p+4pOSu8nWVPVI3RQb1kv4n2dcIopEjv5kbl7VwwH5
         nx4sL/A+x7s5TQF4nJJTtPpv342SoMUZHpko/uKp0JuHYCCzchjBfqUBvTDeFgestk2l
         iZjW6HMveMXI0CpLo7tDA1Sut4UaGjotyxKToJaeLR0SBbsx9qxdNsPjODpDfANSvySb
         E5DVBpXj241ZSWXQePkUuVPQ7ec1t4au8qHu/c2nxWnlHKjnwQm2FiY1Y3p0SfMVo1yu
         x8JJO+CqVg+X3tNGSapeoatASH6v2Hk9S/VVVSk6tHEUVBQ3CXp+kyXC4fC3OrirHHYc
         y74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869637; x=1756474437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7AgEtBb3vOoQNSD1V/oSDnP6NsNXAYQ/9W8TOu1CYY=;
        b=JnIBjvnQnokw3sqGTNUL3hfN9GEenaJk3wdAp2yOUt40Sc4bKp/1uPzqKoov5VZsGX
         TBF1TsJAEv0n8Uy7kSwKItT5hwaiQ965HTHaqjYWWqE+fpnKzRgjvpkp01d5miLznRLF
         UTOu0jklExT3qXjm57tldrzo5IPlixADpb9cpSwkd3PtjnR5LWjk8TQIXj7oZBhqS9C0
         MKRQsOH4WwxqELvZw83erLlfqyjj2L0DzkWJQCMtgE7raVjEXU5+71FKT/dnXNVnrrK/
         kBoHJA2fe8CCU7dCgjGl/vL6iqr+VgJNEvSJbs9K25ZW9iluMS0fQoPl5XpLwCVD2moe
         iZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCVFW0WodaCHmJOeXLpH8k2+itT+pFpAit0/Bq//XjnMnEan2JgEtlWjMQujALBiU+kNznwOhCo1x9/Ccg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9/lUKgF1hdnMMoQe9lrRiJLhM9M3BvsHaN7vkOEWd9CNk9bG
	n/QA8VgruUBdX1ivckUMlZsD816P1Uho6L51IqVi3/ct//dP1Gc4wlTj8biKJxwANVs=
X-Gm-Gg: ASbGncseQqhl8YRjMhlrL8upfh2Zq4sXJzwd5vmhwlJ1caI8VSVxPVE4tWPYY9kg0hm
	zihi2wEelEdQUJeAgRpgFNSwVhT8ArChtPy+NQYNu6lmpwthcjmo/vehGh96sP9MVe1CwKe/U/q
	WXJXm94b5jjq2LZijQ/xbjUHjoDiXy2FwfqyZdhp5KRr7fivtGlWAkpX9tPTbMdimx7rQ0ih1b1
	LcCB5h/1kbP9UVvqrJX8rXZbr/4hzlNyzz025uggegmG9YEHIlUn5KAfp4oQnt+lh7oBmkErYEa
	yfuVgtY2Xt02+++tJG3xIZIFlgh4pMPpAlmtX45Ciy6P529EuNB67ge/8iSs+dJ7QkF/4I0YnYY
	oogDxKLAk3IpT/wYt0E0zz2WFUtKRqhB74w==
X-Google-Smtp-Source: AGHT+IH/6VeQRa8ABUMDHkBjRuY41G6A4Z0+/t+uoy9NDpnb7Tsxehzo4TRN5bsoBM6c2KbSAs4ROQ==
X-Received: by 2002:a17:907:9405:b0:af9:5a1c:fee5 with SMTP id a640c23a62f3a-afe2874f3eemr157690666b.0.1755869637355;
        Fri, 22 Aug 2025 06:33:57 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded537f98sm606493066b.104.2025.08.22.06.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:33:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] arm64: tegra: Add default GIC address cells on Tegra132
Date: Fri, 22 Aug 2025 15:33:52 +0200
Message-ID: <20250822133351.312424-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=8gAmAJpykAypxXShgpXJ+YHQRn2sBo0ccaC3j3ZbunQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHG/v9O+jMlw2u+lyTYeKytKAxYifhGbf4k95
 00iTqY4ap+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxvwAKCRDBN2bmhouD
 16O0D/93HxloowY3QN3qZHFlsBmzqZMth34C9pAi+VZM9XMjoB6UtQdNVJ83jatRMwB2lsEDIp+
 G0zfARYpM2xfgl5ADjErn3Fwp8fFUhaEoRPHGt1esf/p9cZ0RTpMjijio/ksouWAS+nHp1QhnX2
 rbR2tAwyJXbvAKHTqf78P7XsxHxiwtMVaPRD5yFzUFAi3TmF0EtKNEnkQPT7Cw8IKFvSoBcFDfF
 MfSmIQMZvmbi2ArMYSHsGANPNn2UktVIfvwni+31QpnKdoZ/5vsOkUmHOAmQ9bYyQ9pFfHR72xo
 6xEEJJZGrdoSyz+PKNTZChbdqHxoIThck51F/d+o3QP6+mruqVZA6I/BIKcsunA8FDZlthATwED
 7mg9iIIrheMOr5v9xcO+0q7bIKdxD37BxsFFoOvGUjfTJ6SU2G7985kOkPBIAAPrKSsCEIuS7+E
 nuLPB0l0XPt/iBRtLU+wPBLxo4tTuxIuORbvKK6pCsv5brsXiGk51GxsSbRDTVgOw3iWsgjIPIv
 9WvjDPYJzEZXloKkxfwemXczbOsV3p5LADssqUZw814DMVwrTLvhab/U6HOfCEXfz0h3u9fk/IV
 I5lpP4u1nwBcdsRv5/BL26pOy+EP65b+hdUpqZ8VVwGKlxLyse/p/3BMgdrQ52AdkrPONcJ/DSe GbHm0UuD21AQP7A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  tegra132.dtsi:32.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/nvidia/tegra132.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
index 5bcccfef3f7f..93208eb72cb0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
@@ -175,6 +175,7 @@ i2c-bus {
 
 	gic: interrupt-controller@50041000 {
 		compatible = "arm,cortex-a15-gic";
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x50041000 0x0 0x1000>,
-- 
2.48.1

