Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07729341AA7;
	Wed, 20 Aug 2025 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755702835; cv=none; b=tSs30qFQ8nYElKkCmO8cnW5U9Z8kGNR6JfCytWIN11I6zVByribDgTqWK/vWD2dK580m6Y4RTNkkwBSLBqLXXXrQWrM5l/vBt8AVHfqdybbFCgO18XT+ie9wN1V0EgqT9wmrerZesAYd2QeaGiMg7o+CZlCoChlxvRI4JjnGkH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755702835; c=relaxed/simple;
	bh=6jQSrwH7ipH0nEkTGUoLHwCyoxsBgAmpvRdIoQlw5pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzEGIXkwf98Rbuhdn0qF0WNa9njVVqiuxDbRVkKo0+X7tRE5lTHlrSBcAF1oVyCzFMHHU6RV6jaRdiDIslBfTfdlVZj4USiXbk85DKrKpQCh2Ts77iOBZ/RDR070ccmU5X4kXO6fpY/1t45G3HIHjBEbI4SqnhtwYakOKITKik0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7g6QANO; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7g6QANO"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so27512a12.0;
        Wed, 20 Aug 2025 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755702831; x=1756307631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLCxSPlJ/jNNOOnGmgwss6jiEn51DvTSVZm4+Drku5U=;
        b=m7g6QANOgz7C8fTKAj88ldfMqkUsA11O/iUjhYX6tIsSbWKLkmImUNkJCsgW4lk2D9
         nGZ0C4CEJR8bSL/NRWQTdY5PKOjstIdwVO4neiCYGKMb2Jo//7qv85lfKRVJwmkIap76
         vB4PZ0HGW+3tijAcgy6UsPTOlgsB2mDBxoGXTH+tAFmFMIXrcl/kDnTbcU1UdPVTpW79
         Q4wEJna19HYcPZWYitwY0GRBI0bAYGll3Bl/wpXjcpEzkAFpoyt18uUNmedVm9VHRcVo
         u6dffiNk2sl+WvV3aqVrCH4d0zUCqLjbxQ/uEoAooRmK66JH0BP93AsVenkjFarx3n4V
         TW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755702831; x=1756307631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLCxSPlJ/jNNOOnGmgwss6jiEn51DvTSVZm4+Drku5U=;
        b=LFAGQe8fOhp1vA27SGslglfOAp7ZZ50pjZuiCV5oTtBWM1Kp9j2xtnbJ3ytlN+ZG/U
         /VzDaNU4coQM5w4/98jQh/bGevX7LTkM7SrOw5cG2tqHTi+fhs3Zu1ydUUr/wB5RZGX3
         ++RcFWFB58rkE9gE9Rcu7Au+vyezj2u/K460j+DToetnmDnyYgfFeUIMhv1v0FX2ku5T
         Uy6FTVed5DVosv/hxeg2TP1PC8Dpbbf0iB2SZc3xvvtstSSWKDbWE1uBN+EHJ8nDxEpv
         /lgi67c2wVd6q1f+mRGeS0nPWVG2LURargtsbx0BmAkRAf+yCs+3z+3jqTLzYEq2jW1i
         htLg==
X-Forwarded-Encrypted: i=1; AJvYcCVQfQehdJOVHHuGcisCQ489/JbJnBXUwavRfyNBOoBlNxmxMf5NYMqwmOF4fjqbWZmUxlYu2g+EalKm@vger.kernel.org, AJvYcCVzhjHzKUSVe0koZyEKd+qWxRY42/zPDnBvOr/5bFeQa89on+JUy7+4IYN8uBC9Lqx+qsd9iY++lmQ56ks=@vger.kernel.org, AJvYcCXiyAjDlXLEIkFpN7cKMT2qedArl5j3wqLMUX6HTLyMMR+yAFndODTCxz48Ji4+W+HPY1/wT9D6r5Hm@vger.kernel.org
X-Gm-Message-State: AOJu0YyMd6EdsnCtxQdHH91gvOSOCSuPjYPq54mds1v2dw6zWukoSCk6
	CSYfPpvpnhChQjHvwdaXg7yIO66YAhWmc6t1ZJorggy9rQgZTeiTIHsS
