From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 00/17] NVIDIA Tegra20 CPUFreq driver major update
Date: Wed, 16 Oct 2019 16:16:27 +0300
Message-ID: <8cf055a3-57fd-c275-9e74-a9fb5d284866@gmail.com>
References: <20191015211618.20758-1-digetx@gmail.com>
 <20191016052716.yipztnpg7bcuzhfn@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191016052716.yipztnpg7bcuzhfn@vireshk-i7>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

16.10.2019 08:27, Viresh Kumar пишет:
> On 16-10-19, 00:16, Dmitry Osipenko wrote:
>> Hello,
>>
>> This series moves intermediate-clk handling from tegra20-cpufreq into
>> tegra-clk driver, this allows us to switch to generic cpufreq-dt driver
>> which brings voltage scaling, per-hardware OPPs and Tegra30 support out
>> of the box. All boards need to adopt CPU OPPs in their device-trees in
>> order to get cpufreq support. This series adds OPPs only to selective
>> boards because there is assumption in a current device-trees that CPU
>> voltage is set for 1GHz freq and this won't work for those CPUs that
>> can go over 1GHz and thus require voltage regulators to be set up for
>> voltage scaling support (CC'ed Marcel for Toradex boards). We could
>> probably add delete-node for OPPs over 1GHz if there are not actively
>> maintained boards.
> 
> How do you want to get these patches merged ? Can I just pick the cpufreq bits
> alone ?
> 

The cpufreq bits strictly depend on the clk patches and the regulators
coupler/balancer series. Hence all patches in this series should collect
acks from relevant maintainers and then Thierry will pick up the
patchsets in a correct order via tegra tree, at least that's my vision.

Thierry, are you okay with that approach?
