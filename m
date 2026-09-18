Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7965C390224;
	Fri, 18 Sep 2026 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722443; cv=none; b=bL91XOal/9PF+5e9zNQZ7JIhf9xfwY6l0mUmvzQ9UREAM+WQ2uGa0xfkxzhUI4Vj3GVm7HDl8VF92lf8SLtYYxx0gRG1lTB0yVYrLxIo0dEX0OWQPqE+pDS/FUl7KFMD6CpY7qnoBOMppd6tp3MhAfoPkmC1GcnhQvnjMdLT7XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722443; c=relaxed/simple;
	bh=iQeGCDxqJCz6uml4RJH21u9Hj5ZeVsRhDzEhPEYDdaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rZTV+SeqJMPXgCbzaaUu2awv5wyfZQnzwEW2dxvYqKNJDFFNYPjbWoiBWOd9Cjb3a84NEfme4ZBKoqBdGP3UpB5GaTp3egC8Na7Q2T55W9LfvnjNrRXxav8FPFQ1JD5Uo9bO4UHWJcKrYo2SwpZ/EXaXw4R1OKKHvVFFGnIXmjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3Xy3i6L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3Xy3i6L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845D81F000FF;
	Fri, 18 Sep 2026 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722442;
	bh=eXixHyXSg8TS99KXc3U62EWBrHKL97PRLE4uTSlZ0yQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=K3Xy3i6LvpGHAewbRvlt551TLuSIk1CISQ5WqpCkQ1FrL6B1E1jvnZ9dNHzBgw5/A
	 iLibLlr9+jhRyII+we7U7uli2WcksoixdSMvh9biIJT6JprDiACaAAVoeVEzbuxmfi
	 Yg7BwdlvgDAyvvP5wOJAFc9X5LqD+1v2b8EtFaKtgZ54L0fiVb/v/mmsu1xMEBN96E
	 hrBiYCIcLGdJ2E+D1ZnXJViVo+h5gf2et+2DctXIwmOjhUcsRHfA31pvL5LbENG7EX
	 Scmkprjbayrt2USm7Blebyjb6lo1e+tYd3PYYsO1uyiLbAeLJMEKR5aUk2XQw/ni87
	 pvoHWGG0IzQdA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 18 Sep 2026 11:06:55 +0200
Subject: [PATCH 3/5] arm64: tegra: Add NVIDIA Jetson AGX Thor module EEPROM
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-tegra264-i2c-v1-3-3adac7aae717@nvidia.com>
References: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
In-Reply-To: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=941; i=treding@nvidia.com;
 h=from:subject:message-id; bh=OFbwD/LIElKc5M2Bq4f1puVsWKdNFeqhG3E+WpnW34o=;
 b=kA0DAAoB3SOs138+s6EByyZiAGqs/z6js8TkqMrGIOedSZnEmvJAPCqBdEVBx5MDSuPzHacxv
 4kCMwQAAQoAHRYhBIjqwwgBScz3wI3In90jrNd/PrOhBQJqrP8+AAoJEN0jrNd/PrOh10kP/A+a
 w2faeaqpXhA3WW2ykPq7ZY9aLOd0z3yTsqcBofulp0/JYh/zyHR1Zc35wCRAcpPLQlqGKsa3kmw
 D6FmafIBxJqA/RCvQPo6LpiE4SCRJ0vwLlYeQMpmFXzIMVabtxCUnd9YsY5cHFt7lu6Pmoa4XAi
 1QWLJBYgvwUOQzcfnDMGHOyFzdClb9C4zm8KHtS3lYvSUE2QepGaKjCBN5RSyO6dfwp4XpBDquY
 KBVKw+ED5XLZkwkfonmKM6nMJKu/oswfcjjUOyn9TqeEgL4s/Q0XbwP0MohMCVK5dPhQmXZGrWW
 5nrfNNwlDDlIk2PyDkAkv8RAvOwozpr2tWi9sHPPYOSSTbyMRN/H9G0XepNaHs6pFgUo7XR0Px4
 zvs9DOCbzN8vAHAPjr0yyxSbH6fnCCR7ccPbF+u3xw597iH2z8EVdI0iJ+dfDGBAPuFoSbfQBpU
 eOLByBoRA6Jg0R3AmaVerCrFzHB+iwTs+Es1QqCg4mYuJkSg/HyQg5FisLTGLujLd3ZJbpvnFBA
 ztC+7Nw53jfYpcfJAK2ziAWwdFVyH6W85K2xO36+cw9ih2kfZGX5BgVCqK9lY4uN8qpU2f737qz
 gH7AFflGGlClIOVW7CA4DqIJFIUFxkF+rIHF1d3xOpRNIEaSPyU1bCxXlvph/SP43dEcIin/D+c
 NjZHj
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Like most previous Jetson devices, the Jetson AGX Thor has EEPROMs used
to identify the module. Add the device tree node describing this EEPROM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
index d4c9f45e03c1..eb157b0168f0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
@@ -38,6 +38,20 @@ iommu@6000000 {
 		cmdqv@6200000 {
 			status = "okay";
 		};
+
+		i2c@c640000 {
+			status = "okay";
+
+			eeprom@50 {
+				compatible = "atmel,24c02";
+				reg = <0x50>;
+				label = "module";
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.55.0

