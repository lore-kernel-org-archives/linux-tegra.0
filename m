From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 10/16] dt-bindings: PCI: tegra: Add device tree support
 for T194
Date: Mon, 13 May 2019 10:20:50 -0500
Message-ID: <CAL_JsqLEw+HAeqd2TD33cSVBjwDUNMb5amk2wGsW9m_4Z6CucQ@mail.gmail.com>
References: <20190424052004.6270-1-vidyas@nvidia.com> <20190424052004.6270-11-vidyas@nvidia.com>
 <20190426154306.GA16455@bogus> <504abd8f-9eb3-1089-953c-a6372c34b346@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <504abd8f-9eb3-1089-953c-a6372c34b346@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jingoo Han <jingoohan1@gmail.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Mikko Perttunen <mperttunen@nvidia.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, kthota@nvidia.com, Manikanta Maddireddy <mmaddireddy@nvidia.com>, sagar
List-Id: linux-tegra@vger.kernel.org

On Tue, May 7, 2019 at 4:20 AM Vidya Sagar <vidyas@nvidia.com> wrote:
>
> On 4/26/2019 9:13 PM, Rob Herring wrote:
> > On Wed, Apr 24, 2019 at 10:49:58AM +0530, Vidya Sagar wrote:
> >> Add support for Tegra194 PCIe controllers. These controllers are based
> >> on Synopsys DesignWare core IP.
> >>
> >> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> >> ---

> >> +- nvidia,bpmp: Must contain a phandle to BPMP controller node.
> >> +- nvidia,controller-id : Controller specific ID
> >> +    0: C0
> >> +    1: C1
> >> +    2: C2
> >> +    3: C3
> >> +    4: C4
> >> +    5: C5
> >
> > We don't normal put device indexes into DT. Why do you need this.
> > Perhaps for accessing the BPMP? If so, make nvidia,bpmp a phandle+cell.
> BPMP needs to know the controller number to enable it hence it needs to be
> passed to BPMP. Just for accessing BPMP, I already added 'nvidia,bpmp' property.

Then make nvidia,bpmp take the phandle and this number.


> >> +- nvidia,disable-aspm-states: Controls advertisement of ASPM states
> >> +    bit-0 to '1': Disables advertisement of ASPM-L0s
> >> +    bit-1 to '1': Disables advertisement of ASPM-L1. This also disables
> >> +                   advertisement of ASPM-L1.1 and ASPM-L1.2
> >> +    bit-2 to '1': Disables advertisement of ASPM-L1.1
> >> +    bit-3 to '1': Disables advertisement of ASPM-L1.2
> >
> > Can't this cover what 'supports-clkreq' does?
> Well, they are related partially. i.e. if a platform doesn't have 'supports-clkreq' set,
> then, by definition, it can't advertise support for ASPM L1.1 and L1.2 states. But, ASPM-L0s
> and ASPM-L1 states don't depend on 'supports-clkreq' property.
> Having this property gives more granularity as to support for which particular ASPM state
> shouldn't be advertised by the root port.

Okay, then it should be a common property then.

Rob
