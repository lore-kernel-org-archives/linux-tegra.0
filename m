From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 01/20] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
Date: Fri, 11 Jan 2019 13:32:02 -0600
Message-ID: <20190111193202.GA23016@bogus>
References: <20190104030702.8684-1-josephl@nvidia.com>
 <20190104030702.8684-2-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190104030702.8684-2-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: devicetree@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 4 Jan 2019 11:06:43 +0800, Joseph Lo wrote:
> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Add new properties to configure the DFLL PWM regulator support.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> *V4:
>  - s/nvidia,pwm-period/nvidia,pwm-period-nanoseconds/
> *V3:
>  - no change
> *V2:
>  - update the binding strings and descriptions for
>  nvidia,pwm-tristate-microvolts
>  nvidia,pwm-min-microvolts
>  nvidia,pwm-voltage-step-microvolts
> ---
>  .../bindings/clock/nvidia,tegra124-dfll.txt   | 79 ++++++++++++++++++-
>  1 file changed, 77 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
