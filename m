From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v3 16/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
Date: Thu, 16 Jul 2020 14:09:36 -0700
Message-ID: <20d63eca-4b2b-584e-a391-a4fb64a16b40@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-17-git-send-email-skomatineni@nvidia.com>
 <a06dec8f-7042-767b-545b-048685a7683d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a06dec8f-7042-767b-545b-048685a7683d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 7/16/20 1:38 PM, Dmitry Osipenko wrote:
> 15.07.2020 07:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> SW can trigger MIPI pads calibration any time after power on
>> but calibration results will be latched and applied to the pads
>> by MIPI CAL unit only when the link is in LP-11 state and then
>> status register will be updated.
>>
>> For CSI, trigger of pads calibration happen during CSI stream
>> enable where CSI receiver is kept ready prior to sensor or CSI
>> transmitter stream start.
>>
>> So, pads may not be in LP-11 at this time and waiting for the
>> calibration to be done immediate after calibration start will
>> result in timeout.
>>
>> This patch splits tegra_mipi_calibrate() and tegra_mipi_wait()
>> so triggering for calibration and waiting for it to complete can
>> happen at different stages.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
> ...
>>   int tegra_mipi_calibrate(struct tegra_mipi_device *device)
>>   {
>> @@ -370,12 +381,10 @@ int tegra_mipi_calibrate(struct tegra_mipi_device =
*device)
>>   	value |=3D MIPI_CAL_CTRL_START;
>>   	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
>>  =20
>> -	err =3D tegra_mipi_wait(device->mipi);
> Doesn't MIPI clock need to be enabled during of the calibration process?
MIPI clock is already enabled in tegra_mipi_calibrate
>
>>   	mutex_unlock(&device->mipi->lock);
>>   	clk_disable(device->mipi->clk);
>>  =20
>> -	return err;
>> +	return 0;
>>   }
>>   EXPORT_SYMBOL(tegra_mipi_calibrate);
