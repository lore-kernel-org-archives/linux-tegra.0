From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/3] soc/tegra: fuse: Fix reading registers using DMA
 on Tegra20
Date: Tue, 26 Sep 2017 20:31:21 +0300
Message-ID: <9921a66d-90f0-5a69-2da3-dc2c355eb86a@gmail.com>
References: <27dadd0335aac71c9d4d613c33a6a1d0a285afa4.1506378772.git.digetx@gmail.com>
 <87d33561-d959-7444-552d-7226adf29eb4@nvidia.com>
 <d6bd8251-421e-5bc9-ce99-2b6aee4640ce@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d6bd8251-421e-5bc9-ce99-2b6aee4640ce-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 26.09.2017 19:08, Stephen Warren wrote:
> On 09/26/2017 08:08 AM, Jon Hunter wrote:
>> Hi Dmitry,
>>
>> On 25/09/17 23:35, Dmitry Osipenko wrote:
>>> DMA config is incorrect, because of it DMA transfer is never issued and
>>> tegra20_fuse_read() always returns 0x0.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>   drivers/soc/tegra/fuse/fuse-tegra.c   | 1 +
>>>   drivers/soc/tegra/fuse/fuse-tegra20.c | 3 ++-
>>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c
>>> b/drivers/soc/tegra/fuse/fuse-tegra.c
>>> index b7c552e3133c..73a3a2c74021 100644
>>> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
>>> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
>>> @@ -132,6 +132,7 @@ static int tegra_fuse_probe(struct platform_device *pdev)
>>>         /* take over the memory region from the early initialization */
>>>       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +    fuse->phys = res->start;
>>>       fuse->base = devm_ioremap_resource(&pdev->dev, res);
>>>       if (IS_ERR(fuse->base))
>>>           return PTR_ERR(fuse->base);
>>> diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c
>>> b/drivers/soc/tegra/fuse/fuse-tegra20.c
>>> index 294413a969a0..a33f48c06771 100644
>>> --- a/drivers/soc/tegra/fuse/fuse-tegra20.c
>>> +++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
>>> @@ -59,7 +59,7 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse,
>>> unsigned int offset)
>>>         mutex_lock(&fuse->apbdma.lock);
>>>   -    fuse->apbdma.config.src_addr = fuse->apbdma.phys + FUSE_BEGIN + offset;
>>> +    fuse->apbdma.config.src_addr = fuse->phys + FUSE_BEGIN + offset;
>>>         err = dmaengine_slave_config(fuse->apbdma.chan, &fuse->apbdma.config);
>>>       if (err)
>>> @@ -119,6 +119,7 @@ static int tegra20_fuse_probe(struct tegra_fuse *fuse)
>>>       fuse->apbdma.config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>>>       fuse->apbdma.config.src_maxburst = 1;
>>>       fuse->apbdma.config.dst_maxburst = 1;
>>> +    fuse->apbdma.config.direction = DMA_DEV_TO_MEM;
>>>         init_completion(&fuse->apbdma.wait);
>>>       mutex_init(&fuse->apbdma.lock);
>>
>> Thanks for the fix.
>>
>> When booting the mainline on Tegra20 Trimslice, I only see the
>> tegra20_fuse_read_early() called and not the tegra20_fuse_read(). That's
>> not to say it is not needed, but I am wondering if we really need this
>> complex tegra20_fuse_read() using DMA and whether we should just have
>> the normal fuse->read() call tegra20_fuse_read_early() as well to
>> simplify matters?
>>
>> Maybe Thierry or Stephen know the history here?
> 
> There's some HW bug related to reading the fuse registers from the CPU. The fix
> was implemented long ago by Olof; see the git commit description pasted below.
> IIRC, the code directly reads the fuse registers before the point where DMA is
> available (the argument being we can't do anything else, and this period of time
> is short so the risk hopefully low), but once DMA is available, it is used to
> avoid the HW bug. The bug was apparently fixed in Tegra30; see the other commit
> description pasted below.
> 
>> commit e2f91578b35347341482f6af9e4fcf3174531efd
>> Author: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>> Date:   Wed Oct 12 23:52:29 2011 -0700
>>
>>     ARM: tegra: use APB DMA for accessing APB devices
>>         Tegra2 hangs if APB registers are accessed from the cpu during an
>>     apb dma operation. The workaround is to use apb dma to read/write the
>>     registers instead.
>>         There is a dependency loop between fuses, clocks, and APBDMA.  If dma
>>     is enabled, fuse reads must go through APBDMA to avoid corruption due
>>     to a hw bug.  APBDMA requires a clock to be enabled.  Clocks must read
>>     a fuse to determine allowable cpu frequencies.
>>         Separate out the fuse DMA initialization, and allow the fuse read
>>     and write functions to be called without using DMA before the DMA
>>     initialization has been completed.  Access to the fuses before APBDMA
>>     is initialized won't hit the hardware bug because nothing else can be
>>     using DMA.
>>         Original fuse registar access code from Varun Wadekar
>>     <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, improved by Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>>     and later moved to separate driver by Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
>>         Major refactoring/cleanup by Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>.
>>         Changes since v1:
>>         * fix 'return false' on error condition
>>     * dequeue dma ops in case of timeout
>>         From: Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
>>     Signed-off-by: Jon Mayo <jmayo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
>>     Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
>>     Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
>> commit b861c275ea5cfeab32241c3c92a203579d5699ff
>> Author: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Date:   Wed Jun 20 18:06:34 2012 +0530
>>
>>     ARM: tegra: apbio access using dma for tegra20 only
>>         The Tegra20 HW issue with accessing APBIO registers (such
>>     as fuse registers) directly from the CPU concurrently with
>>     APB DMA accesses has been fixed in Tegra30 and later chips.
>>         Access these registers directly from the CPU on Tegra30
>>     and later, and apply the workaround only for Tegra20.
>>         Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>     Tested-by: Chaitanya Bandi <bandik-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>     Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thank you very much for the clarification.

-- 
Dmitry
