From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra20 host1x support
Date: Wed, 14 Nov 2012 10:35:31 +0200
Message-ID: <50A357D3.9080002@nvidia.com>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de> <1352467202-27903-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1352467202-27903-2-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09.11.2012 15:20, Thierry Reding wrote:
> This commit adds the host1x node along with its children to the Tegra20
> DTSI. Furthermore the OF auxiliary data table is updated to have proper
> names assigned to the platform devices instantiated from the device
> tree. Moreover, the clocks required by host1x and the two display
> controllers are initialized and the pll_d frequency table is completed
> with a few entries to support common HDMI and LVDS display modes.

I tried to add nvhost on top of your patches and I noticed a glitch.

> +       { "host1x",     "pll_c",        144000000,      false },

This line causes host1x not to operate correctly. I don't know why this
is so, but when I try to initialize host1x, it hangs with this change,
but everything works without this line.

If you could fix that,

Acked-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Best regards,
Terje
