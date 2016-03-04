From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v10 3/9] dt-bindings: phy: tegra-xusb-padctl: Add Tegra210 support
Date: Fri, 4 Mar 2016 13:41:11 -0800
Message-ID: <CAL1qeaHq2FMPeF9vqPEkpz9v+rcdPoJf2oegZ1afYDL9N6ggKA@mail.gmail.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
	<1457108379-20794-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457108379-20794-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 4, 2016 at 8:19 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Extend the binding to cover the set of feature found in Tegra210.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

> +PCIe pad:
> +---------
> +
> +Required properties:
> +- clocks: Must contain an entry for each entry in clock-names.
> +- clock-names: Must contain the following entries:
> +  - "pll": phandle and specifier referring to the PLLE
> +- resets: Must contain an entry for each entry in reset-names.
> +- reset-names: Must contain the following entries:
> +  - "phy": reset for the PCIe UPHY block
> +
> +SATA pad:
> +---------
> +
> +Required properties:
> +- resets: Must contain an entry for each entry in reset-names.
> +- reset-names: Must contain the following entries:
> +  - "phy": reset for the SATA UPHY block

Doesn't the SATA pad require PLLE as well?  You've included it in the
example DT fragment, but it's absent here.
