From: Paul Walmsley <paul@pwsan.com>
Subject: [PATCH v3 3/3] Documentation: DT bindings: Tegra AHB: require the
 legacy base address for existing chips
Date: Fri, 20 Mar 2015 00:11:02 -0600
Message-ID: <20150320061102.14355.87959.stgit@mcwayne>
References: <20150320061102.14355.4781.stgit@mcwayne>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150320061102.14355.4781.stgit@mcwayne>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Paul Walmsley <pwalmsley@nvidia.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kumar Gala <galak@codeaurora.org>
List-Id: linux-tegra@vger.kernel.org

Per Stephen Warren, note in the Tegra AHB DT binding documentation
that we specifically deprecate any attempt to use the IP block's
actual hardware base address, and advocate the use of the legacy
"off-by-four" address in the 'regs' property, for Tegra chips with
existing upstream Linux DT files that include a Tegra AHB node.  This
patch updates the documentation accordingly.

Changing the existing kernel DT data isn't under consideration because
Linux kernel DT data policy is to preserve compatibility between newer
DT data files and older kernels.  However, this additional step of
changing the documentation should discourage others from sending
kernel patches to try to change the legacy kernel DT data.
Furthermore, for out-of-tree software (such as bootloaders or other
operating systems) that may rely on Linux kernel DT binding
documentation as an ABI (but not the Linux kernel DT data itself),
such a change may allow future convergence with the Linux kernel DT
data without additional code changes.

Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Paul Walmsley <pwalmsley@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 .../bindings/arm/tegra/nvidia,tegra20-ahb.txt      |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
index 067c9790062f..9a4295b54539 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
@@ -5,9 +5,12 @@ Required properties:
   Tegra30, must contain "nvidia,tegra30-ahb".  Otherwise, must contain
   '"nvidia,<chip>-ahb", "nvidia,tegra30-ahb"' where <chip> is tegra124,
   tegra132, or tegra210.
-- reg : Should contain 1 register ranges(address and length)
+- reg : Should contain 1 register ranges(address and length).  For
+  Tegra20, Tegra30, and Tegra114 chips, the value must be <0x6000c004
+  0x10c>.  For Tegra124, Tegra132 and Tegra210 chips, the value should
+  be be <0x6000c000 0x150>.
 
-Example:
+Example (for a Tegra20 chip):
 	ahb: ahb@6000c004 {
 		compatible = "nvidia,tegra20-ahb";
 		reg = <0x6000c004 0x10c>; /* AHB Arbitration + Gizmo Controller */
