From: kishon <kishon-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/7] ARM: tegra: update device trees for USB binding rework
Date: Wed, 20 Mar 2013 16:53:21 +0530
Message-ID: <51499C29.6070405@ti.com>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com> <1363609781-4045-3-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363609781-4045-3-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Monday 18 March 2013 05:59 PM, Venu Byravarasu wrote:
> This patch updates all Tegra board files so that they contain all the
> properties required by the updated USB DT binding. Note that this patch
> only adds the new properties and does not yet remove the old properties,
> in order to maintain bisectability. The old properties will be removed
> once the driver has been updated to assume the new bindings.
>
> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   arch/arm/boot/dts/tegra20-colibri-512.dtsi |    4 +++
>   arch/arm/boot/dts/tegra20-harmony.dts      |    8 +++---
>   arch/arm/boot/dts/tegra20-iris-512.dts     |    4 +++
>   arch/arm/boot/dts/tegra20-paz00.dts        |    8 +++---
>   arch/arm/boot/dts/tegra20-seaboard.dts     |   13 +++++++---
>   arch/arm/boot/dts/tegra20-trimslice.dts    |   12 +++++++---
>   arch/arm/boot/dts/tegra20-ventana.dts      |    7 +++--
>   arch/arm/boot/dts/tegra20.dtsi             |   32 +++++++++++++++++----------
>   8 files changed, 57 insertions(+), 31 deletions(-)
>
> diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> index cb73e62..af5a7ae 100644
> --- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> +++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
> @@ -443,6 +443,10 @@
>   		nvidia,phy-reset-gpio = <&gpio 169 0>; /* gpio PV1 */
>   	};
>
> +	usb-phy@c5004000 {
This node doesn't have a *reg* property. So "@c5004000" is not needed. 
This comment applies to all the nodes which doesn't have *reg* property.

Thanks
Kishon
