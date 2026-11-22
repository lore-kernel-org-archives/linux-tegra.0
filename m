Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378503;
	b=BjJQkOwOWjes3moMPTBKB1SkJ/IVB2ci8mb0W3HqoWDzCfanj1pSJ9HeprTd83WEzjEe
	 ZoPxwerWAP+gV9jsp8mQkRHwXaSzZOswjyZeyiEs3ag59q8iqJ60YFGy/VLKnJymFccPZ
	 3fZD7ANSujaSaYS6Ypw+VRVS+1tJciUhqy1TtI58yWf7izecTKZr8u5q72Oz+qID7xneK
	 hxJgB4CLcZlbr5dGKFIb5wLY2BEvokl069q7+K4hZZllE9PinuX/18F+0ZY27c/ULwMmu
	 9sB6ROLN1MJwVaRcsDMhN7AEITaQIClKsozCWapOw7SI5Euh35m02enOr4q3ePW10Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MaqYWImv02DJ+CpqgjmSJfLLPzjJ2VjogqkfcXMZh8E=;
	b=0qo6/eEacl1qjeXloQodoFDpOR0wCuKO40FI8fu47IfISzdJpfaN4aGxNhMXvZDLKNFi
	 4V+8N0l29kgV/v4o+ZDhidrXG7e7ymTpfGRxgVidkx82X41oKlrLcoe9QGChWGAbZomsJ
	 VBXPRKZnoWmjnPyJ8XyuhFcDE5tOkQ49QuO1kgozE9YTPHFpd7eUO0HOJhp+NVbwKsnI9
	 nzxdKdU3BEz4sHCIHO4s48DXmXQocuntk/CCxzHd1mvWIkjGOpgsIicqa6r/Qi9oBb84B
	 BfO5gKx6UR27RHmzb09+IAwzCo+4Q5fLe+hFskc0EM0500YQ64/SvIo8C+7pO76ZFUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+tBIyG6;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF0606A689
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11FF0606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A+tBIyG6
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so4418359a12.0
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378501; x=1795983301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MaqYWImv02DJ+CpqgjmSJfLLPzjJ2VjogqkfcXMZh8E=;
        b=A+tBIyG6FwKA51lw2JK4ViwReDqsc56mbtfe7BW93tsdunhceN+ejkxD2D0u8vNYyU
         PcO/HRW82JLP1rm439Aljgl4SuoKKPM/PnLDLOKtzRXRE9aHCilcoX/sgIICSyacpAtF
         UNaoQeIdQav/KcsFDCZMe1gERTA65AFO2bS+KRdQi8ENsvTHTVGzaNxmnG2dsWvhBtHP
         PT+UqCHw42m61ldaoGj70KTYsRtdgWPh68Q+4n6ChIz6/4a+xfrNyiAdZLNpB+Wzyr10
         fau0+BG6bLu2DJfS69pAkUHon0HQQ9YL+sxGD5mqV1MVI2Ftuk48oqcu244aCxvaabX5
         96fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378501; x=1795983301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MaqYWImv02DJ+CpqgjmSJfLLPzjJ2VjogqkfcXMZh8E=;
        b=LQe0AcpvDhf2Oh9WDWpzIrljhrwDgWPHYXWC78jHF+3ZLO7SF9xV2Mls/C9p6C7XvK
         Vc+pkWtedjNqS+xUsz+K1+nRPNCV9wySQM5uuODNQSdHWAla3DIRE6FOctgdSmI8ycqz
         n6CXTiWLkJQNwgejyh9WiSlM2JH7dBrcsATh6meLtwywn6aBbKSqzfV4xG7xi2fN1daK
         nnkueey+dgBYd9RmER77smM6WaaU29+QuU13itKrdwkZmqOrTR8zNouYJCCEHLle9nlL
         B6OXcfqp8TSbt5lvhyv6nMWCvRZqgyl5TxhLS5e/vGLUq9rR8zh3Bg5jbDiP5CPdRJDa
         N9MQ==
X-Forwarded-Encrypted: i=1; AL+hErHxq+cTNganUH5L/a2dqdthT4zXsxJvrkld2exmGTrQhqWYKROheo901IIWq1MYWX/OqwkAf0B2y4RTyw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9nCVqcxTBLz4u8riCBepchPM5OEdxNz2vbxYicVMhhW5rQz1x2
	6SOzx/Ln/1ilM0ppjVIW+MayKu1BQmTvqU6TGzqIdSGrgIrYwshbCp+g
