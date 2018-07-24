From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 3/8] dt: bindings: Move tegra20-emc binding to memory-controllers directory
Date: Tue, 24 Jul 2018 19:42:16 +0300
Message-ID: <20180724164221.3307-4-digetx@gmail.com>
References: <20180724164221.3307-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724164221.3307-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Move tegra20-emc binding to the memory-controllers directory for
consistency with the other Tegra memory bindings.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../{arm/tegra => memory-controllers}/nvidia,tegra20-emc.txt      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{arm/tegra => memory-controllers}/nvidia,tegra20-emc.txt (100%)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt
rename to Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
-- 
2.18.0
