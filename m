From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 11/17] ARM: dts: tegra20: Add CPU Operating Performance
 Points
Date: Wed, 16 Oct 2019 16:21:19 +0300
Message-ID: <ba9d6de0-38dc-a851-cf0a-fb9d06461671@gmail.com>
References: <20191015211618.20758-1-digetx@gmail.com>
 <20191015211618.20758-12-digetx@gmail.com>
 <20191016052323.w6hav4qqn3ybt55q@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191016052323.w6hav4qqn3ybt55q@vireshk-i7>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

16.10.2019 08:23, Viresh Kumar пишет:
> On 16-10-19, 00:16, Dmitry Osipenko wrote:
>> Operating Point are specified per HW version. The OPP voltages are kept
>> in a separate DTSI file because some boards may not define CPU regulator
>> in their device-tree if voltage scaling isn't necessary, like for example
>> in a case of tegra20-trimslice which is outlet-powered device.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  .../boot/dts/tegra20-cpu-opp-microvolt.dtsi   | 201 ++++++++++++
>>  arch/arm/boot/dts/tegra20-cpu-opp.dtsi        | 302 ++++++++++++++++++
>>  2 files changed, 503 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi
>>  create mode 100644 arch/arm/boot/dts/tegra20-cpu-opp.dtsi
>>
>> diff --git a/arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi b/arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi
>> new file mode 100644
>> index 000000000000..e85ffdbef876
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi
>> @@ -0,0 +1,201 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/ {
>> +	cpu0_opp_table: cpu_opp_table0 {
>> +		opp@216000000_750 {
> 
> Maybe just drop the _750 (i.e. voltage) from the names as we don't generally
> follow it :)

The reason for the _750 postfix is that there are multiple OPPs for
216MHz and they have different voltages for different versions of
hardware, thus those are separate OPPs and they can't be squashed into a
single OPP node.
