From: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Date: Wed, 1 Jul 2020 11:54:54 +0100
Message-ID: <20200701105453.GG14959@willie-the-truck>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder>
 <20200514193249.GE279327@builder.lan>
 <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
 <20200527110343.GD11111@willie-the-truck>
 <20200602063210.GT11847@yoga>
 <a1f9ee83-66cd-1f04-3e78-3281b3cafd07@arm.com>
 <20200701074050.GO388985@builder.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200701074050.GO388985-Y7zrm0MriT3hXIiyNabO3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 01, 2020 at 12:40:50AM -0700, Bjorn Andersson wrote:
> On Wed 03 Jun 04:00 PDT 2020, Robin Murphy wrote:
> > at that point I'm inclined to suggest we give up and stop trying to
> > drive these things with arm-smmu. The XZR thing was bad enough, but if
> > they're not even going to pretend to implement the architecture correctly
> > then I'm not massively keen to continue tying the architectural driver in
> > further knots if innocent things like CONFIG_IOMMU_DEFAULT_PASSTHROUGH are
> > going to unexpectedly and catastrophically fail. We have qcom-iommu for
> > hypervisor-mediated SMMUs, and this new hypervisor behaviour sounds to me
> > more like "qcom-iommu++" with reassignable stream-to-context mappings,
> > rather than a proper Arm SMMU emulation.
> > 
> 
> I've been going through over and over, hoping to perhaps be able to
> evolve qcom_iommu into a qcom-iommu++, but afaict the new hypervisor is
> different enough that this isn't feasible. In particular, the platforms
> using qcom_iommu relies entirely on the hypervisor to configure stream
> mapping etc - and we can't even read most of the registers.
> 
> On the other hand I agree with you that we're messing around quite a bit
> with the arm-smmu driver, and I'm uncertain where we are on supporting
> the various GPU features, so I'm adding Jordan to the thread.
> 
> So, afaict we have the options of either shoehorning this too into the
> arm-smmu driver or we essentially fork arm-smmu.c to create a
> qcom-smmu.c.
> 
> While I don't fancy the code duplication, it would allow us to revert
> the Qualcomm quirks from arm-smmu and would unblock a number of
> activities that we have depending on getting the SMMU enabled on various
> platforms.

We added the impl hooks to cater for implementation differences, so I'd
still prefer to see this done as part of arm-smmu than introduce another
almost-the-same-but-not-quite IOMMU driver that has the lifetime of
a single SoC.

Will
