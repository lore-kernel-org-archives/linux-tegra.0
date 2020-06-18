From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 06/38] dt-bindings: display: tegra: Document display-hub
Date: Thu, 18 Jun 2020 12:17:36 -0600
Message-ID: <CAL_JsqKgJa0iEfnJO9KfS=sB23bT0E0szB7SwShh2kxWEsxgdA@mail.gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-7-thierry.reding@gmail.com> <20200617225506.GC2975260@bogus>
 <20200618102736.GA3659851@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200618102736.GA3659851@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 18, 2020 at 4:27 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Wed, Jun 17, 2020 at 04:55:06PM -0600, Rob Herring wrote:
> > On Fri, Jun 12, 2020 at 04:18:31PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >
> > > Tegra186 and later have an additional component in the display pipeline
> > > called the display hub. Document the bindings which were missing.
> >
> > I'd rather this be after the conversion or I'm reviewing it twice.
>
> Okay, I'll reorder the patches accordingly.
>
> > >
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  .../display/tegra/nvidia,tegra20-host1x.txt   | 50 +++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> > > index 47319214b5f6..2cf3cc4893da 100644
> > > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> > > @@ -297,6 +297,56 @@ of the following host1x client modules:
> > >    - reset-names: Must include the following entries:
> > >      - vic
> > >
> > > +- display-hub: display controller hub
> > > +  Required properties:
> > > +  - compatible: "nvidia,tegra<chip>-display"
> > > +  - reg: Physical base address and length of the controller's registers.
> > > +  - interrupts: The interrupt outputs from the controller.
> > > +  - clocks: Must contain an entry for each entry in clock-names.
> > > +    See ../clocks/clock-bindings.txt for details.
> > > +  - clock-names: Must include the following entries:
> > > +    - disp
> > > +    - dsc
> > > +    - hub
> > > +  - resets: Must contain an entry for each entry in reset-names.
> > > +    See ../reset/reset.txt for details.
> > > +  - reset-names: Must include the following entries:
> > > +    - misc
> > > +    - wgrp0
> > > +    - wgrp1
> > > +    - wgrp2
> > > +    - wgrp3
> > > +    - wgrp4
> > > +    - wgrp5
> > > +  - power-domains: A list of phandle and specifiers identifying the power
> > > +    domains that the display hub is part of.
> > > +  - ranges: Range of registers used for the display controllers.
> > > +
> > > +  Each subnode of the display hub represents one of the display controllers
> > > +  available:
> > > +
> > > +  - display: display controller
> > > +    - compatible: "nvidia,tegra<chip>-dc"
> > > +    - reg: Physical base address and length of the controller's registers.
> > > +    - interrupts: The interrupt outputs from the controller.
> > > +    - clocks: Must contain an entry for each entry in clock-names.
> > > +      See ../clocks/clock-bindings.txt for details.
> > > +    - clock-names: Must include the following entries:
> > > +      - dc
> > > +    - resets: Must contain an entry for each entry in reset-names.
> > > +      See ../reset/reset.txt for details.
> > > +    - reset-names: Must include the following entries:
> > > +      - dc
> > > +    - power-domains: A list of phandle and specifiers that identify the power
> > > +      domains that this display controller is part of.
> > > +    - iommus: A phandle and specifier identifying the SMMU master interface of
> > > +      this display controller.
> > > +    - nvidia,outputs: A list of phandles of outputs that this display
> > > +      controller can drive.
> >
> > Seems like an OF graph should describe this?
>
> The above documents the current state of affairs. I don't recall exactly
> why we never merged the bindings, but we've been using this
> nvidia,outputs property for almost three years now. Changing this would
> break ABI, although I guess you could say that since this was never
> documented it can't be ABI. Still, changing this is going to cause old
> device trees to fail with new kernels. Unless of course if we add some
> backwards-compatibility mechanism in the driver. But in that case, what
> exactly do we gain by switching to an OF graph?

Probably nothing at this point. More I was just curious how we ended
up with something different.

> Historically, I think nvidia,outputs was introduced before OF graphs
> were "a thing", at least in DRM. According to the git log, the helpers
> for graphs were introduced a couple of years before nvidia,outputs was
> used, but I guess they must not have been widespread enough for me to
> have been aware of them.

There was a period display subsystem bindings were pretty much un-reviewed...

