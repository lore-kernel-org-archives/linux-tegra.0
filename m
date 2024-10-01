Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C1C2E3;
	Tue,  1 Oct 2024 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789255; cv=none; b=gsQ3Qytjv6ekIN0QZCh3bf4Aw/0AdYugwwH1rn2LD8jB8UwR6QpUeOGflj/JdRqvhQVIrN4zsAJddbkpOz97QXf2A5hSHDXEKvDmqsDGTuN8DCNAch03l/CpT9ZDu50a0Gw5Z20eAinVYjPtL8pQKz0xIZ3gKf5kB1IwSRCk4vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789255; c=relaxed/simple;
	bh=itkEClIvbFHoUH/WzE9jOrv/kI7nEJtauerltDzC/Xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VizFMNIZiPOHAgAeR2zAyUSIz3DhKPrOeGQjnL0Q+O0LwunKOkGd9qgXRqJ4R6fj6dIZc3a6omYcH/DzEqZm3VG8kZrrEsuW2PQS4JU3ig8wYuF6YBcIhHW7MDpVVNgIqJ1fqeEN9dBx9L9GgyOwhFfjup5zJkNphGI7++0sV2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=cwbf7se4; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="cwbf7se4"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 01F1B6003003;
	Tue,  1 Oct 2024 14:27:22 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id Y8LhZEt_3TgZ; Tue,  1 Oct 2024 14:27:19 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id B08C76003000;
	Tue,  1 Oct 2024 14:27:19 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1727789239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1jO/1inbmzumzQbTK/sg4fZKbEKejBxIlpeswmP8VvE=;
	b=cwbf7se4aufcl4bhgAPgz3DFeSZ5MYaOB0XesR5Ug00llRRLaesL9HEnKeGwfBCWHcsYaf
	AAroQapRDh5r9zbOlfMiX2HjTl+O0q66p20cFaCXsZdx9nxcmkvj38N+CCsVlUvsQT1s7c
	fvY9uP1sy5cW7T7id08k3WXhMBQqbrE=
Received: from [192.168.1.150] (unknown [IPv6:2001:8a0:6a67:5600:f598:c056:b30e:1a92])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 6D3BB360161;
	Tue,  1 Oct 2024 14:27:19 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Date: Tue, 01 Oct 2024 14:27:07 +0100
Subject: [PATCH] arm64: tegra: smaug: declare cros-ec extcon
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-cros_ec_extcon-v1-1-1e212a1a4bbc@tecnico.ulisboa.pt>
X-B4-Tracking: v=1; b=H4sIAKr4+2YC/x3MQQqAIBBA0avErBMcCaGuEiExjTUbDY0QxLsnL
 d/i/wqZk3CGZaiQ+JUsMXTgOABdezhZydENRpsJtUZFKWbH5Lg8FIPi2VpC1N6Shx7dib2Uf7h
 urX2ORZzMYAAAAA==
X-Change-ID: 20241001-cros_ec_extcon-e966c110f6cf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727789239; l=986;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=itkEClIvbFHoUH/WzE9jOrv/kI7nEJtauerltDzC/Xk=;
 b=awjg5CzkdwGS26YTDvX2s//0/OSxc0bcURNm82C5m7LF7ix8u3JJI/k3YDJMXhPqTuTnfhfE2
 moH006phdfnC71LN67VOM/U15E3zJqMy5uQdYWB4C+gp2X2zjB+9gXW
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Leverage the Chrome OS EC in the Pixel C to convey information about the
state of the USB-C port via the extcon class.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 581bcc19a753640b3ced9e81c457d642a8c8a27d..1e4cbeeb4a6172e3d8c39c3b871c97fb302e3099 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1398,6 +1398,11 @@ battery: bq27742@55 {
 					reg = <0x55>;
 				};
 			};
+
+			usbc_extcon0: extcon0 {
+				compatible = "google,extcon-usbc-cros-ec";
+				google,usb-port-id = <0>;
+			};
 		};
 	};
 

---
base-commit: 841703741c19a65310b81ddfa43725fbc66afcc4
change-id: 20241001-cros_ec_extcon-e966c110f6cf

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

