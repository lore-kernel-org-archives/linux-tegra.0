From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: Enable Venice2 keyboard
Date: Fri, 13 Dec 2013 10:03:39 -0700
Message-ID: <52AB3DEB.5020507@wwwdotorg.org>
References: <1386951847-6490-1-git-send-email-treding@nvidia.com> <1386951847-6490-2-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386951847-6490-2-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/13/2013 09:24 AM, Thierry Reding wrote:

> diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts

> +				linux,keymap = <0x0001007d	/* L_META */
> +						0x0002003b	/* F1 */

I don't suppose you could rework these using the MATRIX_KEY() macro, and
associated header file that provides named keycode constants?
