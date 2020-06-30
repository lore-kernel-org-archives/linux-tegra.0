From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 52/73] arm64: tegra: Remove simple clocks bus
Date: Tue, 30 Jun 2020 12:13:36 +0100
Message-ID: <46e907c8-6fd5-73ff-9ca4-bcf3ee19d716@nvidia.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-53-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-53-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 16/06/2020 14:52, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The standard way to do this is to list out the clocks at the top-level.
> Adopt the standard way to fix validation.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra132-norrin.dts    | 15 ++++-----------
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi    | 15 ++++-----------
>  arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi    | 15 ++++-----------
>  arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi    | 15 ++++-----------
>  .../arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 15 ++++-----------
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts     | 15 ++++-----------
>  6 files changed, 24 insertions(+), 66 deletions(-)

After applying this patch I see the following build breakage ...

  DTC     arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb
arch/arm64/boot/dts/nvidia/tegra132.dtsi:649.15-682.4: ERROR
(phandle_references): /usb@70090000: Reference to non-existent node or
label "vdd_3v3_lp0"

  also defined at
arch/arm64/boot/dts/nvidia/tegra132-norrin.dts:895.15-909.4
arch/arm64/boot/dts/nvidia/tegra132.dtsi:649.15-682.4: ERROR
(phandle_references): /usb@70090000: Reference to non-existent node or
label "vdd_3v3_lp0"

  also defined at
arch/arm64/boot/dts/nvidia/tegra132-norrin.dts:895.15-909.4
arch/arm64/boot/dts/nvidia/tegra132.dtsi:684.26-812.4: ERROR
(phandle_references): /padctl@7009f000: Reference to non-existent node
or label "vdd_3v3_lp0"

Jon

-- 
nvpublic
