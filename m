From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 30/38] dt-bindings: panel: Allow reg property for DSI panels
Date: Fri, 12 Jun 2020 08:29:35 -0600
Message-ID: <CAL_JsqL4wMN3+cd=WEUegGU9xwpj9DTXeKT6EwTRfqiS+y6fMw@mail.gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com> <20200612141903.2391044-31-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200612141903.2391044-31-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 8:20 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> For DSI panels the "reg" property is needed to represent the virtual
> channel of the given panel.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml        | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index d6cca1479633..34fe3d42b829 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -267,6 +267,9 @@ properties:
>          # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
>        - winstar,wf35ltiacd
>
> +  reg:
> +    description: virtual channel for DSI panels
> +

panel-simple-dsi.yaml?

>    backlight: true
>    enable-gpios: true
>    port: true
> --
> 2.24.1
>
