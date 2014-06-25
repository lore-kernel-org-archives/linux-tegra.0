From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v1 5/9] of: Add NVIDIA Tegra XHCI controller binding
Date: Wed, 25 Jun 2014 16:02:48 -0700
Message-ID: <CAL1qeaHThKVBoY0fikFCh9X00BFNJ=XKfovOBwztEyOVjHBLjg@mail.gmail.com>
References: <1403072180-4944-1-git-send-email-abrestic@chromium.org>
	<1403072180-4944-6-git-send-email-abrestic@chromium.org>
	<53AB4530.2050106@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53AB4530.2050106-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 25, 2014 at 2:54 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 06/18/2014 12:16 AM, Andrew Bresticker wrote:
>> Add device-tree binding documentation for the XHCI controller present
>> on Tegra124 and later SoCs.
>
>> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xhci.txt b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xhci.txt
>
>> + - clock-names: Must include the following entries:
>> +    - xusb_host
>> +    - xusb_falcon_src
>> +    - xusb_ss
>> +    - xusb_ss_src
>> +    - xusb_hs_src
>> +    - xusb_fs_src
>
> Looking at include/dt-bindings/clock/tegra124-car.h I see a few entries
> potentially missing here:
>
> #define TEGRA124_CLK_XUSB_HOST_SRC 252
> #define TEGRA124_CLK_XUSB_DEV_SRC 256
> #define TEGRA124_CLK_XUSB_DEV 257
> #define TEGRA124_CLK_XUSB_SS_DIV2 312

The driver doesn't use them, so I didn't put them in the binding.

>> +    - pll_u_480m
>
> Not just pll_u?

We specifically want pll_u_480M as that's what we use as the parent of
xusb_ss_src when scaling it to 120Mhz.
