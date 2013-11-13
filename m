From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Correct Tegra30 SMMU register map
Date: Wed, 13 Nov 2013 07:56:10 +0200
Message-ID: <20131113075610.188f27b9f0799b71de06020a@nvidia.com>
References: <1383796706-10729-1-git-send-email-markz@nvidia.com>
	<1383796706-10729-2-git-send-email-markz@nvidia.com>
	<52827F28.7020305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52827F28.7020305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 12 Nov 2013 20:19:04 +0100
Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:

> On 11/06/2013 08:58 PM, Mark Zhang wrote:
> > Correct Tegra30 SMMU register map.
> 
> Some more explanation is required here re: why this layout is more
> correct than what's there.
> 
> Do you need to edit the reg property in Tegra30's memory-controller node
> too; that's what all these reg ranges are interleaved with, so
> presumably if there was a mistake in the SMMU ranges, there's the
> equivalent inverse mistake in the MC's ranges?
> 
> The DT binding for nvidia,tegra30-smmu states that reg should include
> precisely 3 entries. This patch no longer conforms to that. The binding
> needs to be re-written to explain the interleaving issue, and say that
> an arbitrary number of ranges may be provided. The same issue exists in
> the nvidia,tegra30-mc DT binding.
> 
> I think I'm beginning to regret separating out the MC and SMMU into
> separate DT nodes:-(

What's difficult is that how to handle the undocumented register area.
If we get rid of undocumented/reserved register area, then the number
of banks in SMMU/MC would increase unnecessarily. But practically we
can handle MC/SMMU multi register banks by just identifying MC/SMMU
portion with checking undocumented ones.
