From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: Re: [PATCH v1 2/3] clk: tegra: ignore unused vfir clock shared with uartb
Date: Mon, 10 Dec 2018 22:41:24 +0100
Message-ID: <929FC681-E2DE-42FA-803A-AEDBD9779523@ziswiler.com>
References: <20181101015230.27310-1-marcel@ziswiler.com> <20181101015230.27310-3-marcel@ziswiler.com> <20181101084152.GS7636@tbergstrom-lnx.Nvidia.com> <20181128092404.GF17419@ulmo>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128092404.GF17419@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stephen Boyd <sboyd@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On November 28, 2018 10:24:04 AM GMT+01:00, Thierry Reding <thierry.reding@gmail.com> wrote:
>On Thu, Nov 01, 2018 at 10:41:52AM +0200, Peter De Schrijver wrote:
>> On Thu, Nov 01, 2018 at 02:52:29AM +0100, Marcel Ziswiler wrote:
>> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>> > 
>> > As UARTB and VFIR share their clock enable bit it is rather unwise
>for
>> > the kernel to turn off the VFIR one should that be unused (and
>> > potentially vice versa but so far there anyway is no VFIR driver).
>> > 
>> > Without this patch trying to use UARTB with the regular 8250 driver
>> > will freeze as soon as ttyS1 is accessed after boot. Luckily, using
>the
>> > high-speed Tegra serial driver won't exhibit the issue as clocks
>are
>> > dynamically enabled/disabled on every access.
>> > 
>> > This has been reproduced both on Apalis T30 as well as Apalis TK1
>but
>> > may be an issue on all Tegra UARTB's which share the clock enable
>with
>> > VFIR.
>> > 
>> 
>> Ah.. the correct fix for this is to initialize the enable_refcnt
>based on the
>> hw state. This is done in 9619dba8325fce098bbc9ee2911d1b0150fec0c9
>for
>> periph gate clocks, but obviously also applies to normal periph
>clocks.
>
>Hi Marcel,
>
>were you going to send a new version with the alternative fix as
>suggested by Peter?

Yes, sorry. Let me look at that now.

>Thierry
