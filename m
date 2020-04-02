From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/5] clk: Introduce clk_round_rate_unboundly()
Date: Thu, 2 Apr 2020 17:21:01 +0300
Message-ID: <58c3e230-8361-6710-7946-6d2dd98b2482@gmail.com>
References: <20200330231617.17079-1-digetx@gmail.com>
 <20200330231617.17079-3-digetx@gmail.com>
 <20200402003339.GA11124@qmqm.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20200402003339.GA11124@qmqm.qmqm.pl>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

02.04.2020 03:33, Michał Mirosław пишет:
> On Tue, Mar 31, 2020 at 02:16:14AM +0300, Dmitry Osipenko wrote:
> [...]
>> +/**
>> + * clk_round_rate_unboundly - unboundly round the given rate for a clk
> 
> Just grammar nits:
> 
> clk_round_rate_unbounded - round the given rate for a clk, ignoring users' min/max constraints
> 
>> + * @clk: the clk for which we are rounding a rate
>> + * @rate: the rate which is to be rounded
>> + *
>> + * Takes in a rate as input and rounds it to a rate that the clk can use
>> + * which is then returned.  The given rate isn't bounded by clk users min-max
> 
> s/bounded/limited/ ?
> 
>> + * rates, unlike in a case of clk_round_rate().  If clk doesn't support
> 
> "... unlike in clk_round_rate()."
> 
>> + * round_rate operation then the parent rate is returned.
>> + */
> [...]

Hello Michał,

Thank you very much for the suggestion, I'll take it into account in the
next version.
