From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [RFC PATCH v3 16/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
Date: Thu, 16 Jul 2020 16:06:25 -0700
Message-ID: <4690e682-8495-2327-87c7-c2f06a7a479d@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
 <1594786855-26506-17-git-send-email-skomatineni@nvidia.com>
 <a06dec8f-7042-767b-545b-048685a7683d@gmail.com>
 <20d63eca-4b2b-584e-a391-a4fb64a16b40@nvidia.com>
 <c4945c77-5de1-e9b1-9f4f-cdd78bca18c7@gmail.com>
 <ce0c5ffb-f859-0eab-1ea5-044623dff221@nvidia.com>
 <a2b8169c-c4a3-4862-cd27-8c1a51ddc558@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a2b8169c-c4a3-4862-cd27-8c1a51ddc558@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 7/16/20 4:01 PM, Dmitry Osipenko wrote:
> 17.07.2020 01:49, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> What keeps MIPI clock enabled after completion of the
>>> tegra_mipi_calibrate() invocation?
>> MIPI clock is disabled at end of tegra_mipi_calibrate and is re-enabled
>> during tegra_mipi_wait.
>>
>> I think I should fix this to keep the clock enabled till calibration
>> results are latched.
>>
>> All consumers of tegra_mipi_calibrate() will call tegra_mipi_wait().
>>
>> So will remove clk_disable mipi clk at end of tegra_mipi_calibrate() and
>> clk_enable mipi_clk at beginning of tegra_mipi_wait()
> Isn't it possible to perform the calibration after enabling CSI and
> before of starting the sensor streaming?
Currently this is what I am doing. Triggering calibration start during=20
CSI receiver being ready and then sensor streaming will happen where=20
internal MIPI CAL detects for LP -> HS transition and applies results to=20
pads. So checking for calibration results after sensor stream is enabled
