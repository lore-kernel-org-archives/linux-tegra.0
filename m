From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [PATCHv3 2/4] ARM: tegra: Add SMMU enabler in AHB
Date: Thu, 26 Apr 2012 08:37:16 +0300
Message-ID: <20120426083716.69efa6f5b58200e265b2e867@nvidia.com>
References: <1335352072-4001-1-git-send-email-hdoyu@nvidia.com>
 <1335352072-4001-2-git-send-email-hdoyu@nvidia.com>
 <20120425112950.GC3564@arwen.pp.htv.fi>
 <4F981D96.3000401@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F981D96.3000401@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "balbi@ti.com" <balbi@ti.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Russell King <linux@arm.linux.org.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, Tony Lindgren <tony@atomide.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jamie Iles <jamie@jamieiles.com>, Olof Johansson <olof@lixom.net>, Rob Herring <rob.herring@calxeda.com>, Colin Cross <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 25 Apr 2012 17:51:50 +0200
Stephen Warren <swarren@wwwdotorg.org> wrote:

> On 04/25/2012 05:29 AM, Felipe Balbi wrote:
> > Hi,
> > 
> > On Wed, Apr 25, 2012 at 02:07:37PM +0300, Hiroshi DOYU wrote:
> >> Add extern func, "tegra_ahb_enable_smmu()" to inform AHB that SMMU is
> >> ready.
> 
> >> +#ifdef CONFIG_ARCH_TEGRA_3x_SOC
> >> +static int __tegra_ahb_enable_smmu(struct device *dev, void *data)
> >> +{
> >> +	u32 val;
> >> +	struct tegra_ahb *ahb = dev_get_drvdata(dev);
> >> +
> >> +	val = gizmo_readl(ahb, AHB_ARBITRATION_XBAR_CTRL);
> >> +	val |= AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE;
> >> +	gizmo_writel(ahb, val, AHB_ARBITRATION_XBAR_CTRL);
> >> +	return 0;
> >> +}
> >> +
> >> +int tegra_ahb_enable_smmu(void)
> >> +{
> >> +	return driver_for_each_device(&tegra_ahb_driver.driver, NULL, NULL,
> >> +				      __tegra_ahb_enable_smmu);
> >> +}
> >> +EXPORT_SYMBOL(tegra_ahb_enable_smmu);
> >> +#endif
> > 
> > this is still not correct. If you will always call this whenever you run
> > on tegra 3, why do you even expose this function ?
> 
> I think the issue is that this function should only be called after the
> SMMU driver has initialized the SMMU, and it's ready to be activated.

Right. "tegra_ahb_enable_smmu()" is not supposed to be called at
tegra_ahb_probe(), but it is always expected to be called after SMMU
is initialized/gets ready.

The sequence is:
 1, AHB is probed.
 ...<any other operations>...
 2, SMMU is probed.
 ...<any other operations>...
 3, SMMU is ready, then,
 4, SMMU lets AHB know that SMMU is ready to be used by AHB clients.

The above step 4 is "tegra_ahb_enable_smmu()".
