From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 00/16] gpio: Tight IRQ chip integration and banked infrastructure
Date: Thu, 5 Oct 2017 13:14:19 +0200
Message-ID: <CACRpkdZb4m=o-XR2iAtp+jh57f5BXbm7Ue2LHZ7Ji7cSGvEQQQ@mail.gmail.com>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <44cf41e3-834e-ddb3-4c9e-8ab00e0866cb@ti.com> <CACRpkdagAxotP=VZr1NUvmNmHgACfr4x2aHkh=nyyEhUWWgzPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdagAxotP=VZr1NUvmNmHgACfr4x2aHkh=nyyEhUWWgzPw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hoan Tran <hotran-qTEPVZfXA3Y@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 2, 2017 at 9:55 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> This is not necessarily a blocker if it can be shown that others than
> TI/OMAP can reuse it.
>
> I've looked at things like the imagination pistachio:
>
> pinctrl@18101C00 {
>         compatible = "img,pistachio-system-pinctrl";
>         reg = <0x18101C00 0x400>;
>
>         gpio0: gpio0 {
>                 interrupts = <GIC_SHARED 71 IRQ_TYPE_LEVEL_HIGH>;
>
>                 gpio-controller;
>                 #gpio-cells = <2>;
>
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
>         };
>
>         ...
>
>         gpio5: gpio5 {
>                 interrupts = <GIC_SHARED 76 IRQ_TYPE_LEVEL_HIGH>;
>
>                 gpio-controller;
>                 #gpio-cells = <2>;
>
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
>         };
>
> This looks like a clear candidate.
> CC: to  Andrew Bresticker, can you look into this?
>
> Another example would be gpio-tz1090, notably with interrupt optional:
>
>        gpios: gpio-controller@02005800 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 compatible = "img,tz1090-gpio";
>                 reg = <0x02005800 0x90>;
>
>                 /* bank 0 with an interrupt */
>                 gpios0: bank@0 {
>                         #gpio-cells = <2>;
>                         #interrupt-cells = <2>;
>                         reg = <0>;
>                         interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
>                         gpio-controller;
>                         gpio-ranges = <&pinctrl 0 0 30>;
>                         interrupt-controller;
>                 };
>
>                 /* bank 2 without interrupt */
>                 gpios2: bank@2 {
>                         #gpio-cells = <2>;
>                         reg = <2>;
>                         gpio-controller;
>                         gpio-ranges = <&pinctrl 0 60 30>;
>                 };
>         };
>
> CC to James Hogan to look at the series from this perspective.
>
> A third is gpio-mxs.c:
>
> pinctrl@80018000 {
>         compatible = "fsl,imx28-pinctrl", "simple-bus";
>         reg = <0x80018000 2000>;
>
>         gpio0: gpio@0 {
>                 compatible = "fsl,imx28-gpio";
>                 interrupts = <127>;
>                 gpio-controller;
>                 #gpio-cells = <2>;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
>         };
>
>         gpio1: gpio@1 {
>                 compatible = "fsl,imx28-gpio";
>                 interrupts = <126>;
>                 gpio-controller;
>                 #gpio-cells = <2>;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
>         };
>
>         gpio2: gpio@2 {
>                 compatible = "fsl,imx28-gpio";
>                 interrupts = <125>;
>                 gpio-controller;
>                 #gpio-cells = <2>;
>                 interrupt-controller;
>                 #interrupt-cells = <2>;
>         };
> (...)
>
> CC to Shawn Guo to look into this.
>
> So in short I think there can be others that can make good use of this
> infrastructure.

It also looks like the "ports" in the gpio-dwapb can be modeled using this
bank infrastructure, cutting down on per-driver overhead and adding
good much needed abstraction for these ports/banks.

Paging Hoan Tran on this as well, to keep an eye on the series.

Yours,
Linus Walleij
