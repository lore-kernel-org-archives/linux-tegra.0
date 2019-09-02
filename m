From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 2/6] dt-bindings: PCI: tegra: Add PCIe slot supplies
 regulator entries
Date: Mon, 02 Sep 2019 14:38:50 +0100
Message-ID: <5d6d1b6b.1c69fb81.37811.4cd5@mx.google.com>
References: <20190828172850.19871-1-vidyas@nvidia.com>
 <20190828172850.19871-3-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190828172850.19871-3-vidyas@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, mperttunen@nvidia.com, mmaddireddy@nvidia.com, kthota@nvidia.com, gustavo.pimentel@synopsys.com, vidyas@nvidia.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, linux-pci@vger.kernel.org, bhelgaas@google.com, andrew.murray@arm.com, digetx@gmail.com, kishon@ti.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Wed, 28 Aug 2019 22:58:46 +0530, Vidya Sagar wrote:
> Add optional bindings "vpcie3v3-supply" and "vpcie12v-supply" to describe
> regulators of a PCIe slot's supplies 3.3V and 12V provided the platform
> is designed to have regulator controlled slot supplies.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V3:
> * None
> 
> V2:
> * None
> 
>  .../devicetree/bindings/pci/nvidia,tegra194-pcie.txt      | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
