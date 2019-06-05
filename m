From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] rtc: tegra: Drop MODULE_ALIAS
Date: Wed, 5 Jun 2019 15:43:17 +0300
Message-ID: <3cc5b0f5-83ae-23b8-e064-652300b93aae@gmail.com>
References: <20190605122613.21303-1-digetx@gmail.com>
 <20190605123327.GB724@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190605123327.GB724@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

05.06.2019 15:33, Thierry Reding пишет:
> On Wed, Jun 05, 2019 at 03:26:13PM +0300, Dmitry Osipenko wrote:
>> RTC driver was converted to OF driver long time ago. The MODULE_ALIAS
>> macro has no effect for the OF drivers since the alias is overridden by
>> the drivers core to follow the OF naming convention of the driver's alias,
>> which is based on the device-tree matching name.
>>
>> $ cat /sys/devices/soc0/7000e000.rtc/modalias
>> of:NrtcT(null)Cnvidia,tegra20-rtc
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/rtc/rtc-tegra.c | 1 -
>>  1 file changed, 1 deletion(-)
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 

Thanks!
