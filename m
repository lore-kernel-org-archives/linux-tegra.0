From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH 02/10] soc/tegra: Document long-ram-code property in nvidia,tegra20-apbmisc
Date: Fri, 10 Oct 2014 14:46:53 +0200
Message-ID: <1412945262-6068-3-git-send-email-tomeu.vizoso@collabora.com>
References: <1412945262-6068-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412945262-6068-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: Rhyland Klein <rklein@nvidia.com>, Mikko Perttunen <mikko.perttunen@kapsi.fi>, Thierry Reding <treding@nvidia.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
index b97b8be..e2562ed 100644
--- a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
@@ -11,3 +11,6 @@ Required properties:
        The second entry gives the physical address and length of the
        registers indicating the strapping options.
 
+Optional properties:
+- nvidia,long-ram-code: boolean that tells whether the ram code is long (4 bit)
+			or short (2 bit). If not present, false.
-- 
1.9.3
