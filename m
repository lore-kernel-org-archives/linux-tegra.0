From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: About [PATCH 1/2] regulator: core: Provide a dummy regulator
 with full constraints
Date: Thu, 17 Oct 2013 12:39:55 +0800
Message-ID: <525F6A1B.70505@nvidia.com>
References: <5253A17E.10503@nvidia.com> <20131008090910.GW21581@sirena.org.uk> <5253D489.7010900@nvidia.com> <20131012121412.GJ2443@sirena.org.uk> <525E17DE.6080301@nvidia.com> <20131016103942.GG2443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131016103942.GG2443-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/16/2013 06:39 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Oct 16, 2013 at 12:36:46PM +0800, Wei Ni wrote:
>> On 10/12/2013 08:14 PM, Mark Brown wrote:
> 
>>> OK, I think the device tree board code just needs to set full
>>> constraints during machine initialisation.  We can't have multiple
> 
>> Hi, Mark, do you mean we can call regulator_has_full_constraints(), but
>> some platforms doesn't have board file now, they only have dts file, how
>> to call this functions?
> 
> There is still a board file for DT machines, it's just shared between
> all machines - it should be doing the call instead of the regulator
> framework trying to retrofit it.

So do you mean it should call the regulator_has_full_constraints() in
the .init_machine for all machines? If so, this will affect all boards,
for example, in arch/arm/mach-tegra, if we set full constraints in the
shared board file tegra.c, all tegra boards will be set, is it right?

Thanks.
Wei.

> 
> * Unknown Key
> * 0x7EA229BD
> 
