From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4.19.113 0/3] Fix for long operation cmds busy detection
Date: Sun, 19 Apr 2020 09:23:39 -0700
Message-ID: <6911ee08-1376-a515-9393-1ebc6cc6a255@nvidia.com>
References: <1587150844-12003-1-git-send-email-skomatineni@nvidia.com>
 <20200419072030.GB3544449@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200419072030.GB3544449-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, bradleybolen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, faiz_abbas-l0cyMroinI0@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, anrao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/19/20 12:20 AM, Greg KH wrote:
> External email: Use caution opening links or attachments
>
>
> On Fri, Apr 17, 2020 at 12:14:01PM -0700, Sowjanya Komatineni wrote:
>> This series includes manually backported changes that implements Tegra
>> specific timeout callback to switch between finite and infinite HW busy
>> detection wait modes.
>>
>> sdhci-tegra driver patch implements set_timeout callback based on one of
>> the sdhci host driver patch that refactors sdhci_set_timeout and allows
>> drivers to call __sdhci_set_timeout with their timeout callback
>> implementation.
>>
>> Both of these patches are manually backported in this series.
> Is this a bugfix or a new feature?  I can't tell, but it feels like it's
> a new feature.  What's wrong with just using the 5.4.y kernel tree?
>
> thanks,
>
> greg k-h
Ulf recent patches for increased timeout adds capability 
MMC_CAP_NEED_RSP_BUSY for sdhci-tegra as well.

So, it will always use R1B for R1B type commands so there are no known 
bugs or failures with mmc devices we use on our platforms.

So, we can treat this patch as an improvement for long operation 
commands where HW will wait as long as device is busy.

Yes, should be fine to have this from 5.4.y

For 5.4.y and 5.5.y, we can back-port same patch that was applied to 5.6.y

Will send back-port request of that..

Thanks

Sowjanya
