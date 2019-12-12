From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 00/19] Consolidate and improve NVIDIA Tegra CPUIDLE
 driver(s)
Date: Thu, 12 Dec 2019 04:58:38 +0300
Message-ID: <804e46c7-1c39-926a-6624-924739433638@gmail.com>
References: <20191203004116.11771-1-digetx@gmail.com>
 <20191211085120.GX28289@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191211085120.GX28289@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

11.12.2019 11:51, Peter De Schrijver пишет:
> On Tue, Dec 03, 2019 at 03:40:57AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This series does the following:
>>
>>   1. Unifies Tegra20/30/114 drivers into a single driver and moves it out
>>      into common drivers/cpuidle/ directory.
>>
>>   2. Enables CPU cluster power-down idling state on Tegra30.
>>
>> In the end there is a quite nice clean up of the Tegra CPUIDLE drivers
>> and of the Tegra's arch code in general. Please review, thanks!
>>
> 
> Acked-By Peter De Schrijver <pdeschrijver@nvidia.com> for the series.
> 
> Peter.
> 

Thank you very much! Will be awesome if you could take a look at the
cpufreq patches as well [1].

There are also some other older unreviewed clk patches on the list that
I'd want you to take a look. I'll revisit and re-send them soon. Maybe
will add the PLLX LP1 patches [2] into cpufreq series.

[1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=143592

[2] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=139741
