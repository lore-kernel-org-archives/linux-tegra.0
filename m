From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v10 12/15] memory: tegra: Introduce Tegra30 EMC driver
Date: Wed, 9 Oct 2019 11:52:16 +0300
Message-ID: <ebd9b2df-e4dd-1207-ad38-fc52cf4e86d4@gmail.com>
References: <20190811210043.20122-1-digetx@gmail.com>
 <20190811210043.20122-13-digetx@gmail.com>
 <CAMdYzYqNL_KAYwsnWYuz9wf2xT_RM0cWA8jkKATWMX7yuVq7Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMdYzYqNL_KAYwsnWYuz9wf2xT_RM0cWA8jkKATWMX7yuVq7Hw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Geis <pgwipeout@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

05.10.2019 19:28, Peter Geis пишет:
> Tested on the Ouya (tegra30).
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> 
> On Sun, Aug 11, 2019 at 5:02 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Introduce driver for the External Memory Controller (EMC) found on Tegra30
>> chips, it controls the external DRAM on the board. The purpose of this
>> driver is to program memory timing for external memory on the EMC clock
>> rate change.
>>
>> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---

Peter, thank you very much for the testing!

Thierry, could you please pick up this series and other relevant patches
for 5.5? Thanks in advance!
