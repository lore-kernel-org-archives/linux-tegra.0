From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Wed, 13 Nov 2013 10:29:07 -0700
Message-ID: <5283B6E3.9070206@wwwdotorg.org>
References: <1383203126-3243-1-git-send-email-wni@nvidia.com> <20131031162029.GF2493@sirena.org.uk> <527737C5.5080901@nvidia.com> <20131104161828.GK2493@sirena.org.uk> <5278B4CB.9050305@nvidia.com> <20131106085100.GB11602@sirena.org.uk> <527A1C47.6050405@nvidia.com> <20131106110154.GG11602@sirena.org.uk> <5281C228.3000404@nvidia.com> <5282717C.3050502@wwwdotorg.org> <20131113122329.GC878@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131113122329.GC878-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/13/2013 05:23 AM, Mark Brown wrote:
> On Tue, Nov 12, 2013 at 11:20:44AM -0700, Stephen Warren wrote:
> 
>> The only issue you may have to watch out for is: When is 
>> regulator_init() called (i.e. when does core_initcall happen)
>> relative to when driver probe()s can be called? If it's earlier,
>> then core_initcall is early enough I suspect.
> 
> What I said was to set this up when we hand the DT over to the DT
> code to be parsed so that we don't need to worry about any gaps
> like that, it seems like a more direct solution than worrying about
> initcall ordering.

I guess this means putting the call to
regulator_has_full_constraints() somewhere inside
early_init_dt_scan(), unflatten_device_tree(), or just perhaps inside
of_platform_populate() (all in drivers/of/*.c).

It seems slightly odd to tightly link the drivers/of and
drivers/regulator code like that, but I guess with the appropriate
ifdefs it'll work out OK.
