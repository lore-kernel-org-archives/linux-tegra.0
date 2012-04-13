From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 2/4] ASoC: convert Tegra20 I2S driver to regmap
Date: Fri, 13 Apr 2012 12:13:23 -0600
Message-ID: <4F886CC3.90302@wwwdotorg.org>
References: <1334337819-23665-1-git-send-email-swarren@wwwdotorg.org> <1334337819-23665-2-git-send-email-swarren@wwwdotorg.org> <20120413173012.GZ3168@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120413173012.GZ3168-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/13/2012 11:30 AM, Mark Brown wrote:
> On Fri, Apr 13, 2012 at 11:23:37AM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> v2: Split into separate patch
> 
> Can you regenerate these against for-3.5 please?

Oh right, "ASoC: tegra: ensure clocks are enabled when touching
registers" is only in for-3.4 not for-3.5. Will regenerate. Sorry about
that.

BTW, when merging your for-3.4 into for-3.5, or when rebasing your
for-3.5 onto a new v3.4-rcN, you'll want to just ignore the change from
the patch I mentioned above since it touches code deleted in for-3.5
once these patches are applied.
