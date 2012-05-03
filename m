From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv3 3/4] iommu/tegra: smmu: Refrain from accessing to AHB
Date: Thu, 3 May 2012 19:54:31 +0200
Message-ID: <20120503.205431.1876975023371235981.hdoyu@nvidia.com>
References: <1336061147-10245-1-git-send-email-hdoyu@nvidia.com><1336061147-10245-3-git-send-email-hdoyu@nvidia.com><4FA2C4E9.2080509@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FA2C4E9.2080509-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "joerg.roedel-5C7GfCeVMHo@public.gmane.org" <joerg.roedel-5C7GfCeVMHo@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv3 3/4] iommu/tegra: smmu: Refrain from accessing to AHB
Date: Thu, 3 May 2012 19:48:25 +0200
Message-ID: <4FA2C4E9.2080509-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

> On 05/03/2012 10:05 AM, Hiroshi DOYU wrote:
> > Use "tegra_ahb_enable_smmu()" to inform AHB that SMMU is
> > ready, instead of directly aceessing AHB registers.
> 
> You need to make the Kconfig option for the SMMU either depend on or
> select the TEGRA_AHB option. If you don't, then if someone disables the
> AHB driver, the SMMU driver may still build, yet fail to link since the
> AHB API it calls doesn't exist.
> 
> > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> 
> > @@ -398,10 +388,8 @@ static void smmu_setup_regs(struct smmu_device *smmu)
> >  
> >  	smmu_flush_regs(smmu, 1);
> >  
> > -	val = ahb_read(smmu, AHB_XBAR_CTRL);
> > -	val |= AHB_XBAR_CTRL_SMMU_INIT_DONE_DONE <<
> > -		AHB_XBAR_CTRL_SMMU_INIT_DONE_SHIFT;
> > -	ahb_write(smmu, val, AHB_XBAR_CTRL);
> > +	err = tegra_ahb_enable_smmu(smmu->ahb);
> > +	return err;
> 
> You can just "return tegra_ahb_..." here.
> 
> > @@ -911,14 +899,16 @@ static int tegra_smmu_probe(struct platform_device *pdev)
> 
> > +	smmu->ahb = of_parse_phandle(pdev->dev.of_node, "ahb", 0);
> 
> Hmm, "ahb" should probably be "nvidia,ahb".
> 
> I see that neither this patch nor the next patch include binding
> documentation that describe this property. Can you please add documentation.

There will be the tegra Memory Controller(MC) patches following, which
will change the way DT is passed, where SMMU/dt is passed from
MC.

Can we wait for the following MC patches, not haveing doc for this
patch?
