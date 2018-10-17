From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/3] clk: tegra: Convert CCLKG mux to mux + clock
 divider on Tegra30
Date: Wed, 17 Oct 2018 15:27:24 +0300
Message-ID: <b1265595-f01d-5ab2-aaf9-6c4d674f9f3a@gmail.com>
References: <20180830192045.11017-1-digetx@gmail.com>
 <20180830192045.11017-2-digetx@gmail.com>
 <19523f37-eb78-067c-cc62-b6ceaad985a9@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <19523f37-eb78-067c-cc62-b6ceaad985a9@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/17/18 11:53 AM, Jon Hunter wrote:
> 
> On 30/08/2018 20:20, Dmitry Osipenko wrote:
>> Some of the CCLKG parents aren't accessible via device tree because they
>> are created as non-DT clocks. Apparently there is no reason to define
>> these clocks in that manner, hence convert CCLKG mux to mux + clock
>> divider to remove the non-DT parent clocks. Now it is possible to request
>> all of CCLKG parents from device tree, which is necessary for the CPUFreq
>> driver.
> 
> Is it likely that all of these clock parents will be used by the CPUFreq
> driver for these devices? If the clocks you currently need are available
> then my preference would be to stick with what we have for now.

You could use them all if you want, that's what HW allow. The current clock description doesn't fully describe the HW, though it should be enough at least for the CPUFreq driver if we are going to use clk_get_sys() and stick to the "default" parent. Peter?
