From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] dt-bindings: tegra: Rename some bindings for consistency
Date: Tue, 12 Apr 2016 17:07:36 +0200
Message-ID: <1460473656-27209-2-git-send-email-thierry.reding@gmail.com>
References: <1460473656-27209-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460473656-27209-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Device tree binding for NVIDIA Tegra have traditionally carried the
"nvidia," vendor prefix in the filename. A couple of odd ones don't, so
fix them up for consistency.

Also rename existing bindings to reflect the first compatible value that
they document. This wasn't done consistently either.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- rename a couple more binding documents whose name didn't reflect the
  compatible string that they describe
- generate patch with -M to make obvious that there weren't any changes
  besides the renaming

 .../devicetree/bindings/ata/{tegra-sata.txt => nvidia,tegra124-ahci.txt}  | 0
 .../cpufreq/{tegra124-cpufreq.txt => nvidia,tegra124-cpufreq.txt}         | 0
 .../bindings/dma/{tegra20-apbdma.txt => nvidia,tegra20-apbdma.txt}        | 0
 .../{nvidia,tegra-ictlr.txt => nvidia,tegra20-ictlr.txt}                  | 0
 .../memory-controllers/{tegra-emc.txt => nvidia,tegra124-emc.txt}         | 0
 .../memory-controllers/{nvidia,tegra-mc.txt => nvidia,tegra30-mc.txt}     | 0
 .../bindings/thermal/{tegra-soctherm.txt => nvidia,tegra124-soctherm.txt} | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/ata/{tegra-sata.txt => nvidia,tegra124-ahci.txt} (100%)
 rename Documentation/devicetree/bindings/cpufreq/{tegra124-cpufreq.txt => nvidia,tegra124-cpufreq.txt} (100%)
 rename Documentation/devicetree/bindings/dma/{tegra20-apbdma.txt => nvidia,tegra20-apbdma.txt} (100%)
 rename Documentation/devicetree/bindings/interrupt-controller/{nvidia,tegra-ictlr.txt => nvidia,tegra20-ictlr.txt} (100%)
 rename Documentation/devicetree/bindings/memory-controllers/{tegra-emc.txt => nvidia,tegra124-emc.txt} (100%)
 rename Documentation/devicetree/bindings/memory-controllers/{nvidia,tegra-mc.txt => nvidia,tegra30-mc.txt} (100%)
 rename Documentation/devicetree/bindings/thermal/{tegra-soctherm.txt => nvidia,tegra124-soctherm.txt} (100%)

diff --git a/Documentation/devicetree/bindings/ata/tegra-sata.txt b/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
similarity index 100%
rename from Documentation/devicetree/bindings/ata/tegra-sata.txt
rename to Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
diff --git a/Documentation/devicetree/bindings/cpufreq/tegra124-cpufreq.txt b/Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
similarity index 100%
rename from Documentation/devicetree/bindings/cpufreq/tegra124-cpufreq.txt
rename to Documentation/devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt
diff --git a/Documentation/devicetree/bindings/dma/tegra20-apbdma.txt b/Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.txt
similarity index 100%
rename from Documentation/devicetree/bindings/dma/tegra20-apbdma.txt
rename to Documentation/devicetree/bindings/dma/nvidia,tegra20-apbdma.txt
diff --git a/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra-ictlr.txt b/Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
similarity index 100%
rename from Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra-ictlr.txt
rename to Documentation/devicetree/bindings/interrupt-controller/nvidia,tegra20-ictlr.txt
diff --git a/Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/memory-controllers/tegra-emc.txt
rename to Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/memory-controllers/nvidia,tegra-mc.txt
rename to Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.txt
diff --git a/Documentation/devicetree/bindings/thermal/tegra-soctherm.txt b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
similarity index 100%
rename from Documentation/devicetree/bindings/thermal/tegra-soctherm.txt
rename to Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.txt
-- 
2.8.0