X-Gm-Gg: ASbGncvto3y47i+A5NG4mBfj8S1ve5Jdr05ojwk/PZCdoQEYa2bXuTWs5q4uogBcmRV
	JUBV5NOtuYmJxVlRThrQj3jPo3U4ql7HPwONjbV1Bbapt165Cv7fXVKqRDs0KRT2Iwj/wd/yjdI
	na0hA9jJ8PYf5rekQs5DXnvI85vQY0vITlt2OMwGrbMHz5Bcnm2rU6vc+NpASC456FFe05oZ7+V
	P5Q1oZeZ/M4gnoy7W4uRRtUMSzRAlmWFZmtUbjXqubDUeCm8fEjHjLIoflnxMmxY6fCSB+ufJUb
	YsTL+SmKsiVYkdz+72DO8MtqtUctv64iK6sJP2nyGFJ6FDsRWyc0vE1OBKeYbstNhmq4aPKVEDK
	DRN9eGuOwoH7vqA==
X-Google-Smtp-Source: AGHT+IHR8l8CnZFMORYV+NBogXwGCqrVy3SDHzSca0vRkDOSy8x2Jvgzuvk4vA1CwG5NohoYk/F0vg==
X-Received: by 2002:a17:907:1c9b:b0:ae3:f903:e41 with SMTP id a640c23a62f3a-afdf0236d35mr292474166b.54.1755702831202;
        Wed, 20 Aug 2025 08:13:51 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdef1d34f8sm175905166b.83.2025.08.20.08.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:13:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 6/9] dt-bindings: memory: Document Tegra114 External Memory Controller
Date: Wed, 20 Aug 2025 18:13:20 +0300
Message-ID: <20250820151323.167772-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820151323.167772-1-clamor95@gmail.com>
References: <20250820151323.167772-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include Tegra114 support into existing Tegra124 EMC schema with the most
notable difference being the amount of EMC timings and a few SoC unique
entries.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../nvidia,tegra124-emc.yaml                  | 445 ++++++++++++------
 1 file changed, 292 insertions(+), 153 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index f5f03bf36413..ad755f8b68ea 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: nvidia,tegra124-emc
+    enum:
+      - nvidia,tegra114-emc
+      - nvidia,tegra124-emc
 
   reg:
     maxItems: 1
@@ -29,6 +31,9 @@ properties:
     items:
       - const: emc
 
+  interrupts:
+    maxItems: 1
+
   "#interconnect-cells":
     const: 0
 
@@ -161,156 +166,7 @@ patternProperties:
             description:
               value of the EMC_ZCAL_INTERVAL register for this set of timings
 
