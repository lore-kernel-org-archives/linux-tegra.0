From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/2] pinctrl: tegra: Add DT binding for io pads control
Date: Tue, 15 Nov 2016 18:48:44 +0000
Message-ID: <4be6f5f3-6884-7e4e-049c-29a1f8ca1fcb@nvidia.com>
References: <1478696782-11657-1-git-send-email-ldewangan@nvidia.com>
 <1478696782-11657-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478696782-11657-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 09/11/16 13:06, Laxman Dewangan wrote:
> NVIDIA Tegra124 and later SoCs support the multi-voltage level and
> low power state of some of its IO pads. The IO pads can work in
> the voltage of the 1.8V and 3.3V of IO voltage from IO power rail
> sources. When IO interfaces are not used then IO pads can be
> configure in low power state to reduce the power consumption from
> that IO pads.
> 
> On Tegra124, the voltage level of IO power rail source is auto
> detected by hardware(SoC) and hence it is only require to configure
> in low power mode if IO pads are not used.
> 
> On T210 onwards, the auto-detection of voltage level from IO power
> rail is removed from SoC and hence SW need to configure the PMC
> register explicitly to set proper voltage in IO pads based on
> IO rail power source voltage.
> 
> Add DT binding document for detailing the DT properties for
> configuring IO pads voltage levels and its power state.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> ---
> Changes from V1:
>  The DT binding document is modified to explain the regulator handle
>  for different IOs and how can it be passed from the DT.
> ---
>  .../bindings/pinctrl/nvidia,tegra-io-pad.txt       | 126 +++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
> new file mode 100644
> index 0000000..6ca961f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
> @@ -0,0 +1,126 @@
> +NVIDIA Tegra PMC IO pad controller
> +
> +NVIDIA Tegra124 and later SoCs support the multi-voltage level and
> +low power state of some of its IO pads. When IO interface are not
> +used then IO pads can be configure in low power state to reduce
> +the power from that IO pads. The IO pads can work in the voltage
> +of the 1.8V and 3.3V of IO voltage from power rail sources.

The last sentence is a bit unclear and does not sound correct. I am not
sure if you are missing the word 'range' somewhere or if you are trying
to say it must be either 1.8V or 3.3V. Looks like you have the same
sentence on the changelog too.

Cheers
Jon

-- 
nvpublic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
