From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/38] dt-bindings: firmware: tegra186-bpmp: Document
 interconnect paths
Date: Wed, 17 Jun 2020 16:50:51 -0600
Message-ID: <20200617225051.GB2975260@bogus>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-6-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200612141903.2391044-6-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 12, 2020 at 04:18:30PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Document the interconnects property that is used to describe the paths
> from and to system memory from and to the BPMP.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../firmware/nvidia,tegra186-bpmp.yaml        | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> index 0e4d51ba7aa1..fd642eeb8dde 100644
> --- a/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> +++ b/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> @@ -43,6 +43,21 @@ properties:
>        - enum:
>            - nvidia,tegra186-bpmp
>  
> +  interconnects:
> +    description: A list of phandle and specifier pairs that describe the
> +      interconnect paths to and from the BPMP.
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"

Again, don't re-define standard properties.

> +
> +  interconnect-names:
> +    description: One string for each pair of phandle and specifier in the
> +      "interconnects" property.
> +    $ref: "/schemas/types.yaml#/definitions/string-array"
> +    items:
> +      - const: read
> +      - const: write
> +      - const: dma-mem # dma-read
> +      - const: dma-write
> +
>    iommus:
>      description: |
>        The phandle of the IOMMU and the IOMMU specifier. See ../iommu/iommu.txt
> @@ -158,6 +173,12 @@ examples:
>  
>      bpmp {
>          compatible = "nvidia,tegra186-bpmp";
> +        interconnects = <&mc TEGRA186_MEMORY_CLIENT_BPMPR &emc>,
> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPW &emc>,
> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR &emc>,
> +                        <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW &emc>;
> +        interconnect-names = "read", "write", "dma-mem", "dma-write";
> +
>          iommus = <&smmu TEGRA186_SID_BPMP>;
>          mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_BPMP>;
>          shmem = <&cpu_bpmp_tx &cpu_bpmp_rx>;
> -- 
> 2.24.1
> 
