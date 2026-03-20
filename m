Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9773A3835;
	Fri, 20 Mar 2026 23:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050062; cv=none; b=rxHnJVtM7w9yOkSoWO0nWvSCyp+V9UNW/5qzqegaX/0dwgWkH5STSnzu74XWKOUcsDzh6ev3cBRoWhAq8S0lECsQNIb7TMkDfr4LZtpn7IDInlCS4SHCcEh9mFJUDpdAzZi2iF8cMpmiddBatYIGsswYKcdfSB82wTfczeRyHOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050062; c=relaxed/simple;
	bh=k4iO/6DXxX73V17POZlSonUAdTJloXeKXHjpOygNwt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qisg/FldBW1/ANlQZ2kqBW9uo5wmb5aBCbdNxXPxalQxLPxuD4RkT/VkijsJeLg/VgJJr7X4CMevY7FlkyWhYJWcIKlDZRT+WpcynwAdGjAYW1YpRLrjmAXUdNG7ANG3W06h0GvNNBCYyTHd84Sm6OmUxXnXHsEZYh2akQ14TBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVNysDuA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVNysDuA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B34C4CEF7;
	Fri, 20 Mar 2026 23:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774050061;
	bh=k4iO/6DXxX73V17POZlSonUAdTJloXeKXHjpOygNwt0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XVNysDuAXj9fJpPGfabhoHBcs1Ma3jMrmYHUVWr5jj2wFhufSC7PUx37SNrMYEQwO
	 NAI1CfrJeJIuDhVkSXF4m5Y3tKeyoL4v3+4bu456x2AWIN1a1SDg6VCHqa6Rkoc8Rv
	 tjzH1vE1pCual70pyOYMNMAJCZCbYu3BmbXKfE/ou9wwcNJDW0tNMwpl7BU7Qy2CA2
	 Cis/WU/BXlmilIjksai+uQHSzxP9a/LVR5vllVFcrrX90k47plYaqJSfRfcO4WUQ+T
	 5O8KRaRLCKl9ixqXB6pwLwyH1Jfv9Inwmtgy/PRmMNVvpyt9tkszTsKLGhadoHrp4L
	 cUrLpevsFqXkw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] arm64: tegra: Add PWM controllers on Tegra264
Date: Sat, 21 Mar 2026 00:40:56 +0100
Message-ID: <20260320234056.2579010-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320234056.2579010-1-thierry.reding@kernel.org>
References: <20260320234056.2579010-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Tegra264 has a number of PWM controller which are similar to those found
on earlier chips but with some added functionality.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 72 ++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index efb4d21aa4e3..61c001fd2651 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3344,6 +3344,18 @@ i2c3: i2c@c610000 {
 			status = "disabled";
 		};
 
+		pwm4: pwm@c6a0000 {
+			compatible = "nvidia,tegra264-pwm";
+			reg = <0x0 0xc6a0000 0x0 0x10000>;
+			status = "disabled";
+
+			clocks = <&bpmp TEGRA264_CLK_PWM4>;
+			resets = <&bpmp TEGRA264_RESET_PWM4>;
+			reset-names = "pwm";
+
+			#pwm-cells = <2>;
+		};
+
 		pmc: pmc@c800000 {
 			compatible = "nvidia,tegra264-pmc";
 			reg = <0x0 0x0c800000 0x0 0x100000>,
@@ -3579,6 +3591,66 @@ i2c16: i2c@c430000 {
 			status = "disabled";
 		};
 
+		pwm2: pwm@c5e0000 {
+			compatible = "nvidia,tegra264-pwm";
+			reg = <0x0 0xc5e0000 0x0 0x10000>;
+			status = "disabled";
+
+			clocks = <&bpmp TEGRA264_CLK_PWM2>;
+			resets = <&bpmp TEGRA264_RESET_PWM2>;
+			reset-names = "pwm";
+
+			#pwm-cells = <2>;
+		};
+
+		pwm3: pwm@c5f0000 {
+			compatible = "nvidia,tegra264-pwm";
+			reg = <0x0 0xc5f0000 0x0 0x10000>;
+			status = "disabled";
+
+			clocks = <&bpmp TEGRA264_CLK_PWM3>;
+			resets = <&bpmp TEGRA264_RESET_PWM3>;
+			reset-names = "pwm";
+
+			#pwm-cells = <2>;
+		};
+
+		pwm5: pwm@c600000 {
+			compatible = "nvidia,tegra264-pwm";
+			reg = <0x0 0xc600000 0x0 0x10000>;
+			status = "disabled";
+
+			clocks = <&bpmp TEGRA264_CLK_PWM5>;
+			resets = <&bpmp TEGRA264_RESET_PWM5>;
+			reset-names = "pwm";
+
+			#pwm-cells = <2>;
+		};
+
+		pwm9: pwm@c610000 {
+			compatible = "nvidia,tegra264-pwm";
+			reg = <0x0 0xc610000 0x0 0x10000>;
+			status = "disabled";
+
+			clocks = <&bpmp TEGRA264_CLK_PWM9>;
+			resets = <&bpmp TEGRA264_RESET_PWM9>;
+			reset-names = "pwm";
+
+			#pwm-cells = <2>;
+		};
+
+		pwm10: pwm@c620000 {
+			compatible = "nvidia,tegra264-pwm";
+			reg = <0x0 0xc620000 0x0 0x10000>;
+			status = "disabled";
+
+			clocks = <&bpmp TEGRA264_CLK_PWM10>;
+			resets = <&bpmp TEGRA264_RESET_PWM10>;
+			reset-names = "pwm";
+
+			#pwm-cells = <2>;
+		};
+
 		i2c0: i2c@c630000 {
 			compatible = "nvidia,tegra264-i2c";
 			reg = <0x00 0x0c630000 0x0 0x10000>;
-- 
2.52.0

