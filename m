From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 3/3] dt-bindings: Add support for devices with multiple PM domains
Date: Tue, 20 Sep 2016 11:28:07 +0100
Message-ID: <1474367287-10402-4-git-send-email-jonathanh@nvidia.com>
References: <1474367287-10402-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1474367287-10402-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-pm-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Now that the generic PM domain framework supports devices that require
multiple PM domains, update the device-tree binding for generic PM
domains to state that one or more PM domain is permitted for a device.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 Documentation/devicetree/bindings/power/power_domain.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/power_domain.txt b/Documentation/devicetree/bindings/power/power_domain.txt
index 025b5e7df61c..12131159b605 100644
--- a/Documentation/devicetree/bindings/power/power_domain.txt
+++ b/Documentation/devicetree/bindings/power/power_domain.txt
@@ -20,8 +20,9 @@ Required properties:
    as specified by device tree binding documentation of particular provider.
 
 Optional properties:
- - power-domains : A phandle and PM domain specifier as defined by bindings of
-                   the power controller specified by phandle.
+ - power-domains : An array of one or more PM domain specifiers (defined by the
+		   bindings of the PM domain provider) for each PM domain that
+		   is required by the device.
    Some power domains might be powered from another power domain (or have
    other hardware specific dependencies). For representing such dependency
    a standard PM domain consumer binding is used. When provided, all domains
-- 
2.1.4

