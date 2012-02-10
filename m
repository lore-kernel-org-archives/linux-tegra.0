From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH V1] regmap: Support for caching in reg_raw_write()
Date: Fri, 10 Feb 2012 13:33:16 +0100
Message-ID: <4F350E8C.6030907@metafoo.de>
References: <1328873572-12603-1-git-send-email-ldewangan@nvidia.com> <4F350716.9050407@metafoo.de> <20120210121405.GD6472@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120210121405.GD6472-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/10/2012 01:14 PM, Mark Brown wrote:
> On Fri, Feb 10, 2012 at 01:01:26PM +0100, Lars-Peter Clausen wrote:
> 
>> In my opinion it makes more sense to introduce a regmap_bulk_write function
>> for this. regmap_raw_write was not really meant to write registers but
> 
> This isn't exclusive to that, I think Laxman planned to send a patch
> doing that on top of this one which would be what most users would end
> up using.
> 
>> rather binary blobs, like firmware. Also this keeps things consistent with
>> the read part of the regmap API.
> 
> See the previous discussion on this in the past day or so - bulk_write()
> is more complicated to implement by itself since it's going to end up
> boling down to a raw_write() internally anyway (as does reg_write()) and
> it seems nicer to just do the right thing if people ask for it.  
>

regmap_write doesn't always go the raw_write path. Also with this approach
we end up formatting the value into the raw format, only to parse it again
in the next step.

Furthermore I don't think it makes sense to cache raw values as the cache
operates on a register level, not on a byte level.
