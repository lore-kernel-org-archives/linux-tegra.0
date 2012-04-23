From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: Add AHB driver
Date: Mon, 23 Apr 2012 12:00:13 -0600
Message-ID: <4F9598AD.2030308@wwwdotorg.org>
References: <1335181043-15348-1-git-send-email-hdoyu@nvidia.com> <201204231233.09423.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201204231233.09423.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/23/2012 06:33 AM, Arnd Bergmann wrote:
> On Monday 23 April 2012, Hiroshi DOYU wrote:
>> The AHB Bus conforms to the AMBA Specification (Rev 2.0) Advanced
>> High-performance Bus (AHB) architecture.
...
>> @@ -122,6 +123,7 @@ void __init tegra20_init_early(void)
>>  	tegra_init_cache(0x331, 0x441);
>>  	tegra_pmc_init();
>>  	tegra_powergate_init();
>> +	tegra_ahb_gizmo_init();
>>  }
>>  #endif
>>  #ifdef CONFIG_ARCH_TEGRA_3x_SOC
>> @@ -132,5 +134,6 @@ void __init tegra30_init_early(void)
>>  	tegra_init_cache(0x441, 0x551);
>>  	tegra_pmc_init();
>>  	tegra_powergate_init();
>> +	tegra_ahb_gizmo_init();
>>  }
>>  #endif
> 
> Does it really have to be "early", rather than an initcall? Why?

I don't know whether it has to be early, but if this driver isn't going
to be instantiated from device tree, I'd prefer it to be initialized by
an explicit function call from the boards or common code rather than an
initcall. It seems a lot easier to keep track of all the initialization
by doing it explicitly. That said, it's quite possible this API couuld
be called from say init_machine instead of init_early though.
