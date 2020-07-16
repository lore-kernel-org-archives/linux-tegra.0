From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v3 16/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
Date: Thu, 16 Jul 2020 15:49:35 -0700
Message-ID: <ce0c5ffb-f859-0eab-1ea5-044623dff221@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-17-git-send-email-skomatineni@nvidia.com>
 <a06dec8f-7042-767b-545b-048685a7683d@gmail.com>
 <20d63eca-4b2b-584e-a391-a4fb64a16b40@nvidia.com>
 <c4945c77-5de1-e9b1-9f4f-cdd78bca18c7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <c4945c77-5de1-e9b1-9f4f-cdd78bca18c7@gmail.com>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 7/16/20 2:18 PM, Dmitry Osipenko wrote:
> 17.07.2020 00:09, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 7/16/20 1:38 PM, Dmitry Osipenko wrote:
>>> 15.07.2020 07:20, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> SW can trigger MIPI pads calibration any time after power on
>>>> but calibration results will be latched and applied to the pads
>>>> by MIPI CAL unit only when the link is in LP-11 state and then
>>>> status register will be updated.
>>>>
>>>> For CSI, trigger of pads calibration happen during CSI stream
>>>> enable where CSI receiver is kept ready prior to sensor or CSI
>>>> transmitter stream start.
>>>>
>>>> So, pads may not be in LP-11 at this time and waiting for the
>>>> calibration to be done immediate after calibration start will
>>>> result in timeout.
>>>>
>>>> This patch splits tegra_mipi_calibrate() and tegra_mipi_wait()
>>>> so triggering for calibration and waiting for it to complete can
>>>> happen at different stages.
>>>>
>>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>>> ---
>>> ...
>>>>  =C2=A0 int tegra_mipi_calibrate(struct tegra_mipi_device *device)
>>>>  =C2=A0 {
>>>> @@ -370,12 +381,10 @@ int tegra_mipi_calibrate(struct
>>>> tegra_mipi_device *device)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value |=3D MIPI_CAL_CTRL_START;
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tegra_mipi_writel(device->mipi, value,=
 MIPI_CAL_CTRL);
>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 err =3D tegra_mipi_wait(device->mipi);
>>> Doesn't MIPI clock need to be enabled during of the calibration process=
?
>> MIPI clock is already enabled in tegra_mipi_calibrate
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&device->mipi->lock);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable(device->mipi->clk);
> What keeps MIPI clock enabled after completion of the
> tegra_mipi_calibrate() invocation?

MIPI clock is disabled at end of tegra_mipi_calibrate and is re-enabled=20
during tegra_mipi_wait.

I think I should fix this to keep the clock enabled till calibration=20
results are latched.

All consumers of tegra_mipi_calibrate() will call tegra_mipi_wait().

So will remove clk_disable mipi clk at end of tegra_mipi_calibrate() and=20
clk_enable mipi_clk at beginning of tegra_mipi_wait()

>
>>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 return err;
>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>  =C2=A0 }
>>>>  =C2=A0 EXPORT_SYMBOL(tegra_mipi_calibrate);