> Anyway, irrespective of the compatibility issues, I tried to use an OF
> graph to describe this and here's what I came up with:
>
> --- >8 ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 170 ++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/tegra/dc.c               |  15 +--
>  drivers/gpu/drm/tegra/dc.h               |   1 -
>  drivers/gpu/drm/tegra/output.c           |  12 +--
>  4 files changed, 172 insertions(+), 26 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> index 58100fb9cd8b..a3dcf2437976 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
> @@ -994,8 +994,38 @@ display@15200000 {
>                                 power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
>                                 iommus = <&smmu TEGRA186_SID_NVDISPLAY>;
>
> -                               nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
>                                 nvidia,head = <0>;
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       dc0_out: port@0 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <0>;
> +
> +                                               dc0_out_dsia: endpoint@0 {
> +                                                       reg = <0>;
> +                                                       remote-endpoint = <&dsia_in_dc0>;
> +                                               };
> +
> +                                               dc0_out_dsib: endpoint@1 {
> +                                                       reg = <1>;
> +                                                       remote-endpoint = <&dsib_in_dc0>;
> +                                               };
> +
> +                                               dc0_out_sor0: endpoint@2 {
> +                                                       reg = <2>;
> +                                                       remote-endpoint = <&sor0_in_dc0>;
> +                                               };
> +
> +                                               dc0_out_sor1: endpoint@3 {
> +                                                       reg = <3>;
> +                                                       remote-endpoint = <&sor1_in_dc0>;
> +                                               };
> +                                       };
> +                               };
>                         };
>
>                         display@15210000 {
> @@ -1010,8 +1040,38 @@ display@15210000 {
>                                 power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISPB>;
>                                 iommus = <&smmu TEGRA186_SID_NVDISPLAY>;
>
> -                               nvidia,outputs = <&dsia &dsib &sor0 &sor1>;
>                                 nvidia,head = <1>;
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       dc1_out: port@0 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <0>;
> +
> +                                               dc1_out_dsia: endpoint@0 {
> +                                                       reg = <0>;
> +                                                       remote-endpoint = <&dsia_in_dc1>;
> +                                               };
> +
> +                                               dc1_out_dsib: endpoint@1 {
> +                                                       reg = <1>;
> +                                                       remote-endpoint = <&dsib_in_dc1>;
> +                                               };
> +
> +                                               dc1_out_sor0: endpoint@2 {
> +                                                       reg = <2>;
> +                                                       remote-endpoint = <&sor0_in_dc1>;
> +                                               };
> +
> +                                               dc1_out_sor1: endpoint@3 {
> +                                                       reg = <3>;
> +                                                       remote-endpoint = <&sor1_in_dc1>;
> +                                               };
> +                                       };
> +                               };
>                         };
>
>                         display@15220000 {
> @@ -1026,8 +1086,28 @@ display@15220000 {
>                                 power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISPC>;
>                                 iommus = <&smmu TEGRA186_SID_NVDISPLAY>;
>
> -                               nvidia,outputs = <&sor0 &sor1>;
>                                 nvidia,head = <2>;
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       dc2_out: port@0 {
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +                                               reg = <0>;
> +
> +                                               dc2_out_sor0: endpoint@0 {
> +                                                       reg = <0>;
> +                                                       remote-endpoint = <&sor0_in_dc2>;
> +                                               };
> +
> +                                               dc2_out_sor1: endpoint@1 {
> +                                                       reg = <1>;
> +                                                       remote-endpoint = <&sor1_in_dc2>;
> +                                               };
> +                                       };
> +                               };
>                         };
>                 };
>
> @@ -1044,6 +1124,25 @@ dsia: dsi@15300000 {
>                         status = "disabled";
>
>                         power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               dsia_in: port@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +
> +                                       dsia_in_dc0: endpoint@0 {
> +                                               remote-endpoint = <&dc0_out_dsia>;
> +                                       };
> +
> +                                       dsia_in_dc1: endpoint@1 {
> +                                               remote-endpoint = <&dc1_out_dsia>;
> +                                       };
> +                               };
> +                       };
>                 };
>
>                 vic@15340000 {
> @@ -1072,6 +1171,25 @@ dsib: dsi@15400000 {
>                         status = "disabled";
>
>                         power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               dsib_in: port@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +
> +                                       dsib_in_dc0: endpoint@0 {
> +                                               remote-endpoint = <&dc0_out_dsib>;
> +                                       };
> +
> +                                       dsib_in_dc1: endpoint@1 {
> +                                               remote-endpoint = <&dc1_out_dsib>;
> +                                       };
> +                               };
> +                       };
>                 };
>
>                 sor0: sor@15540000 {
> @@ -1096,6 +1214,29 @@ sor0: sor@15540000 {
>
>                         power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
>                         nvidia,interface = <0>;
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               sor0_in: port@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +
> +                                       sor0_in_dc0: endpoint@0 {
> +                                               remote-endpoint = <&dc0_out_sor0>;
> +                                       };
> +
> +                                       sor0_in_dc1: endpoint@1 {
> +                                               remote-endpoint = <&dc1_out_sor0>;
> +                                       };
> +
> +                                       sor0_in_dc2: endpoint@2 {
> +                                               remote-endpoint = <&dc2_out_sor0>;
> +                                       };
> +                               };
> +                       };
>                 };
>
>                 sor1: sor@15580000 {
> @@ -1120,6 +1261,29 @@ sor1: sor@15580000 {
>
>                         power-domains = <&bpmp TEGRA186_POWER_DOMAIN_DISP>;
>                         nvidia,interface = <1>;
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               sor1_in: port@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +
> +                                       sor1_in_dc0: endpoint@0 {
> +                                               remote-endpoint = <&dc0_out_sor1>;
> +                                       };
> +
> +                                       sor1_in_dc1: endpoint@1 {
> +                                               remote-endpoint = <&dc1_out_sor1>;
> +                                       };
> +
> +                                       sor1_in_dc2: endpoint@2 {
> +                                               remote-endpoint = <&dc2_out_sor1>;
> +                                       };
> +                               };
> +                       };
>                 };
>
>                 dpaux: dpaux@155c0000 {
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 04d6848d19fc..4adb64c083c8 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -10,6 +10,7 @@
>  #include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/of_graph.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>
> @@ -86,19 +87,6 @@ static inline void tegra_plane_writel(struct tegra_plane *plane, u32 value,
>         tegra_dc_writel(plane->dc, value, tegra_plane_offset(plane, offset));
>  }
>
> -bool tegra_dc_has_output(struct tegra_dc *dc, struct device *dev)
> -{
> -       struct device_node *np = dc->dev->of_node;
> -       struct of_phandle_iterator it;
> -       int err;
> -
> -       of_for_each_phandle(&it, err, np, "nvidia,outputs", NULL, 0)
> -               if (it.node == dev->of_node)
> -                       return true;
> -
> -       return false;
> -}
> -
>  /*
>   * Double-buffered registers have two copies: ASSEMBLY and ACTIVE. When the
>   * *_ACT_REQ bits are set the ASSEMBLY copy is latched into the ACTIVE copy.
> @@ -2061,6 +2049,7 @@ static int tegra_dc_init(struct host1x_client *client)
>         if (err < 0)
>                 goto cleanup;
>
> +       dc->base.port = of_graph_get_port_by_id(dc->dev->of_node, 0);
>         drm_crtc_helper_add(&dc->base, &tegra_crtc_helper_funcs);
>
>         /*
> diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> index 3d8ddccd758f..9e4ae77e6270 100644
> --- a/drivers/gpu/drm/tegra/dc.h
> +++ b/drivers/gpu/drm/tegra/dc.h
> @@ -144,7 +144,6 @@ struct tegra_dc_window {
>  };
>
>  /* from dc.c */
> -bool tegra_dc_has_output(struct tegra_dc *dc, struct device *dev);
>  void tegra_dc_commit(struct tegra_dc *dc);
>  int tegra_dc_state_setup_clock(struct tegra_dc *dc,
>                                struct drm_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
> index e36e5e7c2f69..b09935cdf397 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -5,6 +5,7 @@
>   */
>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_simple_kms_helper.h>
>
> @@ -229,16 +230,9 @@ void tegra_output_find_possible_crtcs(struct tegra_output *output,
>                                       struct drm_device *drm)
>  {
>         struct device *dev = output->dev;
> -       struct drm_crtc *crtc;
> -       unsigned int mask = 0;
> -
> -       drm_for_each_crtc(crtc, drm) {
> -               struct tegra_dc *dc = to_tegra_dc(crtc);
> -
> -               if (tegra_dc_has_output(dc, dev))
> -                       mask |= drm_crtc_mask(crtc);
> -       }
> +       u32 mask;
>
> +       mask = drm_of_find_possible_crtcs(drm, dev->of_node);
>         if (mask == 0) {
>                 dev_warn(dev, "missing output definition for heads in DT\n");
>                 mask = 0x3;
> --- >8 ---
>
> I do see the benefit of using standard bindings where available, but in
> this case I think that's hardly an improvement over the current binding,
> even though it's undocumented.
>
> > > +    - nvidia,head: The number of the display controller head. This is used to
> > > +      setup the various types of output to receive video data from the given
> > > +      head.
> >
> > Not really clear what this is...
>
> This is the same as for the display controller in older Tegra devices.
> The value is the index of the display controller head, or the instance
> number of the IP, if that's any clearer. We need this in some places
> for register programming. We can't always safely derive it in some
> other way.

Index, humm. I'll pretend I didn't ask...

Rob
