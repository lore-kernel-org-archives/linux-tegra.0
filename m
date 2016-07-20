From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 3/10] Documentation: dt-bindings: firmware: tegra: add
 bindings of the BPMP
Date: Tue, 19 Jul 2016 20:22:31 -0500
Message-ID: <20160720012231.GA8522@rob-hp-laptop>
References: <20160719091723.30919-1-josephl@nvidia.com>
 <20160719091723.30919-2-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160719091723.30919-2-josephl@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Matthew Longnecker <MLongnecker@nvidia.com>, devicetree@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sivaram Nair <sivaramn@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 19, 2016 at 05:17:23PM +0800, Joseph Lo wrote:
> The BPMP is a specific processor in Tegra chip, which is designed for
> booting process handling and offloading the power management, clock
> management, and reset control tasks from the CPU. The binding document
> defines the resources that would be used by the BPMP firmware driver,
> which can create the interprocessor communication (IPC) between the CPU
> and BPMP.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> Changes in V3:
> - s/mmio-ram/mmio-sram/
> - revise the file path of the reference binding documents and header files
>   for more generic viem in different SW projects
> Changes in V2:
> - update the message that the BPMP is clock and reset control provider
> - add tegra186-clock.h and tegra186-reset.h header files
> - revise the description of the required properties
> ---
>  .../bindings/firmware/nvidia,tegra186-bpmp.txt     |  77 ++
>  include/dt-bindings/clock/tegra186-clock.h         | 940 +++++++++++++++++++++
>  include/dt-bindings/reset/tegra186-reset.h         | 217 +++++
>  3 files changed, 1234 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
>  create mode 100644 include/dt-bindings/clock/tegra186-clock.h
>  create mode 100644 include/dt-bindings/reset/tegra186-reset.h

Acked-by: Rob Herring <robh@kernel.org>