-          nvidia,emc-configuration:
-            description:
-              EMC timing characterization data. These are the registers (see
-              section "15.6.2 EMC Registers" in the TRM) whose values need to
-              be specified, according to the board documentation.
-            $ref: /schemas/types.yaml#/definitions/uint32-array
-            items:
-              - description: EMC_RC
-              - description: EMC_RFC
-              - description: EMC_RFC_SLR
-              - description: EMC_RAS
-              - description: EMC_RP
-              - description: EMC_R2W
-              - description: EMC_W2R
-              - description: EMC_R2P
-              - description: EMC_W2P
-              - description: EMC_RD_RCD
-              - description: EMC_WR_RCD
-              - description: EMC_RRD
-              - description: EMC_REXT
-              - description: EMC_WEXT
-              - description: EMC_WDV
-              - description: EMC_WDV_MASK
-              - description: EMC_QUSE
-              - description: EMC_QUSE_WIDTH
-              - description: EMC_IBDLY
-              - description: EMC_EINPUT
-              - description: EMC_EINPUT_DURATION
-              - description: EMC_PUTERM_EXTRA
-              - description: EMC_PUTERM_WIDTH
-              - description: EMC_PUTERM_ADJ
-              - description: EMC_CDB_CNTL_1
-              - description: EMC_CDB_CNTL_2
-              - description: EMC_CDB_CNTL_3
-              - description: EMC_QRST
-              - description: EMC_QSAFE
-              - description: EMC_RDV
-              - description: EMC_RDV_MASK
-              - description: EMC_REFRESH
-              - description: EMC_BURST_REFRESH_NUM
-              - description: EMC_PRE_REFRESH_REQ_CNT
-              - description: EMC_PDEX2WR
-              - description: EMC_PDEX2RD
-              - description: EMC_PCHG2PDEN
-              - description: EMC_ACT2PDEN
-              - description: EMC_AR2PDEN
-              - description: EMC_RW2PDEN
-              - description: EMC_TXSR
-              - description: EMC_TXSRDLL
-              - description: EMC_TCKE
-              - description: EMC_TCKESR
-              - description: EMC_TPD
-              - description: EMC_TFAW
-              - description: EMC_TRPAB
-              - description: EMC_TCLKSTABLE
-              - description: EMC_TCLKSTOP
-              - description: EMC_TREFBW
-              - description: EMC_FBIO_CFG6
-              - description: EMC_ODT_WRITE
-              - description: EMC_ODT_READ
-              - description: EMC_FBIO_CFG5
-              - description: EMC_CFG_DIG_DLL
-              - description: EMC_CFG_DIG_DLL_PERIOD
-              - description: EMC_DLL_XFORM_DQS0
-              - description: EMC_DLL_XFORM_DQS1
-              - description: EMC_DLL_XFORM_DQS2
-              - description: EMC_DLL_XFORM_DQS3
-              - description: EMC_DLL_XFORM_DQS4
-              - description: EMC_DLL_XFORM_DQS5
-              - description: EMC_DLL_XFORM_DQS6
-              - description: EMC_DLL_XFORM_DQS7
-              - description: EMC_DLL_XFORM_DQS8
-              - description: EMC_DLL_XFORM_DQS9
-              - description: EMC_DLL_XFORM_DQS10
-              - description: EMC_DLL_XFORM_DQS11
-              - description: EMC_DLL_XFORM_DQS12
-              - description: EMC_DLL_XFORM_DQS13
-              - description: EMC_DLL_XFORM_DQS14
-              - description: EMC_DLL_XFORM_DQS15
-              - description: EMC_DLL_XFORM_QUSE0
-              - description: EMC_DLL_XFORM_QUSE1
-              - description: EMC_DLL_XFORM_QUSE2
-              - description: EMC_DLL_XFORM_QUSE3
-              - description: EMC_DLL_XFORM_QUSE4
-              - description: EMC_DLL_XFORM_QUSE5
-              - description: EMC_DLL_XFORM_QUSE6
-              - description: EMC_DLL_XFORM_QUSE7
-              - description: EMC_DLL_XFORM_ADDR0
-              - description: EMC_DLL_XFORM_ADDR1
-              - description: EMC_DLL_XFORM_ADDR2
-              - description: EMC_DLL_XFORM_ADDR3
-              - description: EMC_DLL_XFORM_ADDR4
-              - description: EMC_DLL_XFORM_ADDR5
-              - description: EMC_DLL_XFORM_QUSE8
-              - description: EMC_DLL_XFORM_QUSE9
-              - description: EMC_DLL_XFORM_QUSE10
-              - description: EMC_DLL_XFORM_QUSE11
-              - description: EMC_DLL_XFORM_QUSE12
-              - description: EMC_DLL_XFORM_QUSE13
-              - description: EMC_DLL_XFORM_QUSE14
-              - description: EMC_DLL_XFORM_QUSE15
-              - description: EMC_DLI_TRIM_TXDQS0
-              - description: EMC_DLI_TRIM_TXDQS1
-              - description: EMC_DLI_TRIM_TXDQS2
-              - description: EMC_DLI_TRIM_TXDQS3
-              - description: EMC_DLI_TRIM_TXDQS4
-              - description: EMC_DLI_TRIM_TXDQS5
-              - description: EMC_DLI_TRIM_TXDQS6
-              - description: EMC_DLI_TRIM_TXDQS7
-              - description: EMC_DLI_TRIM_TXDQS8
-              - description: EMC_DLI_TRIM_TXDQS9
-              - description: EMC_DLI_TRIM_TXDQS10
-              - description: EMC_DLI_TRIM_TXDQS11
-              - description: EMC_DLI_TRIM_TXDQS12
-              - description: EMC_DLI_TRIM_TXDQS13
-              - description: EMC_DLI_TRIM_TXDQS14
-              - description: EMC_DLI_TRIM_TXDQS15
-              - description: EMC_DLL_XFORM_DQ0
-              - description: EMC_DLL_XFORM_DQ1
-              - description: EMC_DLL_XFORM_DQ2
-              - description: EMC_DLL_XFORM_DQ3
-              - description: EMC_DLL_XFORM_DQ4
-              - description: EMC_DLL_XFORM_DQ5
-              - description: EMC_DLL_XFORM_DQ6
-              - description: EMC_DLL_XFORM_DQ7
-              - description: EMC_XM2CMDPADCTRL
-              - description: EMC_XM2CMDPADCTRL4
-              - description: EMC_XM2CMDPADCTRL5
-              - description: EMC_XM2DQPADCTRL2
-              - description: EMC_XM2DQPADCTRL3
-              - description: EMC_XM2CLKPADCTRL
-              - description: EMC_XM2CLKPADCTRL2
-              - description: EMC_XM2COMPPADCTRL
-              - description: EMC_XM2VTTGENPADCTRL
-              - description: EMC_XM2VTTGENPADCTRL2
-              - description: EMC_XM2VTTGENPADCTRL3
-              - description: EMC_XM2DQSPADCTRL3
-              - description: EMC_XM2DQSPADCTRL4
-              - description: EMC_XM2DQSPADCTRL5
-              - description: EMC_XM2DQSPADCTRL6
-              - description: EMC_DSR_VTTGEN_DRV
-              - description: EMC_TXDSRVTTGEN
-              - description: EMC_FBIO_SPARE
-              - description: EMC_ZCAL_WAIT_CNT
-              - description: EMC_MRS_WAIT_CNT2
-              - description: EMC_CTT
-              - description: EMC_CTT_DURATION
-              - description: EMC_CFG_PIPE
-              - description: EMC_DYN_SELF_REF_CONTROL
-              - description: EMC_QPOP
+          nvidia,emc-configuration: true
 
         required:
           - clock-frequency
