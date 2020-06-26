From: Sumit Gupta <sumitg@nvidia.com>
Subject: [TEGRA194_CPUFREQ PATCH v4 1/4] dt-bindings: arm: Add t194 ccplex compatible and bpmp property
Date: Fri, 26 Jun 2020 21:13:53 +0530
Message-ID: <1593186236-12760-2-git-send-email-sumitg@nvidia.com>
References: <1593186236-12760-1-git-send-email-sumitg@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1593186236-12760-1-git-send-email-sumitg@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rjw@rjwysocki.net, viresh.kumar@linaro.org, catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: bbasu@nvidia.com, sumitg@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org

To do frequency scaling on all CPUs within T194 CPU Complex, we need
to query BPMP for data on valid operating points. Document a compatible
string under 'cpus' node to represent the CPU Complex for binding drivers
like cpufreq which don't have their node or CPU Complex node to bind to.
Also, document a property to point to the BPMP device that can be queried
for all CPUs.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index a018147..737b55e 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -162,6 +162,7 @@ properties:
       - nvidia,tegra132-denver
       - nvidia,tegra186-denver
       - nvidia,tegra194-carmel
+      - nvidia,tegra194-ccplex
       - qcom,krait
       - qcom,kryo
       - qcom,kryo260
@@ -255,6 +256,14 @@ properties:
 
       where voltage is in V, frequency is in MHz.
 
+  nvidia,bpmp:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    descrption: |
+      Specifies the bpmp node that needs to be queried to get
+      operating point data for all CPUs.
+
+      Optional for NVIDIA Tegra194 Carmel CPUs
+
   power-domains:
     $ref: '/schemas/types.yaml#/definitions/phandle-array'
     description:
-- 
2.7.4
