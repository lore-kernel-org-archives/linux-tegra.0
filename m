From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3 4/4] ARM: tegra: Add support for nyan board
Date: Sun, 23 Nov 2014 10:02:41 -0700
Message-ID: <CAPnjgZ290n57H1QWmCVqeb4g_A3FZBmbVcHQ5i0A=oVa582csQ@mail.gmail.com>
References: <1416759162-25445-1-git-send-email-sjg@chromium.org>
	<1416759162-25445-4-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416759162-25445-4-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Albert Aribaud <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On 23 November 2014 at 09:12, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>
> From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Nyan is a Tegra124 clamshell board that is very similar to venice2, but it
> has a different panel, the sdcard cd and wp sense are flipped, and it has
> a different revision of the AS3722 PMIC.
>
> This is the Acer Chromebook 13 CB5-311-T7NN (13.3-inch HD, NVIDIA
> Tegra K1, 2GB). The display is not currently supported, so it should
> boot on other nyan-based Chromebooks also, but only the device tree for
> nyan-big is provided here.
>
> The device tree file is from Linux but with features removed which are
> unlikely to be supported in U-Boot soon (regulators, pinmux). Also the
> addresses are updated to 32-bit.
>
> Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> (rebase, change to 'nyan', fix pinmux that resets nyan)
>
> ---
>
> Changes in v3:
> - Rename to nyan from norrin
> - Bring in device tree file from Linux v3.18-rc5
> - Generate pinmux file from tegra-pinmux-scripts

I should say that I'm not thrilled with this approach, particularly as
the files it generate have no mentioned that they are auto-generated.
Here we have a case where Nyan and Norrin apparently different by one
pixmux setting but there is no way to exploit this commonality.

I think this was discussed a while ago (the idea of static pinmux
being set up at start of day). If I recall I expressed my objections
at the time. If U-Boot headed this way in general it would be
unfortunate. You get a whole load of pinmux settings with no idea what
they are for, and no idea how to change them for your board. It almost
feels similar to a 'binary blob'.

I recently saw a patch to (from what I can tell) remove all the pinmux
information from the device tree in Linux, presumably on the
assumption it can never be changed except very early in the boot. If
this is a limitation of Tegra then it seems unfortunate to me.

Regards,
Simon
