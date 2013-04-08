From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 3/3] ARM: dts: tegra: Add PCIe entry for cardhu
Date: Mon, 08 Apr 2013 12:32:29 -0600
Message-ID: <51630D3D.2040709@wwwdotorg.org>
References: <1365435688-4179-1-git-send-email-jagarwal@nvidia.com> <1365435688-4179-3-git-send-email-jagarwal@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1365435688-4179-3-git-send-email-jagarwal@nvidia.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jay Agarwal <jagarwal@nvidia.com>
Cc: linux@arm.linux.org.uk, thierry.reding@avionic-design.de, ldewangan@nvidia.com, bhelgaas@google.com, olof@lixom.net, hdoyu@nvidia.com, pgaikwad@nvidia.com, mturquette@linaro.org, pdeschrijver@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, jtukkinen@nvidia.com, kthota@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 04/08/2013 09:41 AM, Jay Agarwal wrote:
> Signed-off-by: Jay Agarwal <jagarwal@nvidia.com>
> 
> - Add PCIe node entry for cardhu
> - Enable only root port 2
> - Initialize regulators required for tegra30

Initialize isn't correct; this change makes no changes to any regulator;
it simply includes the required regulator properties in the new node.

I think you'd want to re-write this patch description as:

Enable the PCIe controller on Cardhu. Only port 2 is connected on this
board. It is connected to the Ethernet controller in the dock.

> diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi

> +	pcie-controller {
...
>  	serial@70006000 {

It lookos like this node is added in the wrong place. Nodes should be
sorted based on reg property, and judging by the reg property for this
node in tegra30.dtsi in Thierry's branch, this should be the first node
in the Cardhu file.
