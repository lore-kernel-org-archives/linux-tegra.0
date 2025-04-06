Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEE326289;
	Sun,  6 Apr 2025 21:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743973999; cv=none; b=PwDpUoIQ0UQzEjxZ+7cFFuJnPgDCx1QQHj/NLgyDThezA+vaikB+vbX2hmejbLJyO2tX+Mzxns9IPXR/OgDF1H2Du+cDrxYufo8dbUwuDvlZkO9ymQ785+573ZEYvPKoRCwh4ZIZ4jz+jxRrCXiJ/nYwpbMgFPMdlvrBXC2wB/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743973999; c=relaxed/simple;
	bh=bulRqcr47jc7VqE5WNZPcSb0IokI8W+YVgaj7tbjxrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tHit7Qjhrh9ELZB+enUatMnEPPBwf6tyfJwcKNO5TVNXpv7oucWxOsGUalc+T8UNpguPPkAsdmX7RRBV+aNK2GU0tW63fGjKaKpGbLl4pyvKInE3LqGhULt+DuU62VLetZATTmYJo2iB2JA8hl7Apo5kIdB/y6IU5/ujbnwjOec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQQRNjNL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQQRNjNL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5478C4CEE3;
	Sun,  6 Apr 2025 21:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743973998;
	bh=bulRqcr47jc7VqE5WNZPcSb0IokI8W+YVgaj7tbjxrc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=HQQRNjNLbDsEIf9G1ZxTGJbHEtDd70z+KepTyIlisqUP964c9zpUwE3GDFojA7jAG
	 0s3OlEK0fQOUmfdEu60E5pyZgdPsjgjCq6D0oeOh+WgJFys/QqE1yEwIvQCJTTc4ZK
	 7ypVofjrR6RAy3YBeedeN+AkTv47vAro4TbDb/AVbCRUP4zq1MD6ZUCELC1RimxiSE
	 inI57rfzM4kiRDF/84gvSqfaK6ndzEnEvpvAhV89hF0iFOFwpMhdyfTPP4cBergqkH
	 DNnoZ6VL0eSzIbxJPEmc2jWWqhEyyS37Zp+baOwn7f7tfskIQy/HFDh3+UEGSTiwAc
	 vSCLP6rvUOrrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27BBC36002;
	Sun,  6 Apr 2025 21:13:18 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 06 Apr 2025 16:12:43 -0500
Subject: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEru8mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwMT3ZLU9KJE3YLikvyiVF3TpNQU4zRzI0NjSwMloJaCotS0zAqwcdG
 xtbUAA397DF4AAAA=
X-Change-ID: 20250404-tegra-pstore-5bed3f721390
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743973998; l=4405;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=8+6obcSKfeNBlTaNefo4ySU2Kjh+Hx6xO5b9LE4VbJk=;
 b=Wma2bTDlc+b7ZVz6L59OvUcBddv6u31glDElqK3rt0iOwTPWBcDzQOuD1ooZRx+zEPh8hi3Lk
 sPHdAr4G41UDYqlvejaX92VClrwW9ziwuvPWa57miDebehCn7LFNdPr
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This allows using pstore on all such platforms. There are some
differences per arch:

* Tegra132: Flounder does not appear to enumerate pstore and I do not
  have access to norrin, thus Tegra132 is left out of this commit.
* Tegra210: Does not support ramoops carveouts in the bootloader, instead
  relying on a dowstream driver to allocate the carveout, hence this
  hardcodes a location matching what the downstream driver picks.
* Tegra186 and Tegra194 on cboot: Bootloader fills in the address and
  size in a node specifically named /reserved-memory/ramoops_carveout,
  thus these cannot be renamed.
* Tegra194 and Tegra234 on edk2: Bootloader looks up the node based on
  compatible, however the dt still does not know the address, so keeping
  the node name consistent on Tegra186 and newer.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 16 ++++++++++++++++
 4 files changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 2b3bb5d0af17bd521f87db0484fcbe943dd1a797..2e2b27deb957dfd754e42dd03f5a1da5079971dc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -2051,6 +2051,22 @@ pmu-denver {
 		interrupt-affinity = <&denver_0 &denver_1>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops_carveout {
+			compatible = "ramoops";
+			size = <0x0 0x200000>;
+			record-size = <0x00010000>;
+			console-size = <0x00080000>;
+			alignment = <0x0 0x10000>;
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			no-map;
+		};
+	};
+
 	sound {
 		status = "disabled";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 33f92b77cd9d9e530eae87a4bb8ba61993ceffeb..90ffea161a57a8986c2493573c73e3cf9e2c43c0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -3105,6 +3105,22 @@ psci {
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops_carveout {
+			compatible = "ramoops";
+			size = <0x0 0x200000>;
+			record-size = <0x00010000>;
+			console-size = <0x00080000>;
+			alignment = <0x0 0x10000>;
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			no-map;
+		};
+	};
+
 	tcu: serial {
 		compatible = "nvidia,tegra194-tcu";
 		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_SM TEGRA_HSP_SM_RX(0)>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index b6c84d195c0ef9ae90721fada09ffd46a9c11fa3..00ae127e8b8af3fe3b95d8ce5986d937a4fc6325 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -2025,6 +2025,19 @@ pmu {
 				      &{/cpus/cpu@2} &{/cpus/cpu@3}>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@b0000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xb0000000 0x0 0x200000>;
+			record-size = <0x00010000>;
+			console-size = <0x00080000>;
+		};
+	};
+
 	sound {
 		status = "disabled";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 2601b43b2d8cadeb0d1f428018a82b144aa79392..36f35c6dc774d42aca8871dbfa0e0a16414cb860 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -5723,6 +5723,22 @@ psci {
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops_carveout {
+			compatible = "ramoops";
+			size = <0x0 0x200000>;
+			record-size = <0x00010000>;
+			console-size = <0x00080000>;
+			alignment = <0x0 0x10000>;
+			alloc-ranges = <0x0 0x0 0x1 0x0>;
+			no-map;
+		};
+	};
+
 	tcu: serial {
 		compatible = "nvidia,tegra234-tcu", "nvidia,tegra194-tcu";
 		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_SM TEGRA_HSP_SM_RX(0)>,

---
base-commit: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
change-id: 20250404-tegra-pstore-5bed3f721390

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


