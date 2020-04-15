From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] NVIDIA Tegra I2C synchronization correction
Date: Wed, 15 Apr 2020 17:14:39 +0300
Message-ID: <87f18a67-5aec-b5df-9d8f-341f03ff3a72@gmail.com>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200415114536.GB910@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200415114536.GB910@ninjato>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

15.04.2020 14:45, Wolfram Sang пишет:
> On Tue, Mar 24, 2020 at 10:12:15PM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> Recently I found a way to reliably reproduce I2C timeouts that happen due
>> to improper synchronizations made by the I2C driver. It's quite easy to
>> reproduce the problem when memory is running on a lower freq + there is
>> some memory activity + CPU could get busy for a significant time. This
>> is the case when KASAN is enabled and CPU is busy while accessing FS via
>> NFS. This small series addresses the found problems.
>>
>> Changelog:
>>
>> v2: - The "Better handle case where CPU0 is busy for a long time" patch
>>       now preserves the old behavior where completion is checked after
>>       disabling the interrupt, preventing potential race-condition of
>>       the completion awaiting vs interrupt syncing.
>>
>> Dmitry Osipenko (2):
>>   i2c: tegra: Better handle case where CPU0 is busy for a long time
>>   i2c: tegra: Synchronize DMA before termination
> 
> Patches look good to me. I tend to apply them to for-current instead of
> for-next because they are fixing issues. Even a stable tag?
> 

Thank you, yes it should be good to apply this series to 5.7 because the
Tegra APBDMA driver dependency-patches are already in 5.7.

The stable tag shouldn't be needed since this is not a critical bug fix
and the DMA driver patches are not going into stable. This series should
be more actual for the upcoming devices, which should be upstreamed in 5.8+.
