From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 16/27] drm/tegra: Add Tegra114 display controller support
Date: Mon, 14 Oct 2013 12:05:18 -0600
Message-ID: <525C325E.2090700@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-17-git-send-email-treding@nvidia.com> <52587843.9070806@wwwdotorg.org> <20131012113231.GD22284@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131012113231.GD22284@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/12/2013 05:32 AM, Thierry Reding wrote:
> On Fri, Oct 11, 2013 at 04:14:27PM -0600, Stephen Warren wrote:
>> On 10/07/2013 02:34 AM, Thierry Reding wrote:
>>> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> 
>>> The Tegra114 display controller is backwards-compatible with
>>> previous generations of the Tegra SoC. No code changes are
>>> required.
>> 
>> If the HW is backwards-compatible, then there's no need to add
>> extra compatible values to the driver; just write the following
>> in the DT, and it'll just work:
>> 
>> compatible = "nvidia,tegra114-dc", "nvidia,tegra30-dc";
> 
> One reason why I thought it might be useful to still include this,
> even though unnecessary, was to match it to the host1x_drm_subdevs
> table. We can probably remove the entry from there as well,
> though.
> 
> As far as I can tell, the same holds for Tegra30, which is also 
> backwards compatible with Tegra20 but the DTS doesn't contain the 
> Tegra20 compatible. So to keep ABI compatibility we'll need to keep
> the nvidia,tegra30-dc in the driver's match tables, but I could
> still update the DTS to include the nvidia,tegra20-dc for
> correctness.
> 
> Does that make sense?

Yes, fixing the Tegra30 .dtsi file sounds like a good idea.
