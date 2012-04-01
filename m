From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 13/17] ASoC: tegra: set a sensible initial clock rate
Date: Sat, 31 Mar 2012 20:07:18 -0600
Message-ID: <4F77B856.2050708@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org> <1333148852-17806-14-git-send-email-swarren@wwwdotorg.org> <20120331201754.GM5012@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120331201754.GM5012-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/31/2012 02:17 PM, Mark Brown wrote:
> On Fri, Mar 30, 2012 at 05:07:28PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Initialize the audio clock tree appropriately for some reasonable rate.
>> This makes sure the PLLs etc. are actually programmed to something
>> reasonable when the audio driver is loaded.
> 
>> +	ret = tegra_asoc_utils_set_rate(data, 48000, 256 * 48000);
> 
> Applied, though 48kHz is a somewhat surprising choice for the default
> CPU audio rate - the overwhelming majority of audio played winds up
> being 44.1kHz.  Still, it's just going to get changed as required.

I may as well change this to be consistent with the Tegra-side patch. I
note you said "applied", but I don't actually see it in your kernel.org
repo.
