From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 8/8] memory: tegra: Introduce Tegra20 EMC driver
Date: Thu, 25 Oct 2018 21:36:33 +0300
Message-ID: <221ac544-b57a-e85f-79ac-0b914615c9a9@gmail.com>
References: <20181021183052.32023-1-digetx@gmail.com>
 <20181021183052.32023-9-digetx@gmail.com> <20181025143853.GL21521@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181025143853.GL21521@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/25/18 5:38 PM, Thierry Reding wrote:
> On Sun, Oct 21, 2018 at 09:30:52PM +0300, Dmitry Osipenko wrote:
>> Introduce driver for the External Memory Controller (EMC) found on Tegra20
>> chips, which controls the external DRAM on the board. The purpose of this
>> driver is to program memory timing for external memory on the EMC clock
>> rate change.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>> ---
>>  drivers/memory/tegra/Kconfig       |  10 +
>>  drivers/memory/tegra/Makefile      |   1 +
>>  drivers/memory/tegra/tegra20-emc.c | 591 +++++++++++++++++++++++++++++
>>  3 files changed, 602 insertions(+)
>>  create mode 100644 drivers/memory/tegra/tegra20-emc.c
> 
> Applied to for-4.21/memory, thanks.

Thank you! 

> Though I did notice that there's quite a bit of code that's very similar
> between this and the existing Tegra124 driver, so I wonder if we can do
> a pass over them and refactor some of it as a follow-up.
I don't think this will really worth the effort.
