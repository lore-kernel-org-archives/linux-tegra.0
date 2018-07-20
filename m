From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] memory: tegra: Don't invoke Tegra30+ specific memory timing setup on Tegra20
Date: Fri, 20 Jul 2018 19:42:46 +0300
Message-ID: <33306633.pSjtQhAtFJ@dimapc>
References: <20180719132453.16860-1-digetx@gmail.com> <31916977.CHrX6e343J@dimapc> <b0403eb2-2494-1924-dbe6-7a6019b6364d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b0403eb2-2494-1924-dbe6-7a6019b6364d@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Friday, 20 July 2018 11:02:04 MSK Jon Hunter wrote:
> On 19/07/18 16:38, Dmitry Osipenko wrote:
> > On Thursday, 19 July 2018 18:30:48 MSK Jon Hunter wrote:
> >> On 19/07/18 14:24, Dmitry Osipenko wrote:
> >>> This fixes irrelevant "tegra-mc 7000f000.memory-controller: no memory
> >>> timings for RAM code 0 registered" warning message during of kernels
> >>> boot-up on Tegra20.
> >> 
> >> Looking at the tegra20-emc.txt bindings doc [0], the 'nvidia,ram-code'
> >> property is also valid for Tegra20. In fact, I see this warning on the
> >> Tegra30 Cardhu because this property is not populated. So I think that
> >> this warning is valid and harmless.
> >> 
> >> Cheers
> >> Jon
> >> 
> >> [0] Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt
> > 
> > That is the irrelevant binding, the relevant one for this driver is [0].
> > The warning is valid for T30+, but not for T20.
> > 
> > [0]
> > Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.tx
> > t
> Yes indeed, looks like we never supported this for Tegra20. OK, fine with me
> I guess this was introduced during the consolidation of the MC drivers. Can
> you add the appropriate fixes tag?
> 

Sure, I can send v2 over next week.
