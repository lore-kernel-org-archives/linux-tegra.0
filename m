From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: Re: [PATCH v1 5/6] dt-bindings: ARM: tegra: Add ASUS Google Nexus 7
Date: Thu, 2 Apr 2020 06:50:08 +0200
Message-ID: <20200402045008.GB11124@qmqm.qmqm.pl>
References: <20200331214327.6496-1-digetx@gmail.com>
 <20200331214327.6496-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200331214327.6496-6-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pedro =?iso-8859-2?Q?=C2ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 01, 2020 at 12:43:26AM +0300, Dmitry Osipenko wrote:
> Add a binding for the Tegra30-based ASUS Google Nexus 7 tablet device.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
> index 7fd0b66c69b2..fb3bbf7a5fb4 100644
> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> @@ -62,6 +62,13 @@ properties:
>                - toradex,colibri_t30-eval-v3
>            - const: toradex,colibri_t30
>            - const: nvidia,tegra30
> +      - items:
> +          - const: asus,grouper
> +          - const: nvidia,tegra30
> +      - items:
> +          - const: asus,tilapia
> +          - const: asus,grouper
> +          - const: nvidia,tegra30
>        - items:
>            - enum:
>                - nvidia,dalmore

Is it really necessary to list every possible device using a SoC chip?
Wouldn't it be enough to just list SoC value nvidia,tegraXYZ and allow
any other supplemental "compatibles"?

Best Regards,
Micha³ Miros³aw
