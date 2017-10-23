From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 0/7] Tegra PCIe end point config space map code refactoring
Date: Mon, 23 Oct 2017 10:10:39 -0500
Message-ID: <CAL_Jsq+3UAwk5gNgh=s6O1f-MadyGCtADX7pyzX8eUfBqboRfA@mail.gmail.com>
References: <1508769312-12465-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508769312-12465-1-git-send-email-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 23, 2017 at 9:35 AM, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> PCIe host controller in Tegra SoCs has 1GB of aperture available
> for mapping end points config space, IO and BARs. In that, currently
> 256MB is being reserved for mapping end points configuration space
> which leaves less memory space available for mapping end points BARs
> on some of the platforms.
> This patch series attempts to use only 4K space from 1GB aperture to
> access end points configuration space.
>
> Currently, this change benefits T20 and T186 in saving (i.e. repurposed
> to use for BAR mapping) physical space as well as kernel virtual mapping space,
> it saves only kernel virtual address space in T30, T124, T132 and T210.
>
> NOTE: Both driver and DT changes are inter-dependent and hence need to go together

You are breaking compatibility with any other OS.

Can't this easily be solved within the kernel by adjusting the
resource size? To save the virtual space, you only need patch 1 and
don't need the DT change. The DT change is just for phys address space
for BARs.

>
> Testing Done on T124, T210 & T186:
>  Enumeration and basic functionality of immediate devices
>  Enumeration of devices behind a PCIe switch
>  Complete 4K configuration space access
>
> Vidya Sagar (7):
>   PCI: tegra: refactor config space mapping code
>   ARM: tegra: limit PCIe config space mapping to 4K for T20
>   ARM: tegra: limit PCIe config space mapping to 4K for T30
>   ARM: tegra: limit PCIe config space mapping to 4K for T124
>   ARM64: tegra: limit PCIe config space mapping to 4K for T132
>   ARM64: tegra: limit PCIe config space mapping to 4K for T210
>   ARM64: tegra: limit PCIe config space mapping to 4K for T186
>
>  arch/arm/boot/dts/tegra124.dtsi          |   2 +-
>  arch/arm/boot/dts/tegra20.dtsi           |   8 +--
>  arch/arm/boot/dts/tegra30.dtsi           |   2 +-
>  arch/arm64/boot/dts/nvidia/tegra132.dtsi |   2 +-
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi |   8 +--
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi |   2 +-
>  drivers/pci/host/pci-tegra.c             | 109 +++++++++----------------------
>  7 files changed, 42 insertions(+), 91 deletions(-)
>
> --
> 2.7.4
>
