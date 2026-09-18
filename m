Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439D34AD7DD;
	Fri, 18 Sep 2026 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722449; cv=none; b=iWYGpGR8cer0ZqlI1mkWwghQDLoG10j/byZWiSGn1PdbyObDe3K9i2vBFtxgoAo/MzEu9zFJHhShbJiD/sv0V6dHgYvtqPNW8HQu1BqepsLde7/21DNE3PVZ7ghNy1+hNtYiVRy1wK+rKhs/QPQigsry9wqpMIWooJ17Dw0N4jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722449; c=relaxed/simple;
	bh=prWtC84Z2bEj0T6Ru7ScsA3CiIenQ658zODxPXLz2Yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HAwWUoh1pgLt4x3VPHHUSHgsJUUJocXmrSnGfH0Li6Y4Xt6VeTzdFhYkryIUPiwG0gSwtfKh9WEOB4aznicj8fxSkyLARU2TRG8JqomVE98qYcic/o3d18msJspFbXXTxyQ1wQLQiMKTY/ZzGKyZn3Vt3w8gx7MwxxICZkwOxIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPndOfet; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPndOfet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2639D1F000FF;
	Fri, 18 Sep 2026 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722447;
	bh=ufBb0+fNRfStQnARdx2fWI4zq7VSUEMwTS+qv5GOtio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZPndOfetzEZsskWpr6FwGa2N6oHoebIeShKpkYPirvMwXUpqDWISRVkX+tgyO8SWA
	 I4kKvn3whB8AqQBJdqxcuGXwT0uYuDukNaXSAkIM3hn8vIk7iCyB3NHybs1XglziI1
	 2rKoTMqRoSoedy6Cx6LSbGsGZDmSh57Z1olJSmvje/5x8fvdBkxZcaPWMI4dQxlGtD
	 kYH4LOYmAfzlipo2DSUlNT9LiYkg+zePd3I5qfv51Ipbl+14zTRmD4dgyu4MNcJo3T
	 /MthEEVc/ThomULNDzgp/wVAWxWUqPQp84wDc7j6oimq31cR+l287i8QNSo9ze8X3c
	 FJdvEi5K9Jrsg==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 18 Sep 2026 11:06:57 +0200
Subject: [PATCH 5/5] arm64: tegra: Add thermal senser for Jetson AGX Thor
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-tegra264-i2c-v1-5-3adac7aae717@nvidia.com>
References: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
In-Reply-To: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=treding@nvidia.com;
 h=from:subject:message-id; bh=Zmc+RmlRoeCabDhbuPn0Xy5Yjv7Zp1RCG1M5HfuCVxw=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqrP8+r3vYviwkQMyi30+PiX9vJbS3O1O1Bk6bH
 si7NSUu9zKJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaqz/PgAKCRDdI6zXfz6z
 oSiJD/95EP2s4+OgxSl8BlhoaNnMh/uvrkf1w5Mj4t2H63du/K7U07hJHi7vZDh7PWn/P+ACmP2
 ypd0Y/hZiPq3mb6j2ta5LJk9oMeaDCCeCaRa6X8XTMWfi7TiBfAslT969KQcH8id9lpeLLhJvS7
 dXWesi6kJjHIKeYKC8CBwEt4UWnDvjrSocSoLGj6DzosILZS3z4niDp35jGk6kXeG8hBowurE+2
 YidsIz8h50dQzNvNLnAs5xI5c/f8dvFv/0Uxk3jMKv79xhiJrz6vOQDbLuO59aLHkEwmQIfoIRA
 6yzXfzpObmqhqstsbnbN1KPHoAuA1YNgzUfpntrOgzmP7VQQve9V5izQydWTFuym9ouLJUUFeo1
 GBPYOFSIjgQUymIybm8BGAz2j99F1VmhKXNTl9RR6gE0InVeBv+THdE3MJ6Vc7vvXUzNvKImyX8
 ebLKAhmVuT+tKGgcKpGEOIkvtUG+w2UBDdg/dwy4BsVcOcZP92mx+Zp9GlODSQ0VzEFMVB0Kf62
 0ih0kbjAnsn6bevqAM6L5qKSkAGvTPEqxpqcdwyxtehdVk6Bon8OwgKM1lafZRBLPqcndka0zDe
 e9sSdXFqm9pnST6/8kauSZNyWhs3Wz+vkWFK7MiWSjoQxeDwCMxz0GelY720HO/fk9a3BDXIcvr
 y9WfH8VX7ZKf6HA==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

The Jetson AGX Thor module contains a thermal sensor that can be used to
read out the local temperature. Add a device tree node describing this
sensor.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
index eb157b0168f0..f39f33a66cd2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
@@ -54,6 +54,17 @@ eeprom@50 {
 		};
 	};
 
+	bpmp {
+		i2c {
+			status = "okay";
+
+			thermal-sensor@4c {
+				compatible = "ti,tmp451";
+				reg = <0x4c>;
+			};
+		};
+	};
+
 	thermal-zones {
 		cpu-thermal {
 			polling-delay-passive = <40>;

-- 
2.55.0

