Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A271254704E;
	Fri, 18 Sep 2026 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722440; cv=none; b=Id1hgCT2vKPsX8D2xP2hj0GTZk/onfXc7JCeVuTsqpuKlDdQfJ+JiWtu+aVFj7oepVVJ08ZBZiXL5L6//eFDLEy3nHLeSR65jEk1T1FsJh2FspDBMPeVMMmtsF9UxyzLXzngDUMyiMqun2Dj9aGAzYZoWYIwSK+HuS6StU8vpSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722440; c=relaxed/simple;
	bh=LfNlzcJu0w/IXCs5870y7iJ6ZHJTQb68P5GCFgCl6IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DN/Q9kkJ+sprvONsk4EJJHpDh4VbpmNyAlXSOLQ6/cXw9sYRqwXRFJT+a6j0gJ2qZfY2i7lAbeGv7OkiCtAXeSce9zVnDhEDHk8GNj/czDz0E9yPgqhud8pLU+11PLSydSzHy4cc136HUkKrn8/y+E3UM+FbvbZdugnHUcVSm70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZugcREa1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZugcREa1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05251F00893;
	Fri, 18 Sep 2026 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722439;
	bh=cvmIEV489qF0qz2iUjqjlYgh54lnifdE6Yw/Ou1f06E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZugcREa1BDFn2zB5hq6dbUtz6LPCbFwUxj7Qx2Yc1EBjKcDPXUxq6BLs0dedBa1ZF
	 Rav3j796dbjLW51yskE88nQIUHzrm5u/dG56yoBuQ3e76QYwtEoInjI42afq3WrNR7
	 WUddsG3mH2d5JakdQzDVdr/PxR9l5RduDucANt3hTM26XmmezX2ff/vrIvI3VVRd2e
	 K7BReoiBIqn5vnfHVGuEU/TgJFVoBmiJEk8GjNNCI4ucIQrJm3xF5Vt7NOFP3sOBIE
	 ZJLnsRTBBbHmbiCcX+xYlUCp6y02+AOu+uD7hwA4F7Rai4d0tRkI4m7rBAuZFjddVa
	 xQVG+1wiz5AmQ==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Fri, 18 Sep 2026 11:06:54 +0200
Subject: [PATCH 2/5] arm64: tegra: Add I2C aliases for Tegra264
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-tegra264-i2c-v1-2-3adac7aae717@nvidia.com>
References: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
In-Reply-To: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=treding@nvidia.com;
 h=from:subject:message-id; bh=LOi/406uyLDiujlFpE2GdfBr/oc+UBYVBt6cT1RGIkY=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqrP8+h5lU2W+6KIlugqYUXv60gTq/yiC+ACzrl
 MBcPpBy5zKJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaqz/PgAKCRDdI6zXfz6z
 oZK6D/9bioOlsTljKmbZ9lhFOjnjdOq0K+fcqoTNa8lWeh292/Q0F7A45VDbfTRpD1YiMfZWaPA
 hE4NjIwoQFl/fZpqbuNR4p9ctJsApvUTF/MnzKl+2hlLsfsmAdy6KBrRaO8pTJlQ5XBYeIoospV
 F/SGjhxuA44KpC3shE+ggWxJjU/GEkUDLa+OktOz9KY+LnVJXPGQdhFd0vA3v7ynugX8JJgGLpy
 4GyrVGZMCnrzu9rdePfna2N6zn/LSFg9Ixq9Fv1EQwq6YhHzRaSq3rMBBkF24h4myCYOUC8xb3X
 aZa5nZMh02g+v8uHi+kRoy6FibAPEvK51FerGDE2VWCK3HynZ0LC3sQG9FCXwQ3CU9qJfh/ZjOj
 bSU+peNvoRwHDpHmG7INI6b3ITuKTyGJ9Cmr7yDjrn6QR6blj2chZMYLLu9pXtoAP9eB5sbZmLR
 NshakaaXOOlNoA5j+203/QRwU1GviM3krt0KZrpQbmkUtwh6zRJemQYUWoqVYyUaDSMU4HGr09R
 hXInzSTIdYbe5z4XkjKWl0Yc/MwF5AQ2D0SOUzlE7E5HsRQqvT/MX/h68Tg6xG6fwPLH0Odocwl
 JTcV64xAY8gHLlbxBodBAROPXizgUYjSAHNey+KXAbUDUDd3e/EzdaWgzi+5A1zmQKm7Y2VORcd
 m7vWudbOZeS4nfw==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

From: Thierry Reding <treding@nvidia.com>

List all aliases for the I2C controllers found on Tegra264 so that they
are numbered according to the TRM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index a5049e1a0571..8226e074df11 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -16,6 +16,25 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &{/bpmp/i2c};
+		i2c6 = &i2c6;
+		i2c7 = &i2c7;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
+		i2c16 = &i2c16;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;

-- 
2.55.0

