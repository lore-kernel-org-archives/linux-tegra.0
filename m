From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ Patch v3 1/4] dt-bindings: arm: Add t194
 ccplex compatible and bpmp property
Date: Mon, 22 Jun 2020 12:52:47 +0530
Message-ID: <20200622072247.agrvmw6sl3jwgjkz@vireshk-i7>
References: <1592775274-27513-1-git-send-email-sumitg@nvidia.com>
 <1592775274-27513-2-git-send-email-sumitg@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1592775274-27513-2-git-send-email-sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 22-06-20, 03:04, Sumit Gupta wrote:
> To do frequency scaling on all CPUs within T194 CPU Complex, we need
> to query BPMP for data on valid operating points. Document a compatible
> string under 'cpus' node to represent the CPU Complex for binding drivers
> like cpufreq which don't have their node or CPU Complex node to bind to.
> Also, document a property to point to the BPMP device that can be queried
> for all CPUs.

You shouldn't be putting how linux is going to use this information and entries
shouldn't be made just so cpufreq can bind to a driver.

Though I see that this is a real hardware register which you can use to interact
with the firmware ? And so it makes sense to have it, maybe in different form
though.

I will let Rob explain what would be the right way of doing this though.

> 
> Signed-off-by: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index a018147..737b55e 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -162,6 +162,7 @@ properties:
>        - nvidia,tegra132-denver
>        - nvidia,tegra186-denver
>        - nvidia,tegra194-carmel
> +      - nvidia,tegra194-ccplex
>        - qcom,krait
>        - qcom,kryo
>        - qcom,kryo260
> @@ -255,6 +256,14 @@ properties:
>  
>        where voltage is in V, frequency is in MHz.
>  
> +  nvidia,bpmp:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    descrption: |
> +      Specifies the bpmp node that needs to be queried to get
> +      operating point data for all CPUs.
> +
> +      Optional for NVIDIA Tegra194 Carmel CPUs
> +
>    power-domains:
>      $ref: '/schemas/types.yaml#/definitions/phandle-array'
>      description:
> -- 
> 2.7.4

-- 
viresh
