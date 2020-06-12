From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/38] dt-bindings: display: tegra: Document interconnect
 paths
Date: Fri, 12 Jun 2020 18:52:44 +0300
Message-ID: <82888e53-c539-7d61-666d-bd6dbc494bfe@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-9-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200612141903.2391044-9-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello Thierry,

12.06.2020 17:18, Thierry Reding пишет:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Commit description is missing, checkpatch should warn about it.

> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.yaml  | 52 ++++++++++++++++---
>  1 file changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> index 3347e1b3c8f0..684fe25641f1 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
> @@ -97,8 +97,17 @@ properties:
>    iommus:
>      $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
>  
> -  memory-controllers:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array

Why memory-controllers property is removed?

> +  interconnects:
> +    description: Description of the interconnect paths for the host1x
> +      controller; see ../interconnect/interconnect.txt for details.
> +    items:
> +      - description: memory read client for host1x
> +
> +  interconnect-names:
> +    description: A list of names identifying each entry listed in the
> +      "interconnects" property.
> +    items:
> +      - const: dma-mem # read

Please notice that Host1x has two memory clients: one for DMA engine and
second I don't know what's for, maybe for indirect memory accesses. Why
you skipped the second path?

>  required:
>    - compatible
> @@ -489,6 +498,26 @@ allOf:
>              iommus:
>                $ref: "/schemas/types.yaml#/definitions/phandle-array"
>  
> +            #interconnects:
> +            #  items:
> +            #    - description: memory read client for window A
> +            #    - description: memory read client for window B
> +            #    - description: memory read client for window C
> +            #    - description: memory read client for cursor
> +            #    # disp only
> +            #    - description: memory read client for window T
> +            #    - description: memory read client for window D
> +
> +            #interconnect-names:
> +            #  items:
> +            #    - const: wina
> +            #    - const: winb
> +            #    - const: winc
> +            #    - const: cursor
> +            #    # disp only
> +            #    - const: wint
> +            #    - const: wind

Is this really intended to be commented out? Looks like this is an
unfinished patch.

In the patch [1] I used memory client names for the interconnect paths.
I like yours variant of the naming, it is more intuitive.

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20200609131404.17523-23-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/

I'll rebase my series on top of yours patches once you'll get them into
linux-next. Looking forward to v2!
