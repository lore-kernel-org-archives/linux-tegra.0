From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: Add bindings for
 nvidia,tegra186-bpmp-thermal
Date: Fri, 23 Jun 2017 13:48:42 -0500
Message-ID: <20170623184842.ndb44vqyu5rtaa2e@rob-hp-laptop>
References: <20170616112825.31025-1-mperttunen@nvidia.com>
 <20170616112825.31025-2-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170616112825.31025-2-mperttunen@nvidia.com>
Sender: linux-pm-owner@vger.kernel.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: mark.rutland@arm.com, rui.zhang@intel.com, edubezval@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 16, 2017 at 02:28:23PM +0300, Mikko Perttunen wrote:
> In Tegra186, the BPMP (Boot and Power Management Processor) implements
> an interface that is used to read system temperatures, including CPU
> cluster and GPU temperatures. This binding describes the thermal sensor
> that is exposed by BPMP.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../thermal/nvidia,tegra186-bpmp-thermal.txt       | 32 ++++++++++++++++++++++
>  .../dt-bindings/thermal/tegra186-bpmp-thermal.h    | 14 ++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.txt
>  create mode 100644 include/dt-bindings/thermal/tegra186-bpmp-thermal.h

Acked-by: Rob Herring <robh@kernel.org>
