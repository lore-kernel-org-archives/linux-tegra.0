Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB523AA4E8
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485789; cv=none; b=FVcnDpzBUuCLoD+x7bNYxjVCS9IVkB5d4hrG2gGR65VyaTDa8GKRYkRmpuGOSVXo7tOlCJl2IPHHKPkcTd5KsxGKaMazHQu34fUo5xruz2LyZsxotsZWtDIwTYdcLaD4d3KvERteVhe1yuTcqpiz15yEBqaKa1JYvLI4rj1u8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485789; c=relaxed/simple;
	bh=HqaU0WD4qknySxmo3vgnfGG3nfKchKcuwTT98vGyX1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9MkEdO1hrGxO6i4BLIMWUhxRR7PdGb12nRNRyhfNv2vcZU86XKmfkGM6WVCDpjDTU/6xl1SBw40BBPCs/C4jlGyKQFtS0VMdB0cjIzd+91nD8mAPXpBhiSdWg1s7Hn4Ueg6r1yxejeiRxBR+cN4J1VNAFdwBhwjce41mBi4RIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IU1XYHGY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IU1XYHGY"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so4282778e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485768; x=1779090568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YTTzhUw+OVdj5GKdKIu9/eMnQ1mrdczMdEmRIufD+s=;
        b=IU1XYHGYGTlYBfKq3lUaHvO57ya7O5QTHVblzdgh/VYVwidztJZrQ8LgUuyZzkILvS
         biWkgvcr0z35I/AoO6V9Ic7FDrTaI2ITcHmop+03wIjaV7OvSA9vYTXCoSZTPGlz/w0f
         S0/4Jnf61KazTinkxNyx6Mt90m7eTD02FFT+8m4UXWvKe9a9gDV08tlW/uY4Y3NcK/EV
         NH6d2QfLYUGSRDIv/NTlOFysRqGLUEB5uuxA+dWDENxseXfvJbciSLXA6iazGXXpbHXA
         NoD3mHV6CvHudcN1rDM1NhMTagZt0KUQ2hxwxSb5GBS5dN2SJJgmr6cb2fiN3sgFkDeY
         MOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485768; x=1779090568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4YTTzhUw+OVdj5GKdKIu9/eMnQ1mrdczMdEmRIufD+s=;
        b=i+rLt7R0NZrRJXXtEVEdrTgdRw40o7HZHZDyogo05sJgL70y18/Hw71zBVly0goqa0
         xQ/k4nHvHX1hz/QzzsN41PdMsvZKy2fTglun5dSZPckDAl6L0oQiherY4Luuvi2RQsl5
         7bhQfWZOcfV5PQM8KoysRONfgbjsXgLsKsFJxPXfy/IUBIrgwg9i76OZf52Qkd01ctjG
         hR/JK3dlqGuB9A7qISYhQ1+AMEYviwWG15VbbSzPUckD4nr8zbb/y9gtwtC5Y6Kn5sib
         kb81/WD0SBgtiKmUueDHU9l0699lhI6INKfqur3W6QCEPggLF8SjtDPmyGWzYUzOJtEU
         tRmg==
X-Forwarded-Encrypted: i=1; AFNElJ9qtU6FaawXx8UgcK2qIhFnq9N7ocCc6WyV8tXvWQ4Uwb0rOvN/Ts1cp8meBbekaPOPq1yV9Kbij1t8zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3gMdGq/YtrdKDDmk8hh6jZ9rGq40etCcbpDui780Ghd7gVpvZ
	K8DaWP1wSgjKFf6Bazq7rVNKDvwQFh5RvbJOTjjVSEmDpcslch2TT0Cx
X-Gm-Gg: Acq92OF2us0kZOy3EXYzgxjzJ7ImLgzk3riqwFwFQPQeYANZBKvgTES2rsDWxbIFVll
	YODjyRvI+Ay80Ac7WUtRwkvrwcpf7UbE7zMSILw6xyJSaV5bu1Sc+XyVmcsw6uz9D2lO7fw/q4e
	K9FdpFDlZE0Se16B151YSp0rFjUVav0pi4UkFS76mpG7zYkzTFcbGn3my9QRXb6WAu0RNZMXRm3
	1JBkdmu3nZXXBMGx0fCMf2Q/myPACWFA6iIdw/YGgZoyzHEC2OynG0D0UOw8X9Fi0AoRJcN4rt8
	MLJcYH0WmmcyaSglx9d7RBhaTN21uyG5pJxaC7pihcEPJ4m3/VDEmWfCQHCEIC73jMsgku+V/pi
	9bj7hIu7wEy7v2QuFWYG1jnq+gSi35afvyH77WcZ7NHHK/spPOcjH7d8CE0Az/hvA1Z9Jf3GTfu
	UOzZ4tjQJvyhhg
X-Received: by 2002:a05:6512:2310:b0:5a8:65c8:dd87 with SMTP id 2adb3069b0e04-5a8b6c9c56bmr2359582e87.3.1778485768068;
        Mon, 11 May 2026 00:49:28 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 9/9 RESEND] ARM: tegra: tf600t: Invert accelerometer calibration matrix
Date: Mon, 11 May 2026 10:48:59 +0300
Message-ID: <20260511074859.24930-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IMU calibration matrix used in the device tree is inverted when testing on
the device which results in wrong screen orientation. Invert it to match
the matrix dumped from the device.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
index 0bebea0cb8c4..5c634b0f3f46 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts
@@ -1091,9 +1091,9 @@ imu@69 {
 			vdd-supply   = <&vdd_3v3_sys>;
 			vddio-supply = <&vdd_1v8_vio>;
 
-			mount-matrix =	 "0", "-1",  "0",
-					"-1",  "0",  "0",
-					 "0",  "0", "-1";
+			mount-matrix =	 "0",  "1",  "0",
+					 "1",  "0",  "0",
+					 "0",  "0",  "1";
 
 			/* External I2C interface */
 			i2c-gate {
-- 
2.51.0

