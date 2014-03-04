From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add LED options back into tegra_defconfig
Date: Tue, 04 Mar 2014 09:27:09 -0700
Message-ID: <5315FEDD.70407@wwwdotorg.org>
References: <1392932240-14480-1-git-send-email-swarren@wwwdotorg.org> <201402282139.40122.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201402282139.40122.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/28/2014 01:39 PM, Arnd Bergmann wrote:
> On Thursday 20 February 2014, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> The last time tegra_defconfig was rebuilt, various LEDs options were
>> somehow selected by other options, and hence their entries in
>> tegra_defconfig were removed by "make savedefconfig". However, for some
>> reason this is no longer happening, so we need to add the entries back
>> into tegra_defconfig so the they are enabled in .config.
>>
>> Fixes: db079b1811d1 ("ARM: tegra: rebuild tegra_defconfig to add DEBUG_FS)"
>> Reported-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> Another fix for 3.14.
> 
> Applied to fixes branch.

It looks like fixes isn't in linux-next. I think it'd be useful to add it.
