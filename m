From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] pci: tegra: actually program REFCLK_CFG* on recent SoCs
Date: Sat, 25 Jun 2016 20:54:02 -0600
Message-ID: <CAPnjgZ05T4+wEH4WwP4c_QWjwFvU6=3j4d+GnzqvpwJ3o5R3Bw@mail.gmail.com>
References: <20160624143703.13231-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160624143703.13231-1-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, lak <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 24 June 2016 at 08:37, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> On recent SoCs, tegra_pcie_phy_enable() isn't called; but instead
> tegra_pcie_enable_controller() calls tegra_xusb_phy_enable(). However,
> part of tegra_pcie_phy_enable() needs to happen in all cases. Move that
> code to tegra_pcie_port_enable() instead.
>
> For reference, NVIDIA's downstream Linux kernel performs this operation
> in tegra_pcie_enable_rp_features(), which is called immediately after
> tegra_pcie_port_enable(). Since that function doesn't exist in the mainline
> driver, we'll just add it to the tail of tegra_pcie_port_enable() instead.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pci/host/pci-tegra.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
