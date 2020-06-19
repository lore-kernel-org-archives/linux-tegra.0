From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 37/38] dt-bindings: pwm: Explicitly include pwm.yaml
Date: Fri, 19 Jun 2020 12:05:59 -0600
Message-ID: <CAL_JsqKMu3YypAo0NTPpLK+dwXQqn_tai-mpewRp=fWd-V3Jtw@mail.gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-38-thierry.reding@gmail.com> <20200618025140.GB3378010@bogus>
 <20200619074654.GD3704347@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200619074654.GD3704347@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 19, 2020 at 1:47 AM Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Wed, Jun 17, 2020 at 08:51:40PM -0600, Rob Herring wrote:
> > On Fri, Jun 12, 2020 at 04:19:02PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >
> > > For PWM controller device tree bindings, make sure that they include the
> > > pwm.yaml controller core bindings explicitly. This prevents the tooling
> > > from matching on the $nodename pattern, which can falsely match things
> > > like pinmux nodes, etc.
> >
> > My preference here is to clean-up the mess that is pinmux nodes.
>
> Any suggestions on how to do that? Do you just want to rename the
> problematic nodes? Or do you want to introduce a standard naming scheme?

.*-pins$ is what I've been using/proposing. Doing that also helps
writing pinctrl schemas.

> As an example, I was running into the issue with this node:
>
>         pinmux@70000014 {
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&state_default>;
>
>                 state_default: pinmux {
>                         ...
>
>                         pwm-a-b {
>                                 nvidia,pins = "sdc";
>                                 nvidia,function = "pwm";
>                                 nvidia,tristate = <TEGRA_PIN_ENABLE>;
>                         };
>
>                         ...
>                 };
>         };
>
> My first instinct was to just add some sort of prefix to this, but then
> I realized that might not be the best option because there could be
> countless other nodes whose names might start with "pwm-" but that had
> nothing to do with PWM controllers whatsoever.
>
> You could for example have some node named "pwm-fan" and then these
> standard bindings will require that to be have a #pwm-cells property.

Pretty sure we only allow pwm@.* or pwm-[0-9a-f]+, so this would not match.

Plus shouldn't it be just 'fan' to be what the class is, not how it is
implemented/controlled.

> So I think the solution of only explicitly "activating" PWM controller
> bindings would work well in this particular case because it would only
> apply the bindings where explicitly requested. That way it doesn't
> matter what nodes are named.
>
> > This has the side effect of no longer checking pwm nodes that didn't
> > have explicit schema. Perhaps that's of somewhat limited value.
>
> There are two easy solutions to this: 1) convert all PWM bindings to
> YAML so that they have an explicit schema or 2) consider the presence of
> the #pwm-cells property as a marker that the node represents a PWM
> controller/provider, irrespective of the name. The latter would be much
> like gpio-controller or interrupt-controller, though less redundant.

There's only 2 things we can generically check, #pwm-cells and the
node name. If we match on one, then we're really only checking the
other one. We could match on #pwm-cells presence and then check its
value is 2 or 3, but then we can do that without a select (i.e. always
apply the schema).

So I guess I'm convinced there's not much value here and we should
just do 1). Patches welcome. :) (BTW, I do think we should do some
mass conversions by class. That I think would be a bit more efficient
in both converting and reviewing. My calculation is something like 6
years to finish (3K bindings left and doing 100-150 a cycle).)

> We could even go as far as using #pwm-cells as the definitive marker and
> then require that it has a certain name, like we do for other types of
> nodes. I did a quick audit and came up with the following results. These
> are all the PWM controller nodes that I could find that don't follow the
> "^pwm(@.*)?$" pattern. The files are only one example of where I found
> them and there were often others that used the same pattern.
>
>  - arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi
>      - ec-pwm
>
>        It should be trivial to rename these to just "pwm" since I don't
>        see the cros-ec driver relying on the exact name.
>
>  - arch/arm/boot/dts/am5729-beagleboneai.dts
>      - stmpe_pwm
>
>        The stmpe MFD driver actually relies on this name, so not sure if
>        there's a lot we can do about that.

That's unfortunate...

The question is how do we allow this, but at the same time prevent more cases.

>  - arch/arm/boot/dts/armada-38x.dtsi
>      - gpio@...
>
>        This is both a GPIO and PWM controller, so can't really do much
>        about the name.

In general, we need some solution for the more than 1 function nodes.
Combo clock and reset controllers are a common one.

>  - arch/arm/boot/dts/at91-kizbox.dts
>      - pwm
>
>        Actually also matches the pattern because the '@.*' part is
>        optional.
>
>  - arch/arm/boot/dts/at91sam9n12.dtsi
>      - hlcdc-pwm
>
>        The MFD driver matches on the compatible string, so we should be
>        able to just rename this to "pwm".
>
>  - arch/arm/boot/dts/da850.dtsi
>     - ecap@...
>
>       No matching on the name as far as I can tell, so we should be able
>       to rename this 'pwm@...'.
>
>  - arch/arm/boot/dts/logicpd-torpedo-baseboard.dtsi
>     - dmtimer-pwm
>
>       Could probably be renamed 'pwm'.
>
>  - arch/arm/boot/dts/lpc32xx.dtsi
>     - mpwm@...
>
>       Could probably be renamed 'pwm'.
>
>  - arch/arm/boot/dts/motorola-mapphone-common.dtsi
>     - dmtimer-pwm-*
>
>       Maybe these should be renamed 'pwm@*' instead?
>
>  - arch/arm/boot/dts/s3c24xx.dtsi
>     - timer@...
>
>       This is a variant similar to dmtimer-pwm above and is driven by a
>       timer that can run in PWM mode. I think this is the same category
>       as the GPIO/PWM controller hybrid above.
>
>       Not much we can do about the name.
>
>  - arch/arm/boot/dts/stm32f429.dtsi
>     - pwm
>
>       Matches the pattern.
>
>  - arch/arm/boot/dts/twl4030.dtsi
>     - pwm
>
>       Matches the pattern.
>
>     - pwmled
>
>       Perhaps both of the above should be named 'pwm@*'? There doesn't
>       seem to be any matching on the name.
>
> For many of the above it should be possible to rename them. But then we
> will always have exceptions where we can't do that because then it might
> conflict with other bindings.
>
> Two interesting things I gathered from the above are that:
>
>   1) nothing in the above actually matches the pwm-* variant that's part
>      of the current pattern defined in pwm.yaml and which is causing the
>      problem for the pinmux nodes, so an easy solution would be to
>      simply drop that part of the pattern since it is useless anyway.
>
>   2) There are actually quite a few PWM controllers that currently are
>      not checked because of the name matching. Now I haven't actually
>      checked the reverse, i.e. to see if all nodes matching the pattern
>      actually have a #pwm-cells property, but given that we miss a
>      number of controller because they don't match the pattern makes me
>      think that that aspect isn't actually very helpful.
>
> All of the above makes me think even more that we should just abandon
> the idea of matching on the names for PWM controller because in some
> instances we can't change the name for backwards-compatibility or
> because the names would then conflict with other bindings.

Yes. :(

Maybe node name checks can be an optional thing to enable until we
come up with a more general way to opt-in/out of specific checks.

Rob
