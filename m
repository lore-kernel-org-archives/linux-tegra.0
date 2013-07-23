From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: correct Colibri T20 regulator settings
Date: Tue, 23 Jul 2013 13:53:53 -0700
Message-ID: <51EEED61.1070300@wwwdotorg.org>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>  <1374442132-24040-5-git-send-email-dev@lynxeye.de>  <51EEC669.9050703@wwwdotorg.org> <1374611752.1712.6.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374611752.1712.6.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/23/2013 01:35 PM, Lucas Stach wrote:
> Am Dienstag, den 23.07.2013, 11:07 -0700 schrieb Stephen Warren:
>> On 07/21/2013 02:28 PM, Lucas Stach wrote:
...
>>> SM2 is not a the parent of LDO regs, but actually the DDR regulator. The
>>> Colibri uses a different version of the TPS with other voltage mapping
>>> tables for SM2, currently we cheat by setting a fake 3,2V which results
>>> in 1,8V physical.
...
>> But is this a regression? If not, how far back in CC: stable should this
>> change go?
> 
> This is not a regression. It was introduced with the original Colibri
> T20 commit and was caused by Toradex not providing any schematics for
> the Module plus me not physically checking this voltage rail before
> pushing things out.

FYI, the reason I ask is that there's more push-back on adding patches
late in the rc cycle (or after release, to -stable) for things that are
not regressions. A safety issue like over-voltage might well still
qualify to be accepted, but fixes for regressions are even more likely
to be accepted.
