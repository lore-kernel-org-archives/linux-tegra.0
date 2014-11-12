From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v4 02/13] of: Document long-ram-code property in nvidia,tegra20-apbmisc
Date: Wed, 12 Nov 2014 08:56:25 +0100
Message-ID: <1415779051-26410-3-git-send-email-tomeu.vizoso@collabora.com>
References: <1415779051-26410-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1415779051-26410-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, mikko.perttunen@kapsi.fi, acourbot@nvidia.com, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Needed to properly decode the ram code register.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

---

v3:	* Clarify wording as suggested by Mikko
---
 Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
index b97b8be..d034ff8 100644
--- a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
+++ b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
@@ -11,3 +11,5 @@ Required properties:
        The second entry gives the physical address and length of the
        registers indicating the strapping options.
 
+Optional properties:
+- nvidia,long-ram-code: If present, the RAM code is long (4 bit). If not, short (2 bit).
-- 
1.9.3
