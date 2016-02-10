From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add stdout-path for various boards
Date: Wed, 10 Feb 2016 09:46:47 +0900
Message-ID: <CAAVeFu+Xii9dMC448mBz8jQbFUCJGfBkJG_dvCxvNChuopDAdA@mail.gmail.com>
References: <1455025920-21875-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455025920-21875-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 9, 2016 at 10:51 PM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> For Tegra boards, the device-tree alias serial0 is used for the console
> and so add the stdout-path information so that the console no longer
> needs to be passed via the kernel boot parameters.
>
> This has been tested on boards, tegra20-trimslice, tegra30-beaver,
> tegra114-dalmore and tegra124-jetson-tk1.
>
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>
> The only boards that I have not modified are tegra114-roth and
> tegra114-tn7 because these boards have two entries for console
> in the *.dts file. AFAICT we cannot suppport multiple consoles
> via the stdout-path and if a console is specified by the kernel
> boot parameters then this sets the kernel variable
> "console_set_on_cmdline" and prevents the stdout-path console
> being registered. If there is a better way to handle these boards
> via device-tree let me know.

These two boards require a hardcoded command-line in the DT anyway,
since the bootloader's command-line cannot be overridden (due to bad
bootloader design). So it seems ok to me to keep specifying the boot
console there for them.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
