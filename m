From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v3 16/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
Date: Fri, 17 Jul 2020 08:41:58 -0700
Message-ID: <b125deab-7900-6266-d405-4d7f029089b4@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-17-git-send-email-skomatineni@nvidia.com>
 <a06dec8f-7042-767b-545b-048685a7683d@gmail.com>
 <20d63eca-4b2b-584e-a391-a4fb64a16b40@nvidia.com>
 <c4945c77-5de1-e9b1-9f4f-cdd78bca18c7@gmail.com>
 <ce0c5ffb-f859-0eab-1ea5-044623dff221@nvidia.com>
 <a2b8169c-c4a3-4862-cd27-8c1a51ddc558@gmail.com>
 <4690e682-8495-2327-87c7-c2f06a7a479d@nvidia.com>
 <66812127-38cf-2af3-51c0-50edbe446e73@nvidia.com>
 <9b4fbf9d-d651-aa35-c0a6-b8f16aeb0900@gmail.com>
 <550f1796-67ca-5856-223d-c68360243954@nvidia.com>
 <ca8f2184-de30-03ec-9caf-e20a22d96a77@nvidia.com>
 <080b30c7-1dce-dd2f-dd96-40f6e25da4d6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <080b30c7-1dce-dd2f-dd96-40f6e25da4d6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 7/17/20 8:01 AM, Dmitry Osipenko wrote:
> 17.07.2020 07:46, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> Looks like sequence posted in TRM need to be updated clearly for proper
>> MIPI CAL start and wait.
>>
>> Correct steps should be like below
>>
>> 1. Set up CSI registers for use case such as number of lanes, virtual
>> channel, etc.
>> 2. Initialize and power up CSI CIL interface
>> 3. Program MIPI CAL bias pads, cal configs, cal control registers and
>> enable calibration start
>> 4. Power up camera through the I2C interface and start sensor streaming
>> through the I2C
>>
>> Note: All sensors might not leave pads in LP-11 state as sensor may be
>> power down when not in use.
>>
>> So start streaming prior to checking for calibration done status as
>> LP-11 -> HS transition happens during sensor stream and calibration
>> logic can apply results to pads and update done status,
>>
>> 5. Wait for done signal from calibration logic
>>
>> 6. perform frame capture thru VI
>> 7. Frame done, CSI goes back to stop state, LP11
>>
>> Will work internally to correct sequence in TRM ...
> Will be nice to have an updated TRM, thank you!
>
> Also, what about the auto-calibration? Isn't it needed to be enabled for
> CSI?
STARTCAL does one time calibration and with AUTOCAL calibration will be=20
triggered periodically.

For pads PULLUP/PULLDN/TERM impedance calibration, we only need one-time=20
calibration on pads power up.

We always use one time pads calibration for CSI.

>
>> In mipi driver will update as below to have mipi clk enabled till
>> calibration status check is done.
>>
>> Always tegra_mipi_wait() followes tegra_mipi_calibrate() in both DSI and
>> CSI. So below sequence should work good.
>>
>> tegra_mipi_calibrate()
>>
>> - clk_enable mipi cal
>> - program mipi cal registers (bias pads cfgs, mipi cal ctrl and trigger
>> calibration start)
>>
>> tegra_mipi_wait()
>> - read mipi cal status and wait for active and done bits
>> - clk_disable mipi cal
>
> Maybe then it should be better to rename the functions like this:
>
> tegra_mipi_calibrate() -> tegra_mipi_start_calibration()
> tegra_mipi_wait()      -> tegra_mipi_finish_calibration().
>
> and there also should be tegra_mipi_cancel_calibration().
>
>
> Example:
>
> 	tegra_mipi_start_calibration();
>
> 	ret =3D v4l2_subdev_call(subdev, video, s_stream, on);
> 	if (ret < 0) {
> 		tegra_mipi_cancel_calibration();
> 		goto err;
> 	}
>
> 	tegra_mipi_finish_calibration();
>
>
