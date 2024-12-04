Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D717335C;
	Wed,  4 Dec 2024 20:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733345106; cv=none; b=ONSASRzv0jPzA8ujTsQX0v5Luw0prqHSavaRDdYFKOH0WEI8wdHiPjtpumX0ubVVddTwCJsNtIZxXCWbYBLP4jTc4dLM1QSSuW7mg/fl0vipDAUB8qP8PXSer7tOe1NnIo4eITfRv9idYLwYBTIcR3Na5JV+BLjgjZcP9XlGBBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733345106; c=relaxed/simple;
	bh=qDYCUgO0lkwc13ngDqszwebpZusgvywdV09ZqWeIUAs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=mFg6yg9JN3Jp06wqnBCU7jc8rfrhVsMVIcysG9fkSmBHkpSSX5SKHcTcs4LLG+3MUFjsG04nk7KJYq54oxR+38SaBozwIVvqy4a5YL0RHHCqQGaiOxzN7svyYk0yTQ1qb/JebZVKZgrAwU0yu+JWBxtzD/lFKV62YAeZlDOD3hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO5hUTuU; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO5hUTuU"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53df7f6a133so167462e87.3;
        Wed, 04 Dec 2024 12:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733345102; x=1733949902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wP2rc24gyYST1aBIofps8XKlz8dO6SqCcv+ThwnHd5Y=;
        b=VO5hUTuU8x6xNr6Bw/O0cuPEsa9EqWKew4lYLCn6frFfG7QhQUW/kVS+XopMQS9F9F
         1AeIK16HtI3zpO6RLs1lgOg6w6fje3ISU0M65dE9ANnJsHACUXYac9fCmTKhpJPQJwe9
         FIQwhn3UJFlWF9bHc3xG0w1IDaUFOhKm+B9fPTfbYA/KfTgz5cxhgqgCRB1RxSwUfciz
         6Bj09nl+OR0j91dh1/0MwWgU+RNU7cKjUmt2HwMfJo2ZTxrKaOpNKU5k1hIv/lICiCMz
         jA8MV4KpWPd3wFJXGPh4CAHzE3MGMuKBx6KAAahrm8oeWEXmYF5vnJyAE7SL8psOyf1T
         TLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733345102; x=1733949902;
        h=content-transfer-encoding:mime-version:message-id:subject:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wP2rc24gyYST1aBIofps8XKlz8dO6SqCcv+ThwnHd5Y=;
        b=JDtykGlphrD8by4/kKTKE1zKY7tSzTq1/SeYIa0XJIrEBjViy7m4OIZDAX4dv5BpHi
         Nd/5T0He6oX1xhjVIBr+j72qz+nAHnp2VnV3m23UN6j3ey0wHhgCYpOB+jWnqaol2y5c
         f79NN8/zJx5ia3m4IiOmjnnckhzA7FpsHfS8YJSBZ8LfziEGho74geOPBk9nUnl8PRz3
         MLMSlCKT5TdTGOHtnw243gPd8HWgBkFzTEYuuAisiHfSvE0qaoFPmf0Xd1UjYI7Q0yEe
         y/b3/5CTCXnZ0bqXjPcGZNjL+VxD3G3KioL4+tw036Z37RZyk9qoPGeDg8xgqvfTAqAf
         Z7lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbZV/QFMY1efBIqR7M5feJ/Ps60Gxkdws9beOW581HOKsw+fs7a/qHYIptOHc4a97J2dXNosy+Yz5lrNM=@vger.kernel.org, AJvYcCVZr7t5XbXvmBN8bw7vs2oykfbZxtFYNXUD+hH2ZpEqXuLPadJe+ZjwztHH7Cap522E7jSjJ97JybrA@vger.kernel.org, AJvYcCX3Z/CydjjMNupJ2KWTNIlKeEHoXork+6bsGmHLZRrlwPj4Zz/lJqOjRfRhLn4dLqk546+S8IpN0+9sPWKB@vger.kernel.org
X-Gm-Message-State: AOJu0YxDfnF4/SMmCLlcutAPYL9J7eW8S4kByztWF4T9oCNOw6QlQK4b
	1JK4hQJYWiV/STfsVKeQFptjSMni9RagQh99tsOeIhTDLh6B1u8Pl5UXPE8Q
X-Gm-Gg: ASbGncsYHYtc5GxhrF6fx9R2Y8eeQ9XMjqErgfM7jAs3I7D5hikejnQmALrcHBgGBUB
	2GWBZCmt8NhL/Q4UiFtXWEixAIgF0E2NFpgZ17gmElQ6YAUSkOqxD5SeMEU65EXm+81e5DSQQPb
	p9GJE3k5yKHYfuzw5cktC/iHLfsU8D7F6z9e/98lzsS40ZqCtFWrm3CyElT8xArAgCv9X8rq8ys
	pYXaFZ2YYOCKv1JXezP5kZ7T4Vy/jArI1DofHM/ICIyWKWpTM68KDdhf4QkKWKaDAI=
X-Google-Smtp-Source: AGHT+IF0V8q4flOPZdH6tW9pvEoMHiH43l9ZLXXAql1Bn830JLmLBYCNmLB5jdJEBJNspmf4yfl8vw==
X-Received: by 2002:a05:6512:6c9:b0:53d:e52d:3373 with SMTP id 2adb3069b0e04-53e12a2c9c4mr3276006e87.41.1733345102161;
        Wed, 04 Dec 2024 12:45:02 -0800 (PST)
Received: from foxbook (adqz254.neoplus.adsl.tpnet.pl. [79.185.159.254])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1bb67353sm485964e87.244.2024.12.04.12.44.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Dec 2024 12:45:00 -0800 (PST)
Date: Wed, 4 Dec 2024 21:44:43 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark
 Hasemeyer <markhas@chromium.org>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: tegra: nyan: Maintain power to USB ports on boot
Message-ID: <20241204214443.3d9c2224@foxbook>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

USB ports are turned on by the firmware as it looks for disks to boot,
ensure that they aren't power cycled before the xHCI driver comes up.

This enables USB devices to be ready for use faster and reduces wear
and risk of data loss on storage devices. A particularly annoying case
was booting from a mechanical disk, which takes time to spin up again.

Vendor kernel also kept these ports powered, and by the same means.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
index 8125c1b..974c76f 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
@@ -716,6 +716,7 @@
 		regulator-name = "+5V_USB_HS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
 		gpio = <&gpio TEGRA_GPIO(N, 4) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		gpio-open-drain;
@@ -727,6 +728,7 @@
 		regulator-name = "+5V_USB_SS";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
 		gpio = <&gpio TEGRA_GPIO(N, 5) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		gpio-open-drain;
-- 
1.9.1

