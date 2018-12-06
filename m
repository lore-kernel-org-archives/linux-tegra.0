From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 30/34] dt-bindings: arm: Convert Tegra board/soc
 bindings to json-schema
Date: Thu, 6 Dec 2018 16:38:44 -0600
Message-ID: <CAL_Jsq+NWVoFzBCYVwu-YM_90mYUdgmaW4ctJim2LkxfpRbg=Q@mail.gmail.com>
References: <20181203213223.16986-1-robh@kernel.org> <20181203213223.16986-31-robh@kernel.org>
 <20181204085022.GB25962@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204085022.GB25962@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, ARM-SoC Maintainers <arm@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 4, 2018 at 2:50 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Dec 03, 2018 at 03:32:19PM -0600, Rob Herring wrote:
> > Convert Tegra SoC bindings to DT schema format using json-schema.
> >
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-tegra@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/arm/tegra.txt         |  65 -----------
> >  .../devicetree/bindings/arm/tegra.yaml        | 101 ++++++++++++++++++
> >  2 files changed, 101 insertions(+), 65 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/tegra.txt
> >  create mode 100644 Documentation/devicetree/bindings/arm/tegra.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/tegra.txt b/Documentation/devicetree/bindings/arm/tegra.txt
> > deleted file mode 100644
> > index c59b15f64346..000000000000
> > --- a/Documentation/devicetree/bindings/arm/tegra.txt
> > +++ /dev/null
> > @@ -1,65 +0,0 @@
> > -NVIDIA Tegra device tree bindings
> > --------------------------------------------
> > -
> > -SoCs
> > --------------------------------------------
> > -
> > -Each device tree must specify which Tegra SoC it uses, using one of the
> > -following compatible values:
> > -
> > -  nvidia,tegra20
> > -  nvidia,tegra30
> > -  nvidia,tegra114
> > -  nvidia,tegra124
> > -  nvidia,tegra132
> > -  nvidia,tegra210
> > -  nvidia,tegra186
> > -  nvidia,tegra194
> > -
> > -Boards
> > --------------------------------------------
> > -
> > -Each device tree must specify which one or more of the following
> > -board-specific compatible values:
> > -
> > -  ad,medcom-wide
> > -  ad,plutux
> > -  ad,tamonten
> > -  ad,tec
> > -  compal,paz00
> > -  compulab,trimslice
> > -  nvidia,beaver
> > -  nvidia,cardhu
> > -  nvidia,cardhu-a02
> > -  nvidia,cardhu-a04
> > -  nvidia,dalmore
> > -  nvidia,harmony
> > -  nvidia,jetson-tk1
> > -  nvidia,norrin
> > -  nvidia,p2371-0000
> > -  nvidia,p2371-2180
> > -  nvidia,p2571
> > -  nvidia,p2771-0000
> > -  nvidia,p2972-0000
> > -  nvidia,roth
> > -  nvidia,seaboard
> > -  nvidia,tn7
> > -  nvidia,ventana
> > -  toradex,apalis_t30
> > -  toradex,apalis_t30-eval
> > -  toradex,apalis_t30-v1.1
> > -  toradex,apalis_t30-v1.1-eval
> > -  toradex,apalis-tk1
> > -  toradex,apalis-tk1-eval
> > -  toradex,apalis-tk1-v1.2
> > -  toradex,apalis-tk1-v1.2-eval
> > -  toradex,colibri_t20
> > -  toradex,colibri_t20-eval-v3
> > -  toradex,colibri_t20-iris
> > -  toradex,colibri_t30
> > -  toradex,colibri_t30-eval-v3
> > -
> > -Trusted Foundations
> > --------------------------------------------
> > -Tegra supports the Trusted Foundation secure monitor. See the
> > -"tlm,trusted-foundations" binding's documentation for more details.
> > diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
> > new file mode 100644
> > index 000000000000..66493892ffc1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> > @@ -0,0 +1,101 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/tegra.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>
> Could you explain what these are? They give 404, so I assume they are
> more like placeholders and not actually used?

Please read the documentation in patch 2. They are used, but aren't live URLs.

> > +
> > +title: NVIDIA Tegra device tree bindings
> > +
> > +maintainers:
> > +  - Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > +  - Peter De Schrijver <pdeschrijver@nvidia.com>
>
> Not sure how you got that list, but probably from git history. I think
> it makes sense to replace Marcel and Peter with Jon and myself.

Will do.

> Other than that, looks fine to me. Some of the enumerations below look
> somewhat hard to parse, but I suspect that it will become second nature
> in no time.

We can add descriptions and/or comments if that helps. I didn't add
them if not already there.

> Acked-by: Thierry Reding <treding@nvidia.com>

Thanks.

Rob
