From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 05/16] PM / devfreq: tegra: Don't set EMC clock rate to
 maximum on probe
Date: Tue, 4 Jun 2019 16:05:31 +0300
Message-ID: <71f7b41c-b33f-92fa-e0a5-85fefeb57274@gmail.com>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-6-digetx@gmail.com> <20190604110042.GE16519@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604110042.GE16519@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.06.2019 14:00, Thierry Reding пишет:
> On Thu, May 02, 2019 at 02:38:04AM +0300, Dmitry Osipenko wrote:
>> There is no real benefit from doing so, hence let's drop that rate setting
>> for consistency.
>>
>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/tegra-devfreq.c | 2 --
>>  1 file changed, 2 deletions(-)
> 
> Do you have any numbers to tell how long it would take for the EMC rate
> to get incremented? My understanding is that ACTMON basically reacts to
> system load, so I could imagine that not setting to the maximum
> frequency after this is loaded might make the system slow in the short
> term. Only after ACTMON has collected enough data to determine that it
> needs to clock the EMC higher would system speed resume normal.
> 
> I guess technically this patch doesn't change anything if the system
> already boots at the highest EMC frequency anyway, which I think it does
> on many (although not all) devices.
> 
> Anyway, you said you've tested this and are satisfied with the
> performance, so it can't be that bad:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

It takes 12ms for ACTMON to react and then about (couple) hundred
microseconds to change memory freq. This is a very short period of time
that human being can't notice.

AFAIK, in practice there are no devices in the wild that boot up with
DRAM clocked at lowest rate. Most devices have a video output and thus
require significant memory bandwidth at a boot time already. Secondly,
higher memory bandwidth is only really needed for a cases like
multimedia, in most generic cases CPU is hitting cache and not utilizing
DRAM a lot.
