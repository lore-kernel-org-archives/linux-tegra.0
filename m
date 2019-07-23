From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] clk: tegra: divider: Fix missing check for
 enable-bit on rate's recalculation
Date: Tue, 23 Jul 2019 03:13:10 +0300
Message-ID: <2dca58c1-b44c-1396-6ede-22642d047b25@gmail.com>
References: <20190715173527.5719-1-digetx@gmail.com>
 <20190717200821.A77A120818@mail.kernel.org>
 <ca05abf7-1486-ceb7-91d6-266640eea69e@gmail.com>
 <20190722215554.DA23D21951@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722215554.DA23D21951@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

23.07.2019 0:55, Stephen Boyd пишет:
> Quoting Dmitry Osipenko (2019-07-17 14:33:36)
>> 17.07.2019 23:08, Stephen Boyd пишет:
>>> Quoting Dmitry Osipenko (2019-07-15 10:35:26)
>>>> Unset "enable" bit means that divider is in bypass mode, hence it doesn't
>>>> have any effect in that case.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>
>>> Any Fixes tags for these patches?
>>
>> I'm not aware of any actual bugs that this change fixes. Probably better
>> to just s/Fix/Add/ in the commit's title?
> 
> Sounds fine to me.
> 

Okay, I'll re-spin these patches.
