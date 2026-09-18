Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11A44C6EF8;
	Fri, 18 Sep 2026 10:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728286; cv=none; b=AA9J+A2JFvmWaSHuKuul2r5xoDtr5+TtKSi6j6Fm8pz6fMW6lVXNgsTvgGkan6Q2I2ler1O4XM20gfNKwAwtV/WCpNZEqGejI+/xa4fOhE1oBbx2jt2xbGkqe8Ba3de/Zwhn9OAyZO4+P5TscaN1NmtvdysShkRwfJu5oCKVsq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728286; c=relaxed/simple;
	bh=F6TvpcEVosqVPYmYYk2zyN5vocsuBaY0vDUb/g4fM9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DKLFaKzJRiH9luj3ZZKVHa6Wlq8Y5Uo1mNFTA4085eoC02L3/dmBK7kvncBfiLzDFffRIr7d0EVZBdKkWiQK3+LslNZ2kPIj8OutdkoqZhQdhxrXudfHAE0C67jNNL/MuY6PHeS+uevA5jY4D+Rgw5OxeaQygPHmn3gpNB7rlfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AnhH/oE2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AnhH/oE2"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A7564F07;
	Fri, 18 Sep 2026 12:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789728165;
	bh=F6TvpcEVosqVPYmYYk2zyN5vocsuBaY0vDUb/g4fM9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AnhH/oE2XOJ3Jhxmu7HdEKMMIjTcKMzZsrzIasIBLMSNJCv9a1rw2L1pXeSnEOMTp
	 n6mE/tLr3BZdQ0OVugoqrdxvGd3KB33cpBo8CdMP+6qZAiWZfztFctaBWT/KZeYnWa
	 X/ilA5/ogcWIMR7qu/AKEGD/uwbyfANa4JkzrXlY=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 18 Sep 2026 11:44:18 +0100
Subject: [PATCH v6 6/6] dt-bindings: media: i2c: himax,hm1246: Use
 video-interface-devices
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-kbingham-orientation-v6-6-5e8b1f01be29@ideasonboard.com>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
 Matthias Fend <matthias.fend@emfend.at>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789728257; l=1278;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=zj0TRPd2r+l+CPw8KXOYUgmrO4GRMVVMAHrTLWUo4iY=;
 b=Hr6H/4uJ2Ofm5pjTJhZRU6jZzp9KXp8SsSLerp3e166U5M1d90/cFvvGs5guDRBlHx+joE/ec
 nf3mQVJ4lxnBPnrBMrnIqA9Yx+RgDsgC3UQc+I8me1Uv3ykqmv5j6Z/
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the example binding documentation.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v6:
 - Actually use the correct orientation!
---
 Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
index a65488fcc643..9994105552e7 100644
--- a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
@@ -86,6 +86,7 @@ examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/media/video-interface-devices.h>
 
     i2c {
         #address-cells = <1>;
@@ -103,7 +104,7 @@ examples:
             iovdd-supply = <&hm1246_iovdd>;
             dvdd-supply = <&hm1246_dvdd>;
 
-            orientation = <2>;
+            orientation = <MEDIA_ORIENTATION_EXTERNAL>;
             rotation = <0>;
 
             port {

-- 
2.52.0

