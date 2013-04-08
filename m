From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/3] ARM: tegra: pcie: Add tegra3 support
Date: Mon, 08 Apr 2013 12:21:47 -0600
Message-ID: <51630ABB.1020200@wwwdotorg.org>
References: <1365435688-4179-1-git-send-email-jagarwal@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1365435688-4179-1-git-send-email-jagarwal@nvidia.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jay Agarwal <jagarwal@nvidia.com>
Cc: linux@arm.linux.org.uk, thierry.reding@avionic-design.de, ldewangan@nvidia.com, bhelgaas@google.com, olof@lixom.net, hdoyu@nvidia.com, pgaikwad@nvidia.com, mturquette@linaro.org, pdeschrijver@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, jtukkinen@nvidia.com, kthota@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 04/08/2013 09:41 AM, Jay Agarwal wrote:
> Signed-off-by: Jay Agarwal <jagarwal@nvidia.com>
> 
> - Enable pcie root port 2 for cardhu
> - Make private data structure for each SOC
> - Add required tegra3 clocks and regulators
> - Add tegra3 specific code in enable controller
> - Modify clock tree to get clocks based on device
> - Based on git://gitorious.org/thierryreding/linux.git

A couple more points on this patch:

* You didn't mention that this series is based on Thierry's
work-in-progress tree, and not something immediately destined for
upstream. As such, only Thierry is expected to actually apply any of
these patches.

* Your changes to the Tegra PCIe driver require that device tree include
extra clocks and regulators. You need to update
Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt to
describe these new requirements.