@@ -318,9 +174,7 @@ patternProperties:
           - nvidia,emc-auto-cal-config2
           - nvidia,emc-auto-cal-config3
           - nvidia,emc-auto-cal-interval
-          - nvidia,emc-bgbias-ctl0
           - nvidia,emc-cfg
-          - nvidia,emc-cfg-2
           - nvidia,emc-ctt-term-ctrl
           - nvidia,emc-mode-1
           - nvidia,emc-mode-2
@@ -344,6 +198,291 @@ required:
   - "#interconnect-cells"
   - operating-points-v2
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-emc
+    then:
+      patternProperties:
+        "^emc-timings-[0-9]+$":
+          patternProperties:
+            "^timing-[0-9]+$":
+              properties:
+                nvidia,emc-configuration:
+                  description:
+                    EMC timing characterization data. These are the registers (see
+                    section "20.11.2 EMC Registers" in the TRM) whose values need to
+                    be specified, according to the board documentation.
+                  $ref: /schemas/types.yaml#/definitions/uint32-array
+                  items:
+                    - description: EMC_RC
+                    - description: EMC_RFC
+                    - description: EMC_RAS
+                    - description: EMC_RP
+                    - description: EMC_R2W
+                    - description: EMC_W2R
+                    - description: EMC_R2P
+                    - description: EMC_W2P
+                    - description: EMC_RD_RCD
+                    - description: EMC_WR_RCD
+                    - description: EMC_RRD
+                    - description: EMC_REXT
+                    - description: EMC_WEXT
+                    - description: EMC_WDV
+                    - description: EMC_WDV_MASK
+                    - description: EMC_QUSE
+                    - description: EMC_IBDLY
+                    - description: EMC_EINPUT
+                    - description: EMC_EINPUT_DURATION
+                    - description: EMC_PUTERM_EXTRA
+                    - description: EMC_CDB_CNTL_1
+                    - description: EMC_CDB_CNTL_2
+                    - description: EMC_QRST
+                    - description: EMC_QSAFE
+                    - description: EMC_RDV
+                    - description: EMC_RDV_MASK
+                    - description: EMC_REFRESH
+                    - description: EMC_BURST_REFRESH_NUM
+                    - description: EMC_PRE_REFRESH_REQ_CNT
+                    - description: EMC_PDEX2WR
+                    - description: EMC_PDEX2RD
+                    - description: EMC_PCHG2PDEN
+                    - description: EMC_ACT2PDEN
+                    - description: EMC_AR2PDEN
+                    - description: EMC_RW2PDEN
+                    - description: EMC_TXSR
+                    - description: EMC_TXSRDLL
+                    - description: EMC_TCKE
+                    - description: EMC_TCKESR
+                    - description: EMC_TPD
+                    - description: EMC_TFAW
+                    - description: EMC_TRPAB
+                    - description: EMC_TCLKSTABLE
+                    - description: EMC_TCLKSTOP
+                    - description: EMC_TREFBW
+                    - description: EMC_QUSE_EXTRA
+                    - description: EMC_FBIO_CFG6
+                    - description: EMC_ODT_WRITE
+                    - description: EMC_ODT_READ
+                    - description: EMC_FBIO_CFG5
+                    - description: EMC_CFG_DIG_DLL
+                    - description: EMC_CFG_DIG_DLL_PERIOD
+                    - description: EMC_DLL_XFORM_DQS0
+                    - description: EMC_DLL_XFORM_DQS1
+                    - description: EMC_DLL_XFORM_DQS2
+                    - description: EMC_DLL_XFORM_DQS3
+                    - description: EMC_DLL_XFORM_DQS4
+                    - description: EMC_DLL_XFORM_DQS5
+                    - description: EMC_DLL_XFORM_DQS6
+                    - description: EMC_DLL_XFORM_DQS7
+                    - description: EMC_DLL_XFORM_QUSE0
+                    - description: EMC_DLL_XFORM_QUSE1
+                    - description: EMC_DLL_XFORM_QUSE2
+                    - description: EMC_DLL_XFORM_QUSE3
+                    - description: EMC_DLL_XFORM_QUSE4
+                    - description: EMC_DLL_XFORM_QUSE5
+                    - description: EMC_DLL_XFORM_QUSE6
+                    - description: EMC_DLL_XFORM_QUSE7
+                    - description: EMC_DLI_TRIM_TXDQS0
+                    - description: EMC_DLI_TRIM_TXDQS1
+                    - description: EMC_DLI_TRIM_TXDQS2
+                    - description: EMC_DLI_TRIM_TXDQS3
+                    - description: EMC_DLI_TRIM_TXDQS4
+                    - description: EMC_DLI_TRIM_TXDQS5
+                    - description: EMC_DLI_TRIM_TXDQS6
+                    - description: EMC_DLI_TRIM_TXDQS7
+                    - description: EMC_DLL_XFORM_DQ0
+                    - description: EMC_DLL_XFORM_DQ1
+                    - description: EMC_DLL_XFORM_DQ2
+                    - description: EMC_DLL_XFORM_DQ3
+                    - description: EMC_XM2CMDPADCTRL
+                    - description: EMC_XM2CMDPADCTRL4
+                    - description: EMC_XM2DQPADCTRL2
+                    - description: EMC_XM2CLKPADCTRL
+                    - description: EMC_XM2COMPPADCTRL
+                    - description: EMC_XM2VTTGENPADCTRL
+                    - description: EMC_XM2VTTGENPADCTRL2
+                    - description: EMC_XM2DQSPADCTRL3
+                    - description: EMC_XM2DQSPADCTRL4
+                    - description: EMC_DSR_VTTGEN_DRV
+                    - description: EMC_TXDSRVTTGEN
+                    - description: EMC_FBIO_SPARE
+                    - description: EMC_ZCAL_WAIT_CNT
+                    - description: EMC_MRS_WAIT_CNT2
+                    - description: EMC_CTT
+                    - description: EMC_CTT_DURATION
+                    - description: EMC_DYN_SELF_REF_CONTROL
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra124-emc
+    then:
+      patternProperties:
+        "^emc-timings-[0-9]+$":
+          patternProperties:
+            "^timing-[0-9]+$":
+              properties:
+                nvidia,emc-configuration:
+                  description:
+                    EMC timing characterization data. These are the registers (see
+                    section "15.6.2 EMC Registers" in the TRM) whose values need to
+                    be specified, according to the board documentation.
+                  $ref: /schemas/types.yaml#/definitions/uint32-array
+                  items:
+                    - description: EMC_RC
+                    - description: EMC_RFC
+                    - description: EMC_RFC_SLR
+                    - description: EMC_RAS
+                    - description: EMC_RP
+                    - description: EMC_R2W
+                    - description: EMC_W2R
+                    - description: EMC_R2P
+                    - description: EMC_W2P
+                    - description: EMC_RD_RCD
+                    - description: EMC_WR_RCD
+                    - description: EMC_RRD
+                    - description: EMC_REXT
+                    - description: EMC_WEXT
+                    - description: EMC_WDV
+                    - description: EMC_WDV_MASK
+                    - description: EMC_QUSE
+                    - description: EMC_QUSE_WIDTH
+                    - description: EMC_IBDLY
+                    - description: EMC_EINPUT
+                    - description: EMC_EINPUT_DURATION
+                    - description: EMC_PUTERM_EXTRA
+                    - description: EMC_PUTERM_WIDTH
+                    - description: EMC_PUTERM_ADJ
+                    - description: EMC_CDB_CNTL_1
+                    - description: EMC_CDB_CNTL_2
+                    - description: EMC_CDB_CNTL_3
+                    - description: EMC_QRST
+                    - description: EMC_QSAFE
+                    - description: EMC_RDV
+                    - description: EMC_RDV_MASK
+                    - description: EMC_REFRESH
+                    - description: EMC_BURST_REFRESH_NUM
+                    - description: EMC_PRE_REFRESH_REQ_CNT
+                    - description: EMC_PDEX2WR
+                    - description: EMC_PDEX2RD
+                    - description: EMC_PCHG2PDEN
+                    - description: EMC_ACT2PDEN
+                    - description: EMC_AR2PDEN
+                    - description: EMC_RW2PDEN
+                    - description: EMC_TXSR
+                    - description: EMC_TXSRDLL
+                    - description: EMC_TCKE
+                    - description: EMC_TCKESR
+                    - description: EMC_TPD
+                    - description: EMC_TFAW
+                    - description: EMC_TRPAB
+                    - description: EMC_TCLKSTABLE
+                    - description: EMC_TCLKSTOP
+                    - description: EMC_TREFBW
+                    - description: EMC_FBIO_CFG6
+                    - description: EMC_ODT_WRITE
+                    - description: EMC_ODT_READ
+                    - description: EMC_FBIO_CFG5
+                    - description: EMC_CFG_DIG_DLL
+                    - description: EMC_CFG_DIG_DLL_PERIOD
+                    - description: EMC_DLL_XFORM_DQS0
+                    - description: EMC_DLL_XFORM_DQS1
+                    - description: EMC_DLL_XFORM_DQS2
+                    - description: EMC_DLL_XFORM_DQS3
+                    - description: EMC_DLL_XFORM_DQS4
+                    - description: EMC_DLL_XFORM_DQS5
+                    - description: EMC_DLL_XFORM_DQS6
+                    - description: EMC_DLL_XFORM_DQS7
+                    - description: EMC_DLL_XFORM_DQS8
+                    - description: EMC_DLL_XFORM_DQS9
+                    - description: EMC_DLL_XFORM_DQS10
+                    - description: EMC_DLL_XFORM_DQS11
+                    - description: EMC_DLL_XFORM_DQS12
+                    - description: EMC_DLL_XFORM_DQS13
+                    - description: EMC_DLL_XFORM_DQS14
+                    - description: EMC_DLL_XFORM_DQS15
+                    - description: EMC_DLL_XFORM_QUSE0
+                    - description: EMC_DLL_XFORM_QUSE1
+                    - description: EMC_DLL_XFORM_QUSE2
+                    - description: EMC_DLL_XFORM_QUSE3
+                    - description: EMC_DLL_XFORM_QUSE4
+                    - description: EMC_DLL_XFORM_QUSE5
+                    - description: EMC_DLL_XFORM_QUSE6
+                    - description: EMC_DLL_XFORM_QUSE7
+                    - description: EMC_DLL_XFORM_ADDR0
+                    - description: EMC_DLL_XFORM_ADDR1
+                    - description: EMC_DLL_XFORM_ADDR2
+                    - description: EMC_DLL_XFORM_ADDR3
+                    - description: EMC_DLL_XFORM_ADDR4
+                    - description: EMC_DLL_XFORM_ADDR5
+                    - description: EMC_DLL_XFORM_QUSE8
+                    - description: EMC_DLL_XFORM_QUSE9
+                    - description: EMC_DLL_XFORM_QUSE10
+                    - description: EMC_DLL_XFORM_QUSE11
+                    - description: EMC_DLL_XFORM_QUSE12
+                    - description: EMC_DLL_XFORM_QUSE13
+                    - description: EMC_DLL_XFORM_QUSE14
+                    - description: EMC_DLL_XFORM_QUSE15
+                    - description: EMC_DLI_TRIM_TXDQS0
+                    - description: EMC_DLI_TRIM_TXDQS1
+                    - description: EMC_DLI_TRIM_TXDQS2
+                    - description: EMC_DLI_TRIM_TXDQS3
+                    - description: EMC_DLI_TRIM_TXDQS4
+                    - description: EMC_DLI_TRIM_TXDQS5
+                    - description: EMC_DLI_TRIM_TXDQS6
+                    - description: EMC_DLI_TRIM_TXDQS7
+                    - description: EMC_DLI_TRIM_TXDQS8
+                    - description: EMC_DLI_TRIM_TXDQS9
+                    - description: EMC_DLI_TRIM_TXDQS10
+                    - description: EMC_DLI_TRIM_TXDQS11
+                    - description: EMC_DLI_TRIM_TXDQS12
+                    - description: EMC_DLI_TRIM_TXDQS13
+                    - description: EMC_DLI_TRIM_TXDQS14
+                    - description: EMC_DLI_TRIM_TXDQS15
+                    - description: EMC_DLL_XFORM_DQ0
+                    - description: EMC_DLL_XFORM_DQ1
+                    - description: EMC_DLL_XFORM_DQ2
+                    - description: EMC_DLL_XFORM_DQ3
+                    - description: EMC_DLL_XFORM_DQ4
+                    - description: EMC_DLL_XFORM_DQ5
+                    - description: EMC_DLL_XFORM_DQ6
+                    - description: EMC_DLL_XFORM_DQ7
+                    - description: EMC_XM2CMDPADCTRL
+                    - description: EMC_XM2CMDPADCTRL4
+                    - description: EMC_XM2CMDPADCTRL5
+                    - description: EMC_XM2DQPADCTRL2
+                    - description: EMC_XM2DQPADCTRL3
+                    - description: EMC_XM2CLKPADCTRL
+                    - description: EMC_XM2CLKPADCTRL2
+                    - description: EMC_XM2COMPPADCTRL
+                    - description: EMC_XM2VTTGENPADCTRL
+                    - description: EMC_XM2VTTGENPADCTRL2
+                    - description: EMC_XM2VTTGENPADCTRL3
+                    - description: EMC_XM2DQSPADCTRL3
+                    - description: EMC_XM2DQSPADCTRL4
+                    - description: EMC_XM2DQSPADCTRL5
+                    - description: EMC_XM2DQSPADCTRL6
+                    - description: EMC_DSR_VTTGEN_DRV
+                    - description: EMC_TXDSRVTTGEN
+                    - description: EMC_FBIO_SPARE
+                    - description: EMC_ZCAL_WAIT_CNT
+                    - description: EMC_MRS_WAIT_CNT2
+                    - description: EMC_CTT
+                    - description: EMC_CTT_DURATION
+                    - description: EMC_CFG_PIPE
+                    - description: EMC_DYN_SELF_REF_CONTROL
+                    - description: EMC_QPOP
+
+              required:
+                - nvidia,emc-bgbias-ctl0
+                - nvidia,emc-cfg-2
+
 additionalProperties: false
 
 examples:
-- 
2.48.1

