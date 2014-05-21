From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v1 0/3] Tegra DMA residue improvements
Date: Wed, 21 May 2014 08:58:51 +0200
Message-ID: <537C4EAB.1040802@metafoo.de>
References: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com> <20140521055213.GK21128@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140521055213.GK21128-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Christopher Freeman <cfreeman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/21/2014 07:52 AM, Vinod Koul wrote:
> On Tue, May 06, 2014 at 02:22:20PM -0700, Christopher Freeman wrote:
>> A collection of patches to improve Tegra's DMA residual reporting
>>
>> Christopher Freeman (3):
>>    dma: tegra: finer granularity residual for tx_status
>>    dma: tegra: change interrupt-related log levels
>>    dma: tegra: avoid int overflow for transferred count
> Can you pls use the *right* subsystem name...
>

Without you saying what the right subsystem name is, I think it is not that 
obvious what it is:

git log --format="%s" --no-merges drivers/dma/ | grep '^[a-zA-Z]\+' -o | 
sort | uniq -c | sort -n

381 dma
509 dmaengine

So there is a bias towards 'dmaengine', but if you only look at recent 
commits there is a bias towards 'dma'.

git log v3.6..HEAD --format="%s" --no-merges drivers/dma/ | grep 
'^[a-zA-Z]\+' -o | sort | uniq -c | sort -n

181 dmaengine
248 dma

- Lars
