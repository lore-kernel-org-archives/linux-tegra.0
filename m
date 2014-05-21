From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v1 0/3] Tegra DMA residue improvements
Date: Wed, 21 May 2014 10:21:32 -0600
Message-ID: <537CD28C.5020304@wwwdotorg.org>
References: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com> <20140521055213.GK21128@intel.com> <537C4EAB.1040802@metafoo.de> <20140521110637.GQ21128@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140521110637.GQ21128@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>, Lars-Peter Clausen <lars@metafoo.de>
Cc: Christopher Freeman <cfreeman@nvidia.com>, ldewangan@nvidia.com, swarren@nvidia.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/21/2014 05:06 AM, Vinod Koul wrote:
> On Wed, May 21, 2014 at 08:58:51AM +0200, Lars-Peter Clausen wrote:
>> On 05/21/2014 07:52 AM, Vinod Koul wrote:
>>> On Tue, May 06, 2014 at 02:22:20PM -0700, Christopher Freeman wrote:
>>>> A collection of patches to improve Tegra's DMA residual reporting
>>>>
>>>> Christopher Freeman (3):
>>>>   dma: tegra: finer granularity residual for tx_status
>>>>   dma: tegra: change interrupt-related log levels
>>>>   dma: tegra: avoid int overflow for transferred count
>>> Can you pls use the *right* subsystem name...
>>>
>>
>> Without you saying what the right subsystem name is, I think it is
>> not that obvious what it is:
> ah... the subsystem name and ML name is dmaengine
> 
>>
>> git log --format="%s" --no-merges drivers/dma/ | grep '^[a-zA-Z]\+'
>> -o | sort | uniq -c | sort -n
>>
>> 381 dma
>> 509 dmaengine
>>
>> So there is a bias towards 'dmaengine', but if you only look at
>> recent commits there is a bias towards 'dma'.
> And thats what i am getting annoyed at :) Yes ppl please use dmaengine only
> I think I will stop accepting patches with "dma" now and improve the stats
> here...

Simplest is to just edit the commit subjects/descriptions when you apply
patches. That way, you don't have to reject patches, or force people to
repost patches for nit-picky reasons, yet still get the results you want
in the final git tree. I certainly do this for Tegra patches.
