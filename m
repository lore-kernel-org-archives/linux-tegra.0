From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/2] soc/tegra: pmc: Query PCLK clock rate at probe
 time
Date: Thu, 25 Jul 2019 14:15:52 +0300
Message-ID: <f7879942-0875-1f27-5870-3f8414c2148d@gmail.com>
References: <20190723023511.24542-1-digetx@gmail.com>
 <20190725093644.GJ12715@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725093644.GJ12715@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

25.07.2019 12:36, Peter De Schrijver пишет:
> On Tue, Jul 23, 2019 at 05:35:10AM +0300, Dmitry Osipenko wrote:
>> The PCLK clock is running off SCLK, which is a critical clock that is
>> very unlikely to randomly change its rate. It's also a bit clumsy (and
>> apparently incorrect) to query the clock's rate with interrupts being
>> disabled because clk_get_rate() takes a mutex and that's the case during
>> suspend/cpuidle entering.
>>
> 
> SCLK and PCLK certainly can change rate at runtime, although the code to
> handle this hasn't reached upstream yet.

Okay, maybe this patch is indeed not very worthwhile then. I'm leaving
it up to you, guys, to decide.
