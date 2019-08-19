From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2] iommu/arm-smmu: Break insecure users by disabling
 bypass by default
Date: Mon, 19 Aug 2019 13:09:18 +0100
Message-ID: <20190819120917.hysyc6l3ckkwcx25@willie-the-truck>
References: <20190301192017.39770-1-dianders@chromium.org>
 <20190404145957.GA25912@fuggles.cambridge.arm.com>
 <4754bcf1-6423-f1fe-64d4-da4a35b164ad@free.fr>
 <20190424115231.GA14829@fuggles.cambridge.arm.com>
 <20190502105912.GA943@ulmo>
 <20190502110821.GD30966@fuggles.cambridge.arm.com>
 <20190502124525.GA3579@ulmo>
 <94cf6d56-5dcb-051a-06da-5edfacde1655@arm.com>
 <20190819112856.GA28102@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190819112856.GA28102@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>, Douglas Anderson <dianders@chromium.org>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 19, 2019 at 01:28:56PM +0200, Thierry Reding wrote:
> Perhaps an alternative would be to add a property to the SMMU node that
> lists a set of stream IDs for which to enable bypass by default. We
> could let the firmware set that when the display hardware has been set
> up. That way when the kernel boots we can keep scanning from the
> reserved memory and the ARM SMMU driver would not disable bypass for the
> display hardware. Only when the display hardware is actually attached to
> the IOMMU domain, and the 1:1 mappings have been created would bypass be
> disabled, and at that point there should be no SMMU faults anymore, so
> we have cleanly transitioned to the kernel.
> 
> Any thoughts?

There is currently an extension to IORT under discussion which should
address this problem, so it would make a lot of sense for the DT solution
to follow the same approach. I think it will end up being along the lines
that you suggest, although we won't just enable bypass because that leaves
memory wide open if the device driver doesn't probe and it also creates
an issue because device attach typically happens before the endpoint
driver has probed.

So the flow would look something like:

	- Firmware describes a physical region of memory which must be
	  reserved by the OS.

	- Additionally, firmware describes a master -> reserved memory
	  linkage as part of the IOMMU description.

	- When the IOMMU probes, these reserved memory regions will be
	  mapped 1:1 for the relevant master.

This is similar to RMRR on x86, except that the mappings are intended to
be less rigid and can be torn down if the endpoint driver decides to do
that or for things like device passthrough.

If we get that working, we should update our booting.txt so that DMA is
allowed during boot in the limited cases which this covers.

Will
