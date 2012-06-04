From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: tegra: simplify Kconfig dependencies
Date: Mon, 04 Jun 2012 11:58:32 -0600
Message-ID: <4FCCF748.8000901@wwwdotorg.org>
References: <1337635343-16613-1-git-send-email-swarren@wwwdotorg.org> <20120522100248.GF21999@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120522100248.GF21999-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/22/2012 04:02 AM, Mark Brown wrote:
> On Mon, May 21, 2012 at 03:22:23PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> The Tegra ASoC machine drivers only depend on Tegra architecture support
>> to compile, not specific board support. Remove Kconfig dependencies on
>> any particular board. This is required since Kconfig options for boards
>> are going away given the migration to device tree.
> 
> Please merge this as part of the Tegra tree as it's going to conflict
> with the removal of the machine Kconfig entries anyway.
> 
> Acked-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

Applied for 3.6.
