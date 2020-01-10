From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [PATCH v7 00/21] Move PMC clocks into Tegra PMC driver
Date: Thu, 9 Jan 2020 19:24:48 -0800
Message-ID: <37a9676b-e0e5-7e80-5ee4-abfca361dcf7@nvidia.com>
References: <1578457515-3477-1-git-send-email-skomatineni@nvidia.com>
 <4e9fab30-14b5-bf1f-dc91-fd57ef614503@gmail.com>
 <61a78ba8-4cc3-f6a6-513b-36daa9be32f0@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <61a78ba8-4cc3-f6a6-513b-36daa9be32f0@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 1/9/20 5:39 PM, Sowjanya Komatineni wrote:
>
> On 1/9/20 11:44 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 08.01.2020 07:24, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> This patch series moves Tegra PMC clocks from clock driver to pmc=20
>>> driver
>>> along with the device trees changes and audio driver which uses one of
>>> the pmc clock for audio mclk.
>>>
>>> Tegra PMC has clk_out_1, clk_out_2, clk_out_3 and blink controls which
>>> are currently registered by Tegra clock driver using clk_regiser_mux=20
>>> and
>>> clk_register_gate which performs direct Tegra PMC register access.
>>>
>>> When Tegra PMC is in secure mode, any access from non-secure world will
>>> not go through.
>>>
>>> This patch series adds these Tegra PMC clocks and blink controls to=20
>>> Tegra
>>> PMC driver with PMC as clock provider and removes them from Tegra clock
>>> driver.
>>>
>>> PMC clock clk_out_1 is dedicated for audio mclk from Tegra30 thru=20
>>> Tegra210
>>> and clock driver does inital parent configuration for it and enables=20
>>> them.
>>> But this clock should be taken care by audio driver as there is no need
>>> to have this clock pre enabled.
>>>
>>> So, this series also includes patch that updates ASoC driver to take
>>> care of parent configuration for mclk if device tree don't specify
>>> initial parent configuration using assigned-clock-parents and controls
>>> audio mclk enable/disable during ASoC machine startup and shutdown.
>>>
>>> DTs are also updated to use clk_out_1 as audio mclk rather than=20
>>> extern1.
>>>
>>> This series also includes a patch for mclk fallback to extern1 when
>>> retrieving mclk fails to have this backward compatible of new DT with
>>> old kernels.
>> Suspend-resume doesn't work anymore, reverting this series helps. I
>> don't have any other information yet, please take a look.
> Thanks Dmitry. Will test suspend resume and check..

I see if we leave audio mclk (cdev1) enabled during=20
tegra_asoc_utils_init, suspend resume works.

Without audio mclk enabled during tegra_asoc_utils_init, somehow it=20
prevents entry to suspend on Tegra30 platform.

Will look in detail..
