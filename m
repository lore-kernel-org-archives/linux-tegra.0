From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/5] ARM: trusted_foundations: Implement L2 cache initialization callback
Date: Wed, 15 Aug 2018 00:19:08 +0300
Message-ID: <1581737.LbIJYaB7YW@dimapc>
References: <20180619110027.16935-1-digetx@gmail.com> <20180619110027.16935-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619110027.16935-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
List-Id: linux-tegra@vger.kernel.org

On Tuesday, 19 June 2018 14:00:23 MSK Dmitry Osipenko wrote:
> Implement L2 cache initialization firmware callback that should be invoked
> early in boot to enable cache HW.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/firmware/trusted_foundations.c | 27 +++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Russell, could you please take a look at the arm/firmware/ patches and ACK 
them if they are good to you?
