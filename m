From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 1/7] ARM: trusted_foundations: Support L2 cache
 maintenance
Date: Thu, 28 Feb 2019 16:36:49 +0300
Message-ID: <ba215d63-ffaa-5be6-c43f-fdb845b1d6b7@gmail.com>
References: <20190228131707.2592-1-digetx@gmail.com>
 <20190228131707.2592-2-digetx@gmail.com>
 <20190228132748.s2woduoycm7igfub@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190228132748.s2woduoycm7igfub@shell.armlinux.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

28.02.2019 16:27, Russell King - ARM Linux admin пишет:
> On Thu, Feb 28, 2019 at 04:17:01PM +0300, Dmitry Osipenko wrote:
>> +#ifdef CONFIG_CACHE_L2X0
>> +static void tf_cache_write_sec(unsigned long val, unsigned int reg)
>> +{
>> +	u32 l2x0_way_mask = 0xff;
>> +
>> +	switch (reg) {
>> +	case L2X0_CTRL:
>> +		if (l2x0_saved_regs.aux_ctrl & BIT(16))
> 
> And bit 16 is what?  We have definitions in one of the headers you've
> added above, please use them.  Thanks.
> 

Good catch, I missed that there is a definition for that bit. I'll make a v8 soon'ish, please let me know if there is anything else to be addressed. Yours r-b and a-b will be appreciated.
