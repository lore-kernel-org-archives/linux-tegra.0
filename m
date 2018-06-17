From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 3/8] dt: bindings: Move tegra20-emc binding to memory-controllers directory
Date: Sun, 17 Jun 2018 17:55:34 +0300
Message-ID: <20180617145539.4758-4-digetx@gmail.com>
References: <20180617145539.4758-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180617145539.4758-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Move tegra20-emc binding to the memory-controllers directory for
consistency with the other Tegra memory bindings.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../{arm/tegra => memory-controllers}/nvidia,tegra20-emc.txt      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{arm/tegra => memory-controllers}/nvidia,tegra20-emc.txt (100%)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt
rename to Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
-- 
2.17.1
