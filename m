From: miaoqinglang <miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH -next] gpu: host1x: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Fri, 17 Jul 2020 09:32:21 +0800
Message-ID: <5684dcb3-c5a4-96c1-dd96-c44f5a94938f@huawei.com>
References: <20200716090323.13274-1-miaoqinglang@huawei.com>
 <20200716133450.GJ535268@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200716133450.GJ535268@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


在 2020/7/16 21:34, Thierry Reding 写道:
> On Thu, Jul 16, 2020 at 05:03:23PM +0800, Qinglang Miao wrote:
>> From: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>
>> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
>>
>> Signed-off-by: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/host1x/debug.c | 28 ++++------------------------
>>   1 file changed, 4 insertions(+), 24 deletions(-)
> This doesn't apply. Can you please resend, based on something like
> linux-next?
>
> Thanks,
> Thierry
Hi, Thierry

   Sorry I didn't mention it in commit log, but this patch is based on 
linux-next where commit <4d4901c6d7> has switched over direct  seq_read 
method calls to seq_read_iter, this is why there's conflict in  your apply.

   Do you think I should send a new patch based on 5.8rc?

Thanks.
