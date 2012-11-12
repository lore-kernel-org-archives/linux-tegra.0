From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: enable data prefetch on L2
Date: Mon, 12 Nov 2012 09:19:53 -0700
Message-ID: <50A121A9.9070101@wwwdotorg.org>
References: <1352251597-2936-1-git-send-email-josephl@nvidia.com> <20121112121905.GI1962@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121112121905.GI1962-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/12/2012 05:19 AM, Peter De Schrijver wrote:
> On Wed, Nov 07, 2012 at 02:26:37AM +0100, Joseph Lo wrote:
>> Enable the data prefetch on L2. The bit28 in aux ctrl register.
>>
>> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  arch/arm/mach-tegra/common.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
>> index c25746e..c3dee56 100644
>> --- a/arch/arm/mach-tegra/common.c
>> +++ b/arch/arm/mach-tegra/common.c
>> @@ -124,7 +124,7 @@ static void __init tegra_init_cache(void)
>>  
>>  	cache_type = readl(p + L2X0_CACHE_TYPE);
>>  	aux_ctrl = (cache_type & 0x700) << (17-8);
>> -	aux_ctrl |= 0x6C000001;
>> +	aux_ctrl |= 0x7C000001;
> 
> Just found out that we should also set bit 22 as per
> http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=6395%2F1
> 
> Stephen, should I send a seperate patch for that?

Yes please; I've applied the patch in this thread already.
