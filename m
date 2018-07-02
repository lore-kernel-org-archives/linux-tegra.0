From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 0/5] Initial support of Trusted Foundations on Tegra30
Date: Mon, 02 Jul 2018 17:48:36 +0300
Message-ID: <11534185.70fb5jbPr6@dimapc>
References: <20180619110027.16935-1-digetx@gmail.com> <d99935be-797d-4676-c186-a045a590f01b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d99935be-797d-4676-c186-a045a590f01b@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Geis <pgwipeout@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
List-Id: linux-tegra@vger.kernel.org

On Friday, 29 June 2018 22:37:02 MSK Peter Geis wrote:
> Good Afternoon,
> 
> I have tested these patches on the Ouya T3 device.
> They work great to enable the L2 cache controller, however they do not
> respect explicitly disabling the L2 cache controller via the kernel
> config nor device tree.
> 
> With CONFIG_CACHE_L2X0 disabled, but CONFIG_TRUSTED_FOUNDATIONS enabled,
> the L2 cache controller is silently enabled and allows all four cores to
> boot.
> 

I don't see how cache could be enabled with CONFIG_CACHE_L2X0 disabled, there 
is no code to do that. Could you elaborate please?

Secondary cores do not depend on the cache state, disabled cache shouldn't 
prevent them to boot.

> One must also disable CONFIG_TRUSTED_FOUNDATIONS to stop the L2 cache
> controller from spinning up.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> 
