From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 15/27] gpu: host1x: Add support for Tegra114
Date: Mon, 14 Oct 2013 12:07:33 -0600
Message-ID: <525C32E5.2020406@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-16-git-send-email-treding@nvidia.com> <525877F3.9070004@wwwdotorg.org> <20131012112443.GC22284@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131012112443.GC22284@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/12/2013 05:24 AM, Thierry Reding wrote:
> On Fri, Oct 11, 2013 at 04:13:07PM -0600, Stephen Warren wrote:
>> On 10/07/2013 02:34 AM, Thierry Reding wrote:
>>> Tegra114 uses a slightly updated version of host1x with an
>>> additional syncpoint.
>> 
>>> drivers/gpu/host1x/hw/host1x02.c            |  42 +++++ 
>>> drivers/gpu/host1x/hw/host1x02.h            |  26 +++ 
>>> drivers/gpu/host1x/hw/hw_host1x02_channel.h | 121
>>> ++++++++++++++ drivers/gpu/host1x/hw/hw_host1x02_sync.h    |
>>> 243 ++++++++++++++++++++++++++++ 
>>> drivers/gpu/host1x/hw/hw_host1x02_uclass.h  | 175
>>> ++++++++++++++++++++
>> 
>> That seems like an awful lot of extra lines to support just one
>> extra syncpoint. Are there other changes? If not, can the code
>> be shared/parameterized somehow?
> 
> Yeah, I don't like very much how this is currently done. I mean
> about half of this is actually duplicate code because of the static
> inline functions used for register defines. As discussed elsewhere
> this was originally meant to be used for coverage testing, but
> nobody's done anything like that as far as I know. I'm also not
> convinced that these would be very useful in coverage testing, but
> adding Terje on Cc and unless he or anyone else has any (strong)
> objections I'll go and remove the duplicate definitions and while
> at it see if I can come up with a way to share more
> code/definitions between versions of host1x.
> 
> Do you see this as a blocker for 3.13 or can I do the cleanup
> after that? As far as I know Tegra124 has a more heavily modified
> version of host1x so implementing Tegra124 support might be a good
> opportunity to clean this up anyway.

I guess I'm unsure re: whether it's a blocker. It's certainly not some
kind of ABI issue, so it's not like it forces our hand later; we can
easily refactor the code later. However, I'm slightly worried that if
we do actually intend to do that, it'll be seen as code-churn. Still,
I guess if the main DRM maintainers don't object to this, I'm OK with it.

Re: Terje's points, we (e.g. Terje) should work with the HW designers
to stop moving things about, so we don't have incompatible HW.
