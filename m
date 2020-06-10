From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v1 13/18] gpu: host1x: mipi: Add
 of_tegra_mipi_request() API
Date: Wed, 10 Jun 2020 10:00:13 -0700
Message-ID: <ef909904-9d21-c124-73fc-79c9ae7ac75b@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-14-git-send-email-skomatineni@nvidia.com>
 <e84c6723-e94a-3fcf-8b38-eb680c88de25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e84c6723-e94a-3fcf-8b38-eb680c88de25-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 6/10/20 6:33 AM, Dmitry Osipenko wrote:
> 10.06.2020 09:02, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds an API of_tegra_mipi_request() to allow creating
>> mipi device for specific device node rather than a device so Tegra
>> CSI driver can use it for calibrating MIPI pads for each stream
>> independently.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/host1x/mipi.c | 10 ++++++++--
>>   include/linux/host1x.h    |  2 ++
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
>> index e00809d..f51fe69 100644
>> --- a/drivers/gpu/host1x/mipi.c
>> +++ b/drivers/gpu/host1x/mipi.c
>> @@ -206,9 +206,9 @@ static int tegra_mipi_power_down(struct tegra_mipi *=
mipi)
>>   	return 0;
>>   }
>>  =20
>> -struct tegra_mipi_device *tegra_mipi_request(struct device *device)
>> +struct tegra_mipi_device *of_tegra_mipi_request(struct device *device,
>> +						struct device_node *np)
>>   {
>> -	struct device_node *np =3D device->of_node;
>>   	struct tegra_mipi_device *dev;
>>   	struct of_phandle_args args;
>>   	int err;
>> @@ -252,6 +252,12 @@ struct tegra_mipi_device *tegra_mipi_request(struct=
 device *device)
>>   	of_node_put(args.np);
>>   	return ERR_PTR(err);
>>   }
>> +EXPORT_SYMBOL(of_tegra_mipi_request);
>> +
>> +struct tegra_mipi_device *tegra_mipi_request(struct device *device)
>> +{
>> +	return of_tegra_mipi_request(device, device->of_node);
>> +}
>>   EXPORT_SYMBOL(tegra_mipi_request);
>>  =20
>>   void tegra_mipi_free(struct tegra_mipi_device *device)
>> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
>> index c230b4e..a61ca52 100644
>> --- a/include/linux/host1x.h
>> +++ b/include/linux/host1x.h
>> @@ -325,6 +325,8 @@ int host1x_client_resume(struct host1x_client *clien=
t);
>>  =20
>>   struct tegra_mipi_device;
>>  =20
>> +struct tegra_mipi_device *of_tegra_mipi_request(struct device *device,
>> +						struct device_node *np);
> Looks like adding a new function here is a bit of overkill. What about
> to change tegra_mipi_request() to take the node argument?

thought to avoid changes to existing usage of that function in other=20
drivers.

Will update in v2.
