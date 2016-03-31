From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra boots failing due to as3722 I/O errors
Date: Thu, 31 Mar 2016 15:45:14 +0100
Message-ID: <56FD37FA.8010005@nvidia.com>
References: <20160329190319.GE2350@sirena.org.uk>
 <56FBB923.4000302@nvidia.com> <56FBD164.7040707@nvidia.com>
 <20160330164646.GH2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160330164646.GH2350-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 30/03/16 17:46, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Mar 30, 2016 at 02:15:16PM +0100, Jon Hunter wrote:
> 
>> On second thoughts, is this the correct way to fix this? I see that
>> there are some operators defined for get/set_bypass for a regulator and
>> these are not specified for LDO6 either. However, even if they were I
>> don't believe this will fix the problem alone.
> 
> If this is trying to implement bypass support it should use bypass
> support (and the other things doing this fixed to do so).

I have created 2 patches to add bypass support for LDO6 on the as3722 [0].

>> The failure is caused by _regulator_get_voltage() returning an error.
>> This function does not check if the regulator is bypassed, but I am
>> wondering if it should and then return the bypass voltage?
> 
> Yes, like we already do for switches.  I'll send an untested patch
> shortly.

Thanks. I have tested the patch, but as I mentioned in my response, the
issue is still not resolved even my patches for as3722. Hence, I have
not sent out my patches yet (although I verified they are working and
detecting bypass correctly).

Unfortunately, I am leaving for a weeks holiday starting tomorrow.

Laxman, Thierry, if you have some time to look at this over the next
week that would be great. Otherwise I will pick it up when I get back. I
don't think that it is too hard to resolve, we just need to add support
for bypass on LDO6 for as3722 (hopefully I have done this now) and then
ensure the bypass voltage is read correctly when registering the LDO.
Mark's initial patch to do this [1] is not working so far.

By the way, this issue has been recently exposed by a change to the
regulator core (bisect showed the problem is first seen after commit
fa93fd4ecc9c "regulator: core: Ensure we are at least in bounds for our
constraints" was added).

Cheers
Jon

[0] https://github.com/jonhunter/linux/commits/as3722	
[1] http://marc.info/?l=linux-kernel&m=145935914903138&w=2
