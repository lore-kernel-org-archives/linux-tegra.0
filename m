From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 4/4] media: staging: tegra-vde: Power-cycle hardware on
 probe
Date: Fri, 26 Jun 2020 16:42:35 +0300
Message-ID: <1c306d0a-571b-dc7c-3a61-0149dfb0e2be@gmail.com>
References: <20200624150847.22672-1-digetx@gmail.com>
 <20200624150847.22672-5-digetx@gmail.com> <20200626074818.GD3109062@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200626074818.GD3109062@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

26.06.2020 10:48, Thierry Reding пишет:
> On Wed, Jun 24, 2020 at 06:08:47PM +0300, Dmitry Osipenko wrote:
>> VDE partition is left turned ON after bootloader on most devices, hence
>> let's ensure that it's turned OFF in order to lower power leakage while
>> hardware is idling by turning it ON and OFF during of the driver's probe.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/staging/media/tegra-vde/vde.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
>> index b64e35b86fb4..3be96c36bf43 100644
>> --- a/drivers/staging/media/tegra-vde/vde.c
>> +++ b/drivers/staging/media/tegra-vde/vde.c
>> @@ -1068,6 +1068,14 @@ static int tegra_vde_probe(struct platform_device *pdev)
>>  	pm_runtime_use_autosuspend(dev);
>>  	pm_runtime_set_autosuspend_delay(dev, 300);
>>  
>> +	/*
>> +	 * VDE partition may be left ON after bootloader, hence let's
>> +	 * power-cycle it in order to put hardware into a predictable lower
>> +	 * power state.
>> +	 */
>> +	pm_runtime_get_sync(dev);
>> +	pm_runtime_put(dev);
>> +
>>  	return 0;
>>  
>>  err_deinit_iommu:
> 
> Shouldn't this happen automatically? My understanding is that power
> domains are turned on automatically before ->probe() and then unless a
> runtime PM reference is taken during ->probe() it will get turned off
> again after ->probe()?

Older Tegra SoCs haven't been converted to use the generic power-domain
API and today's VDE driver supports only T20 and T30 SoCs.

> Is that not happening? Is auto-suspend perhaps getting in the way
> somehow?

We're manually toggling the PD using legacy Tegra-PD API in the driver's
RPM callbacks, that's why the RPM needs to be toggled manually as well.

Perhaps this hunk could be removed if older Tergas would get a genpd
support. I guess it shouldn't be difficult to implement the genpd
support, but then there will be a compatibility trouble with older DTs,
so perhaps it's not really worth the effort.
