From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: About [PATCH 1/2] regulator: core: Provide a dummy regulator
 with full constraints
Date: Thu, 17 Oct 2013 18:39:56 +0800
Message-ID: <525FBE7C.9080402@nvidia.com>
References: <5253A17E.10503@nvidia.com> <20131008090910.GW21581@sirena.org.uk> <5253D489.7010900@nvidia.com> <20131012121412.GJ2443@sirena.org.uk> <525E17DE.6080301@nvidia.com> <20131016103942.GG2443@sirena.org.uk> <525F6A1B.70505@nvidia.com> <20131017093701.GH2443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131017093701.GH2443-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/17/2013 05:37 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Thu, Oct 17, 2013 at 12:39:55PM +0800, Wei Ni wrote:
> 
>> So do you mean it should call the regulator_has_full_constraints() in
>> the .init_machine for all machines? If so, this will affect all boards,
>> for example, in arch/arm/mach-tegra, if we set full constraints in the
>> shared board file tegra.c, all tegra boards will be set, is it right?
> 
> Yes, but this is currently the case anyway for every system using DT -
> all we'd be doing is moving this call earlier in init.

Ok, I will send out patches for Tegra series.

> 
> * Unknown Key
> * 0x7EA229BD
> 
