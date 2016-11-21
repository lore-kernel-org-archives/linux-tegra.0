From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 1/2] pinctrl: tegra: Add DT binding for io pads control
Date: Mon, 21 Nov 2016 14:46:29 +0530
Message-ID: <5832BB6D.6090305@nvidia.com>
References: <1478696782-11657-1-git-send-email-ldewangan@nvidia.com> <1478696782-11657-2-git-send-email-ldewangan@nvidia.com> <4be6f5f3-6884-7e4e-049c-29a1f8ca1fcb@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <4be6f5f3-6884-7e4e-049c-29a1f8ca1fcb@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: gnurou@gmail.com, yamada.masahiro@socionext.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Wednesday 16 November 2016 12:18 AM, Jon Hunter wrote:
> On 09/11/16 13:06, Laxman Dewangan wrote:
>> +NVIDIA Tegra124 and later SoCs support the multi-voltage level and
>> +low power state of some of its IO pads. When IO interface are not
>> +used then IO pads can be configure in low power state to reduce
>> +the power from that IO pads. The IO pads can work in the voltage
>> +of the 1.8V and 3.3V of IO voltage from power rail sources.
> The last sentence is a bit unclear and does not sound correct. I am not
> sure if you are missing the word 'range' somewhere or if you are trying
> to say it must be either 1.8V or 3.3V. Looks like you have the same
> sentence on the changelog too.
The IO pads are designed to work in two different voltage rail 1.8V 
(nominal) and 3.3V (nominal) for interfacing.
However, the tolerances of the IO pads are:

1.8 V nominal is (1.62V, 1.98V)
3.3 V nominal is (2.97V,3.63V)

