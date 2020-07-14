From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ PATCH v5 1/4] dt-bindings: arm: Add t194 ccplex
 compatible and bpmp property
Date: Tue, 14 Jul 2020 07:46:11 -0600
Message-ID: <CAL_JsqL1CuumdT1CZiofEZw9j+3gsir8JwSrZVfcxFxEB=bavQ@mail.gmail.com>
References: <1594649209-29394-1-git-send-email-sumitg@nvidia.com>
 <1594649209-29394-2-git-send-email-sumitg@nvidia.com> <20200713164214.GA341271@bogus>
 <70a0a8ee-b79a-2a05-5150-2ee0faaf2730@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <70a0a8ee-b79a-2a05-5150-2ee0faaf2730-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:THERMAL" <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 14, 2020 at 5:44 AM Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>
>
> > On Mon, Jul 13, 2020 at 07:36:46PM +0530, Sumit Gupta wrote:
> >> To do frequency scaling on all CPUs within T194 CPU Complex, we need
> >> to query BPMP for data on valid operating points. Document a compatible
> >> string under 'cpus' node to represent the CPU Complex for binding drivers
> >> like cpufreq which don't have their node or CPU Complex node to bind to.
> >> Also, document a property to point to the BPMP device that can be queried
> >> for all CPUs.
> >
> > The cpus.yaml binding documents what's in 'cpu' nodes, not 'cpus'
> > node. AIUI, the latter is what you want. You should do your own schema
> > file here.
> >
> Do you mean to change existing file name from 'cpus.yaml' to 'cpu.yaml'
> and create new 'cpus.yaml' file?
> I think it's better to incorporate the change in existing 'cpus.yaml'
> file to keep both cpu@X and cpus node details together. Please suggest.

No, I'm suggesting you create nvidia,tegra194-ccplex.yaml.


> >> Signed-off-by: Sumit Gupta <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >>   Documentation/devicetree/bindings/arm/cpus.yaml | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> >> index a018147..9b328e3 100644
> >> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> >> @@ -162,6 +162,7 @@ properties:
> >>         - nvidia,tegra132-denver
> >>         - nvidia,tegra186-denver
> >>         - nvidia,tegra194-carmel
> >> +      - nvidia,tegra194-ccplex
> >
> > Tegra194 has 2 different CPUs?
> >
> No, T194 SOC has homogeneous architecture with four clusters where each
> cluster has two symmetric cores. 'nvidia,tegra194-carmel' compatible
> string represents each cpu. 'nvidia,tegra194-ccplex' string represents
> the CPU Complex to bind cpufreq driver. The change was done as per
> discussion [1]

You are adding the compatible string to the cpu@N node compatible.

>
> >>         - qcom,krait
> >>         - qcom,kryo
> >>         - qcom,kryo260
> >> @@ -255,6 +256,15 @@ properties:
> >>
> >>         where voltage is in V, frequency is in MHz.
> >>
> >> +  nvidia,bpmp:
> >> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> >> +    description: |
> >> +      Specifies the bpmp node that needs to be queried to get
> >> +      operating point data for all CPUs.
> >> +
> >> +      Optional for systems that have a "compatible"
> >> +      property value of "nvidia,tegra194-ccplex".
> >> +
> >>     power-domains:
> >>       $ref: '/schemas/types.yaml#/definitions/phandle-array'
> >>       description:
> >> @@ -340,6 +350,7 @@ required:
> >>
> >>   dependencies:
> >>     rockchip,pmu: [enable-method]
> >> +  nvidia,bpmp: [compatible]
> >>
> >>   examples:
> >>     - |
> >> --
> >> 2.7.4
> >>
>
> [1] https://marc.info/?l=linux-arm-kernel&m=158999171528418&w=2
