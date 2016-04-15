From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 6/7] pinctrl: tegra: Add DT binding for io pads control
Date: Fri, 15 Apr 2016 10:35:11 -0600
Message-ID: <5711183F.1090003@wwwdotorg.org>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-7-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1460473007-11535-7-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: thierry.reding@gmail.com, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/12/2016 08:56 AM, Laxman Dewangan wrote:
> NVIDIA Tegra210 supports the IO pads which can operate at 1.8V
> or 3.3V I/O voltage levels. Also IO pads can be configured for
> power down state if it is not in used. SW needs to configure the
> voltage level of IO pads based on IO rail voltage and its power
> state based on platform usage.
>
> Add DT binding document for detailing the DT properties for
> configuring IO pads voltage levels and its power state.

I hope that we only intend to use this in the case where Linux must make 
dynamic changes to the IO voltage (e.g. SD cards switching between speeds).

All static settings, and good boot defaults, should be set up by system 
FW. Perhaps not all FW does this on Tegra210 platforms:-( I hope that on 
future chips, the same FW that sets up the static pinmux sets up the 
static IO voltage configuration, in exactly the same way.
