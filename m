From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: timer: add Tegra210 timer
Date: Fri, 11 Jan 2019 16:21:12 -0600
Message-ID: <20190111222112.GA14252@bogus>
References: <20190107032810.13522-1-josephl@nvidia.com>
 <20190107032810.13522-2-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190107032810.13522-2-josephl@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 7 Jan 2019 11:28:05 +0800, Joseph Lo wrote:
> The Tegra210 timer provides fourteen 29-bit timer counters and one 32-bit
> timestamp counter. The TMRs run at either a fixed 1 MHz clock rate derived
> from the oscillator clock (TMR0-TMR9) or directly at the oscillator clock
> (TMR10-TMR13). Each TMR can be programmed to generate one-shot periodic,
> or watchdog interrupts.
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
>  .../bindings/timer/nvidia,tegra210-timer.txt  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nvidia,tegra210-timer.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
