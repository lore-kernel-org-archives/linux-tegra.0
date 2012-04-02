From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 12/17] ASoC: tegra: utils: add support for Tegra30 devices
Date: Mon, 02 Apr 2012 11:44:36 -0600
Message-ID: <4F79E584.7080904@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org> <1333148852-17806-13-git-send-email-swarren@wwwdotorg.org> <20120331202015.GN5012@opensource.wolfsonmicro.com> <4F77B5F8.8080205@wwwdotorg.org> <20120401102814.GC3153@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120401102814.GC3153-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/01/2012 04:28 AM, Mark Brown wrote:
> On Sat, Mar 31, 2012 at 07:57:12PM -0600, Stephen Warren wrote:
>> On 03/31/2012 02:20 PM, Mark Brown wrote:
>>> On Fri, Mar 30, 2012 at 05:07:27PM -0600, Stephen Warren wrote:
> 
>>>> -	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
>>>> + ret = tegra_asoc_utils_init(&alc5632->util_data, + 
>>>> TEGRA_ASOC_UTILS_SOC_TEGRA20, &pdev->dev);
> 
>>> Would it not be more sensible to do cpu_is_() calls in the utils 
>>> code rather than have the board say?  It'd possibly also end up 
>>> looking nicer in the code and may mean the compiler can figure out 
>>> not to include cases that can't be taken in the current build.
> 
>> We had floated the idea of adding cpu_is_*() (Well, soc_is_*()) macros
>> for Tegra in the past, and received the message that was a bad idea;
>> things should instead be driven by compatible flag values or similar.
> 
> Or look at the binding, or something.  Having the machine drivers need
> to translate the bindings into these defines just feels clunky.

I guess the utility code can just call of_machine_is_compatible() during
probe, and so not require the machine driver to pass the value in. That
doesn't feel /too/ gross, and avoids having to export any new soc_is()
or similar APIs for Tegra.

Does that seem reasonable to you?

In the longer run, I suspect the clock naming differences that are keyed
off this flag to be handled by clock properties in DT, but that relies
on common clock bindings being in place first. I'm not sure if it makes
sense to put the PLL rate information into the DT too, or not.

>> See http://www.spinics.net/lists/linux-tegra/msg02250.html. That said,
>> I see many cpu_is_*() calls in arch/arm, so perhaps we should revisit
>> this.
> 
> Many of those might get some pushback in this day and age.
