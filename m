From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [U-Boot] [PATCH v6 10/18] tegra: usb: fdt: Add additional device tree definitions for USB ports
Date: Mon, 27 Feb 2012 00:14:08 +0100
Message-ID: <201202270014.09174.marex@denx.de>
References: <1328288907-16725-11-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328288907-16725-11-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> This adds clock references to the USB part of the device tree for U-Boot,
> and marks USB1 as supporting legacy mode (which we disable in the driver).
> 
> The USB timing information may vary between boards sometimes, but for
> now we hard-code it in C. This is because all current T2x boards use
> the same values, we will deal with T3x later and we first need to agree
> on the format for this timing information in the fdt and may in fact
> decide that it has no place there.
> 

Hi,

what's the status of this patch/patchset?

Thanks
M
