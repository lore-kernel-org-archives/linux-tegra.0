From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 1/2] pinctrl: tegra: Add DT binding for io pads control
Date: Fri, 25 Nov 2016 17:19:51 +0000
Message-ID: <71fe4550-52ac-d176-b1c5-fe64083a95e7@nvidia.com>
References: <1479976734-30498-1-git-send-email-ldewangan@nvidia.com>
 <1479976734-30498-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479976734-30498-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org
Cc: yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 24/11/16 08:38, Laxman Dewangan wrote:
> NVIDIA Tegra124 and later SoCs support the multi-voltage level and
> low power state of some of its IO pads. The IO pads can work in
> the voltage of the 1.8V and 3.3V of IO voltage from IO power rail
> sources.

Can you fix the above sentence?

> When IO interfaces are not used then IO pads can be
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
>  New in series based on pinctrl driver requirement.
> 
> Changes from V2:
>  Updated the statement to say 1.8V and 3.3V as nominal voltage.
>  Corrected DT example by adding -supply and taken care of V1 review
>  from Rob.
> 
>  .../bindings/pinctrl/nvidia,tegra-io-pad.txt       | 126 +++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
> new file mode 100644
> index 0000000..a88c484
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra-io-pad.txt
> @@ -0,0 +1,126 @@
> +NVIDIA Tegra PMC IO pad controller
> +
> +NVIDIA Tegra124 and later SoCs support the multi-voltage level and low power
> +state of some of its IO pads. When IO interface are not used then IO pads can
> +be configure in low power state to reduce the power from that IO pads. The IO
> +pads can work in the nominal IO voltage of 1.8V and 3.3V from power rail
> +sources.

I would replace the above sentence with ...

"The IO pads can operate at the nominal IO voltage of either 1.8V or 3.3V".

Cheers
Jon

-- 
nvpublic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
