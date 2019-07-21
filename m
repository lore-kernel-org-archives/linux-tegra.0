From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V6 21/21] arm64: dts: tegra210-p3450: Jetson nano SC7
 timings
Date: Mon, 22 Jul 2019 01:25:28 +0300
Message-ID: <29137a3d-0463-2832-7484-caf768ed2bc9@gmail.com>
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-22-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563738060-30213-22-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

21.07.2019 22:41, Sowjanya Komatineni пишет:
> This patch adds Jetson nano platform specific SC7 timing configuration
> in the device tree.

You should stat all names with a capital letter, hence "Jetson Nano" and
"Tegra" in all patches (commit title/message and code comments). When
unsure, just go to google and find how official name looks like.

> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> index 9d17ec707bce..b525e69c172a 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -382,6 +382,13 @@
>  
>  	pmc@7000e400 {
>  		nvidia,invert-interrupt;
> +		nvidia,suspend-mode = <0>;
> +		nvidia,cpu-pwr-good-time = <0>;
> +		nvidia,cpu-pwr-off-time = <0>;
> +		nvidia,core-pwr-good-time = <4587 3876>;
> +		nvidia,core-pwr-off-time = <39065>;
> +		nvidia,core-power-req-active-high;
> +		nvidia,sys-clock-req-active-high;
>  	};
>  
>  	hda@70030000 {
> 
