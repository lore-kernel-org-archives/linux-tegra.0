From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dmaengine: tegra210-adma: Add memcpy support
Date: Wed, 14 Sep 2016 19:08:55 +0530
Message-ID: <20160914133855.GJ13920@localhost>
References: <cover.1473186743.git.nicoleotsuka@gmail.com>
 <c730136b708404e1257eb28bb1dc2cbf13bf6023.1473186743.git.nicoleotsuka@gmail.com>
 <bafb9b89-2b45-c419-62d4-b25a50f8d6be@nvidia.com>
 <37d4645c-6318-78bd-79bb-844fb6764a1b@nvidia.com>
 <20160908173141.GA28381@Asurada-Nvidia>
 <c6da41de-ca1d-c9ce-23df-f820994a49bb@nvidia.com>
 <20160912205017.GA12187@Asurada-Nvidia>
 <0a0d5875-eb10-d98b-c26b-52fcb13b2be0@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0a0d5875-eb10-d98b-c26b-52fcb13b2be0-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 13, 2016 at 09:52:43AM +0100, Jon Hunter wrote:
> 
> On 12/09/16 21:50, Nicolin Chen wrote:
> > On Mon, Sep 12, 2016 at 03:34:08PM +0100, Jon Hunter wrote:
> > 
> >>> Sorry. I forgot to mention that the TEGRA210_CLK_APE_SLCG_OVR
> >>> clock is required for the tests. So I cherry-picked 2 patches
> >>> from your audio branch to the linux-next:
> >>> 	clk: tegra210: Add SLCG override gate clocks
> >>> 	ARM64: tegra: DT: Add SLCG clock for AUD
> > 
> >>> And it seems that you've submitted that patch once but it got
> >>> hold because it wasn't so useful at that time?
> > 
> >> Yes it was not being used at the time. It is on my list of things to do
> >> and we need to revisit it. There was some discussion on the best way to
> >> handle these clocks from a client perspective. I am not sure we came to
> >> a conclusion on this. I need to find some time to look at this.
> > 
> > I may also take a look to speed it up. Yet, putting that clock
> > aside, how about this patch then? I think we don't need to wait
> > for that clock patch in order to announce that we support this
> > now on a specific SoC but can just treat it as a new feature of
> > a DMA controller, which sounds quite plausible to me since the
> > ADMA module is now being disabled in all dts files of existing
> > SoCs -- There have to be some local changes in any way so as to
> > test it with the mainline code.
> 
> I am fine with the changes. However, I am wondering if we should sort
> out this clock business first just in case someone tries to use this.

I think that is better, so am dropping this series.

-- 
~Vinod
