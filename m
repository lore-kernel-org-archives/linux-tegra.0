From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 13/16] usb: phy: tegra: Keep CPU interrupts enabled
Date: Thu, 2 Jan 2020 17:40:48 +0300
Message-ID: <ad1a2b09-12b0-112e-1556-6faf6a01c330@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
 <20191228203358.23490-14-digetx@gmail.com>
 <20191230203648.GA24135@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191230203648.GA24135@qmqm.qmqm.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

30.12.2019 23:36, Michał Mirosław пишет:
> On Sat, Dec 28, 2019 at 11:33:55PM +0300, Dmitry Osipenko wrote:
>> There is no good reason for disabling of CPU interrupts in order to
>> protect the utmip_pad_count modification.
> 
> Since there are sleeping functions called outside of the locked sections,
> this should be a mutex instead. OTOH if the spin_lock is to protect register
> write against IRQ handler, then the patch is wrong.
> 
> [...]
>> -	spin_unlock_irqrestore(&utmip_pad_lock, flags);
>> +	spin_unlock(&utmip_pad_lock);
>>  
>>  	clk_disable_unprepare(phy->pad_clk);

Hello Michał,

This spinlock isn't for protecting from the IRQ handler, it's used
solely to protect modification of the registers that are shared by all
USB controllers.

It's possible to use mutex instead of spinlock here, but it doesn't
bring any benefits because mutex is more useful when protected code
could block for a long time due to sleep or whatever, while spinlock is
much more efficient when protected code doesn't sleep and takes no more
than dozens microseconds to execute (which is the case here).

In this particular case of the Tegra USB PHY driver, the chance of
getting a block on taking the utmip_pad_lock is zero unless USB
controller drivers will start to use asynchronous probing. So this patch
does a very minor clean-up change and nothing more.
