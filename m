From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V4] regulator: tps6586x: add support for SYS rail
Date: Thu, 06 Sep 2012 17:05:47 -0600
Message-ID: <50492C4B.6010502@wwwdotorg.org>
References: <1346791419-31290-1-git-send-email-swarren@wwwdotorg.org> <20120906000136.GM10580@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120906000136.GM10580-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/05/2012 06:01 PM, Mark Brown wrote:
> On Tue, Sep 04, 2012 at 02:43:39PM -0600, Stephen Warren wrote:
>> From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Device have SYS rail which is always ON. It is system power bus. LDO5
>> and LDO_RTC get powered through this rail internally. Add support for
>> this rail and make the LDO5/LDO_RTC supply by it. Update document
>> accordingly.
> 
> Applied, thanks.  It'll be next week before I can give you a signed tag
> to pull, sorry.

Thanks. For the record, as I mentioned on IRC, I've merged the topic
branch that contains this patch into the Tegra tree. As soon as you have
a tag available, I'll pull that in instead, and rebase on it.
