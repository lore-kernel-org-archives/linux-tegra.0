From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 38/38] dt-bindings: serial: Document Tegra-specific
 properties
Date: Wed, 17 Jun 2020 20:47:21 -0600
Message-ID: <20200618024721.GA3378010@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-39-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-39-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 04:19:03PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> On Tegra the UART is described using additional properties, such as
> clock-names, reset-names, dmas and dma-names. Document them in the
> bindings so that Tegra device trees are properly validated.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/serial/8250.yaml      | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
> index c1d4c196f005..9c8fad27c3f3 100644
> --- a/Documentation/devicetree/bindings/serial/8250.yaml
> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
> @@ -28,6 +28,32 @@ allOf:
>            const: 2
>        required:
>          - reg-shift
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra20-uart

Can use 'const' here instead.

> +    then:
> +      properties:
> +        clock-names:
> +          $ref: "/schemas/types.yaml#/definitions/string-array"

Don't need type.

> +          items:
> +            - const: serial
> +
> +        dmas:
> +          $ref: "/schemas/types.yaml#/definitions/phandle-array"

How many?

> +
> +        dma-names:
> +          $ref: "/schemas/types.yaml#/definitions/string-array"
> +          items:
> +            - const: rx
> +            - const: tx
> +
> +        reset-names:
> +          $ref: "/schemas/types.yaml#/definitions/string-array"
> +          items:
> +            - const: serial
>    - if:
>        not:
>          properties:
> -- 
> 2.24.1
> 
