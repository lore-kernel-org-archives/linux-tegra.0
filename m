From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v5 9/9] arm64: tegra: Add Tegra VI CSI support in
 device tree
Date: Tue, 24 Mar 2020 22:19:02 +0300
Message-ID: <672819ea-01d3-2eca-8bb7-84ffd64256d4@gmail.com>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
 <1584985955-19101-10-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1584985955-19101-10-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

23.03.2020 20:52, Sowjanya Komatineni пишет:
...
> +			pd_venc: venc {
> +				clocks = <&tegra_car TEGRA210_CLK_VI>,
> +					 <&tegra_car TEGRA210_CLK_CSI>;
> +				resets = <&mc TEGRA210_MC_RESET_VI>,

The MC resetting should be needed only for a hardware hot-resetting. It
should be wrong to add it to the power domain.

> +					 <&tegra_car TEGRA210_RST_VI>,
> +					 <&tegra_car TEGRA210_CLK_CSI>;
> +				#power-domain-cells = <0>;
> +			};
>  		};
