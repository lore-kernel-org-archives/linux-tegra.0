From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] backlight: lp855x: Ensure regulators are disabled on
 probe failure
Date: Mon, 27 Apr 2020 14:17:12 +0100
Message-ID: <b57f3ef0-8d14-c0bf-524c-9ec0d6334e0c@nvidia.com>
References: <20200224140748.2182-1-jonathanh@nvidia.com>
 <20200224143732.rreev3ypou26hvx3@holly.lan>
 <6ec74817-968b-ab5e-6566-56bbb9b67599@nvidia.com>
 <20200316090546.5eufi423ahstz6v3@holly.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200316090546.5eufi423ahstz6v3@holly.lan>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>
Cc: Milo Kim <milo.kim@ti.com>, Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Lee,

On 16/03/2020 09:05, Daniel Thompson wrote:
> On Fri, Mar 13, 2020 at 02:16:16PM +0000, Jon Hunter wrote:
>> Hi Lee, Daniel,
>>
>> On 24/02/2020 14:37, Daniel Thompson wrote:
>>> On Mon, Feb 24, 2020 at 02:07:48PM +0000, Jon Hunter wrote:
>>>> If probing the LP885x backlight fails after the regulators have been
>>>> enabled, then the following warning is seen when releasing the
>>>> regulators ...
>>>>
>>>>  WARNING: CPU: 1 PID: 289 at drivers/regulator/core.c:2051 _regulator_put.part.28+0x158/0x160
>>>>  Modules linked in: tegra_xudc lp855x_bl(+) host1x pwm_tegra ip_tables x_tables ipv6 nf_defrag_ipv6
>>>>  CPU: 1 PID: 289 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200224 #1
>>>>  Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
>>>>
>>>>  ...
>>>>
>>>> Fix this by ensuring that the regulators are disabled, if enabled, on
>>>> probe failure.
>>>>
>>>> Finally, ensure that the vddio regulator is disabled in the driver
>>>> remove handler.
>>>>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>
>>> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
>> I received a bounce from Milo's email and so I am not sure that his
>> email address is still valid.
>>
>> Can either of you pick this up?
> 
> Lee generally starts to hoover up patches about this stage in the dev
> cycle so I'd expect this to move fairly soon.

Does not look like this ever got picked up. Please let me know if you
can queue this one. Note it still applies cleanly to -next.

Jon

-- 
nvpublic
