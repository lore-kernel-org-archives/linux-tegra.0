From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: beaver: allow SD card voltage to be changed
Date: Fri, 24 Jun 2016 10:14:27 +0100
Message-ID: <576CF9F3.7090406@nvidia.com>
References: <1456779678-20173-1-git-send-email-dev@lynxeye.de>
 <1463124331.2459.0.camel@lynxeye.de> <20160513172704.GA498@ulmo.ba.sec>
 <573DCDB3.80202@nvidia.com> <575E897A.5080508@nvidia.com>
 <575FA21E.80309@intel.com> <575FBEE5.50905@nvidia.com>
 <575FD6E0.7070201@intel.com> <5760125A.8030102@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5760125A.8030102-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Adrian,

On 14/06/16 15:19, Jon Hunter wrote:

...

>>> So the controller itself supports UHS-I modes, but a given board may not
>>> have the regulator to support them. We need a way to determine if the
>>> board can support the UHS-I modes. Now we could check to see if the
>>> regulator is present in the Tegra SDHCI driver and if not remove the cap
>>> flags. However, I was not sure if this is applicable to other sdhci
>>> controllers and so there should be a generic solution for this?
>>
>> There is SDHCI_QUIRK2_NO_1_8_V but it doesn't cover the eMMC 1.8V DDR52 case
>> at present.  Dong Aisheng wanted to plug that gap but I wanted to get rid of
>> SDHCI_QUIRK2_NO_1_8_V:
>>
>> 	http://marc.info/?l=linux-mmc&m=146132847206423&w=2
> 
> Ok, that would require the tegra sdhci driver to set this quirk for a
> board, which is do-able, I guess. However, given the above I am not sure
> what path you are suggesting we take to resolve this? Does not sound
> like we should be looking at using SDHCI_QUIRK2_NO_1_8_V anyway.

Any feedback here? Are you still planning to get rid of
SDHCI_QUIRK2_NO_1_8_V or should we use this?

Cheers
Jon

-- 
nvpublic
