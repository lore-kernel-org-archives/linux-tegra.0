From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 14/14] MAINTAINERS: Add myself as Tegra PCIe maintainer
Date: Fri, 9 Aug 2013 08:56:00 -0600
Message-ID: <CAErSpo7ozQG7R4FLXM0jtGL8F=i80q4CpVcMnA5Qj=Y1t9N4kw@mail.gmail.com>
References: <1376059772-16669-1-git-send-email-treding@nvidia.com> <1376059772-16669-15-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1376059772-16669-15-git-send-email-treding@nvidia.com>
Sender: linux-pci-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Jason Cooper <jason@lakedaemon.net>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 9, 2013 at 8:49 AM, Thierry Reding <thierry.reding@gmail.com> wrote:
> I'll be taking on maintainership of the Tegra PCIe driver since it's now
> moved out of arch/arm/mach-tegra.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd1b287..26fc20a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6287,6 +6287,13 @@ F:       Documentation/PCI/
>  F:     drivers/pci/
>  F:     include/linux/pci*
>
> +PCI DRIVER FOR NVIDIA TEGRA
> +M:     Thierry Reding <thierry.reding@gmail.com>
> +L:     linux-tegra@vger.kernel.org
> +S:     Supported
> +F:     Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
> +F:     drivers/pci/host/pci-tegra.c
> +
>  PCMCIA SUBSYSTEM
>  P:     Linux PCMCIA Team
>  L:     linux-pcmcia@lists.infradead.org
> --
> 1.8.3.4
>
