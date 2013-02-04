From: Prashant Gaikwad <pgaikwad@nvidia.com>
Subject: Re: [PATCH v5 08/10] ARM: dt: Add references to tegra_car clocks
Date: Mon, 4 Feb 2013 12:15:14 +0530
Message-ID: <510F58FA.5000101@nvidia.com>
References: <1359713962-16822-1-git-send-email-pdeschrijver@nvidia.com> <1359713962-16822-9-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1359713962-16822-9-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Stephen Warren <swarren@wwwdotorg.org>, Russell King <linux@arm.linux.org.uk>, Simon Glass <sjg@chromium.org>, Mike Turquette <mturquette@linaro.org>, Joseph Lo <josephl@nvidia.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 01 February 2013 03:48 PM, Peter De Schrijver wrote:
> Add references to tegra_car clocks for the basic device nodes.
>
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---

Reviewed-by: Prashant Gaikwad <pgaikwad@nvidia.com>

>   arch/arm/boot/dts/tegra114.dtsi |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
> index 96a8235..1dec620 100644
> --- a/arch/arm/boot/dts/tegra114.dtsi
> +++ b/arch/arm/boot/dts/tegra114.dtsi
> @@ -27,7 +27,7 @@
>   	};
>   
>   	tegra_car: clock {
> -		compatible = "nvidia,tegra114-car, nvidia,tegra30-car";
> +		compatible = "nvidia,tegra114-car";
>   		reg = <0x60006000 0x1000>;
>   		#clock-cells = <1>;
>   	};
> @@ -43,6 +43,7 @@
>   		reg-shift = <2>;
>   		interrupts = <0 36 0x04>;
>   		status = "disabled";
> +		clocks = <&tegra_car 6>;
>   	};
>   
>   	serial@70006040 {
> @@ -51,6 +52,7 @@
>   		reg-shift = <2>;
>   		interrupts = <0 37 0x04>;
>   		status = "disabled";
> +		clocks = <&tegra_car 192>;
>   	};
>   
>   	serial@70006200 {
> @@ -59,6 +61,7 @@
>   		reg-shift = <2>;
>   		interrupts = <0 46 0x04>;
>   		status = "disabled";
> +		clocks = <&tegra_car 55>;
>   	};
>   
>   	serial@70006300 {
> @@ -67,12 +70,14 @@
>   		reg-shift = <2>;
>   		interrupts = <0 90 0x04>;
>   		status = "disabled";
> +		clocks = <&tegra_car 65>;
>   	};
>   
>   	rtc {
>   		compatible = "nvidia,tegra114-rtc", "nvidia,tegra20-rtc";
>   		reg = <0x7000e000 0x100>;
>   		interrupts = <0 2 0x04>;
> +		clocks = <&tegra_car 4>;
>   	};
>   
>   	pmc {
>