X-Gm-Gg: AZFdTZevPxSLJXT5SSIEDW1gaK9v5QjkdAcjDwhSFFTL6jf10JDaGdwwvq2ipOxr87H
	tM3SeZlUGpDyLWuKmVKp3LM43EfSeUJ4nVyrC5bkEI3bKlLQi7wgSlhkZTyRVN9YuTT9TEDrXT/
	N1SJeQh0VpxdjKirrCCuwFMrWL5FDqPVo1P2ynWFs5uwTIya0NOAM7kcQ4Ushmz1k21wflcsstX
	7aU/jgUcj5C7bsuMPDQvYfJc/NKq4tdkxHQU+7Guoj6uyNZYhMShTG0CspFFV0bbMzbBPzBb3YJ
	CYOjqi27ylxNGXQAC3UrKHJyhSCG4my8d7jncSMuKXwie5N5Zg03Ci5AW7ykmvynOcyGqYJKMCP
	aAFTo2OlcBR3MBKjowMpGDYFH+cT0c3oA+DGvOd5isn9kpYhYxPFy/feiehULNo0iNd6mEwq+PM
	CM1YgXFlAkTwHlxWQAEtNie/Z/e2Uwvkm2lJ432m2BqGNkCnK7GCdzBfueTvimbrnL8XBwnC4mQ
	3nqH+pwKW83aoppuOnm+ytDFLlmqwvDINnaCMCIjf/yiYrqxA/Gweq25Hju7tpzUz+Csv8K4W4f
	+2b0kIQ8tXehBbWczFtTLofe9I1gHFqqP3l+Qm9X3jYqLGVj7YkaBAR8lL6PlFKbU5Nmh2NcE9S
	GNGQdkXx+gg==
X-Received: by 2002:aa7:da08:0:b0:6ba:144f:ae49 with SMTP id 4fb4d7f45d1cf-6ba37e8b7cemr4884943a12.27.1795378501279;
        Sun, 22 Nov 2026 12:15:01 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:15:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 16/18] ARM: tegra: tegratab: Update aliases, chosen and memory nodes
Date: Sun, 22 Nov 2026 22:14:05 +0200
Message-ID: <20261122201407.23742-17-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Add the chassis-type property. Add RTC aliases and place the aliases node
first. Drop redundant configurations from the chosen node. Expose all
available memory in the memory node, but add reserved memory regions to
avoid touching TrustZone or bootloader firmware.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 44 ++++++++++++++-----
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index f6b167dc8d338..1e9df07dadc98 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -6,23 +6,24 @@
 #include "tegra114.dtsi"
 
 / {
-	chosen {
-		/* TN7's bootloader's arguments need to be overridden */
-		bootargs = "console=ttyS0,115200n8 console=tty1 gpt fbcon=rotate:2";
-		/* TN7's bootloader will place initrd at this address */
-		linux,initrd-start = <0x82000000>;
-		linux,initrd-end = <0x82800000>;
-	};
+	chassis-type = "tablet";
 
 	aliases {
 		mmc0 = &sdmmc4; /* eMMC */
 		mmc1 = &sdmmc3; /* uSD slot */
 		mmc2 = &sdmmc1; /* WiFi */
 
-		serial0 = &uartd;
+		rtc0 = &palmas;
+		rtc1 = "/rtc@7000e000";
+
+		serial0 = &uartd; /* Console */
 		serial1 = &uartc; /* Bluetooth */
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	firmware {
 		trusted-foundations {
 			compatible = "tlm,trusted-foundations";
@@ -32,8 +33,31 @@ trusted-foundations {
 	};
 
 	memory@80000000 {
-		/* memory >= 0x37e00000 is reserved for firmware usage */
-		reg = <0x80000000 0x37e00000>;
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		linux,cma@80000000 {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x80000000 0x30000000>;
+			size = <0x10000000>;		/* 256MiB */
+			linux,cma-default;
+			reusable;
+		};
+
+		bootloader-firmware@b7e00000 {
+			reg = <0xb7e00000 0x8000000>;   /* 128MB */
+			no-map;
+		};
+
+		trustzone@bfe00000 {
+			reg = <0xbfe00000 0x200000>;	/* 2MB */
+			no-map;
+		};
 	};
 
 	host1x@50000000 {
-- 
2.53.0

