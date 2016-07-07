From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 01/10] Documentation: dt-bindings: mailbox: tegra: Add
 binding for HSP mailbox
Date: Thu, 7 Jul 2016 12:35:02 -0600
Message-ID: <577EA0D6.9020308@wwwdotorg.org>
References: <20160705090431.5852-1-josephl@nvidia.com>
 <20160705090431.5852-2-josephl@nvidia.com>
 <20160707181356.GA6864@kickseed.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160707181356.GA6864-5el8CFYymRZDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthew Longnecker <MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/07/2016 12:13 PM, Sivaram Nair wrote:
> On Tue, Jul 05, 2016 at 05:04:22PM +0800, Joseph Lo wrote:
>> Add DT binding for the Hardware Synchronization Primitives (HSP). The
>> HSP is designed for the processors to share resources and communicate
>> together. It provides a set of hardware synchronization primitives for
>> interprocessor communication. So the interprocessor communication (IPC)
>> protocols can use hardware synchronization primitive, when operating
>> between two processors not in an SMP relationship.

>> diff --git a/include/dt-bindings/mailbox/tegra186-hsp.h b/include/dt-bindings/mailbox/tegra186-hsp.h

>> +#define HSP_MBOX_TYPE_DB 0x0
>> +#define HSP_MBOX_TYPE_SM 0x1
>> +#define HSP_MBOX_TYPE_SS 0x2
>> +#define HSP_MBOX_TYPE_AS 0x3
>> +
>> +#define HSP_DB_MASTER_CCPLEX 17
>> +#define HSP_DB_MASTER_BPMP 19
>> +
>> +#define HSP_MBOX_ID(type, ID) \
>> +		(HSP_MBOX_TYPE_##type << 16 | ID)
>
> It will be nicer if you avoid the macro glue magic '##' for 'type'. I
> would also suggest to use braces around 'type' and 'ID'.

This technique been used without issue in quite a few other places 
without issue, and has the benefit of simplifying the text wherever the 
macro is used. What issue do you foresee?

BTW, if this patch does need reposting, I'd suggest s/ID/id/ since macro 
parameters are usually lower-case.
