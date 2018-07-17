From: Aapo Vienamo <avienamo@nvidia.com>
Subject: Re: [PATCH v3 5/7] dt-bindings: Add Tegra PMC pad configuration
 bindings
Date: Tue, 17 Jul 2018 18:30:20 +0300
Message-ID: <20180717183020.5ab9bfa6@dhcp-10-21-25-168>
References: <1531396813-6581-1-git-send-email-avienamo@nvidia.com>
        <1531396813-6581-6-git-send-email-avienamo@nvidia.com>
        <20180716154309.GA16477@rob-hp-laptop>
        <20180717152318.3608e3f9@dhcp-10-21-25-168>
        <CAL_JsqL1F0RF_6=ho0pa7Uh4AUsyvFRDGM50gN4=6_+MwBfGYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL1F0RF_6=ho0pa7Uh4AUsyvFRDGM50gN4=6_+MwBfGYQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 17 Jul 2018 08:22:07 -0600
Rob Herring <robh@kernel.org> wrote:

> On Tue, Jul 17, 2018 at 6:23 AM Aapo Vienamo <avienamo@nvidia.com> wrote:
> >
> > On Mon, 16 Jul 2018 09:43:09 -0600
> > Rob Herring <robh@kernel.org> wrote:
> >  
> > > On Thu, Jul 12, 2018 at 03:00:11PM +0300, Aapo Vienamo wrote:  
> > > > Document the pinctrl bindings used by the PMC driver for performing pad
> > > > configuration. Both nvidia,tegra186-pmc.txt and nvidia,tegra20-pmc.txt
> > > > are modified as they both cover SoC generations for which these bindings
> > > > apply.
> > > >
> > > > Add a header defining Tegra PMC pad voltage configurations.
> > > >
> > > > Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
> > > > Acked-by: Jon Hunter <jonathanh@nvidia.com>
> > > > ---
> > > >  .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     | 84 +++++++++++++++++++
> > > >  .../bindings/arm/tegra/nvidia,tegra20-pmc.txt      | 95 ++++++++++++++++++++++
> > > >  include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h | 18 ++++
> > > >  3 files changed, 197 insertions(+)
> > > >  create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra-io-pad.h
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
> > > > index 5a3bf7c..9528f41 100644
> > > > --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
> > > > +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
> > > > @@ -34,3 +34,87 @@ Board DTS:
> > > >     pmc@c360000 {
> > > >             nvidia,invert-interrupt;
> > > >     };
> > > > +
> > > > +== Pad Control Nodes ==
> > > > +
> > > > +The PMC can be used to set pad power state and voltage configuration.
> > > > +The pad configuration is done via the pinctrl framework. The driver
> > > > +implements power-source, low-power-enable, and low-power-disable pinconf
> > > > +pin configuration node properties. Each pinctrl pin corresponds to a
> > > > +single Tegra PMC pad. Thus, in the following sections of this document
> > > > +pin refers to the pinctrl frameworks notion of a Tegra PMC pad.  
> > >
> > > "pinctrl framework" is Linux specific and doesn't belong in the binding.
> > > Neither does what a driver supports. Describe what the h/w supports.
> > >  
> > > > +
> > > > +The pad configuration state nodes are placed under the pmc node and they
> > > > +are referred to by the pinctrl client device properties. For more  
> > >
> > > Another driver detail not relevant.
> > >  
> > > > +information see the examples presented later and  
> > >
> > > examples don't document bindings. The documentation should be complete
> > > without examples.
> > >  
> > > > +Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt.
> > > > +
> > > > +The values accepted by power-source property are
> > > > +TEGRA_IO_PAD_VOLTAGE_1V8 and TEGRA_IO_PAD_VOLTAGE_3V3, which are defined
> > > > +in dt-bindings/pinctrl/pinctrl-tegra-io-pad.h.  
> > >
> > > You need to list out what properties the child nodes can have.
> > >
> > > power-source needs a vendor prefix.  
> >
> > Isn't it a generic pinctrl property?  
> 
> I don't know offhand. Doesn't look like it if you have custom values.

It's listed under "Supported generic properties" in
pinctrl-bindings.txt. The convention seems to be not to add a vendor
prefix even though such custom macro values are used. The property is
currently used by qcom,pmic-gpio, qcom,pmic-mpp, and renesas,pfc-pinctrl.
I could not find a bindings document describing it with a vendor prefix.

 -Aapo
