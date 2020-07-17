From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [RFC PATCH v3 16/18] gpu: host1x: mipi: Split
 tegra_mipi_calibrate and tegra_mipi_wait
Date: Fri, 17 Jul 2020 18:01:58 +0300
Message-ID: <080b30c7-1dce-dd2f-dd96-40f6e25da4d6@gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <ca8f2184-de30-03ec-9caf-e20a22d96a77@nvidia.com>
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.07.2020 07:46, Sowjanya Komatineni пишет:
...
> Looks like sequence posted in TRM need to be updated clearly for proper
> MIPI CAL start and wait.
> 
> Correct steps should be like below
> 
> 1. Set up CSI registers for use case such as number of lanes, virtual 
> channel, etc.
> 2. Initialize and power up CSI CIL interface
> 3. Program MIPI CAL bias pads, cal configs, cal control registers and
> enable calibration start
> 4. Power up camera through the I2C interface and start sensor streaming
> through the I2C
> 
> Note: All sensors might not leave pads in LP-11 state as sensor may be
> power down when not in use.
> 
> So start streaming prior to checking for calibration done status as
> LP-11 -> HS transition happens during sensor stream and calibration
> logic can apply results to pads and update done status,
> 
> 5. Wait for done signal from calibration logic
> 
> 6. perform frame capture thru VI
> 7. Frame done, CSI goes back to stop state, LP11
> 
> Will work internally to correct sequence in TRM ...

Will be nice to have an updated TRM, thank you!

Also, what about the auto-calibration? Isn't it needed to be enabled for
CSI?

> In mipi driver will update as below to have mipi clk enabled till
> calibration status check is done.
> 
> Always tegra_mipi_wait() followes tegra_mipi_calibrate() in both DSI and
> CSI. So below sequence should work good.
> 
> tegra_mipi_calibrate()
> 
> - clk_enable mipi cal
> - program mipi cal registers (bias pads cfgs, mipi cal ctrl and trigger
> calibration start)
> 
> tegra_mipi_wait()
> - read mipi cal status and wait for active and done bits
> - clk_disable mipi cal


Maybe then it should be better to rename the functions like this:

tegra_mipi_calibrate() -> tegra_mipi_start_calibration()
tegra_mipi_wait()      -> tegra_mipi_finish_calibration().

and there also should be tegra_mipi_cancel_calibration().


Example:

	tegra_mipi_start_calibration();

	ret = v4l2_subdev_call(subdev, video, s_stream, on);
	if (ret < 0) {
		tegra_mipi_cancel_calibration();
		goto err;
	}

	tegra_mipi_finish_calibration();
