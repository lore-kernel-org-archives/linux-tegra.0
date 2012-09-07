From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: fix maxburst settings in dmaengine code
Date: Thu, 06 Sep 2012 19:36:12 -0600
Message-ID: <50494F8C.3030906@wwwdotorg.org>
References: <1346975253-2935-1-git-send-email-swarren@wwwdotorg.org> <20120907010050.GE4400@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120907010050.GE4400-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/06/2012 07:00 PM, Mark Brown wrote:
> On Thu, Sep 06, 2012 at 05:47:33PM -0600, Stephen Warren wrote:
> 
>> Mark, I'd like to take this patch through the Tegra tree, since it's a
>> dependency for the series that converts Tegra to dmaengine. Thanks.
> 
> Since it's a fix I was going to send it as a patch for 3.6 so that
> shouldn't be an issue?

Oh right, that makes sense too, thanks.
