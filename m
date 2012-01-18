From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 10/20] tegra: fdt: Add additional USB binding
Date: Wed, 18 Jan 2012 15:48:30 -0700
Message-ID: <4F174C3E.2090403@nvidia.com>
References: <1326342789-5781-1-git-send-email-sjg@chromium.org> <1326342789-5781-11-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1326342789-5781-11-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/11/2012 09:32 PM, Simon Glass wrote:
> This adds a property to indicate a port which can switch between host and device
> mode.
> 
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> 
>  doc/device-tree-bindings/usb/tegra-usb.txt |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/doc/device-tree-bindings/usb/tegra-usb.txt b/doc/device-tree-bindings/usb/tegra-usb.txt
> index 035d63d..96fd022 100644
> --- a/doc/device-tree-bindings/usb/tegra-usb.txt
> +++ b/doc/device-tree-bindings/usb/tegra-usb.txt
> @@ -11,3 +11,7 @@ Required properties :
>   - phy_type : Should be one of "ulpi" or "utmi".
>   - nvidia,vbus-gpio : If present, specifies a gpio that needs to be
>     activated for the bus to be powered.
> +
> +Optional properties:
> + - support-host-mode : If present then this peripheral can switch between
> +   host and device mode

All of Tegra's USB ports support host mode, and it's the typical mode of
operation. The TRM also indicates that all USB ports support device mode
(possibly depending on the PHY type that's been selected for or attached
to port). Port 2 explicitly doesn't support run-time switching, but by
omission, ports 1 and 3 do.

Hence, "support-host-mode" is not an accurate name, and doesn't match
the description given either.

I think that it'd be better to:
* Add properties to explicitly specify whether the port is
intended/allowed to operate (per board design) in each of host or device
mode.
* Default to static host mode if no properties are present.

i.e.:

+Optional properties:
+ - enable-host-mode : Indicate that the port is intended to operate in
+   host mode.
+ - enable-device-mode : Indicate that the port is intended to operate
+   in device mode.

We should error out if both properties are set for USB 2, since it
doesn't support run-time switching. Perhaps you can skip this
error-checking for now since we aren't implementing device mode anywhere
anyway...

Then in the later patch in your series that was using support-host-mode,

* Do VBUS detection only if both enable-host-mode and enable-device-mode
are present.
* Do VBUS GPIO enable if enable-host-mode is present (or assumed by
default) and VBUS detection passed (if it ran).

-- 
nvpublic
