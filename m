From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4] Tegra: DT: add device tree binding doc for QSPI
Date: Mon, 26 Oct 2015 18:09:47 -0500
Message-ID: <CAL_Jsq+ns8eFrXpERA4+DoXcC3cGFtbu=72ehpkxDf8KQzQguQ@mail.gmail.com>
References: <1445898140-3561-1-git-send-email-twarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445898140-3561-1-git-send-email-twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, tomcwarren3959-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 26, 2015 at 5:22 PM, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> This patch adds the device tree binding doc for the Tegra
> QSPI controller on Tegra210.
>
> Signed-off-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

> ---
> Changes in v2:
> - based it more on kernel's nvidia,tegra114-spi.txt binding
> - changes based on prelim review by swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Changes in v3:
> - renamed to 'nvidia,tegra210-qspi.txt' to match kernel bindings
> - more changes based on review from swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Changes in v4:
> - move 'clock' up under 'clock-names' entry
>
>  Documentation/devicetree/bindings/spi/nvidia,tegra210-qspi.txt | 42 ++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/nvidia,tegra210-qspi.txt
>
> diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-qspi.txt b/Documentation/devicetree/bindings/spi/nvidia,tegra210-qspi.txt
> new file mode 100644
> index 0000000..fe1558f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-qspi.txt
> @@ -0,0 +1,42 @@
> +NVIDIA Tegra QSPI controller.
> +
> +Required properties:
> +- compatible : for Tegra210, must contain "nvidia,tegra210-qspi".
> +- reg: Should contain QSPI registers location and length.
> +- interrupts: Should contain QSPI interrupt.
> +- clock-names : Must include the following entries:
> +  - qspi
> +- clocks : Must contain an entry for each entry in clock-names.
> +  See ../clocks/clock-bindings.txt for details.
> +- resets : Must contain an entry for each entry in reset-names.
> +  See ../reset/reset.txt for details.
> +- reset-names : Must include the following entries:
> +  - qspi
> +
> +Optional properties:
> +- dmas : Must contain an entry for each entry in clock-names.
> +  See ../dma/dma.txt for details.
> +- dma-names : Must include the following entries:
> +  - rx
> +  - tx
> +
> +Recommended properties:
> +- spi-max-frequency: Definition as per spi-bus.txt
> +
> +Example:
> +
> +spi@70410000 {
> +       compatible = "nvidia,tegra210-qspi";
> +       reg = <0x0 0x70410000 0x0 0x1000>;
> +       interrupts = <0 10 0x04>;
> +       spi-max-frequency = <24000000>;
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       clocks = <&tegra_car 211>;
> +       clock-names = "qspi";
> +       resets = <&tegra_car 211>;
> +       reset-names = "qspi";
> +       dmas = <&apbdma 16>, <&apbdma 16>;
> +       dma-names = "rx", "tx";
> +       status = "disabled";
> +};
> --
> 1.8.2.1.610.g562af5b
>
