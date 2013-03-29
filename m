From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: keep power on to SD slot on Dalmore
Date: Fri, 29 Mar 2013 10:33:17 -0600
Message-ID: <5155C24D.2000704@wwwdotorg.org>
References: <1364498550-15972-1-git-send-email-swarren@wwwdotorg.org> <51552AA4.1030607@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51552AA4.1030607-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/28/2013 11:46 PM, Laxman Dewangan wrote:
> On Friday 29 March 2013 12:52 AM, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Set "regulator-always-on" for the SD slot on Dalmore, so that SD cards
>> work. This used to work, since this regulator is on by default, but was
>> broken by commit "ARM: tegra: dalmore: add TPS65090 node", since that
>> didn't specify always-on for this regulator.
>>
>> In the long run, the regulators should all be hooked up to the SDHCI
>> device nodes. However, we haven't done that for any of the Tegra boards
>> yet, so to be consistent, this patch simply forces the regulator on,
>> rather than hooking it up and making it work differently to other boards.
>>
>> Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Reported-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
> 
> Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This means we should keep sd slot rails always ON when we populate the
> power tree for any Tegra board?

For now yes.

Ideally, our DTs would include the appropriate supply properties in each
SDHCI/MMC node, and then everything would work out as it's supposed to.
However, that requires verification, and might be interdependent with
our SDHCI driver correctly supporting various HS modes that actively
require non-default voltages. We have a bug filed to fully flesh out and
validate the Tegra MMC driver upstream. It's assigned to Pavan. However,
I haven't seen any movement in the Tegra MMC driver area for eons:-(
Perhaps you can push on him if he's at the same site?
