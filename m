From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v7 3/5] misc: fuse: Add efuse driver for Tegra
Date: Wed, 11 Jun 2014 10:29:22 -0600
Message-ID: <539883E2.9040605@wwwdotorg.org>
References: <1401973754-19701-1-git-send-email-pdeschrijver@nvidia.com> <1401973754-19701-4-git-send-email-pdeschrijver@nvidia.com> <53984FE3.6010509@nvidia.com> <20140611152551.GH5961@tbergstrom-lnx.Nvidia.com> <53987CA4.4040506@wwwdotorg.org> <20140611161901.GI5961@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140611161901.GI5961-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/11/2014 10:19 AM, Peter De Schrijver wrote:
> On Wed, Jun 11, 2014 at 05:58:28PM +0200, Stephen Warren wrote:
>> On 06/11/2014 09:25 AM, Peter De Schrijver wrote:
>>> On Wed, Jun 11, 2014 at 02:47:31PM +0200, Mikko Perttunen wrote:
>>>> On 05/06/14 16:09, Peter De Schrijver wrote:
>>>> ...
>>>>> +int tegra_fuse_readl(u32 offset, u32 *val)
>>>>> +{
>>>>> +       if (!fuse_readl)
>>>>> +               return -ENXIO;
>>>>> +
>>>>> +       *val = fuse_readl(offset);
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>
>>>> -EPROBE_DEFER would be a better error value, so that drivers can work 
>>>
>>> Ok.
>>>
>>>> even if they are initially probed before the fuse driver. Of course, if 
>>>> the fuse initialization is moved into machine init then this is a non-issue.
>>>
>>> The exported function will always be initialized later because on Tegra20 it
>>> requires APB DMA to be available. If you read the fuses directly, the system
>>> sometimes hangs.
>>
>> That's not true in the current code. IIRC, the bug was that *if* an APB
>> DMA access to anything and a CPU access to the fuses happen at the same
>> time, then there can be a hang. As such, the current fuse code accesses
>> the fuses directly (without potential for a hang) if the APB DMA driver
>> is not available, but once the driver becomes available, it reads the
>> fuses through DMA instead. Does the new code not do that?
>>
> 
> I'm not so sure about that. I have seen the hang when dumping all fuses using
> sysfs in an otherwise idle system booted from initrd. I don't think there
> should be any APB DMA activity going on then?

Hmm. Perhaps I'm misremembering the trigger for the bug then. Still, the
existing code works as I described. Perhaps that's dangerous and it
shouldn't though. Either way, I think we should have a standalone commit
that removes tegra_apb_readl_using_dma()'s fallback to
tegra_apb_readl_direct(), so any behaviour change that causes a problem
can be bisected easily.
