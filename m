From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 04/17] ASoC: tegra: add description to a couple Kconfig
 options
Date: Mon, 02 Apr 2012 10:32:31 -0600
Message-ID: <4F79D49F.9000000@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org> <1333148852-17806-5-git-send-email-swarren@wwwdotorg.org> <20120331194848.GG5012@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120331194848.GG5012-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/31/2012 01:48 PM, Mark Brown wrote:
> On Fri, Mar 30, 2012 at 05:07:19PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Even though these options are typically only selected by other options,
>> it's still useful to give them a brief description.
> 
> Why do you find these short descriptions useful?  They'll cause Kconfig
> to prompt for them and...

Honestly, the downstream patches for Tegra30 support that I was
cherry-picking had descriptions for the Tegra30 options, so I needed to
resolve the discrepancy

When doing that, I figured why hide those options, even if they're
typically auto-selected? Perhaps some out-of-tree ASoC machine driver
needs those modules built.

Still, I can go either way; do you want me to drop this, and remove the
equivalent descriptions from the Tegra30 patches?

>> -	tristate
>> +	tristate "Tegra I2S driver"
>>  	depends on SND_SOC_TEGRA
>>  	help
>>  	  Say Y or M if you want to add support for codecs attached to the
> 
> ...there's already a description in the long text anyway?
