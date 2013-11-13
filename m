From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Correct Tegra30 SMMU register map
Date: Wed, 13 Nov 2013 09:14:42 +0800
Message-ID: <5282D282.1020409@nvidia.com>
References: <1383796706-10729-1-git-send-email-markz@nvidia.com>
 <1383796706-10729-2-git-send-email-markz@nvidia.com>
 <52827F28.7020305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52827F28.7020305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hiroshi has mentioned that the TRM should be revised. :)
Because there are some registers which are needed by SMMU driver while
they're not in TRM yet.

So this patch doesn't make sense now. Thanks for the review.

Mark
On 11/13/2013 03:19 AM, Stephen Warren wrote:
> On 11/06/2013 08:58 PM, Mark Zhang wrote:
>> Correct Tegra30 SMMU register map.
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
> 
