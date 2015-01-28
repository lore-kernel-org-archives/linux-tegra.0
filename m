From: Paul Walmsley <paul@pwsan.com>
Subject: [PATCH 14/24] Documentation: DT bindings: add more chip compatible
 strings for Tegra eFuse
Date: Wed, 28 Jan 2015 16:49:38 -0700
Message-ID: <20150128234938.20644.83960.stgit@dusk.lan>
References: <20150128234935.20644.89300.stgit@dusk.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150128234935.20644.89300.stgit@dusk.lan>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Paul Walmsley <pwalmsley@nvidia.com>, Kumar Gala <galak@codeaurora.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


Add compatible strings for the eFuse IP blocks present on several Tegra
chips.  The primary objective here is to avoid checkpatch warnings,
per:

http://marc.info/?l=linux-tegra&m=142201349727836&w=2

Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Paul Walmsley <pwalmsley@nvidia.com>
Cc: devicetree@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../bindings/fuse/nvidia,tegra20-fuse.txt          |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
index d8c98c7614d0..c602216826af 100644
--- a/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
+++ b/Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
@@ -6,6 +6,7 @@ Required properties:
 	"nvidia,tegra30-efuse"
 	"nvidia,tegra114-efuse"
 	"nvidia,tegra124-efuse"
+	"nvidia,tegra132-efuse" (not yet matched by the driver)
   Details:
   nvidia,tegra20-efuse: Tegra20 requires using APB DMA to read the fuse data
 	due to a hardware bug. Tegra20 also lacks certain information which is
