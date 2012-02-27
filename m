From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 09/20] tegra: fdt: Add additional USB binding
Date: Mon, 27 Feb 2012 16:27:17 -0700
Message-ID: <4F4C1155.5040900@nvidia.com>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org> <1330375973-10681-10-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330375973-10681-10-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/27/2012 01:52 PM, Simon Glass wrote:
> This adds a property to indicate a port which can switch between host and device
> mode.
...
> diff --git a/doc/device-tree-bindings/usb/tegra-usb.txt b/doc/device-tree-bindings/usb/tegra-usb.txt
...
> +Optional properties:
> +  - dr_mode : dual role mode. Indicates the working mode for
> +   nvidia,tegra20-ehci compatible controllers.  Can be "host", "peripheral",
> +   or "otg".  Default to "host" if not defined for backward compatibility.

Those last two lines need to be indented 1 extra space each so the text
lines up with "dr_mode". I assume that Tom can do this when applying the
change to save any respins etc.

-- 
nvpublic
