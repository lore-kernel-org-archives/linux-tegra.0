From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/7] ARM: tegra: finalize USB EHCI and PHY bindings
Date: Wed, 03 Apr 2013 13:07:51 -0600
Message-ID: <515C7E07.4040505@wwwdotorg.org>
References: <1364978502-22887-1-git-send-email-vbyravarasu@nvidia.com> <1364978502-22887-2-git-send-email-vbyravarasu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364978502-22887-2-git-send-email-vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/03/2013 02:41 AM, Venu Byravarasu wrote:
> The existing Tegra USB bindings have a few issues:
...
> This patch fixes the binding definition to resolve these issues.

> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt

>  Required properties :
...
> +  - vbus-supply: regulator for VBUS

Doesn't the driver only need to control VBUS if the port is in OTG mode?

If there is no VBUS control, and the HW provides VBUS, I think that the
port can only operate in host mode.

If there is no VBUS control, and the HW does not provide VBUS, I think
that the port can only operate in peripheral mode.

If there is VBUS control, then shouldn't the port always operate in OTG
mode, or are there other reasons to control VBUS even in host-only mode?

If VBUS control is only useful for OTG mode, then I think the
vbus-supply property should be documented in a "Required properties for
dr_mode == otg" section.

I assume that VBUS control makes no sense for a peripheral-mode-only
port, so if VBUS control is useful for host-only mode as well as OTG
mode, then I think the vbus-supply property should be documented in a
"Required properties for dr_mode != peripheral" section.

Is the following table correct?

Port operating mode:	host	peripheral	otg
--------------------	----	----------	---
VBUS control required:	no	no		yes
VBUS control useful:	yes[1]?	no		yes

[1] perhaps for power-saving/suspend???
