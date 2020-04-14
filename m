From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Tue, 14 Apr 2020 18:32:57 +0300
Message-ID: <45b65baa-fd9b-3248-bc24-e226cfc8c8dc@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <3e518dfa-cb3d-e2ce-a9b8-5e143e02fc61@gmail.com>
 <6976796c-6972-328e-3e9f-60c1737cf0e2@gmail.com>
 <20200414150516.GL3593749@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20200414150516.GL3593749@ulmo>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

14.04.2020 18:05, Thierry Reding пишет:
...
>> What about replacing those barely readable concatenated macros with a
>> raw values?
>>
>> Like:
>>
>> TRIM_REG(brlshft_idx, ob_ddll_long_dq_rank_mask, ...)
> 
> That's just going to move the complexity from the macros to the
> callsites, isn't it?
> 
> I suppose I could spend a few cycles trying to make this a little more
> readable, but to be frank, the complexity in this driver is already so
> high that this doesn't really make much of a difference, in my opinion.

I can't guarantee that the final result will be excellent, but I'd try
to turn that macro into the function and then use the raw HW values
instead of the defines. It looks to me that the result at least should
be better.
