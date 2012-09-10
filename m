From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ASoC: tegra: fix maxburst settings in dmaengine code
Date: Mon, 10 Sep 2012 12:03:31 -0600
Message-ID: <504E2B73.2020006@wwwdotorg.org>
References: <1346975253-2935-1-git-send-email-swarren@wwwdotorg.org> <20120907010050.GE4400@opensource.wolfsonmicro.com> <50494F8C.3030906@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50494F8C.3030906-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/06/2012 07:36 PM, Stephen Warren wrote:
> On 09/06/2012 07:00 PM, Mark Brown wrote:
>> On Thu, Sep 06, 2012 at 05:47:33PM -0600, Stephen Warren wrote:
>>
>>> Mark, I'd like to take this patch through the Tegra tree, since it's a
>>> dependency for the series that converts Tegra to dmaengine. Thanks.
>>
>> Since it's a fix I was going to send it as a patch for 3.6 so that
>> shouldn't be an issue?
> 
> Oh right, that makes sense too, thanks.

Mark,

This patch shows up in your ASoC for-next branch, but not in your
for-3.6 or for-3.7 branches. I think gitk is telling me that you simply
forgot to push your latest for-3.6 branch to kernel.org when you pushed
your updated for-next.

Anyway, since this patch didn't make 3.6-rc5, it is difficult for me to
use as a baseline for any branches destined for 3.7, since I'm supposed
to send my pull requests to arm-soc before 3.6-rc6 is released, yet if
this patch goes into 3.6, it won't be there until 3.6-rc6 at the earliest.

I'm not sure how best to resolve this; is it possible for me to take the
patch through the Tegra tree instead, as I originally intended?
