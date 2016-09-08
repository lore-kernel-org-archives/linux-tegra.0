From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] dmaengine: tegra210-adma: Add memcpy support
Date: Thu, 8 Sep 2016 15:19:57 +0100
Message-ID: <37d4645c-6318-78bd-79bb-844fb6764a1b@nvidia.com>
References: <cover.1473186743.git.nicoleotsuka@gmail.com>
 <c730136b708404e1257eb28bb1dc2cbf13bf6023.1473186743.git.nicoleotsuka@gmail.com>
 <bafb9b89-2b45-c419-62d4-b25a50f8d6be@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <bafb9b89-2b45-c419-62d4-b25a50f8d6be-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 08/09/16 15:08, Jon Hunter wrote:
> 
> On 06/09/16 19:42, Nicolin Chen wrote:
>> ADMA supports non-flow controlled Memory-to-Memory direction
>> transactions. So this patch just adds an initial support for
>> that. It passed a simple dmatest:
>>         echo dma1chan0 > /sys/module/dmatest/parameters/channel
>> 	echo 1024 > /sys/module/dmatest/parameters/iterations
>> 	echo 0 > /sys/module/dmatest/parameters/dmatest
>> 	echo 1 > /sys/module/dmatest/parameters/run
>> 	dmesg | grep dmatest
>> Started 1 threads using dma1chan0
>> dma1chan0-copy0: summary 1024 tests, 0 failures 2054 iops 16520 KB/s (0)
> 
> What board and kernel did you try this on?
> 
> I have tried this on a tegra210-jetson-tx1 and I get :
> 
> [  202.569204] dmatest: Started 1 threads using dma1chan0
> [  205.620318] dmatest: dma1chan0-copy0: result #1: 'test timed out' with src_off=0x86c dst_off=0xc80 len=0x307c (0)
> [  208.692315] dmatest: dma1chan0-copy0: result #2: 'test timed out' with src_off=0x3288 dst_off=0x2720 len=0xa1c (0)
> [  211.764323] dmatest: dma1chan0-copy0: result #3: 'test timed out' with src_off=0x2f44 dst_off=0x3164 len=0x3a4 (0)
> [  214.836309] dmatest: dma1chan0-copy0: result #4: 'test timed out' with src_off=0x17d0 dst_off=0x2b10 len=0xe2c (0)
> [  217.908305] dmatest: dma1chan0-copy0: result #5: 'test timed out' with src_off=0x23d8 dst_off=0xe90 len=0xb7c (0)
> ...
> 
> I also tried a tegra210-smaug and I get:
> 
> [  167.508828] dmatest: Started 1 threads using dma1chan0
> [  167.508870] dmatest: dma1chan0-copy0: dstbuf[0x0] not copied! Expected db, got 09
> [  167.508873] dmatest: dma1chan0-copy0: dstbuf[0x1] not copied! Expected da, got 05
> [  167.508875] dmatest: dma1chan0-copy0: dstbuf[0x2] not copied! Expected d9, got 26
> [  167.508876] dmatest: dma1chan0-copy0: dstbuf[0x3] not copied! Expected d8, got 16
> ...

I tried this again on my audio testing branch for tegra210 and it worked ...

[   36.427210] dmatest: Started 1 threads using dma1chan0
[   37.036948] dmatest: dma1chan0-copy0: summary 1024 tests, 0 failures 2410 iops 19419 KB/s (0)

Do you have other patches in your branch? If so it would be good to understand the dependency. May be we are missing a clock somewhere?

Cheers
Jon

-- 
nvpublic
