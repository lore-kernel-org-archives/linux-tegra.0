From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 12/16] dmaengine: tegra-apb: Clean up suspend-resume
Date: Thu, 30 Jan 2020 21:06:54 +0300
Message-ID: <ffd9dbd0-be74-7bb4-9ca9-a97ee8023fc2@gmail.com>
References: <20200130043804.32243-1-digetx@gmail.com>
 <20200130043804.32243-13-digetx@gmail.com>
 <e787bee2-4b52-1643-b3a5-8c4e70f6fdca@nvidia.com>
 <394014f3-011a-d6b6-b5f2-f8c86834ec70@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <394014f3-011a-d6b6-b5f2-f8c86834ec70@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.01.2020 19:08, Dmitry Osipenko пишет:
> 30.01.2020 17:09, Jon Hunter пишет:
>>
>> On 30/01/2020 04:38, Dmitry Osipenko wrote:
>>> It is enough to check whether hardware is busy on suspend and to reset
>>> it across of suspend-resume because channel's configuration is fully
>>> re-programmed on each DMA transaction anyways and because save-restore
>>> of an active channel won't end up well without pausing transfer prior to
>>> saving of the state (note that all channels shall be idling at the time of
>>> suspend, so save-restore is not needed at all).
>>
>> I guess if we ever wanted to support SNDRV_PCM_INFO_PAUSE for audio and
>> support the pause callback, then saving and restoring the channels could
>> be needed. Right now I believe that it will just terminate_all transfers
>> for audio on entering suspend. Any value in keeping this?
> 
> Indeed, looks like [1] pauses DMA during suspend if SNDRV_PCM_INFO_PAUSE
> is supported.
> 
> [1]
> https://elixir.bootlin.com/linux/v5.5/source/sound/core/pcm_dmaengine.c#L199
> 
> So we'll need to save-restore context only if DMA is in a paused state
> during suspend, I'll adjust this patch to do that and will see if
> enabling SNDRV_PCM_INFO_PAUSE works.

I started to look at it and found that the .device_pause() hook isn't
implemented by the driver. So, it's fine to remove the context's
save-restore for now.

Jon, what about to keep this patch as-is? Later on I'll take a look at
implementing the proper pausing functionality and try to cleanup code a
bit further (remove the free list usage, etc).
