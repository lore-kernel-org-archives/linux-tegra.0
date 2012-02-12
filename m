From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 2/2] regmap: add regmap_bulk_write() for register write
Date: Sun, 12 Feb 2012 19:44:38 +0530
Message-ID: <4F37C94E.5000504@nvidia.com>
References: <1329036556-15408-1-git-send-email-ldewangan@nvidia.com> <4F37A925.90507@metafoo.de> <20120212131101.GA3395@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120212131101.GA3395-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sunday 12 February 2012 06:41 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Sun, Feb 12, 2012 at 12:57:25PM +0100, Lars-Peter Clausen wrote:
>> On 02/12/2012 09:49 AM, Laxman Dewangan wrote:
>>> [...]
>>> +	} else {
>>> +		for (i = 0; i<  val_count; i++) {
>>> +			memcpy(&ival, val + (i * val_bytes), val_bytes);
>> This will have endianess issues. You'll need something like regcache_get_val.
The data pointer of this function is in cpu-endianess and so I am just 
copying it because regmap_write takes integer type value.
>>> +			ret = _regmap_write(map, reg + i, ival);
> Or just don't provide this fallback at all - it's not something the
> underlying device supports anyway and none of the other block or bulk
> operations work on these devices either.
Yaah, Seeing other function I think I can remove this fallback.

> * Unknown Key
> * 0x6E30FDDD
