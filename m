From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911
Date: Fri, 01 Jun 2012 14:44:00 -0600
Message-ID: <4FC92990.5030104@wwwdotorg.org>
References: <1337691917-15040-1-git-send-email-ldewangan@nvidia.com> <1337691917-15040-2-git-send-email-ldewangan@nvidia.com> <4FBBC192.7030900@wwwdotorg.org> <4FBBC830.2060802@nvidia.com> <4FBBCA8F.3050903@wwwdotorg.org> <4FBBD33C.8020802@nvidia.com> <4FBBDA97.6000006@wwwdotorg.org> <4FBBDE06.5080806@nvidia.com> <4FC916AC.4060804@wwwdotorg.org> <20120601204052.GB4258@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120601204052.GB4258-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/01/2012 02:40 PM, Mark Brown wrote:
> On Fri, Jun 01, 2012 at 01:23:24PM -0600, Stephen Warren wrote:
> 
>> However, Mark warned that changing this would be a bit painful 
>> because there are already users of the existing scheme. It looks 
>> like that's only tps65910 (which we haven't started using yet), 
>> db8500, and ab8500, so probably not that big a deal.
> 
> No, there's a bunch of others - some queued for -next, others open
>  coding the same scheme.  Any device with more than one regulator
> in a node should be using the same scheme.
> 
>> We could either augment struct of_regulator_match with an
>> integer ID field for each regulator (which would perhaps make it
>> slightly painful to write the nodes and keep the IDs matched up),
>> or add a new property
> 
> No, that's awful.  How's anyone supposed to read stuff like that? 
> The interrupt bindings are a disaster, not a model.
> 
>> to each regulator provider node e.g. regulator-id which
>> contained the name that the regulator driver knows the regulator
>> as (which would match struct of_regulator_match.name), since the
>> existing regulator-name property is used for semantically
>> different purposes.
> 
> Oh, ick.  This isn't nice.  If anything I'd be more inclined to
> put a named property in there and have drivers look for its
> presence. The presence of multiple name properties isn't nice.

Could you expand on "named property" a bit; I'm not quite sure what
you're getting at - literally a property with name "named" (which
would be the same as regulator-id under just a different property
name), or ...?

>>> vdd1_reg: regulator@0 {
> 
> Can't we use the right hand side of this?  It appears to just be 
> syntactic sugar without any current meaning.

The stuff to the right of @ is the "unit address" and must match the
value in the reg property. Using that was the first proposal I had
above (which I also didn't like as much)
