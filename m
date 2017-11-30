From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] clk: tegra: Mark APB clock as critical
Date: Thu, 30 Nov 2017 20:49:15 +0300
Message-ID: <dad412e5-9e89-297f-9c11-667b18340ef7@gmail.com>
References: <1508757172-13030-1-git-send-email-jonathanh@nvidia.com>
 <18f57c1f-add0-908a-6a26-7cc81f29d7d9@gmail.com>
 <f940d9f1-aaec-cf25-24d2-956df63bbbd1@gmail.com>
 <e0fa0df8-aaec-04fe-72b6-21ee1b3c9acb@nvidia.com>
 <95c14859-a2c7-1c61-adba-bd6c16155c01@gmail.com>
 <9d479a38-f40b-0e58-09c3-d06e9ee32a25@nvidia.com>
 <a96d03da-c2a3-1e44-f227-02577f972df6@gmail.com>
 <e69dc6c8-cbca-0498-c9d8-23e9a7ac1ad6@nvidia.com>
 <6264cf17-0850-37dd-ca92-9362521d2db6@gmail.com>
 <236aa250-3b9b-94de-0978-0fb8546d504d@nvidia.com>
 <17a79383-0642-5cc6-7b3f-9d302f027b4b@gmail.com>
 <43e293c3-daf2-7b2e-2524-f14de3811f44@nvidia.com>
 <6378f92d-54a9-590a-5fdb-88a7bfa96fc1@gmail.com>
 <e73fb625-58bc-8ccf-4c71-00b457da6a05@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <e73fb625-58bc-8ccf-4c71-00b457da6a05@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 30.11.2017 20:22, Jon Hunter wrote:
> 
> On 30/11/17 16:53, Dmitry Osipenko wrote:
> 
> ...
> 
>>>> Could you please show the /sys/kernel/debug/clk/clk_summary?
>>>
>>> With what patches present?
>>>
>> linux-next without any additional patches
> 
> Here you go. This is from Tegra124 Jetson TK1 ...
> 

[snip]

Thanks, looks fine. Yeah, PCLK definitely must be critical, along with EMC.
