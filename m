Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401563F1048;
	Fri, 18 Sep 2026 09:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722446; cv=none; b=Hxxud8dI8I3YxLPbsSoL1IPkq/04ocJTAo8nxixMPrD04ZDqpaeHq5AMISS60D1AwebUz/wKxH7gVniosxukglLkncNrqHHozHq97Wg+WOAisDXpiLoBLS8aqBGkQapUy5EWllKbIc9HKVNGFYNh5nxsldYwZ4pNDNXGAIuU44c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722446; c=relaxed/simple;
	bh=iLnuDJoWz9Uq7szmyd3CWCMjaYotcZN0LyyGElZWwFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b99tnSiilWPBMa90kvg5lnHDQIVOQJbGc8sWuiqsbwDjvYoL0umPqhgMm9WHfTp5ie0Vc+1rtPpom9CDf+lbm2nm51XnslBcOm3f1esXH5oN5W5zKlJN6NLZM6de7C+SSNbe4jqGIZcNRBjnEIVUddM9elkfMxwnukBv9Hkf95k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7zVPX+B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7zVPX+B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549DE1F000FF;
	Fri, 18 Sep 2026 09:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722444;
	bh=ppk3/xwifzZLroA54+9rB22nqWzLHTHCYN6LwoyipV4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=P7zVPX+ByLbkFb75wAduGi19Vgi95PNUaVR6pmbkf4pLLhG9vRUJSPDh+b/7r8rdd
	 /lu+Hn/7QRA34i5JQKBO8hocysocs9mSctPV4hSEavuN9qJMmZxgrvoLe2ZEa33Wd8
	 pYkJHt2xjGG1zKDY512sdTRXAccbi5HARpyI8PGRD0uU9ALDdMmT4C12VsNM01yFYy
	 kSFllU6u8E2Lquq8E7Mvr2AM1reSw3bykqJdzsFwFP9ZMBPOm6vgOzO6c69jvvTnmx
	 wSyyMNZAzzruamZ6/J35ZaEiZ8DT8I9k2Gth8uFVrnpg3YXRx5kurbursR0XDlDZaM
	 KL7YU5R9abQ+w==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 18 Sep 2026 11:06:56 +0200
Subject: [PATCH 4/5] arm64: tegra: Add NVIDIA Jetson AGX Thor system EEPROM
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-tegra264-i2c-v1-4-3adac7aae717@nvidia.com>
References: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
In-Reply-To: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023; i=treding@nvidia.com;
 h=from:subject:message-id; bh=/jE7PYOugXQeMYx845CwR61BSX9vUw6xjbMf0JnVUYA=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqrP8+JXnZ07ZRxqM41Fh5SqdI0VXJbH75PN1VZ
 L4iUuzNoRCJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaqz/PgAKCRDdI6zXfz6z
 oQa5D/0foUAZoF29zkhPGQxDsTQf7vXr5Yw9ghnIWfCzhaXoOZPNXrqS0txAA/KCzM6y0CPXCyc
 iRcqSD0K0pm+ZhqbFGSiW+mEjOel5jqDi8p50NYcgSOmXyT5IdeEa5IehEPOf5wVNAGFP9+ZkLV
 bvBe41Fenk9eazCdpKouGSsusBTxKc1JLcrTX8hJmTlmlNDzZBGcMTf0wMf3DyQtH2J1JFnGtMT
 QjaVYpf2zIoKxrNKcURtk/qS6XGfU6YrLshDi4rNUdwWJ0LT0BCvaAGm/oBZe/Tn861HtMAJdHy
 uPEZZlJOezgSmThc74FeY4KxDRqqAgi4+n4LimabWqGEbRQgAvm7L7j0U44fThxh8KqXLbfsetx
 6AIelCvqqlSg07CAFeWyRDfKiJDjEYCUOwrdRNwTs/A7mtwCWEEuPLGxvVnyMuauQ7swyCFKYlR
 A96VpyRrhMqinptbZHsWXSFY1TghGGi+7cLXj0gHCj4aYLe8l5B6p1yAr6VnjPnMRQ57lY8JfzM
 72vqgUlklP9quuBaijfmco/UadHz+3YIgoa9QYCEZZGUQODxc4jfFUaqKg+recYyoi7fuiVWZ5W
 o9+1NzjOQZtUZorqtMr4hnuL1QFUm+HyzTelEVcAwS92UeyVJPXvaHB67cQpo+hgj5zezNFaXi7
 Kqe+/pwHHHNTjlg==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

Like most previous Jetson devices, the Jetson AGX Thor has EEPROMs used
to identify the system. Add the device tree node describing this EEPROM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
index 86ce40e80c73..62ca7e4d227e 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi
@@ -19,6 +19,20 @@ pwm@c6a0000 {
 		};
 	};
 
+	bus@8100000000 {
+		i2c@c640000 {
+			eeprom@56 {
+				compatible = "atmel,24c02";
+				reg = <0x56>;
+				label = "system";
+				address-width = <8>;
+				pagesize = <8>;
+				size = <256>;
+				read-only;
+			};
+		};
+	};
+
 	fan: pwm-fan {
 		compatible = "pwm-fan";
 		cooling-levels = <77 102 140 192 255>;

-- 
2.55.0

