From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1] regmap: Support for caching in reg_raw_write()
Date: Fri, 10 Feb 2012 17:37:34 +0530
Message-ID: <4F350886.4070600@nvidia.com>
References: <1328873572-12603-1-git-send-email-ldewangan@nvidia.com> <4F350716.9050407@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F350716.9050407-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 10 February 2012 05:31 PM, Lars-Peter Clausen wrote:
> On 02/10/2012 12:32 PM, Laxman Dewangan wrote:
>> Adding support for caching of data into the
>> non-volatile register from the call of reg_raw_write().
>>
>> This will allow the larger block of data write into multiple
>> register without worrying whether register is cached or not
>> through reg_raw_write().
>>
> In my opinion it makes more sense to introduce a regmap_bulk_write function
> for this.
Yes, I am going to push another change which will have the 
regmap_bulk_write() which will be in sync with read part.
