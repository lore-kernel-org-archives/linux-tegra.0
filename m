From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dt: tegra: cardhu: register core regulator tps65911
Date: Fri, 08 Jun 2012 22:24:06 -0600
Message-ID: <4FD2CFE6.9070500@wwwdotorg.org>
References: <1337691917-15040-1-git-send-email-ldewangan@nvidia.com> <1337691917-15040-2-git-send-email-ldewangan@nvidia.com> <4FBBC192.7030900@wwwdotorg.org> <4FBBC830.2060802@nvidia.com> <4FBBCA8F.3050903@wwwdotorg.org> <4FBBD33C.8020802@nvidia.com> <4FBBDA97.6000006@wwwdotorg.org> <4FBBDE06.5080806@nvidia.com> <4FC916AC.4060804@wwwdotorg.org> <4FD250DB.2090207@nvidia.com> <20120609030608.GF3924@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120609030608.GF3924-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/08/2012 09:06 PM, Mark Brown wrote:
> On Sat, Jun 09, 2012 at 12:52:03AM +0530, Laxman Dewangan wrote:
> 
>> So is it fine to go on the above binding?
>> In this case we need to find the match_regulator based on
>> regulator-id rather than by name.
> 
> I guess.  I'm not enthusiastic about it (some way of using the key/value
> nature of DT as a hash would be much nicer) but it seems that the
> combination of DT and the existing code for it can't really give us
> more.  
> 
> If we're going to do this we need to update all the existing DT bindings
> for drivers that use single node regulators like this.  Please also
> change the name used for the property to regulator-compatible to make it
> clear that the idea is the same as normal compatible properties.

I'm not sure of the logic behind naming the property
"regulator-compatible"; the standard compatible property identifies that
the node is of a particular type/class, whereas the regulator-id in the
example Laxman quoted would indicate the specific identity/object. Those
seem like different things.
