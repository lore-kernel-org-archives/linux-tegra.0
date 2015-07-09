From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFT PATCH 1/2] i2c: tegra: update CONFIG_LOAD for new conifiguration
Date: Thu, 9 Jul 2015 11:10:24 +0530
Message-ID: <559E0948.1050004@nvidia.com>
References: <1435661667-11554-1-git-send-email-ldewangan@nvidia.com> <559D89D8.50500@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <559D89D8.50500-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, andrewc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Thursday 09 July 2015 02:06 AM, Stephen Warren wrote:
> On 06/30/2015 04:54 AM, Laxman Dewangan wrote:
>>
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> I'm not sure why Chaitanya's S-o-b is there and listed last if he's 
> not the patch author. If he wrote the patch, he should be the git 
> author and his S-o-b should be first. If he didn't and you simply 
> based this patch on work by Chaitanya, then his S-o-b probably 
> shouldn't be present, and yours would be last since you're submitting 
> the patch.

The patch I created is based on Chaitanya's work, edited on his work to 
match with mainline.

>
>> ---
>> Stephen/Andrew,
>> I need help on testing this on other platform. I tested this on T210.
>
> I'm puzzled how this was tested on T210, since it isn't supported 
> upstream yet.

We tested this as:
- K318 kernel release + i2c subsystem from linux-next in downstream boards.
- Chrome-OS team on smaug with their tree.


> The series,
> Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks for testing.
