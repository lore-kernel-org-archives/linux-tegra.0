From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 1/3] drm/nouveau/tegra: Skip manual unpowergating when not
 necessary
Date: Tue, 13 Jun 2017 15:43:01 +0300
Message-ID: <abc5775b-a74e-7902-91ad-a90f3c1bfce4@kapsi.fi>
References: <20170609122541.31118-1-mperttunen@nvidia.com>
 <c8569914-3264-bd12-9418-8bdaa4aaa379@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c8569914-3264-bd12-9418-8bdaa4aaa379-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kholtta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 13.06.2017 01:52, Ben Skeggs wrote:
> On 06/09/2017 10:25 PM, Mikko Perttunen wrote:
>> On Tegra186, powergating is handled by the BPMP power domain provider
>> and the "legacy" powergating API is not available. Therefore skip
>> these calls if we are attached to a power domain.
> Thanks Mikko,
>
> Taken all 3 patches into my tree.

Thanks!

>
> Ben.
>
>>
>> Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
>> index 6474bd2a6d07..3d42cdbbe9c0 100644
>> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
>> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
>> @@ -51,10 +51,12 @@ nvkm_device_tegra_power_up(struct nvkm_device_tegra *tdev)
>>  	reset_control_assert(tdev->rst);
>>  	udelay(10);
>>
>> -	ret = tegra_powergate_remove_clamping(TEGRA_POWERGATE_3D);
>> -	if (ret)
>> -		goto err_clamp;
>> -	udelay(10);
>> +	if (!tdev->pdev->dev.pm_domain) {
>> +		ret = tegra_powergate_remove_clamping(TEGRA_POWERGATE_3D);
>> +		if (ret)
>> +			goto err_clamp;
>> +		udelay(10);
>> +	}
>>
>>  	reset_control_deassert(tdev->rst);
>>  	udelay(10);
>>
>
