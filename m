From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3] ARM: dts: tegra30: Connect SMMU with Video Decoder
 Engine
Date: Mon, 12 Aug 2019 19:42:29 +0300
Message-ID: <e2dbeed2-7596-d687-d200-8f08dc267c83@gmail.com>
References: <20190623170730.5095-1-digetx@gmail.com>
 <20190623170730.5095-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623170730.5095-2-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

23.06.2019 20:07, Dmitry Osipenko пишет:
> Enable IOMMU support for the video decoder.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> No changes since v1.
> 
>  arch/arm/boot/dts/tegra30.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> index 934caa83c8db..ce162125e7bf 100644
> --- a/arch/arm/boot/dts/tegra30.dtsi
> +++ b/arch/arm/boot/dts/tegra30.dtsi
> @@ -424,6 +424,7 @@
>  		clocks = <&tegra_car TEGRA30_CLK_VDE>;
>  		reset-names = "vde", "mc";
>  		resets = <&tegra_car 61>, <&mc TEGRA30_MC_RESET_VDE>;
> +		iommus = <&mc TEGRA_SWGROUP_VDE>;
>  	};
>  
>  	apbmisc@70000800 {
> 

Hello Thierry,

Will be awesome if you could pick up this and [1][2] for v5.4. The rest of the VDE patches
are already applied by the media maintainers in linux-next, please note that [2] is required
to avoid problems caused by the notorious implicit IOMMU backing. Thanks in advance!

[1] http://patchwork.ozlabs.org/patch/1120864/
[2] http://patchwork.ozlabs.org/project/linux-tegra/list/?series=115608
