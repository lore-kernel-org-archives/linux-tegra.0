From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/7] dmaengine: tegra-apb: Prevent race conditions on
 channel's freeing
Date: Thu, 2 Jan 2020 18:09:45 +0300
Message-ID: <4e1e4fef-f75c-f2e2-4d9e-29af69daf8db@gmail.com>
References: <20191228204640.25163-1-digetx@gmail.com>
 <20191228204640.25163-4-digetx@gmail.com>
 <20191230204555.GB24135@qmqm.qmqm.pl> <20191230205054.GC24135@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191230205054.GC24135@qmqm.qmqm.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.12.2019 23:50, Michał Mirosław пишет:
> On Mon, Dec 30, 2019 at 09:45:55PM +0100, Michał Mirosław wrote:
>> On Sat, Dec 28, 2019 at 11:46:36PM +0300, Dmitry Osipenko wrote:
>>> It's unsafe to check the channel's "busy" state without taking a lock,
>>> it is also unsafe to assume that tasklet isn't in-fly.
>>
>> 'in-flight'. Also, the patch seems to have two independent bug-fixes
>> in it. Second one doesn't look right, at least not without an explanation.
>>
>> First:
>>
>>> -	if (tdc->busy)
>>> -		tegra_dma_terminate_all(dc);
>>> +	tegra_dma_terminate_all(dc);
>>
>> Second:
>>
>>> +	tasklet_kill(&tdc->tasklet);
> 
> BTW, maybe you can convert the code to threaded interrupt handler and
> just get rid of the tasklet instead of fixing it?

This shouldn't bring much benefit because the the code's logic won't be
changed since we will still have to use the threaded ISR part as the
bottom-half and then IRQ API doesn't provide a nice way to synchronize
interrupt's execution, while tasklet_kill() is a nice way to sync it.
