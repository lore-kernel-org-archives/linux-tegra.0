From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/2] clk: tegra: divider: Add missing check for
 enable-bit on rate's recalculation
Date: Tue, 29 Oct 2019 15:50:22 +0300
Message-ID: <1dfd0270-b8d7-da22-46dd-7efc907d5655@gmail.com>
References: <20190723025245.27754-1-digetx@gmail.com>
 <20191028142753.GC27141@pdeschrijver-desktop.Nvidia.com>
 <62c375bd-09ae-e09f-6ca2-c1395eebc5fa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <62c375bd-09ae-e09f-6ca2-c1395eebc5fa@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

29.10.2019 03:14, Dmitry Osipenko пишет:
> 28.10.2019 17:27, Peter De Schrijver пишет:
>> On Tue, Jul 23, 2019 at 05:52:44AM +0300, Dmitry Osipenko wrote:
>>> Unset "enable" bit means that divider is in bypass mode, hence it doesn't
>>> have any effect in that case. Please note that there are no known bugs
>>> caused by the missing check.
>>>
>>
>> Technically this is not quite true, but for the purposes of CCF you can
>> treat it that way. This bits defines if the value in the lower 16 bits
>> of the divider register is used to configure the divider or if the
>> contents of the UART DLM/DLL registers is used. So the divider isn't
>> actually bypassed, it's just configured differently.
>> In practice this bit is only set when the divider is non-zero when doing
>> set rate. So the extra test isn't strictly needed as long as the sw
>> running before the kernel also ensures the bit is only set when the
>> divider is non-zero.
>>
>> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Thank you for the clarification. I hope that bootloader doesn't enable
> the divider because it looks like standard 8250 driver won't be ready
> for that. But serial-tegra driver seems should be good.

Actually, it should be good because I missed that UART clocks are
per-initialized in the clk driver init table.

I'll update commit's message and send a new version of this patch.
